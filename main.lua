--- TODO if there's two params with the same name (because CA docs don't provide param names), name them _1 _2 etc.

--- TODO change the overrides folder structure so it has /wh3/ etc. folders within
--- TODO smartly create a single file called "all.lua" or "setup.lua" or something that basiucally defines all the relevant global variables and assigns them to the types

--- TODO emmylua-ify LFS
package.cpath = package.cpath .. ";includes/?.dll"
require "lfs"

local override_method_path = "override_methods"
local override_type_path = "override_types"

in_path = "input"
out_path = "output"

local out_file = io.open("out.txt", "w+")

local i = 0
local old_print = print
function print(t)
    old_print(t)
    out_file:write("\n" .. t)

    i = i + 1
    if i >= 10000 then out_file:flush() i = 0 end
end

function printf(t, ...)
    print(string.format(t, ...))
end

--- TODO move to overrides/ file
local OVERRIDES = require "overrides"
local __ = require "doc_obj"
local DocObj = __[1]
local MethodObj = __[2]
local TypeObj = __[3]

---@type table<string, MethodObj[]>
override_methods = {}

---@type table<string, string>
overwrite_types = {}

--- TODO print out scripting_doc info same as anything else (ie. local class = {} function class:method(args) end)
--- scripting_doc.html
local function parse_events(game)
    local path = string.format("%s/%s/scripting_doc.html", in_path, game)
    local file = io.open(path, "r")
    if not file then
        return print("No scripting_doc.html file found!")
    end

    print("Events file found!")

    --- First, loop through the "Events" section and define a table of events
    --- Then, loop through the "Interfaces" section and do the same

    --- Next, go through the events table, find those events in the file, parse the functions within, saving them within the events
    --- Next, go through interfaces and do the same

    --- Finaly, print out and write down all of these using EmmyLua annotations.
        --- In this, make a version of add_listener for each variant!

    local section = 0
    local events = {}
    local interfaces = {}

    local current_event
    local current_interface

    for line in file:lines("*a") do
        if section == 0 then -- Very top
            if line == "<h2>Events</h2>" then 
                section = 1
            end
        elseif section == 1 then -- Events section
            if line:find("Interfaces") then
                -- we're in Interfaces now!
                section = 2
            elseif line:find("a href=") then
                -- we're defining an event here - grab its name.
                -- print(line)
                local sx,ex = line:find('href=\"#%a+\"')
                if not sx then
                    -- err
                else
                    sx = sx + 7
                    ex = ex - 1
                    local name = line:sub(sx,ex)
                    print("Found event: " .. name)

                    events[name] = {
                        functions = {},
                    }
                end
            end
        elseif section == 2 then -- Interfaces def!
            if line:find("Event Functions") then
                -- we're in Interfaces now!
                section = 3
            elseif line:find("a href=") then
                -- we're defining an event here - grab its name.
                -- print(line)
                local sx,ex = line:find('href=\"#[%a_]+\"')
                if not sx then
                    -- err
                else
                    sx = sx + 7
                    ex = ex - 1
                    local name = line:sub(sx,ex)
                    print("Found interface: " .. name)

                    interfaces[name] = {
                        key = name,
                        functions = {},
                    }
                end
            end
        elseif section == 3 then -- Event Functions
            local sx,sy = line:find("name=\"%a+\"")
            if line:find("Interface Functions") then 
                section = 4
            elseif current_event then -- we're in an event function
                -- end is <br></dd> to next event
                if line:find("<br></dd>") then 
                    current_event = nil
                else
                    -- first line is "Function Name: ", for the actual index for the function
                    local fx,fy = line:find("Function Name: [%a_]+")
                    if fx then
                        -- grab the function index
                        local fn_index = line:sub(fx, fy)
                        fn_index = fn_index:gsub("Function Name: ", "")
                        -- print("Found function in event " .. current_event .. " with index " .. fn_index)
                        
                        events[current_event].functions[#events[current_event].functions+1] = {
                            index = fn_index,
                            description = "",
                            returns = nil,
                        }
                    else
                        -- we're in a function - grab the last one made
                        local fn_tab = events[current_event].functions[#events[current_event].functions]
                        
                        local ix,iy = line:find("Interface: <a href=\"#[%a_]+")
                        local dx,dy = line:find("Description: [%a%s%p]+")

                        if ix then
                            print("Retval found")
                            -- we're getting the return value!
                            local ret = line:sub(ix, iy)
                            ret = ret:gsub("Interface: <a href=\"#", "")
                            -- print("Return for function "..current_event..":"..fn_tab.index.."() is " .. ret)

                            fn_tab.returns = ret
                        elseif dx then
                            print("Desc found")
                            -- we're getting the description!
                            local desc = line:sub(dx, dy)
                            desc = desc:gsub("Description: ", "")
                            desc = desc:gsub("</dd>", "")
                            -- print("Description for function "..current_event..":"..fn_tab.index.."() is " .. desc)

                            fn_tab.description = desc
                        else
                            -- skip?
                        end
                    end
                end
            elseif sx then
                local event_name = line:sub(sx, sy):gsub("name=", "")
                event_name = event_name:gsub("\"", "")

                print(line)
                -- print("In functions for event " .. tostring(event_name))

                current_event = event_name
            end
        elseif section == 4 then -- interface functions
            -- could be the interface name or the function name
            local nx,ny = line:find("<a name=\"[%a_]+")
            if nx then
                print("Found a new thing")
                -- get rid of the HTML stuff
                local s = line:sub(nx, ny)
                s = s:gsub("<a name=\"", "")

                print(s)

                -- test if it's an existing interface
                if interfaces[s] then -- it's an interface!
                    current_interface = s
                else
                    -- functions are defined as <a name="INTERFACEfunction">, so we have to get rid of the interface name
                    s = s:gsub(current_interface, "")
                    -- we've got the name of a function
                    interfaces[current_interface].functions[#interfaces[current_interface].functions+1] = {
                        index = s,
                        params = nil,
                        returns = nil,
                        description = "",
                    }
                end
            elseif current_interface then
                print("In interface " .. current_interface)
                -- all we need from here is the desc/param/ret fields
                local dx,dy = line:find("Description: [%a%s%p]+")
                local px,py = line:find("Parameters: [%a%s%p]+")
                local rx,ry = line:find("Return: [%a%s%p]+")

                if dx and not interfaces[current_interface].description then 
                    local desc = line:sub(dx, dy)
                    desc = desc:gsub("</dd>", "")
                    interfaces[current_interface].description = desc
                else
                    local fn_tab = interfaces[current_interface].functions[#interfaces[current_interface].functions]
                    if dx then 
                        local desc = line:sub(dx, dy)
                        desc = desc:gsub("</dd>", "")
                        fn_tab.description = desc 
                    elseif px then 
                        --- Parameters: is_recipe_available(String recipe_key)
                        local param = line:sub(px, py)
                        param = param:gsub("</dd>", "")

                        param = param:gsub(fn_tab.index, "")
                        param = param:gsub("[()]", "")
                        print("Param: " .. param)
                        if param ~= "" then
                            fn_tab.params = param
                        end
                    elseif rx then
                        --- TODO fix up multiple returns
                        local ret = line:sub(rx, ry)
                        ret = ret:gsub("Return: ", "")
                        ret = ret:gsub("</dd>", "")

                        if ret:find("[(.+,)]") then
                            printf("Found a line with multiple returns: %s", ret)
                        end

                        --- TODO it will sometimes do an a href= here for interfaces, so check and fix!
                        local hx,hy = ret:find("<a href=\"#[%a_]+")
                        if hx then
                            print("HREF FOUND: " .. ret)
                            ret = ret:sub(hx, hy)
                            print("SUBBED: " .. ret)
                            ret = ret:gsub("<a href=\"#", "")
                            print("GSUB: " .. ret)
                        end

                        -- if ret == "nil" or ret == "NONE" then
                        --     fn_tab.returns = nil
                        -- else
                        --     print("Ret: ".. ret)
                        --     fn_tab.returns = {ret}
                        -- end
                    end
                end
            end

            -- first line is interface key
            -- second is a description of this interface
            -- third is a list of all function indices
            -- following that is a breakdown of each function's description / parameters / returns
        end
    end

    local this_overrides = OVERRIDES[game]

    if this_overrides then
        for event,override_data in pairs(this_overrides.Events) do
            --- TODO
            printf("Overriding details for %s", event)
        end
    
        for interface_key,override_data in pairs(this_overrides.Interfaces) do
            printf("Overriding details for interface %s", interface_key)
    
            local interface = interfaces[interface_key]
    
            if override_data.functions then
                for func_name,func_overrides in pairs(override_data.functions) do
                    for i,f in ipairs(interface.functions) do
                        if f.index == func_name then
                            for k,v in pairs(func_overrides) do
                                f[k] = v
                            end
                        end 
                    end
                    
                end
            end
        end
    end

    --- Print file
    local eai_path = string.format("%s/%s/tw_events_and_interfaces.lua", out_path, game)
    local new_file = io.open(eai_path, "w+")

    local endl = "---============================---"
    local startl = "\t--- [[ %s ]] ---"

    -- local s = string.format("%s\n", "---@diagnostic disable\n")
    local s = ""

    local function ins(str)
        s = s .. str
    end

    local function insf(str, ...)
        s = s .. string.format(str, ...)
    end

    -- First, write out the events section
    insf("%s\n%s\n%s", endl, string.format(startl, "Events"), endl)
    for key,event in pairs(events) do
        insf("\ndo")
        insf("\n\t---@class %s", key)
        insf("\n\tlocal %s = {}", key)
        for i,fun in ipairs(event.functions) do
            --- TODO multi-returns?
            if fun.returns and fun.returns ~= "" then
                local retval = overwrite_types[fun.returns] or fun.returns
                if retval ~= "NONE" then
                    insf("\n\t---@return %s", retval)
                end
            end
            insf("\n\tfunction %s:%s() end", key, fun.index)
            -- insf("\n---@field %s fun(self:%s)%s", fun.index, key, type(fun.returns) == "nil" and "" or ":"..fun.returns)
        end

        insf("\nend\n%s", endl)
    end

    -- write out the interfaces section!
    s = s .. "\n\n" ..  endl .. string.format("\n%s\n", string.format(startl, "Interfaces")) .. endl
    for key,interface in pairs(interfaces) do
        insf("\n\n---@class %s%s", key, (" " .. interface.description) or "")
        ins("\nlocal " .. key .. " = {}")
        for i,fun in ipairs(interface.functions) do

            --- TODO params

            if type(fun.returns) == "table" then
                for j,ret in ipairs(fun.returns) do
                    if ret == "" then ret = "UNKNOWN" end
                    ret = overwrite_types[ret] or ret
                    insf("\n---@return %s", ret)
                end
            end

            insf("\nfunction %s:%s(%s) end", key, fun.index, "")
            -- interface_string = interface_string .. string.format("\n---@field %s fun(self:%s)%s", fun.index, key, (fun.returns and fun.returns ~= "" and ":" .. fun.returns) or "")
        end
    end

    --- TODO temp removed, figure a better way to incorporate this when it's functional again (sumneko-side error)
    -- -- add_listener variants!!
    -- s = s .. "\n\n" .. endl .. string.format("\n%s\n", string.format(startl, "Listeners")) .. endl .. "\n\n---@class Core"
    -- for key,_ in pairs(events) do 
    --     s = s .. string.format("\n---@overload fun(key:string, event: \"'%s'\", conditional: fun(context:%s), callback:fun(context:%s), persistent:boolean)", key, key, key)
    -- end

    -- s = s .. string.format("\n---")

    new_file:write(s)
end


--- TODO prettify
local headers = {
    ["UIC"] = [[
---@class UIC_Address:userdata A pointer to the UIC.

---@param address UIC_Address
---@return UIC
function UIComponent(address) end

]]
}

--- Remove all HTML tags in this line of text
---@param txt string
---@param remove_line_breaks_and_tabs boolean|nil
---@return string
function kill_html(txt, remove_line_breaks_and_tabs)
    local t = txt
    for tag in t:gmatch("</?[%a%s_\"#:=%.]+>") do
        t = t:gsub(tag, "", 1)
    end

    if remove_line_breaks_and_tabs then
        t = t:gsub("[\t\n]", "")
    end

    return t
end

local function sf(txt, ...)
    return string.format(txt, ...)
end

function check_dir(path, found_game, context)
    local out_dir = lfs.attributes(path)
    if not out_dir or out_dir.mode ~= "directory" then
        lfs.mkdir(path)
    end

    if not found_game then return path end

    local game_path = string.format("%s/%s", path, found_game)
    local game_dir = lfs.attributes(game_path)
    if not game_dir or game_dir.mode ~= "directory" then
        lfs.mkdir(game_path)
    end

    if not context then return game_path end

    local context_path = string.format("%s/%s", game_path, context)
    local context_dir = lfs.attributes(context_path)
    if not context_dir or context_dir.mode ~= "directory" then
        lfs.mkdir(context_path)
    end

    return context_path
end


print("START")
package.path = package.path .. ";.vscode/?.lua"

--- TODO emmylua-ify LFS
local function parse_all_games()
    local path = "./input/"
    --- Each "file" is the path to one of the games; keep this in mind for the 
    for found_game in lfs.dir(path) do
        if found_game == "." or found_game == ".." then
            -- ignore; dunno what these are, LFS
        else
            local game_path = path .. "/" .. found_game
            printf("Game found at %s", game_path)

            --- find each HTML file in each "context" (battle;campaign;frontend)
            local contexts = {"battle", "campaign", "frontend"}
            for i = 1,#contexts do
                local context = contexts[i]
                local context_path = game_path .. "/" .. context

                for file in lfs.dir(context_path) do
                    local invalids = {
                        "index.html", "lua.html"
                    }

                    --- if not an HTML file, fuck off
                    --- if an index file, fuck off as well
                    if file:find(".html") and not file:find("index.html") and not file:find("lua.html") then
                        printf("Found %s within %s/%s", file, found_game, context)

                        -- if file:find("core") then
                            DocObj:new(found_game, context, file)
                        -- end
                    end
                end
            end

            --- TODO no longer special it
            --- grab the scripting_doc.html and treat it special
            parse_events(found_game)
        end
    end
end

--- TODO overrides currently don't support returns lmao
local function parse_override_file(file_path)
    local file = io.open(file_path, "r+")
    if not file then
        --- ERRMSG???
        return
    end

    ---@type MethodObj A MethodObj to override on a class.
    local this = nil

    ---@type string The string name of the class to be overriden upon
    local this_class = ""


    for line in file:lines("*a") do
        --- only read lines that start with --- or have `function` to start.
        if line:find("^---") or line:find("^function") then
            if not this then this = MethodObj:new() end

            if line:find("^---@") then
                -- check if it's a param or a return or a vararg
                local wild_un_bar = "[%a_|]+"
                if line:find("^---@param") then
                    printf("Line is %s", line)

                    local param_name, param_type, param_desc
                    
                    do
                        local pn_s,pn_e = line:find("^---@param " .. wild_un)
                        line = line:gsub("^---@param ", "")
                        param_name = line:sub(1, pn_e-10)
                        -- param_name = 
                        -- param_name = line:sub( )
                        line = line:sub(pn_e+1-10)
                        printf("Param name is %s", param_name)

                        local pt_s,pt_e = line:find(wild_un_bar)
                        param_type = line:match(wild_un_bar)
                        line = line:sub(pt_e+1)
                        printf("Param type is %s", param_type)

                        -- remove any leading spaces!
                        line = line:gsub("^[%s]+", "")
                        param_desc = line
                        printf("Param desc is %s", param_desc)
                    end

                    -- local param_type = line:match("^---@param " .. param_name .. " " .. wild_un_bar):gsub("^---@param " .. param_name .." ", "")
                    -- printf("Param type is %s", param_type)
                    -- local param_desc = line:match("^---@param " .. param_name .. " " .. param_type .. " " .. wild_sp):gsub("^---@param " .. param_name .. " " .. param_type .. " ", "")


                    local param = TypeObj:new(param_name)
                    param.is_param = true
                    param.type = param_type
                    param.desc = param_desc

                    this.params[#this.params+1] = param
                elseif line:find("^---@return") then
                    --- first it's the type, then it's the description - no name.
                    line = line:gsub("^---@return[%s]", "")
                    printf("Return line without lead&spaces is %s", line)

                    --- TODO type should be everything connected that ISN'T a space or a #
                    local type = line:match("[^%s#]+")
                    local t_s,t_e = line:find("[^%s#]+")
                    printf("Everything that connects that isn't a space or # is %s", type)

                    local comment = line:sub(t_e+1)
                    --- Remove trailing spaces
                    comment = comment:gsub("^[%s]+", "")

                    local ret = TypeObj:new("")
                    ret.type = type
                    ret.desc = comment

                    this.returns[#this.returns+1] = ret
                end
            elseif line:find("^---") then
                -- description
                local desc = line:gsub("^--- ", "")
                this.desc[#this.desc+1] = desc
            elseif line:find("^function") then
                -- define the function name!
                local method_name = line:gsub("^function ", "")
                printf("Line: %s", method_name)
                method_name = method_name:match("[%a_]+:[%a_]+%(.+%)")
                -- printf("Method: %s", method_name)

                local class = line:match("[%a_]+:")
                class = class:gsub(":", "")
                printf("Class is %s", class)

                local method = line:match(":[%a_]+")
                method = method:gsub(":", "")
                printf("Method is %s", method)

                -- this.parent_class = class
                this_class = class
                this.name = method
            end
        elseif line == "" then
            --- save our existing stuff!
            printf("Found an override for %s:%s()", this_class, this.name)
            if not override_methods[this_class] then override_methods[this_class] = {} end

            override_methods[this_class][#override_methods[this_class]+1] = this

            --- start tracking the next one!
            this = nil
            this_class = ""
        end
    end

    --- We need to do this at the end here when we're done looping in case there wasn't an empty line after the last section in the overrides file.
    if this then
        --- save our existing stuff!
        printf("Found an override for %s:%s()", this_class, this.name)
        if not override_methods[this_class] then override_methods[this_class] = {} end
    
        override_methods[this_class][#override_methods[this_class]+1] = this
    end
end

local function init()
    for override_file in lfs.dir(override_method_path) do
        if override_file:find(".lua") then
            --- TODO read the override file, apply the override in the overrides table, and loop through it.
            parse_override_file(override_method_path .. "/" .. override_file)
        end
    end

    package.path = package.path .. ";override_types/?.lua"

    printf("Checking override_types folder!")
    for override_file in lfs.dir(override_type_path) do
        printf("found a file in %s/%s", override_type_path, override_file)
        if override_file:find(".lua") then
            override_file = override_file:gsub(".lua", "")
            local t = require(override_type_path .. "." .. override_file)
            for k,v in pairs(t) do
                printf("Setting %s = %s", k, v)
                overwrite_types[k] = v
            end
        end
    end

    parse_all_games()
end

init()