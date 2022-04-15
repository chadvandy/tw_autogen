
---@class battle_composite_scene
local battle_composite_scene = {}

--- 
function battle_composite_scene:search_by_parent_script_id() end

--- 
function battle_composite_scene:composite_scene_by_script_id() end

--- Enables/disable the composite scene.
---@param enable boolean enable
---@param loop boolean loop
function battle_composite_scene:enable(enable, loop) end

--- 
function battle_composite_scene:composite_scenes_by_parent_script_id() end

--- Returns the script id of the composite scene.
function battle_composite_scene:script_id() end

--- Returns the scene name of the composite scene.
function battle_composite_scene:scene_name() end

--- 
function battle_composite_scene:composite_scenes_by_scene_name() end

--- 
function battle_composite_scene:item() end

--- Returns whether the composite scene instance is enabled.
function battle_composite_scene:enabled() end

--- 
function battle_composite_scene:terrain_composite_scenes() end

--- 
function battle_composite_scene:count() end

--- 
function battle_composite_scene:search_by_scene_name() end

--- 
function battle_composite_scene:search_by_script_id() end
