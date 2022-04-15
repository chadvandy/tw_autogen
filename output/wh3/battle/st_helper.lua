
---@class st_helper
local st_helper = {}

--- Returns camera offset positions for a supplied script unit. The first camera position is specified by an x and z offset from the supplied script unit, based on that unit's facing. The position height is determined by a vertical bearing (i.e. looking from the side) from the unit.<br />
--- The second returned camera is rotated around the unit from the first by the horizontal delta. If the delta is 0 then only one camera position is returned.
---@param script_unit script_unit Subject script unit.
---@param vertical_bearing number X-offset of first camera position from the script unit, by that unit's facing.
---@param delta number Z-offset of first camera position from the script unit, by that unit's facing.
function st_helper:get_offset_camera_positions_from_sunit(script_unit, vertical_bearing, delta) end

--- Returns the closest building from a supplied list of buildings. An optional filter function may also be supplied, which should take a battle_building as a single argument and return a boolean result - true if the filter passes, or false otherwise.
---@param position battle_vector Position to test against.
---@param building_list table List of buildings to test. This should be an indexed table of battle_building objects, such as (but not restricted to) those returned by functions documented in the Building Lists section of this documentation.
---@param filter_function function Filter function. This should take a battle_building object as a single argument and return a boolean result. If no filter function is supplied then all buildings pass.
function st_helper:get_closest_building_from_list(position, building_list, filter_function) end

--- Returns whether a capture location of the specified type exists on the battlefield.
---@param capture_location_type string Capture location type, from the capture_point_types database table.
---@param partial_match boolean Perform a partial string match. This would allow a supplied capture location search string "major_key_building" to match capture locations with types such as "major_key_building_magic" or "major_key_building_missile".
function st_helper:capture_location_of_type_exists(capture_location_type, partial_match) end

--- Returns camera offset positions for a minor victory point. The subject victory point is chosen automatically.
function st_helper:get_offset_camera_positions_from_minor_victory_point() end

--- Returns camera offset positions for fortified walls as the siege defender. The subject wall piece is chosen automatically.
function st_helper:get_offset_camera_positions_from_walls_as_defender() end

--- Returns a pair of vectors that define camera positions around a supplied vector target. The co-ordinates of the first camera position are determined by a supplied bearing vector, which defines a horizontal bearing along which the first camera position lies, and is further fixed by a supplied distance and optional vertical bearing. The second returned camera position is offset from the first by an optional horizontal bearing delta. If this is set to 0 then only one camera position is returned.
---@param camera_target battle_vector Camera target.
---@param bearing_vector battle_vector Bearing vector, which defines the horizontal bearing of the first computed camera position.
---@param distance number Distance in metres from camera target to computed camera positions.
---@param v_bearing number Vertical bearing in radians from the camera target to the camera positions, in radians. The default value is equivalent to 30 degrees.
---@param delta number Horizontal bearing delta in radians. The default value is equivalent to 10 degrees.
function st_helper:get_offset_camera_positions_by_bearing_vector(camera_target, bearing_vector, distance, v_bearing, delta) end

--- Returns a second camera position from a supplied vector target and an initial camera position. The initial position and the second returned position defines a pair of camera co-ordinates that can be used to effect a camera rotation around the supplied target.<br />
--- The returned position will be rotated around the camera target from the initial position by the horizontal delta.
---@param camera_target battle_vector Camera target.
---@param initial_camera_position battle_vector Initial camera position.
---@param delta number horizontal bearing delta in radians. The default value is equivalent to 10 degrees.
function st_helper:get_second_offset_camera_position(camera_target, initial_camera_position, delta) end

--- Returns whether any fort wall buildings exist on the battlefield.
function st_helper:fort_wall_building_exists() end

--- Returns camera offset positions for a major victory point. The subject victory point is chosen automatically.
function st_helper:get_offset_camera_positions_from_major_victory_point() end

--- Returns camera offset positions for a supplied scriptunits collection. The first camera position is specified by an x and z offset from the centre-point of the scriptunits collection, based on their average bearing (or a bearing override). The position height is determined by a vertical bearing (i.e. looking from the side) from that central point.<br />
--- The second returned camera is rotated around the unit from the first by the horizontal delta. If the delta is 0 then only one camera position is returned.
---@param script_units script_units Subject script units.
---@param vertical_bearing number X-offset of first camera position from the script unit, by that unit's facing.
---@param horizontal_bearing_override number Z-offset of first camera position from the script unit, by that unit's facing.
---@param delta number Vertical bearing from subject unit to first camera position. The default value is equivalent to 30 degrees.
---@param relaxed_pose number Horizontal bearing override in radians. By default, the average bearing of all units in the supplied scriptunits collection is used.
function st_helper:get_offset_camera_positions_from_sunits(script_units, vertical_bearing, horizontal_bearing_override, delta, relaxed_pose) end

--- Returns whether a victory point capture location exists on the battlefield.
function st_helper:victory_point_plaza_capture_location_exists() end

--- Returns camera offset positions for a capture location of any type. The subject capture location is chosen automatically.
function st_helper:get_offset_camera_positions_from_capture_location() end

--- Returns a pair of vectors that define camera positions around a supplied vector target. These camera positions can be used by scripted tour scripts to position and animate the camera as it rotates around the camera target. The positions are computed from the target vector, a distance, and horizontal/vertical bearings supplied from the target vector to the initial camera position.<br />
--- A horizontal bearing delta, which defines how separated the two returned positions are, may also be supplied. If the supplied horizontal bearing is 0 then only one position vector is returned.
---@param target battle_vector Target position.
---@param distance number Camera-to-target distance in m.
---@param horizontal_bearing number Horizontal bearing (i.e. looking from above) from camera target to initial camera position in radians.
---@param vertical_bearing number Vertical vearing (i.e. looking from side) from camera target to initial camera position in radians. The default value is equivalent to 30 degrees.
---@param delta number Horizontal bearing delta in radians. The default value is equivalent to 10 degrees.
function st_helper:get_offset_camera_positions_by_bearing(target, distance, horizontal_bearing, vertical_bearing, delta) end

--- Returns whether the supplied building is a fort wall but not a gate or a tower.
---@param building battle_building building
function st_helper:building_is_standard_fort_wall(building) end

--- Returns whether the supplied building is a standard fort wall connected a supplied number of times on either side. Wall pieces are connected to adjacent pieces in the wall, so a wall piece that is connected n times would have n buildings to the left and to the right of it in the wall, meaning that it's not at or near the end of the wall.
---@param building battle_building Building.
---@param connections number Number of connections to test.
function st_helper:building_is_standard_fort_wall_connected_n_times(building, connections) end

--- Returns whether a capture location of the specified type exists on the battlefield with associated toggleable slots.
---@param capture_location_type string Capture location type, from the capture_point_types database table. If no type is specified then any type is matched.
---@param partial_match boolean Perform a partial string match. This would allow a supplied capture location search string "major_key_building" to match capture locations with types such as "major_key_building_magic" or "major_key_building_missile".
function st_helper:capture_location_of_type_with_toggleable_slot_exists(capture_location_type, partial_match) end

--- Returns a building from a supplied list of buildings that matches a supplied filter function. The filter function should take a battle_building as a single argument and return a boolean result - true if the filter passes, or false otherwise. Each building in the list is tested sequentially, and the first building which passes the filter is returned.<br />
--- If no building from the supplied list matches then nil is returned.
---@param building_list table List of buildings to test. This should be an indexed table of battle_building objects, such as (but not restricted to) those returned by functions documented in the Building Lists section of this documentation.
---@param filter_function function Filter function. This should take a battle_building object as a single argument and return a boolean result.
function st_helper:get_building_from_list(building_list, filter_function) end

--- Returns camera offset positions for fortified walls as the siege attacker. The subject wall piece is chosen automatically.
function st_helper:get_offset_camera_positions_from_walls_as_attacker() end

--- Returns a pair of vectors that define camera positions around a supplied vector target. The co-ordinates of the first camera position are determined by a supplied x/z offset from the camera target, the facing of which is determined by a supplied horizontal bearing, and a vertical bearing from the camera target to determine the height. The second returned camera position is offset from the first by an optional horizontal bearing delta. If this is set to 0 then only one camera position is returned.
---@param camera_target battle_vector Camera target.
---@param x_offset number X offset of the first camera position from the camera target, based on the horizontal bearing.
---@param z_offset number Z offset of the first camera position from the camera target, based on the horizontal bearing.
---@param horizontal_bearing number Horizontal bearing (i.e. looking from top down) in radians from which to take the offset, from the camera target.
---@param vertical_bearing number Vertical bearing (i.e. looking from side) in radians of the first camera position, from the camera target. The default value is equivalent to 30 degrees.
---@param delta number Horizontal bearing delta in radians. The default value is equivalent to 10 degrees.
function st_helper:get_offset_camera_positions_by_offset_and_bearing(camera_target, x_offset, z_offset, horizontal_bearing, vertical_bearing, delta) end

--- Returns the closest fort wall building to the supplied position that is connected n times to other buildings. The connection test is performed by st_helper.building_is_standard_fort_wall_connected_n_times
---@param position battle_vector Position to test against.
---@param connections number Number of connections to test for each building.
function st_helper:get_closest_connected_wall_building(position, connections) end

--- Builds and returns a navigable_tour_section with certain standardised behaviours.
---@param section_name string Section name for the navigable tour section being created.
---@param camera_positions_generator function Camera positions generator function. If supplied, this function should return two or three battle_vector objects. If two are supplied, these are assumed to be a camera target and position to pan the camera to when the navigable tour starts.
---@param advice_key string Key of advice to show when the navigable tour section plays. If nil is supplied then no advice is shown.
---@param infotext table Table of infotext keys to show when the navigable tour section plays. If nil is supplied then no infotext is shown.
---@param advice_delay number Interval before the advice, infotext and objectives begin to display. By default this is 1000ms. A string may also be supplied, in which case it specifies an event which, when received, causes the advice/infotext/objectives to be triggered.
---@param objective string Objective key of objective to show. This should be a key for a record from the scripted_objectives database table. If nil is supplied then no objective is shown.
---@param objective_test function Objective completion test function. If supplied, a battle_manager:watch is set up with this function as the condition. When the condition passes, the supplied objective is marked as completed.
---@param leave_objective boolean Leave section objective on-screen after it has been completed. By default the section objective is removed from the screen once it's completed - set this value to true to suppress this behaviour.
---@param windowed_movie_path string Path of movie to play in window, if one is required for this navigable tour section.
function st_helper:navigable_tour_section_battle_factory(section_name, camera_positions_generator, advice_key, infotext, advice_delay, objective, objective_test, leave_objective, windowed_movie_path) end

--- Returns camera offset positions for a capture location for a gate. The subject capture location is chosen automatically.
function st_helper:get_offset_camera_positions_from_gate_capture_location() end

--- A generic function for setting up aspects of the UI at the end of a navigable tour in battle.
---@param navigable_tour navigable_tour navigable tour
function st_helper:setup_tour_end(navigable_tour) end

--- Returns the closest capture location of the specified type to the supplied position. The capture location is returned as a context string identifier. If the type is left blank then any capture location matches.
---@param position battle_vector Position.
---@param capture_location_type string Capture location type, from the capture_location_types<\code> database table.
---@param partial_match boolean Perform a partial string match. This would allow a supplied capture location search string "major_key_building" to match capture locations with types such as "major_key_building_magic" or "major_key_building_missile".
function st_helper:get_closest_capture_location_of_type(position, capture_location_type, partial_match) end

--- Returns camera offset positions for a minor-key-building toggleable slot location. The subject slot location is chosen automatically.
function st_helper:get_offset_camera_positions_from_minor_point_supplies_toggleable_slot_location() end

--- Returns camera offset positions suitable for the opening shot of a siege defence. A camera position over the top of the controlled unit closest to the enemy army is chosen.
function st_helper:get_offset_camera_positions_for_siege_defence_start() end

--- Returns camera offset positions for a minor-key-building capture location. The subject capture location is chosen automatically.
function st_helper:get_offset_camera_positions_from_minor_point_supplies_capture_location() end

--- Returns whether any minor key building capture locations with attached toggleable slots exist on the battlefield.
function st_helper:minor_supply_capture_location_with_toggleable_slot_exists() end

--- Returns camera offset positions for a fortified gate. The subject gate is chosen automatically.
---@param is_attacker boolean Return offset positions as the attacker i.e. from outside the fort.
function st_helper:get_offset_camera_positions_from_gate(is_attacker) end

--- Returns camera offset positions for a siege weapon. The subject siege weapon is chosen automatically.
function st_helper:get_offset_camera_positions_from_siege_weapons() end

--- Returns whether a minor key building capture location exists on the battlefield.
function st_helper:minor_supply_capture_location_exists() end

--- A generic function for setting up aspects of the UI at the start of a navigable tour in battle.
---@param navigable_tour navigable_tour Host navigable tour.
---@param suppress_record_camera_position boolean If set to true, the current camera position is not recorded on the scripted tour. This is useful if the scripted tour has already done this.
function st_helper:setup_tour_start(navigable_tour, suppress_record_camera_position) end

--- Returns the closest toggleable slot from any capture location of the specified type, to the supplied position. The toggleable slot is returned as a context string identifier. If the capture location type is left blank then any capture location matches.
---@param position battle_vector Position.
---@param capture_location_type string Capture location type, from the capture_location_types<\code> database table.
---@param partial_match boolean Perform a partial string match. This would allow a supplied capture location search string "major_key_building" to match capture locations with types such as "major_key_building_magic" or "major_key_building_missile".
function st_helper:get_closest_toggleable_slot_from_capture_location_of_type(position, capture_location_type, partial_match) end

--- Returns whether a major key building capture location exists on the battlefield.
function st_helper:major_key_building_capture_location_exists() end

--- Returns whether any fort gate buildings exist on the battlefield.
function st_helper:fort_gate_building_exists() end

--- Returns whether any capture locations exist on the battlefield.
function st_helper:capture_location_exists() end

--- Returns camera offset positions for a tower building. The subject tower is chosen automatically.
function st_helper:get_offset_camera_positions_from_tower() end

--- Returns whether any capture location with a gate exists on the battlefield.
function st_helper:capture_location_with_gate_exists() end

--- Returns whether any selectable tower buildings exist on the battlefield.
function st_helper:selectable_tower_exists() end
