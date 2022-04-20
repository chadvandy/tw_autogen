--- TODO if there's two params with the same name (because CA docs don't provide param names), name them _1 _2 etc.

--- TODO fix the assumption of every file being a full class (ie. global.html just being globby functions)
--- TODO also fix the assumption of every file being a single class (ie. core.html having custom_context and others)

--- TODO change the overrides folder structure so it has /wh3/ etc. folders within
--- TODO smartly create a single file called "all.lua" or "setup.lua" or something that basiucally defines all the relevant global variables and assigns them to the types

--- NEXT maybe load up all classes created in each docobj, but treat some classes as "invisible" so you just print `method()` instead of `class:method()`. it'll be easier for global.
---- Decide if I want to just hardcode "global class is invisible" or do something like "read the actual visible text in a function definition, and if there's no class there don't give them a class and link them to the doc obj"

--- TODO hardcode the order of functions to match that of the documentation

--- TODO emmylua-ify LFS
package.cpath = package.cpath .. ";includes/?.dll"
require "lfs"

override_path = "overrides"
in_path = "input"
out_path = "output"

function printf(t, ...)
    print(string.format(t, ...))
end

--- TODO move to overrides/ file
local OVERRIDES = require "overrides"
local __ = require "doc_obj"
local DocObj = __[1]
local MethodObj = __[2]
local TypeObj = __[3]

overrides = {}

overwrite_types = {
    ["address"] = "UIC_Address",
    ["uicomponent"] = "UIC",
    variable = "any",
    value = "any",
    object = "any",
    card = "number",
    float32 = "number",
    data = "string|number|boolean",
    
    ["nil"] = "NONE",
    void = "NONE",
    
    --- Interfaces
    null_interface = "NULL_SCRIPT_INTERFACE",
    character = "CHARACTER_SCRIPT_INTERFACE",
    family_member = "FAMILY_MEMBER_SCRIPT_INTERFACE",
    faction = "FACTION_SCRIPT_INTERFACE",
    region = "REGION_SCRIPT_INTERFACE",
    region_data = "REGION_DATA_SCRIPT_INTERFACE",
    unit = "UNIT_SCRIPT_INTERFACE",
    province = "PROVINCE_SCRIPT_INTERFACE",
    garrison_residence = "GARRISON_RESIDENCE_SCRIPT_INTERFACE",
    military_force = "MILITARY_FORCE_SCRIPT_INTERFACE",
    military = "MILITARY_FORCE_SCRIPT_INTERFACE",
    force = "MILITARY_FORCE_SCRIPT_INTERFACE",
    military_force_list = "MILITARY_FORCE_LIST_SCRIPT_INTERFACE",
    settlement = "SETTLEMENT_SCRIPT_INTERFACE",
    ["[MODIFY]RITUAL_SETUP_SCRIPT_INTERFACE"] = "MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE|RITUAL_SETUP_SCRIPT_INTERFACE",
}

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

    --- TODO read through overrides.
    for event,override_data in pairs(OVERRIDES.Events) do
        printf("Overriding details for %s", event)
    end

    for interface_key,override_data in pairs(OVERRIDES.Interfaces) do
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

    --- Print file
    local eai_path = string.format("%s/%s/tw_events_and_interfaces.lua", out_path, game)
    local new_file = io.open(eai_path, "w+")

    local endl = "---============================---"
    local startl = "\t--- [[ %s ]] ---"

    local s = string.format("%s\n", "---@diagnostic disable\n")

    local function ins(str)
        s = s .. "\n" .. str
    end

    local function insf(str, ...)
        s = s .. "\n" .. string.format(str, ...)
    end

    -- First, write out the events section
    insf("%s\n%s\n%s", endl, string.format(startl, "Events"), endl)
    for key,event in pairs(events) do
        insf("do")
        insf("\t---@class %s", key)
        insf("\tlocal %s = {}", key)
        for i,fun in ipairs(event.functions) do
            --- TODO multi-returns?
            if fun.returns and fun.returns ~= "" then
                local retval = overwrite_types[fun.returns] or fun.returns
                if retval ~= "NONE" then
                    insf("\n\t---@return %s", retval)
                end
            end
            insf("\tfunction %s:%s() end", key, fun.index)
            -- insf("\n---@field %s fun(self:%s)%s", fun.index, key, type(fun.returns) == "nil" and "" or ":"..fun.returns)
        end

        insf("end\n%s", endl)
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
                    insf("---@return %s", ret)
                end
            end

            insf("function %s:%s(%s) end", key, fun.index, "")
            -- interface_string = interface_string .. string.format("\n---@field %s fun(self:%s)%s", fun.index, key, (fun.returns and fun.returns ~= "" and ":" .. fun.returns) or "")
        end
    end

    -- add_listener variants!!
    s = s .. "\n\n" .. endl .. string.format("\n%s\n", string.format(startl, "Listeners")) .. endl .. "\n\n---@class Core"
    for key,_ in pairs(events) do 
        s = s .. string.format("\n---@field add_listener fun(self:Core, key:string, event: \"'%s'\", conditional: fun(context:%s), callback:fun(context:%s), persistent:boolean)", key, key, key)
    end

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

    local game_path = string.format("%s/%s", path, found_game)
    local game_dir = lfs.attributes(game_path)
    if not game_dir or game_dir.mode ~= "directory" then
        lfs.mkdir(game_path)
    end

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

local function parse_override_file(file_path)
    local file = io.open(file_path, "r+")
    if not file then
        --- ERRMSG???
        return
    end

    local this = nil

    for line in file:lines("*a") do
        --- only read lines that start with --- or have `function` to start.
        if line:find("^---") or line:find("^function") then
            if not this then this = MethodObj:new() end

            if line:find("^---@") then
                -- check if it's a param or a return or a vararg
            elseif line:find("^---") then
                -- description
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

                this.parent_class = class
                this.name = method_name
            end
        else
            this = nil
        end
    end
end

local function init()
    for override_file in lfs.dir(override_path) do
        if override_file:find(".lua") then
            --- TODO read the override file, apply the override in the overrides table, and loop through it.
            parse_override_file(override_path .. "/" .. override_file)
        end
    end

    parse_all_games()
end

init()