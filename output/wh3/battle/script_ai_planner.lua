
---@class script_ai_planner
local script_ai_planner = {}

--- Creates a script_ai_planner object. A script ai planner must be given a string name and at least one unit in either a script_units, script_unit or table argument. This unit/these units will be placed under the control of the script_ai_planner being created.
---@param name string Name for script ai planner.
---@param units any Unit(s) to be controlled by the script ai planner. Supported types are script_unit, script_units, or a numerically-index table of script units. Units may be added or removed at a later time.
---@param debug_mode boolean Activate debug mode, for more output.
function script_ai_planner:new(name, units, debug_mode) end

--- Sets debug mode on this script_ai_planner.
---@param debug_mode boolean debug mode
function script_ai_planner:set_debug(debug_mode) end

--- Adds one or more script_unit objects to the script_ai_planner. Each script_unit added must be in the same alliance as those already in the script_ai_planner.
---@param scriptunits_to_add any Scriptunits to add. Supported argument types are a single script_unit, script_units or a table of script_unit objects.
function script_ai_planner:add_sunits(scriptunits_to_add) end

--- Removes one or more script_unit objects from the script_ai_planner.
---@param scriptunits_to_remove any Scriptunits to remove. Supported argument types are a single script_unit, script_units or a table of script_unit objects.
function script_ai_planner:remove_sunits(scriptunits_to_remove) end

--- Returns the number of units currently belonging to this ai planner
function script_ai_planner:count() end

--- Removes all units and releases control of them to the ai/player.
function script_ai_planner:release() end

--- Returns true if any controlled unit is still alive/not-routed, false otherwise.
function script_ai_planner:any_controlled_sunit_standing() end

--- Returns a vector position of the mean centre of all units this script_ai_planner controls.
function script_ai_planner:get_centre_point() end

--- Instructs the script_ai_planner to move its units to a position. This will supercede any previously-issued order.
---@param position vector position
function script_ai_planner:move_to_position(position) end

--- Instructs the script_ai_planner to move its units to the position of a supplied script_unit, tracking the target as it moves. The supplied script_unit may be allied with or enemies of the units controlled by this script_ai_planner.
---@param target_sunit script_unit Target script_unit.
---@param rout_callback function Function callback to call if the target script_unit routs or dies, or if the target unit's position is reached.
function script_ai_planner:move_to_position_of_sunit(target_sunit, rout_callback) end

--- Instructs the script_ai_planner to move its units to the position of a supplied force, tracking the target as it moves. The supplied force may be allied with or enemies of the units controlled by this script_ai_planner.
---@param target_force any Target force. May be a script_units collection or a table of script_unit objects.
function script_ai_planner:move_to_force(target_force) end

--- Instructs the script_ai_planner to defend a position on the battlefield. Alongside a vector position a radius must be supplied, which sets how tightly bound to the position the controlled units are.
---@param position_to_defend vector position to defend
---@param radius_in_m radius radius in m
function script_ai_planner:defend_position(position_to_defend, radius_in_m) end

--- Instructs the script_ai_planner to defend the position of a target script_unit, tracking this target as it moves. Alongside a target script_unit a radius must be supplied, which sets how tightly bound to the position the controlled units are.
---@param sunit script_unit Scriptunit to defend.
---@param radius radius Radius in m.
---@param callback function Function to call if position of target script_unit is reached, or if it routs or dies.
function script_ai_planner:defend_position_of_sunit(sunit, radius, callback) end

--- Instructs the script_ai_planner to defend the position of a target military force, tracking this target as it moves. Alongside a target script_unit a radius must be supplied, which sets how tightly bound to the computed position the controlled units are.
---@param sunit script_unit Scriptunit to defend.
---@param radius radius Radius in m.
function script_ai_planner:defend_force(sunit, radius) end

--- Instructs the script_ai_planner to reissue defend and movement orders every 30 seconds. By default, this behaviour is enabled. Supply false as a single argument to disable it.
---@param should_reorder boolean should reorder
function script_ai_planner:set_should_reorder(should_reorder) end

--- Instructs the script_ai_planner to attack a target unit. The target unit must be an enemy of those controlled by the script_ai_planner.
---@param target_unit UNIT_SCRIPT_INTERFACE target unit
function script_ai_planner:attack_unit(target_unit) end

--- Instructs the script_ai_planner to rush a target unit. The target unit must be an enemy of those controlled by the script_ai_planner.
---@param target_unit UNIT_SCRIPT_INTERFACE target unit
function script_ai_planner:rush_unit(target_unit) end

--- Instructs the script_ai_planner to attack a target force. The target force is supplied as a script_units collection, or as a table of script_unit objects. Each of these must be an enemy of the units controlled by the script_ai_planner.
---@param enemy_force any Enemy force. Must be a script_units collection or a table of script_unit objects.
function script_ai_planner:attack_force(enemy_force) end

--- Instructs the script_ai_planner to rush a target force. The target force is supplied as a script_units collection, or as a table of script_unit objects. Each of these must be an enemy of the units controlled by the script_ai_planner.
---@param enemy_force any Enemy force. Must be a script_units collection or a table of script_unit objects.
function script_ai_planner:rush_force(enemy_force) end

--- Instructs the script_ai_planner to merge into another. This script_ai_planner instructs its units to move towards those controlled by the target planner, and when it gets close it removes units from itself and gives them to the target planner. The threshold distance is 120m.
---@param target_ai_planner script_ai_planner target ai planner
function script_ai_planner:merge_into(target_ai_planner) end

--- Instructs the script_ai_planner to send its units on a patrol path along a series of waypoint positions. The units will move from point to point along the path, and move to engage any of the specified enemy units they find along the path. Should the enemy units retreat far enough from the path then the subject units will resume their patrol.
---@param waypoint_list table Numerically-indexed table of vector waypoint positions.
---@param enemy_force any Enemy force to engage. This can be a script_units object or a table of script_unit objects.
---@param completion_callback function Function to call when the patrol is completed.
function script_ai_planner:patrol(waypoint_list, enemy_force, completion_callback) end

--- Sets the radius at which a script_ai_planner patrol will defend each waypoint along its patrol path. This influences how tightly bound the script ai planner arranges its defensive position at each destination, which is likely to influence how it moves. The default value is 100m.
---@param radius_in_m number radius in m
function script_ai_planner:set_patrol_defend_radius(radius_in_m) end

--- Sets the distance at which a patrol will intercept an enemy it finds on its path. The distance will be the closest distance in m between any two units in the opposing forces. Set a higher number here to make the script_ai_planner more prone to intercept enemies at a greater distance. Note that this is the distance at which the script will instruct the script_ai_planner to intercept the enemy - the AI may have already responded of its own volition. The default value is 100m.
---@param radius_in_m number radius in m
function script_ai_planner:set_patrol_enemy_distance(radius_in_m) end

--- Sets the distance between the controlled units and a patrol waypoint at the patrol will considered to have arrived at the waypoint. Set a lower number here to bind the patrol more tightly to its waypoints. The default value is 75.
---@param radius_in_m number radius in m
function script_ai_planner:set_patrol_waypoint_distance(radius_in_m) end

--- Instructs the script_ai_planner whether to perform its enemy proximity test when on a patrol. Be default it does, and it is this that causes the script_ai_planner to engage enemies. Disable the proximity test by supplying false as an argument to this function.
---@param perform_proximity_test boolean perform proximity test
function script_ai_planner:set_perform_patrol_prox_test(perform_proximity_test) end
