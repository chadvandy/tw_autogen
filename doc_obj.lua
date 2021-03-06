--- TODO an object for each "class" (ie. Event/Interface/Episodic Scripting/Etc)
--- TODO separate "docobj" and "classobj", so a single document can have multiple classes or none at all.

local new_class = require "includes.30-log"

wild = "[%a%s_%[%]]+"
wild_un = "[%a_]+"
wild_sp = "[%a%s]+"

--- TODO rework the DocObj; it should really just be the thing that reads the entire file and holds the individual classes, or groups of functions, together
---@class DocObj : Class The Documentation object; once built for each in-game class (ie. episodic_scripting, BuildingCompletedEvent, etc etc)
local doc_obj_defaults = {
    -- ---@type string The name of this class, for printing and referencing.
    -- name = "",

    -- ---@type string The description for this class. TODO multi-line support.
    -- desc = "",

    ---@type  ClassObj[] All the Class Objects within this documentation.
    classes = {},

    ---@type ClassObj pointer to the currently read ClassObj
    current_class = nil,

    ---@type table<string, MethodObj> A table of all orphaned functions in this DocObj.
    funcs = {},

    ---@type table The contexts this doc object is available within.
    contexts = {
        battle = false,
        campaign = false,
        frontend = false,
    }
}

---@class ClassObj : Class The Class object; once built for each in-game class (ie. episodic_scripting, BuildingCompletedEvent, etc etc)
local class_obj_defaults = {
    ---@type string The name of this class, for printing and referencing.
    name = "",

    ---@type string The description for this class. TODO multi-line support.
    desc = "",

    ---@type table<string, MethodObj> A table of all methods in this ClassObj.
    methods = {},
}

---@class MethodObj : Class The Method object; used for each individual instance of a documented function on a class.
local method_obj_defaults = {
    ---@type boolean If this method is actually a method; is only here for the rarest cases (for instance, CampaignUI.Stuff())
    is_method = true,

    order = 0,

    ---@type string The name of this method.
    name = "",

    ---@type string[] The description of this method.
    desc = {},

    ---@type TypeObj[] All of the available parameters for this function, in order of usage.
    params = {},

    ---@type TypeObj[] All of the available returns for this function, in order of returnage.
    returns = {},
}

---@class TypeObj : Class
local type_obj_defaults = {
    ---@type string The name of this type
    name = "",

    ---@type string[] The description of this type.
    desc = {},

    ---@type string The, uh, type of this type.
    type = nil,

    ---@type boolean False for return, true for parameter.
    is_param = false,

    ---@type boolean Whether this type is optional.
    is_optional = false,

    ---@type string The default value of this type, if it's optional.
    default_value = nil,
}

---@class DocObj
---@field __new fun():DocObj
local DocObj = new_class("DocObj", doc_obj_defaults)

---@class ClassObj
---@field __new fun():ClassObj
local ClassObj = new_class("ClassObj", class_obj_defaults)

---@class MethodObj
---@field __new fun():MethodObj
local MethodObj = new_class("MethodObj", method_obj_defaults)

---@class TypeObj
---@field __new fun():TypeObj
local TypeObj = new_class("TypeObj", type_obj_defaults)

--- Format string
local function sf(str, ...)
    return string.format(str, ...)
end

function DocObj:new(found_game, context, file_name)
    local o = self:__new()
    o:init(found_game, context, file_name)

    return o
end

local function get_dirs(contexts)
    local dirs = {}

    for k,v in pairs(contexts) do
        if v == true then
            dirs[#dirs+1] = k
        end
    end

    if #dirs == 3 then
        dirs = {"global"}
    end

    return dirs
end

function DocObj:init(found_game, context, file_name)
    local file_path = string.format("%s/%s/%s/%s", in_path, found_game, context, file_name)
    local file = io.open(file_path, "r")
    if not file then
        return print("No "..file_path.." file found!")
    end

    print(tostring(file))

    print(file_path .. " found!")

    --- TODO if you find a class, do X; if you don't see a class (like global.html), do Y
    self.file_name = file_name
    self.section = -1
    self.this_function = {}
    self.current_param = nil

    for line in file:lines("*a") do
        self:read(line)
    end

    
    local out_dir = check_dir(out_path, found_game, context)
    if file_name == "global.html" then
        out_dir = check_dir(out_path, found_game)
    end
    local out_filepath = out_dir .. "/" .. string.gsub(file_name, ".html", ".lua")
    printf("Outputing on file %s", out_filepath)
    local out_file = io.open(out_filepath, "w+")
    if out_file then
        out_file:write(self:print())
    end
    
    --- TODO output to specific folders automatically
    -- printf("Getting out directories for docobj %s", file_name)
    -- local out_dirs = get_dirs(self.contexts)

    -- for i,out_dir in ipairs(out_dirs) do
    --     printf("In %s", out_dir)
    --     local this_path = check_dir(out_path, found_game, out_dir)
    --     local out_filepath = this_path .. "/" .. string.gsub(file_name, ".html", ".lua")
    --     printf("Outputing on file %s", out_filepath)
    
    --     local out_file = io.open(out_filepath, "w+")
    --     if out_file then
    --         out_file:write(self:print())
    --     end
    -- end



end

function ClassObj:new(name)
    local o = self:__new()
    o:init(name)

    return o
end

function ClassObj:init(name)
    self.name = name
end

---@return MethodObj
function MethodObj:new(name)
    local o = self:__new()
    o:init(name)

    return o
end

function MethodObj:init(name)
    self.name = name
end

function TypeObj:new(name)
    local o = self:__new()
    o:init(name)

    return o
end

function TypeObj:init(name)
    self.name = name
end


function DocObj:context_check(line)
    if line:find("<td width=\"75%%\">Loaded in") then
        printf("Found context!")
        if line:find("Campaign") then
            self.contexts.campaign = true
        elseif line:find("Battle") then
            self.contexts.battle = true
        elseif line:find("Frontend") then
            self.contexts.frontend = true
        end
    end
end

--- Check if a new ClassObj is defined on this line.
---@param line string
function DocObj:class_check(line)
    if line:find("<a href=\"#class:") then
        -- create a new class with the key and the visible name (ie. class:custom_context> and Custom Context)
        line = line:match("<a href=\"#class:"..wild_un.."\">"..wild.."</a>")

        local key = line:match("<a href=\"#class:"..wild_un.."\">")
        key = key:gsub("<a href=\"#class:", ""):gsub("\">", "")

        local name = kill_html(line, true)

        printf("New class found with key %q and name %q", key, name)

        --- make sure this isn't an existing class referenced again later!
        if self:get_class(key) then return end

        --- TODO grab the description of the class
        --- TODO use the localised "name" instead of just the key
        self.current_class = ClassObj:new(key)
        self.classes[#self.classes+1] = self.current_class

        self.section = 0
    end
end

function DocObj:get_class(key)
    printf("Looking for class w/ key %s", key)
    --- make sure this isn't an existing class referenced again later!
    for i,class in ipairs(self.classes) do
        if class.name == key then
            return class
        end
    end

    return false
end

function ClassObj:num_methods()
    local i = 0
    for _,_ in pairs(self.methods) do
        i = i + 1
    end

    return i
end

function ClassObj:add_method(name)
    local new_obj = MethodObj:new(name)
    self.methods[name] = new_obj
    local num_methods = self:num_methods()

    printf("Giving %s order %i", name, num_methods)
    new_obj.order = num_methods
end

--- TODO a different system for reading scripting.txt (needed?)
--- TODO a different system for reading Events & Interfaces
--- TODO get Class description by the top!
---@param line string
function DocObj:read(line)
    self:class_check(line)
    if not self.current_class then
        self:context_check(line)
    elseif self.current_class then
        if self.section == 0 then
            if line:find("<div id=\"content\">") then
                self.section = 1
            else
                local fn_check = string.format("<a href=\"#function:%s:%s\">", wild_un, wild_un)

                -- get the "sections" and all methods
                if line:find(fn_check) then
                    local sx,ex = line:find(fn_check)
                    local rep = line:sub(sx, ex)
                    local this_class_key = rep:match("<a href=\"#function:"..wild_un):gsub("<a href=\"#function:", "")
                    local this_class = self:get_class(this_class_key)

                    rep = rep:gsub("<a href=\"#function:"..this_class_key..":", "")
                    rep = rep:gsub("\">", "")

                    this_class:add_method(rep)

                    printf("Found function %s:%s()", this_class_key, rep)
                -- TODO wtf is this?
                elseif line:find("href=\"#self.section") then
                    -- meh
                end
            end
        elseif self.section >= 1 then
            local fn_name = string.format("<a name=\"function:%s:%s\">", wild_un, wild_un)
            if self.section == 1 then
                if line:find("dl class=\"function\"") then
                    self.section = 1.1
                end
            elseif self.section == 1.1 then -- getting a specific function or its details!
                if line:find(fn_name) then
                    --- TODO this MUST read from <code>function()</code> instead of a name/href (for things like global:out() actually just being out())
                    local rep = line:match(fn_name)
                    printf("Line is %s", line)
                    local class_name = rep:match("<a name=\"function:"..wild_un)
                    class_name = class_name:gsub("<a name=\"function:", "")
                    printf(class_name)
                    local class = self:get_class(class_name)
                    rep = rep:gsub("<a name=\"function:"..class_name..":", "")
                    rep = rep:gsub("\">", "")

                --    [[ <a name="function:global:script_error"><h3 class="function_name"><strong><code>script_error(<code><a href="lua.html#class:string">string</a></code> </strong></code><i class="parameter">message</i><code><strong>, [<code><a href="lua.html#class:number">number</a></code> </strong></code><i class="parameter">stack level modifier</i><code><strong>], [<code><a href="lua.html#class:boolean">boolean</a></code> </strong></code><i class="parameter">suppress assert</i><code><strong>])</code></strong></h3></a>
                --         global ]]

                    --- TODO handle if it's a method, OR if the class is invisible (ie. global)
                    local in_str = line:match("<code>"..wild_un.."[%.:]")
                    local is_method = false
                    if not in_str then
                        -- is_method = false
                        printf("%s.%s is not a method!", class_name, rep)
                    else
                        in_str = kill_html(in_str, true)
                        printf("Testing if %s is a method or static", in_str)
                        is_method = in_str:match(":$") ~= nil
                        -- is_method = in_str:match(string.format("%s:", class_name)) ~= nil

                        if is_method then
                            printf("It's %s.%s()", class_name, rep)
                        else
                            printf("It's %s:%s()", class_name, rep)
                        end
                        -- printf("%s.%s() has a colon: ")

                        printf("%s:%s() is a method: " .. tostring(is_method), class_name, rep)
                    end

                    self.this_function = {
                        name = rep,
                        next = 0,
                        class = class,
                        -- is_method = is_method
                    }

                    printf("In %s:%s()", class_name, self.this_function.name)

                    class.methods[self.this_function.name].is_method = is_method

                    --- we have to get the param names from here!
                    -- find each <i class="parameter">param_name</i>
                    -- <i class="parameter">width</i>
                    for str in string.gmatch(line, "<i class=\"parameter\">"..wild.."</i>") do
                        str = kill_html(str, true)
                        str = str:gsub(" ", "_")
                        str = str:gsub("%.", "")
                        print("FOUND PARAM NAME: " .. str .. " at index " .. #class.methods[self.this_function.name].params+1)

                        ---@class param
                        local param = TypeObj:new(str)

                        class.methods[self.this_function.name].params[#class.methods[self.this_function.name].params+1] = param
                    end
                elseif self.this_function then
                    if self.this_function.next == 0 then
                        if line:find("<dd>") then 
                            self.this_function.next = 1
                        end
                    elseif self.this_function.next == 1 then -- We're in desc!
                        -- getting the desc
                        local is = line:find(wild)
                        if line:find("<h4>Parameters:</h4") then
                            self.this_function.next = 2
                        elseif line:find("<h4>Returns:</h4>") then
                            self.this_function.next = 3
                        elseif is then
                            -- line = string.gsub(line, "\t", "")
                            local d = kill_html(line, true)
                            -- local s = self.methods[self.this_function.name].desc or ""
                            -- s = s .. "\n" .. d
                            printf("Description of %s:%s() is %q", self.this_function.class.name, self.this_function.name, d)
                            self.this_function.class.methods[self.this_function.name].desc[#self.this_function.class.methods[self.this_function.name].desc+1] = d
                        end
                    elseif self.this_function.next == 2 then -- we're in Params!
                        -- Note: this is optional!
                        if line:find("<h4>Returns:</h4>") then
                            self.this_function.next = 3
                        end

                        -- print(line)

                        --- TODO see if it's optional, what the default value is, the "name" (if any), and the position

                        --- param order!
                        local current_order = 0
                        if line:find("<strong>") then 
                            current_order = tonumber(kill_html(line, true))
                            ---@type TypeObj
                            self.current_param = self.this_function.class.methods[self.this_function.name].params[current_order]

                            if self.current_param then
                                print("Entering param order " .. current_order .. " with name " .. self.current_param.name)
                            end
                        -- try to get the current type
                        elseif type(self.current_param) == 'table' then
                            -- printf("Checking param %s", self.current_param.name)
                            if line:find("<code>") and not self.current_param.type then
                                --- get only the stuff in between the html tags
                                local t = kill_html(line, true)
                                print("Adding type " .. t .. " to param #"..current_order.." named " .. self.current_param.name)
                                self.current_param.type = t
                            
                            else -- try to get the description
                                if line:find("<p>") then
                                    if line:find("optional, default value=") then
                                        printf("We have an optional parameter line: " .. line)
                                        local default = line:match("default value=.*<"):gsub("default value=", "")
                                        -- local default = line:match("default value="..wild_un):gsub("default value=", "")
                                        self.current_param.is_optional = true
                                        self.current_param.default = default
                                    end

                                    self.current_param.desc[#self.current_param.desc+1] = kill_html(line, true)
                                end
                            end
                        end
                        
                    elseif self.this_function.next == 3 then -- we're in Returns!
                        -- Always happens!
                        -- printf("We're in the return section for %s:%s()", self.this_function.class.name, self.this_function.name)
                        if line:find("<li><code>") then
                            --- type is between <code>TYPE</code> (potentially a href if Lua native type), name is between </code> NAME </li>
                            local t = line:match("<li><code>.-%a+<.->")
                            if t then
                                local ty = kill_html(t, true)

                                local ret = TypeObj:new("")

                                local n = line:match("</code>[%a%s]+</li>")
                                if n then
                                    ret.name = kill_html(n, true)
                                end

                                ret.type = ty

                                printf("Trying to get function %s:%s()", self.this_function.class.name, self.this_function.name)
                                local method = self.this_function.class.methods[self.this_function.name]

                                printf("Ret w/ name %s and type %s found for %s:%s()", ret.name, ret.type, self.this_function.class.name, self.this_function.name)

                                if not method.returns then method.returns = {} end
                                method.returns[#method.returns+1] = ret
                            end
                        end
                    end
                end
            end
        end
    end
end

--- TODO different print functions for different outputs (ie. EmmyLua or Kailua or whatever)
--- Construct an output string to print for this Documentation Object.
function DocObj:print()
    local s = "--- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT MANUALLY.\n"

    for _,class in pairs(self.classes) do
        s = s .. class:print()
    end

    return s
end

function ClassObj:print()
    local s = ""
    local name = overwrite_types[self.name] or self.name
    local this_overrides = override_methods[name]

    --- Insert into string
    local function ins(str)
        s = s .. "\n" .. str
    end

    --- Insert formatted into string
    local function insf(str, ...)
        s = s .. "\n" .. sf(str, ...)
    end

    if name ~= "global" then
        --- TODO plop in description here
        insf("---@class %s", name)
        insf("local %s = {}\n", name)
    else
        insf("--- All the global functions!")
    end


    local ordered_methods = {}
    for _,method in pairs(self.methods) do
        ordered_methods[method.order] = method
    end

    for i,method in ipairs(ordered_methods) do
        if this_overrides then
            for _,override_method in ipairs(this_overrides) do
                if override_method.name == method.name then
                    printf("OVERRIDING METHOD %s in class %s", override_method.name, name)
                    method = override_method
                end
            end
        end
        s = s .. method:print(name)
    end

    return s
end

function MethodObj:print(c_name)
    local s = ""

    --- Insert into string
    local function ins(str, ln)
        s = string.format("%s%s%s", s, ln==true and "\n" or "", str)
    end

    --- Insert formatted into string
    local function insf(str, ...)
        s = s .. "\n" .. sf(str, ...)
    end

    local desc = table.concat(self.desc, "\n--- ")
    insf("--- %s", desc)
    -- insf("--- %s", self.desc)

    local param_names = {}
    for _,param in ipairs(self.params) do
        ins(param:print(true), false)
        local name = param.name
        local corrected_type = overwrite_types[param.type] or param.type
        if corrected_type == "..." then name = "..." end
        param_names[#param_names+1] = name
    end

    for i, ret in ipairs(self.returns) do
        -- printf("Trying to print a return for %s")
        ins(ret:print(), false)
    end

    local delim = ":"
    if not self.is_method then
        delim = "."
        printf("%s.%s is a method!", c_name, self.name)
    end

    local fstr = "function %s%s%s(%s) end\n"
    if c_name == "global" then
        -- fstr = "function %s%s%s(%s) end\n"
        c_name = ""
        delim = ""
    end

    insf(fstr, c_name, delim, self.name, table.concat(param_names, ", "))

    return s
end

function TypeObj:print(is_param)
    local s = ""

    --- Insert into string
    local function ins(str)
        s = s .. "\n" .. str
    end

    --- Insert formatted into string
    local function insf(str, ...)
        s = s .. "\n" .. sf(str, ...)
    end

    local corrected_type = overwrite_types[self.type] or self.type
    local name,desc = self.name,self.desc or {""}
    local is_optional, default_value = self.is_optional, self.default_value

    --- check if name or desc start with a space[s] and then remove it
    name = name:gsub("^%s*", "")
    desc = table.concat(desc, " ")
    desc = desc:gsub("^%s*", "")

    if is_param then
        if corrected_type == "..." or corrected_type == "vararg" then
            name = "..."
            corrected_type = "any" --- TODO proper type-checking for varargs later, the docs are very fucked up.
        end
        -- else
        printf("param name is %s, type is %s, optional is %s and default value is %s", tostring(name), tostring(corrected_type), tostring(is_optional), tostring(default_value))
        insf("---@param %s %s%s %s", name, tostring(corrected_type), is_optional and "?" or "", desc == "" and desc or "#"..desc)
        -- end
    else
        if corrected_type ~= "nil" and corrected_type ~= "NONE" then
            if corrected_type == "vararg" then corrected_type = "..." end
            if name == "" and desc == "" then
                insf("---@return %s", corrected_type)
            else
                insf("---@return %s #%s %s", corrected_type, name, desc)
            end
        end
    end

    return s
end

return {DocObj,MethodObj,TypeObj}