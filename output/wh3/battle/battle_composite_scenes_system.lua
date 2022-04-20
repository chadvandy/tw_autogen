
---@class battle_composite_scenes_system
local battle_composite_scenes_system = {}

--- Returns a list of all terrain composite scenes on the map.
function battle_composite_scenes_system:terrain_composite_scenes() end

--- Returns a list of all terrain composite scenes with the given scene name.
---@param scene_name string scene_name
function battle_composite_scenes_system:composite_scenes_by_scene_name(scene_name) end

--- Returns a list of all terrain composite scenes who have this parent script id.
---@param parent_script_id string parent_script_id
function battle_composite_scenes_system:composite_scenes_by_parent_script_id(parent_script_id) end

--- Returns a terrain composite scene with the given script id.
---@param script_id string script id
function battle_composite_scenes_system:composite_scene_by_script_id(script_id) end

---@class battle_composite_scenes_list
local battle_composite_scenes_list = {}

--- Returns the composite scene in the given position in the list.
---@param index number index
function battle_composite_scenes_list:item(index) end

--- Returns the composite scene with the given script id.
---@param script_id string script_id
function battle_composite_scenes_list:search_by_script_id(script_id) end

--- Returns the composite scene which this parent script id.
---@param script_id string script_id
function battle_composite_scenes_list:search_by_parent_script_id(script_id) end

--- Returns a composite scene list of composite scenes with the given scene name.
---@param scene_name string scene_name
function battle_composite_scenes_list:search_by_scene_name(scene_name) end

--- Enables/disable the all composite scenes in the list.
---@param enable boolean enable
---@param loop boolean loop
function battle_composite_scenes_list:enable(enable, loop) end

--- Returns the number composite scenes in the list.
function battle_composite_scenes_list:count() end

---@class battle_composite_scene
local battle_composite_scene = {}

--- Returns whether the composite scene instance is enabled.
function battle_composite_scene:enabled() end

--- Enables/disable the composite scene.
---@param enable boolean enable
---@param loop boolean loop
function battle_composite_scene:enable(enable, loop) end

--- Returns the scene name of the composite scene.
function battle_composite_scene:scene_name() end

--- Returns the script id of the composite scene.
function battle_composite_scene:script_id() end
