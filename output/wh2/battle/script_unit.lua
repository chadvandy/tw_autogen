--- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT MANUALLY.

---@class script_unit
local script_unit = {}

--- Creates a new script unit.
---@param army army Army the target unit is a member of.
---@param reference any Reference for the unit. Can be an integer number representing the unit's index within the army ('1' is generally the general, for example) or a string name. If a string name, this must match the script name given to the unit in either the battle xml or in the battle_set_piece_armies_units_junctions table.
---@return script_unit   
function script_unit:new(army, reference) end

--- Instructs the scriptunit to move to its start location.
---@param should_run boolean should run
function script_unit:goto_start_location(should_run) end

--- Teleports the scriptunit to the position/bearing/width it started the battle at.
function script_unit:teleport_to_start_location() end

--- Teleports the scriptunit to an offset from the position/bearing/width it started the battle at. This offset will be calculated from the scriptunit's start bearing, so an offset of [0, -10] will teleport it 10m behind its starting position. The function also optionally takes an override bearing to alter the position calculation, as well as a flag to release the unit to script control afterwards.
---@param x_offset number x offset in m
---@param z_offset number z offset in m
---@param bearing_override number Bearing override in degrees. Supply a value here to override the bearing used to make the offset calculation.
---@param release_control boolean Release control after teleporting. Set this to true if you want the player (or AI, if it's not player-controlled) to be able to control this unit immediately after teleporting.
function script_unit:teleport_to_start_location_offset(x_offset, z_offset, bearing_override, release_control) end

--- Instructs the scriptunit to move to an offset from the position/bearing/width it started the battle at. This offset will be calculated from the scriptunit's start bearing, so an offset of [0, -10] will send it 10m behind its starting position. The function also optionally takes a flag to instruct the unit to run, an override bearing to alter the position calculation, as well as a flag to release the unit to script control afterwards.
---@param x_offset number x offset in m
---@param z_offset number z offset in m
---@param should_run boolean Set to true to instruct the unit to move quickly to its destination.
---@param bearing_override number Bearing override in degrees. Supply a value here to override the bearing used to make the offset calculation.
---@param release_control boolean Release control after the movement order is issued. Set this to true if you want the player (or AI, if it's not player-controlled) to be able to control this unit immediately after moving.
function script_unit:goto_start_location_offset(x_offset, z_offset, should_run, bearing_override, release_control) end

--- Returns the position of the scriptunit, offset from its current position. This offset will be calculated from the scriptunit's current bearing, so an offset of [0, 0, -10] will report a position 10m behind its current position. An override bearing to alter the position calculation may optionally be supplied.
---@param x_offset number x offset in m
---@param y_offset number y offset (height) in m
---@param z_offset number z offset in m
---@param bearing_override number Bearing override in degrees. Supply a value here to override the bearing used to make the offset calculation.
---@return battle_vector  offset position 
function script_unit:position_offset(x_offset, y_offset, z_offset, bearing_override) end

--- Instructs the scriptunit to move to an offset from its current position. This offset will be calculated from the scriptunit's current bearing, so an offset of [0, -10] will send it 10m behind its current position. The function also optionally takes a flag to instruct the unit to run, an override bearing to alter the position calculation, as well as a flag to release the unit to script control afterwards.
---@param x_offset number x offset in m
---@param z_offset number z offset in m
---@param should_run boolean Set to true to instruct the unit to move quickly to its destination.
---@param bearing_override number Bearing override in degrees. Supply a value here to override the bearing used to make the offset calculation.
---@param release_control boolean Release control after the movement order is issued. Set this to true if you want the player (or AI, if it's not player-controlled) to be able to control this unit immediately after moving.
function script_unit:goto_location_offset(x_offset, z_offset, should_run, bearing_override, release_control) end

--- Instructs the scriptunit to teleport to an offset from its current position. This offset will be calculated from the scriptunit's current bearing, so an offset of [0, -10] will teleport it 10m behind its current position. The function also optionally takes an override bearing to alter the position calculation, as well as a flag to release the unit to script control afterwards.
---@param x_offset number x offset in m
---@param z_offset number z offset in m
---@param bearing_override number Bearing override in degrees. Supply a value here to override the bearing used to make the offset calculation.
---@param release_control boolean Release control after the teleport order is issued. Set this to true if you want the player (or AI, if it's not player-controlled) to be able to control this unit immediately after teleporting.
function script_unit:teleport_to_location_offset(x_offset, z_offset, bearing_override, release_control) end

--- Instructs the scriptunit to goto an offset from its location when it deploys. This offset will be calculated from the scriptunit's bearing at the time it finds itself on the battlefield, so an offset of [0, -5] will move it 50m forward. The function also optionally takes a flag instructing it to run, an override bearing to alter the position calculation, as well as a flag to release the unit to script control afterwards.
---@param x_offset number x offset in m
---@param z_offset number z offset in m
---@param should_run boolean Set to true to instruct the unit to move quickly to its destination.
---@param bearing_override number Bearing override in degrees. Supply a value here to override the bearing used to make the offset calculation.
---@param release_control boolean Release control after the movement order is issued. Set this to true if you want the player (or AI, if it's not player-controlled) to be able to control this unit immediately after moving.
function script_unit:goto_location_offset_when_deployed(x_offset, z_offset, should_run, bearing_override, release_control) end

--- Stops a running script_unit:goto_location_offset_when_deployed listener on the current unit. Call this after calling script_unit:goto_location_offset_when_deployed to stop the listener for any reason.
function script_unit:stop_goto_location_offset_when_deployed() end

--- Instructs the scriptunit to turn to face a position vector.
---@param position battle_vector position
function script_unit:turn_to_face(position) end

--- Instructs the scriptunit to teleport to a location.
---@param position battle_vector Position to teleport to.
---@param bearing number Bearing to face at the target position in degrees.
---@param width number Width in m of formation at target position.
function script_unit:teleport_to_location(position, bearing, width) end

--- Caches the units current position, bearing and width.
function script_unit:cache_location() end

--- Returns the vector position of the unit last time it was cached with script_unit:cache_location.
---@return battle_vector  
function script_unit:get_cached_position() end

--- Returns the bearing of the unit in degrees last time it was cached with script_unit:cache_location.
---@return number  
function script_unit:get_cached_bearing() end

--- Returns the width of the unit in m last time it was cached with script_unit:cache_location.
---@return number  
function script_unit:get_cached_width() end

--- Instructs the scriptunit to move to the location the unit occupied the last time it was cached with script_unit:cache_location.
---@param should_run boolean Instructs the unit to move fast.
function script_unit:goto_cached_location(should_run) end

--- Teleports the scriptunit to the location the unit occupied the last time it was cached with script_unit:cache_location.
function script_unit:teleport_to_cached_location() end

--- Returns true if the scriptunit has moved from the last cached position, or an optional supplied position. The movement threshold can also be overriden (by default it's 1m).
---@param position_override battle_vector position override
---@param threshold_distance number threshold distance
---@return boolean  has moved 
function script_unit:has_moved(position_override, threshold_distance) end

--- Caches the current destination position of the scriptunit. Note that the if the subject unit is attacking rather than moving to a position it will have no valid destination. The function also caches whether the unit is running.
function script_unit:cache_destination() end

--- Caches the current destination position of the scriptunit with script_unit:cache_destination, and then orders the unit to halt.
function script_unit:cache_destination_and_halt() end

--- Returns the vector destination last cached by script_unit:cache_destination.
---@return battle_vector  
function script_unit:get_cached_destination_position() end

--- Returns the ordered bearing in degrees that was last cached by script_unit:cache_destination.
---@return number  
function script_unit:get_cached_destination_bearing() end

--- Returns the ordered width in m that was last cached by script_unit:cache_destination.
---@return number  
function script_unit:get_cached_destination_width() end

--- Instructs the unit to move to the location last cached by script_unit:cache_destination. If the unit was moving quickly when its destination was last cached, than it will resume moving quickly when this function is called.
---@param should_release boolean Set to true to release script control of the unit after calling this function. Set this if it's desirable for the player (or AI, if it's not a player-controlled unit) to be able to control this unit after the order has been issued.
function script_unit:goto_cached_destination(should_release) end

--- Caches the proportion of the scriptunit still alive, so that it can be queried later with script_unit:has_taken_casualties.
function script_unit:cache_health() end

--- Compares the scriptunits current casualties with that when it was previously cached with script_unit:cache_health, and returns true if they're different.
---@param tolerance number Tolerance value. The casualties values is expressed internally as a unary value (between 0 and 1), so this should be expressed in a similar manner. Therefore a tolerance of 0.1 would allow for 10% casualties (of the original number of soldiers in the unit) more than when previously cached before returning true.
---@return boolean  has taken casualties 
function script_unit:has_taken_casualties(tolerance) end

--- Returns true if the unit is under missile attack, in melee, or has casualties since the last time is_under_attack was called. Designed to be called repeatedly.
---@return boolean  is under attack 
function script_unit:is_under_attack() end

--- Returns true if the unit is in melee. This is an unembellished wrapper for an underlying code function.
---@return boolean  is in melee 
function script_unit:is_in_melee() end

--- Instructs the scriptunit to halt. This is an unembellished wrapper for an underlying code function.
function script_unit:halt() end

--- Instructs the scriptunit to celebrate. This is an unembellished wrapper for an underlying code function.
function script_unit:celebrate() end

--- Instructs the scriptunit to taunt. This is an unembellished wrapper for an underlying code function.
function script_unit:taunt() end

--- Instructs the scriptunit to play a charge sound. This is an unembellished wrapper for an underlying code function.
function script_unit:play_sound_charge() end

--- Instructs the scriptunit to play a taunt sound. This is an unembellished wrapper for an underlying code function.
function script_unit:play_sound_taunt() end

--- Instructs the scriptunit to deploy or not. If supplied with false as a single argument, the instruction prevents the unit from deploying until the function is called again with true.
---@param should_deploy boolean should deploy
function script_unit:deploy_reinforcement(should_deploy) end

--- Sets a supplied behaviour active on the unit or not. This is an unembellished wrapper for an underlying code function. This is the main mechanism for turning on/turning off certain unit behaviours such as fire at will, skirmish etc. Current list of behaviours includes, but may not be limited to the following:<br />
--- "defend", "dismount", "fire_at_will", "skirmish", "change_formation_spacing", "drop_siege_equipment", "release_animals", "disembark_from_ship", "board_ship"
---@param behaviour_name string behaviour name
---@param activate boolean activate
function script_unit:change_behaviour_active(behaviour_name, activate) end

--- Instructs the specified unit to withdraw. This is an unembellished wrapper for an underlying code function.
---@param should_run boolean should run
function script_unit:withdraw(should_run) end

--- Activates or deactivates melee mode. 
---@param activate boolean Should activate melee mode.
---@param release_control boolean Release script control after setting melee mode. Set this to true if the unit is under player control.
function script_unit:set_melee_mode(activate, release_control) end

--- Enables or disables a unit attribute for the unit. Valid attribute keys are listed in the Unit Attributes section of this documentation.
---@param attribute_key string attribute key
function script_unit:set_stat_attribute(attribute_key) end

--- Sets the unit to be enabled and visible if true is supplied as an argument, or disabled and invisible if false is supplied.
---@param enabled boolean enabled
function script_unit:set_enabled(enabled) end

--- Sets the unit to be always visible, according to the rules of the terrain visibility system.
---@param always_visible boolean always visible
function script_unit:set_always_visible(always_visible) end

--- Makes player unit look like ally (for script where gradually give units in tutorials). This is an unembellished wrapper for an underlying code function.
---@param mark_as_ally boolean mark as ally
function script_unit:mark_as_ally(mark_as_ally) end

--- Returns true if the unit is hidden in grass/forests etc. This is an unembellished wrapper for an underlying code function. Returned result is not related to the terrain visibility system, which came later than this code function, so a unit may not be hidden (according to this result returned by this function) but may still not be visible to its enemy - check also script_unit:is_visible_to_enemy.
---@return boolean  is hidden 
function script_unit:is_hidden() end

--- Makes the unit invisible. This is an unembellished wrapper for an underlying code function.
---@param is_hidden boolean is hidden
function script_unit:set_invisible_to_all(is_hidden) end

--- Returns true if this unit is visible to its enemy, by the rules of the visibility system. Note that the unit may be visible according to the visibility system, but may still be hidden in forests or tall grass - check script_unit:is_hidden.
---@param is_visible boolean is visible
function script_unit:is_visible_to_enemy(is_visible) end

--- Takes script control of this unit.
function script_unit:take_control() end

--- Releases script control of the subject unit.
function script_unit:release_control() end

--- Modifies this unit's ammo to a specified unary proportion of its starting value.
---@param proportion number Desired proportion of starting ammo. Supply 1 to set the ammo back to its starting value, 0.5 to half etc. Values of greater than one are semi-supported - the command will work, but any ammo bars on the UI will show as full until the unit's ammo value drops below its starting value.
function script_unit:modify_ammo(proportion) end

--- Modifies this unit's ammo to a specified unary proportion of its starting value, but only if it has less than the specified amount.
---@param proportion number Desired proportion of starting ammo. Supply 1 to set the ammo back to its starting value, 0.5 to half etc. Values of greater than one are semi-supported - the command will work, but any ammo bars on the UI will show as full until the unit's ammo value drops below its starting value.
function script_unit:refill_ammo(proportion) end

--- Grants this unit infinite ammo by refilling ammo every 5 seconds.
function script_unit:grant_infinite_ammo() end

--- Sets this unit to 1/10th its current fatigue level, and tops its ammo back to full.
---@param should_release boolean Release script control of the unit after refreshing. Set this to true if the unit is under player control.
function script_unit:refresh(should_release) end

--- Caches this unit's current ammunition level.
function script_unit:cache_ammo() end

--- Restores this unit's ammunition level to the value previously cached with script_unit:cache_ammo.
function script_unit:restore_cached_ammo() end

--- Returns this unit's hitpoints as a unary of its initial value. This is an unembellished wrapper for an underlying code function.
---@return number  unary hitpoints 
function script_unit:unary_hitpoints() end

--- Sets the maximum number of casualties that this unit can take. If the unit's hitpoints drop below the specified unary value, the unit is made invincible so that it can no longer take casualties (note that it may still rout). Exception scriptunits can be set, so that proximity to those script_unit or script_units disables this invincibility (allow certain units to be perceived to charge in and 'save the day').
---@param unary_proportion number Call max_casualties with a proportion value of 0 to disables any previous max_casualties monitor on this unit.
---@param should_release boolean Set to true to release script control of this unit after max_casualties makes a change. Set this primarily if the unit is under player control.
---@param silent_mode any The monitor will resume and this unit will (potentially) regain invincibility when this unit moves more than 40m away from any unit specified as an exception.
function script_unit:max_casualties(unary_proportion, should_release, silent_mode) end

--- Prevents this unit from routing until it takes a certain proportion of casualties. If a proportion of 0 is supplied then any previous monitor set up with fearless_until_casualties is cancelled and the unit is allowed to rout.
---@param proportion unary Proportion of unit at which it may rout. Value should be expressed as a unary e.g. 0.5 = 50% casualties.
---@param should_release boolean Set to true to release script control of this unit after fearless_until_casualties makes a change. Set this primarily if the unit is under player control.
function script_unit:fearless_until_casualties(proportion, should_release) end

--- Forces this unit to rout when it reaches a certain proportion of casualties. If a proportion of 0 is supplied then any previous monitor set up with rout_on_casualties is cancelled.
---@param proportion unary Proportion of unit at which it routs. Value should be expressed as a unary e.g. 0.5 = 50% casualties.
function script_unit:rout_on_casualties(proportion) end

--- Makes the subject unit invincible/fearless if it's not already routing.
---@param should_release boolean Set to true to release script control of this unit after invincible_if_standing makes a change. Set this primarily if the unit is under player control.
function script_unit:invincible_if_standing(should_release) end

--- Makes the subject unit invincible. This is an unembellished wrapper for an underlying code function.
---@param set_invincible boolean set invincible
function script_unit:set_invincible(set_invincible) end

--- Prevents the subject unit from rallying if it's already routing. Supply true as a single argument to start a monitor that will continually poll whether this unit is routing, and prevent it
---@param check_perpetually boolean If true is supplied instead, the function sets up a monitor that will continually poll the unit's routing status and, when found to be routing, prevents it from rallying at that time.
function script_unit:prevent_rallying_if_routing(check_perpetually) end

--- Stops any running monitor started by script_unit:prevent_rallying_if_routing.
function script_unit:stop_prevent_rallying_if_routing() end

--- Sets this unit to be fearless/unroutable. This is an unembellished wrapper for an underlying code function.
function script_unit:morale_behavior_fearless() end

--- Causes this unit to instantly rout. This is an unembellished wrapper for an underlying code function.
function script_unit:morale_behavior_rout() end

--- Causes this unit to be subject to normal morale. This is an unembellished wrapper for an underlying code function.
function script_unit:morale_behavior_default() end

--- Makes the subject unit fearless if it's not already routing.
---@param should_release boolean Set to true to release script control of this unit after morale_behavior_fearless_if_standing makes a change. Set this primarily if the unit is under player control.
function script_unit:morale_behavior_fearless_if_standing(should_release) end

--- Makes the subject unit fearless if it's not already routing.
---@param should_release boolean Set to true to release script control of this unit after morale_behavior_default_if_standing makes a change. Set this primarily if the unit is under player control.
function script_unit:morale_behavior_default_if_standing(should_release) end

--- Instantly kills this unit.
---@param should_disappear boolean Set to true to make the unit instantly disappear, instead of appearing to drop dead on the spot.
function script_unit:kill(should_disappear) end

--- Instantly kills a unary proportion of this unit.
---@param proportion number Proportion to kill, expressed as a unary value (e.g. 0.5 = 50% of the unit's starting number of soldiers die).
---@param preserve_proportion number Prevents kill_proportion from reducing the strength of the unit below a specified unary proportion.
---@param hide_bodies boolean Hides the bodies.
function script_unit:kill_proportion(proportion, preserve_proportion, hide_bodies) end

--- Kills a unary proportion of this unit over a specified time period in ms.
---@param proportion number Proportion to kill, expressed as a unary value (e.g. 0.5 = 50% of the unit's starting number of soldiers die).
---@param duration number Duration in ms over which to kill soldiers.
---@param stop_on_rout boolean Stops the function from killing any more soldiers if the unit routs during the process.
function script_unit:kill_proportion_over_time(proportion, duration, stop_on_rout) end

--- Stops a running process started by script_unit:kill_proportion_over_time.
function script_unit:stop_kill_proportion_over_time() end

--- Gets the enemy alliance number.
---@return number  enemy alliance number 
function script_unit:get_enemy_alliance_num() end

--- Gets the enemy alliance object.
---@return battle_alliance  enemy alliance 
function script_unit:get_enemy_alliance() end

--- Pulses a highlight effect on the unit card associated with this scriptunit.
---@param should_highlight boolean Set to true to turn the highlight effect on, false to turn it off.
---@param pulse_strength number Sets the strength of the pulse effect. A higher supplied value leads to a more pronounced pulse effect. The default value is 5.
---@param force_highlight boolean Overrides the disabling of help page highlighting with battle_ui_manager:set_help_page_link_highlighting_permitted. Set this to true if the script explicitly wants to highlight the UI cards when help page link highlighting is disabled (useful in tutorials).
function script_unit:highlight_unit_card(should_highlight, pulse_strength, force_highlight) end

--- Adds a ping icon above the unit, optionally for a duration.
---@param duration number icon_type Type of icon to add. This is a numeric index.
function script_unit:add_ping_icon(duration) end

--- Removes a ping icon from above the unit added with script_unit:add_ping_icon.
function script_unit:remove_ping_icon() end

---@class script_units
local script_units = {}

--- Creates a new script units collection.
---@param name string Name for this script_units collection. Will be used for debug output.
---@vararg any
---@return script_units   
function script_units:new(name, ...) end

--- Sets the scriptunits collection into debug mode, for more output.
---@param debug_mode boolean debug mode
function script_units:set_debug(debug_mode) end

--- Adds one or more supplied script_unit objects to this scriptunits collection.
---@vararg any
function script_units:add_sunits(...) end

--- Removes a supplied script_unit object from this scriptunits collection.
---@param scriptunit_to_remove script_unit scriptunit to remove
function script_units:remove_sunit(scriptunit_to_remove) end

--- Removes one or more supplied script_unit objects from this scriptunits collection.
---@vararg any
function script_units:remove_sunits(...) end

--- Returns a script_unit from this script_units collection that matches the supplied reference number or string. nil is returned if no matching script_unit is found.
---@param reference any Reference number or string.
---@return script_unit  
function script_units:get_sunit_by_name(reference) end

--- Returns a script_unit from this script_units collection that contains the supplied battle_unit. nil is returned if no matching script_unit is found.
---@param unit battle_unit unit
---@return script_unit  
function script_units:get_sunit_for_unit(unit) end

--- Returns the script_unit in this script_units collection that contains a battle_unit of the supplied type. nil is returned if no matching script_unit is found.
---@param unit_type string Unit type, from the main_units table.
---@return script_unit  
function script_units:get_sunit_by_type(unit_type) end

--- Returns true if this script_units collection contains the supplied script_unit, false otherwise.
---@param to_test script_unit to test
---@return boolean  collection contains sunit 
function script_units:contains_sunit(to_test) end

--- Returns whether this script_units collection contains a script_unit of the supplied type, from the main_units table.
---@param unit_type string unit type
---@return boolean  collection contains type 
function script_units:contains_type(unit_type) end

--- Returns the number of script_unit objects in this script_units collection.
---@return number  number of units 
function script_units:count() end

--- Returns the script_unit in this collection at the supplied index.
---@param index_value integer index value
---@return script_unit   
function script_units:item(index_value) end

--- Returns the internal table containing all the script_unit objects in this script_units collection. Be aware that modifications to this table will also modify this script_units object.
---@return table  
function script_units:get_sunit_table() end

--- Returns another scriptunits collection containing all script_unit objects from the subject collection that pass the supplied test. The test should be supplied as a function that takes a scriptunit parameter and returns a boolean value. Should a call to the function with a specific scriptunit return true, that scriptunit will be added to the returned collection.
---@param name string Name for the returned scriptunits collection
---@param test function Function that takes a scriptunit parameter and returns a boolean value.
---@param assert_if_empty boolean If set to true, filter triggers a script assert if the returned collection is empty.
---@return script_units   
function script_units:filter(name, test, assert_if_empty) end

--- Prints the list of script_unit objects this collection contains to the debug console spool.
function script_units:out() end

--- Returns a duplicate script_units collection with the supplied name.
---@param name string name
---@return script_units  duplicate collection 
function script_units:duplicate(name) end

--- Returns a unitcontroller with control over all the units this script_units collection contains.
---@param If_an_army_is_supplied_here army, If no army is supplied, the function assumes that all units in the scriptunits collection are in the same army, and will assert if any aren't.
---@return unitcontroller   
function script_units:get_unitcontroller(If_an_army_is_supplied_here) end

--- Returns the number of commanding general units the scriptunits collection contains.
---@return number  number of generals 
function script_units:num_generals() end

--- Returns a commanding general scriptunit from the scriptunits collection. By default the first general scriptunit is returned. An index value may be given to specify a particular general to return.
---@param general_index number general index
---@return script_unit  number of generals 
function script_units:get_general_sunit(general_index) end

--- Returns a vector corresponding to the mean centre position of all the script_unit objects in the collection.
---@return battle_vector  centre position 
function script_units:centre_point() end

--- Returns the distance from the furthest unit from the centre, to the centre, which is an indication of how spread out the units in this collection are.
---@return number  radius 
function script_units:radius() end

--- Returns the northern-most script_unit.
---@return script_unit   
function script_units:get_northernmost() end

--- Returns the southern-most script_unit.
---@return script_unit   
function script_units:get_southernmost() end

--- Returns the western-most script_unit.
---@return script_unit   
function script_units:get_westernmost() end

--- Returns the eastern-most script_unit.
---@return script_unit   
function script_units:get_easternmost() end

--- Returns the closest script_unit in this collection to the supplied collection of units/positions, as well as the distance in m.
---@param position_collection any Position object or collection. Supported object types are vector, unit, script_unit, units, script_units, army, armies, alliance or table.
---@param only 2d consider 2D distance only (disregarding altitude)
---@return script_unit  closest scriptunit 
---@return distance  distance of closest scriptunit in m 
---@return any  
function script_units:get_closest(position_collection, only) end

--- Returns the furthest script_unit in this collection from the mean centre.
---@return script_unit   
function script_units:get_outlying() end

--- Prevents routing units within the collection from rallying, and routs all non-routing units over the specified period in ms so that all units are eventually routing.
---@param period_in_ms number Time in ms over which the units are routed. Must be positive.
function script_units:rout_over_time(period_in_ms) end

--- Have any of the script_unit objects in the collection deployed onto the battlefield.
---@return boolean  any deployed 
function script_units:have_any_deployed() end

--- Have all of the script_unit objects in the collection deployed onto the battlefield.
---@return boolean  all deployed 
function script_units:have_all_deployed() end

--- Returns true if any script_unit in this collection is deployed on the battlefield and not routing or dead.
---@return boolean  any active 
function script_units:are_any_active_on_battlefield() end

--- Returns true if script_unit:has_moved returns true for any unit in this collection. Call &lt;script_units_obj&gt;:script_unit:cache_location() first.
---@param position battle_vector Position to test against. May be of limited usefulness when testing multiple units like this.
---@param threshold_distance distance Threshold distance in m.
---@return boolean  have any moved 
function script_units:have_any_moved(position, threshold_distance) end

--- Returns true if script_unit:has_moved returns true for all units in this collection. Call &lt;script_units_obj&gt;:script_unit:cache_location() first.
---@param position battle_vector Position to test against. May be of limited usefulness when testing multiple units like this.
---@param threshold_distance distance Threshold distance in m.
---@return boolean  have all moved 
function script_units:have_all_moved(position, threshold_distance) end

--- Returns true if any script_unit in this collection is moving fast.
---@return boolean  any running 
function script_units:are_any_running() end

--- Returns true if all script_unit objects in this collection are moving fast.
---@return boolean  any running 
function script_units:are_all_running() end

--- Returns true if any script_unit in this collection is under attack (uses script_unit:is_under_attack)
---@return boolean  any under attack 
function script_units:is_under_attack() end

--- Returns true if any script_unit in this collection is in melee combat (uses script_unit:is_in_melee).
---@return boolean  any in melee 
function script_units:is_in_melee() end

--- Returns the average unary hitpoints of all script_unit objects in this collection.
---@return number  average hitpoints 
function script_units:unary_hitpoints() end

--- Returns the total number of enemies killed by all units in this collection.
---@return number  total enemies killed 
function script_units:number_of_enemies_killed() end

--- Sets all script_unit objects in the collection into a group formation.<br />
--- A list of formations can be found in raw data. Valid entries at time of writing are:<br />
--- flanking<br />
--- generic_directfire_defence<br />
--- generic_directfire_attack<br />
--- generic<br />
--- generic_ranged_protected<br />
--- generic_melee_heavy<br />
--- generic_melee_super_heavy<br />
--- assault_gates_formation<br />
--- assault_reserves_formation<br />
--- Multiple Selection Drag Out Land<br />
--- Multiple Selection Deployable Drag Out Land<br />
--- single_line<br />
--- Multiple Selection Naval<br />
--- Ambush Defence Block<br />
--- test_melee_forward_simple<br />
--- test_missile_forward_simple<br />
--- river_ai_attack<br />
--- river_ai_attack_narrow<br />
--- river_ai_stop_and_shoot<br />
--- river_ai_defend<br />
--- stop_and_shoot_artillery<br />
--- stop_and_shoot_ranged_direct
---@param group_formation_name string group formation name
function script_units:change_formation(group_formation_name) end

--- Returns true if any script_unit in this collection is hidden in long grass or trees. If true is supplied as a single argument, then all units in the collection must be hidden for the function to return true.
---@param all_units boolean all units
---@return boolean  is hidden 
function script_units:is_hidden(all_units) end

--- Returns true if any script_unit in this collection is visible to the enemy, by the rules of the terrain visibility system. Note that a unit can be considered visible by this system but still be hidden in forests.
---@return boolean  is visible 
function script_units:is_visible_to_enemy() end

--- Deploys the units in this collection onto the battlefield in randomly-sized, randomly-timed batches. Units must have been scripted to not deploy automatically before this is called. Arguments can be used to influence the size and timing of the batches of units.
---@param min_units number Minimum size of random unit batch. Must be postive.
---@param max_units number Maximum size of random unit batch. Must be positive, and not less than the supplied min units value.
---@param min_period number Minimum time period between the arrival of batches in ms. Must be positive.
---@param max_period number Maximum time period between the arrival of batches in ms. Must be positive, and not less than the supplied minimum period.
---@param debug_out boolean Supply true to turn on debug output.
---@param spawn_immediately boolean Spawns the first wave immediately.
function script_units:deploy_at_random_intervals(min_units, max_units, min_period, max_period, debug_out, spawn_immediately) end

--- Cancels/stops a running process started with script_units:deploy_at_random_intervals.
function script_units:cancel_deploy_at_random_intervals() end

--- Activates a kill aura around these units that cause a specified enemy/other script_units to take casualties when they come within a specified range. Only one kill aura process may be active on a scriptunit at a time.
---@param target_sunits script_units Target script_units collection.
---@param range number Range in m at which the enemy script_units begin to take casualties.
---@param casualties_proportion number Proportion of casualties taken per second. This should be specified as a unary proportion of the unit's initial strength, so the default value of 0.02 represents 2% of the initial strength per second.
function script_units:start_kill_aura(target_sunits, range, casualties_proportion) end

--- Stops the kill aura started on this collection with script_units:start_kill_aura.
function script_units:stop_kill_aura() end

--- Instructs this scriptunits collection to attack another, acting entirely under script control. This is best used for a close-quarters scripted engagement where no AI randomness or maneouvring is desired.
---@param enemy_script_units script_units enemy script_units
---@param should_run boolean should run
function script_units:attack_enemy_scriptunits(enemy_script_units, should_run) end

--- Stops an attack process started with script_units:attack_enemy_scriptunits.
function script_units:stop_attack_enemy_scriptunits() end

--- Pulses a highlight effect on all the unit cards associated with this scriptunits collection, using script_unit:highlight_unit_card.
---@param should_highlight boolean Set to true to turn the highlight effect on, false to turn it off.
---@param pulse_strength number Sets the strength of the pulse effect. A higher supplied value leads to a more pronounced pulse effect. The default value is 5.
---@param force_highlight boolean Overrides the disabling of help page highlighting with battle_ui_manager:set_help_page_link_highlighting_permitted. Set this to true if the script explicitly wants to highlight the UI cards when help page link highlighting is disabled (useful in tutorials).
function script_units:highlight_unit_cards(should_highlight, pulse_strength, force_highlight) end