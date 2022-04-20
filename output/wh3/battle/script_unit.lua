
---@class script_unit
local script_unit = {}

--- Creates a new script unit. The unit object to encapsulate is looked up by the supplied army and reference name.
---@param army battle_army Army the target unit is a member of.
---@param reference any Reference for the unit. This can either be a string name, or an integer number representing the unit's index within the army ('1' is generally the general, for example). If a string name is supplied this must match the script name given to the unit in the battle setup - this is generally set in either the battle xml or in the relevant entry in the battle_set_piece_armies_units_junctions database table.
function script_unit:new_by_reference(army, reference) end

--- Creates a new script unit from a supplied battle_unit. An optional reference name may be passed which is used for debug output.
---@param unit battle_unit Unit object to be contained.
---@param name string Reference name for the unit.
function script_unit:new(unit, name) end

--- Returns the army object to which the unit contained by this scriptunit currently belongs.
function script_unit:army() end

--- Returns the alliance object to which the unit contained by this scriptunit belongs.
function script_unit:alliance() end

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

--- Respawns the unit at the location it started the battle. This resets its health, fatigue, casualties and other stats.
---@param only_if_dead boolean Respawn the unit only if it is dead, or if it has routed off the battlefield.
function script_unit:respawn_in_start_location(only_if_dead) end

--- Returns the position of the scriptunit, offset from its current position. This offset will be calculated from the scriptunit's current bearing, so an offset of [0, 0, -10] will report a position 10m behind its current position. An override bearing to alter the position calculation may optionally be supplied.
---@param x_offset number x offset in m
---@param y_offset number y offset (height) in m
---@param z_offset number z offset in m
---@param bearing_override number Bearing override in degrees. Supply a value here to override the bearing used to make the offset calculation.
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
---@param position vector position
function script_unit:turn_to_face(position) end

--- Instructs the scriptunit to teleport to a location.
---@param position vector Position to teleport to.
---@param bearing number Bearing to face at the target position in degrees.
---@param width number Width in m of formation at target position.
function script_unit:teleport_to_location(position, bearing, width) end

--- Caches the units current position, bearing and width.
function script_unit:cache_location() end

--- Returns the vector position of the unit last time it was cached with script_unit:cache_location.
function script_unit:get_cached_position() end

--- Returns the bearing of the unit in degrees last time it was cached with script_unit:cache_location.
function script_unit:get_cached_bearing() end

--- Returns the width of the unit in m last time it was cached with script_unit:cache_location.
function script_unit:get_cached_width() end

--- Instructs the scriptunit to move to the location the unit occupied the last time it was cached with script_unit:cache_location.
---@param should_run boolean Instructs the unit to move fast.
function script_unit:goto_cached_location(should_run) end

--- Teleports the scriptunit to the location the unit occupied the last time it was cached with script_unit:cache_location.
function script_unit:teleport_to_cached_location() end

--- Returns true if the scriptunit has moved from the last cached position, or an optional supplied position. The movement threshold can also be overriden (by default it's 1m).
---@param position_override vector position override
---@param threshold_distance number threshold distance
function script_unit:has_moved(position_override, threshold_distance) end

--- Caches the current destination position of the scriptunit. Note that the if the subject unit is attacking rather than moving to a position it will have no valid destination. The function also caches whether the unit is running.
function script_unit:cache_destination() end

--- Caches the current destination position of the scriptunit with script_unit:cache_destination, and then orders the unit to halt.
function script_unit:cache_destination_and_halt() end

--- Returns the vector destination last cached by script_unit:cache_destination.
function script_unit:get_cached_destination_position() end

--- Returns the ordered bearing in degrees that was last cached by script_unit:cache_destination.
function script_unit:get_cached_destination_bearing() end

--- Returns the ordered width in m that was last cached by script_unit:cache_destination.
function script_unit:get_cached_destination_width() end

--- Instructs the unit to move to the location last cached by script_unit:cache_destination. If the unit was moving quickly when its destination was last cached, than it will resume moving quickly when this function is called.
---@param should_release boolean Set to true to release script control of the unit after calling this function. Set this if it's desirable for the player (or AI, if it's not a player-controlled unit) to be able to control this unit after the order has been issued.
function script_unit:goto_cached_destination(should_release) end

--- Returns true if the unit is under missile attack, in melee, or has casualties since the last time is_under_attack was called. Designed to be called repeatedly.
function script_unit:is_under_attack() end

--- Returns true if the unit is in melee. This is an unembellished wrapper for an underlying code function.
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

--- Instructs the scriptunit to deploy as a reinforcement if it can.
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

--- Sets the unit to be enabled and visible if true is supplied as an argument, or disabled and invisible if false is supplied. The second argument forces the UI to refresh the unit card's visibility, but this only needs to be set to true in certain specific circumstances.<br />
--- The third argument, if set to true or false, will also set that unit to contribute to the army strength or not depending upon the value supplied. If no value is supplied here then enabled units will contribute to army strength whereas disabled units will not.
---@param enabled boolean enabled
---@param force_unit_card_update boolean force unit card update
---@param unit_contributes_to_army_strength boolean unit contributes to army strength
function script_unit:set_enabled(enabled, force_unit_card_update, unit_contributes_to_army_strength) end

--- Sets the unit to be always visible, according to the rules of the terrain visibility system.
---@param always_visible boolean always visible
function script_unit:set_always_visible(always_visible) end

--- Sets the unit to be always visible, doesn't affect hidden by forest / abilities
---@param always_visible boolean always visible
function script_unit:set_always_visible_no_hidden(always_visible) end

--- Sets the unit to be always visible, doesn't affect leaving battle
---@param always_visible boolean always visible
function script_unit:set_always_visible_no_leave_battle(always_visible) end

--- Sets the unit to be always visible, doesn't affect hidden by forest / abilities  doesn't affect leaving battle
---@param always_visible boolean always visible
function script_unit:set_always_visible_no_hidden_no_leave_battle(always_visible) end

--- Makes player unit look like ally (for script where gradually give units in tutorials). This is an unembellished wrapper for an underlying code function.
---@param mark_as_ally boolean mark as ally
function script_unit:mark_as_ally(mark_as_ally) end

--- Returns true if the unit is hidden in grass/forests etc. This is an unembellished wrapper for an underlying code function. Returned result is not related to the terrain visibility system, which came later than this code function, so a unit may not be hidden (according to this result returned by this function) but may still not be visible to its enemy - check also script_unit:is_visible_to_enemy.
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

--- Caches the proportion of the scriptunit still alive, so that it can be queried later with script_unit:has_taken_casualties.
function script_unit:cache_health() end

--- Compares the scriptunits current casualties with that when it was previously cached with script_unit:cache_health, and returns true if they're different.
---@param tolerance number Tolerance value. The casualties values is expressed internally as a unary value (between 0 and 1), so this should be expressed in a similar manner. Therefore a tolerance of 0.1 would allow for 10% casualties (of the original number of soldiers in the unit) more than when previously cached before returning true.
function script_unit:has_taken_casualties(tolerance) end

--- Returns this unit's hitpoints as a unary of its initial value. If the shattered-considered-dead flag is set and the unit is shattered (or it's routing and has left the field), then 0 is returned.
---@param considered_dead shattered considered dead
function script_unit:unary_hitpoints(considered_dead) end

--- Sets the maximum number of casualties that this unit can take. If the unit's hitpoints drop below the specified unary value, the unit is made invincible so that it can no longer take casualties (note that it may still rout). Exception scriptunits can be set, so that proximity to those script_unit or script_units disables this invincibility (allow certain units to be perceived to charge in and 'save the day').
---@param unary_proportion number Call max_casualties with a proportion value of 0 to disables any previous max_casualties monitor on this unit.
---@param should_release boolean Set to true to release script control of this unit after max_casualties makes a change. Set this primarily if the unit is under player control.
---@param boolean_silent_mode script_units The monitor will resume and this unit will (potentially) regain invincibility when this unit moves more than 40m away from any unit specified as an exception.
function script_unit:max_casualties(unary_proportion, should_release, boolean_silent_mode) end

--- Makes the subject unit invincible. This wraps an underlying code function, and also cancels any running process started for this unit with script_unit:max_casualties or script_unit:set_invincible_for_time_proportion.
---@param set_invincible boolean set invincible
function script_unit:set_invincible(set_invincible) end

--- Makes the subject unit invincible a proportion of the time. The intended effect is to slow the rate at which the unit receives casualties. Invincibility is toggled on and off over a five second interval, with the unit being invincible the specified proportion of time. The proportion is set as a unary number, so supplying a value of 0.8 would make the unit invincible for four seconds out of every five.<br />
--- Set a value of 0 to turn off any previous invincibility set with this function.
---@param time_proportion number Unary (0-1) time proportion over which this unit should be invincible.
---@param should_release boolean Instructs the function to release script control of the unit after setting it to be invincible or otherwise. Set this to true if the scriptunit is player-controlled.
function script_unit:set_invincible_for_time_proportion(time_proportion, should_release) end

--- Prevents this unit from routing until it takes a certain proportion of casualties. If a proportion of 0 is supplied then any previous monitor set up with fearless_until_casualties is cancelled and the unit is allowed to rout.
---@param proportion unary Proportion of unit at which it may rout. Value should be expressed as a unary e.g. 0.5 = 50% casualties.
---@param should_release boolean Set to true to release script control of this unit after fearless_until_casualties makes a change. Set this primarily if the unit is under player control.
function script_unit:fearless_until_casualties(proportion, should_release) end

--- Forces this unit to rout when it reaches a certain proportion of casualties. If a proportion of 0 is supplied then any previous monitor set up with rout_on_casualties is cancelled.
---@param unary_proportion number Proportion of unit hitpoints remaining at which it routs. Value should be expressed as a unary e.g. 0.6 = unit will rout when its health gets below 60%.
---@param set_invincible boolean Makes the unit invincible when it routs, so that it's guaranteed to survive.
function script_unit:rout_on_casualties(unary_proportion, set_invincible) end

--- Makes the subject unit invincible/fearless if it's not already routing.
---@param should_release boolean Set to true to release script control of this unit after invincible_if_standing makes a change. Set this primarily if the unit is under player control.
function script_unit:invincible_if_standing(should_release) end

--- Prevents the subject unit from rallying if it's already routing. Supply true as a single argument to start a monitor that will continually poll whether this unit is routing, and prevent it
---@param check_perpetually boolean If true is supplied instead, the function sets up a monitor that will continually poll the unit's routing status and, when found to be routing, prevents it from rallying at that time.
---@param shattered_only boolean Only count shattered units
---@param permit_rampaging boolean Don't automatically count rampaging units, check if they are actually routing too.
function script_unit:prevent_rallying_if_routing(check_perpetually, shattered_only, permit_rampaging) end

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

--- Calls unitcontroller:hide_unbreakable_in_ui to prevent or allow the UI to show that this unit is unbreakable. This is useful for scripted content which is altering whether a unit can rout or not but doesn't want this to be reflected on the user interface.
---@param hide_unbreakable_state boolean hide unbreakable state
function script_unit:hide_unbreakable_in_ui(hide_unbreakable_state) end

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
function script_unit:get_enemy_alliance_num() end

--- Gets the enemy alliance object.
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

--- Instructs this scriptunit to attack the closest enemy unit under full script control. This process will continually re-acquire the closest enemy target every interval and instruct the unit to attack. The process repeats until the unit is shattered, dead, or until script_unit:stop_attack_closest_enemy is called.
---@param interval number Repeating interval in milliseconds after which the scriptunit re-acquires the closest enemy target.
---@param debug boolean Shows debug output about what this unit is attacking.
function script_unit:start_attack_closest_enemy(interval, debug) end

--- Stops any running attack closest enemy process that was started with script_unit:start_attack_closest_enemy. An optional string reason may be supplied which is printed as debug output.
function script_unit:stop_attack_closest_enemy() end

---@class script_units
local script_units = {}

--- Creates a new script units collection.
---@param name string Name for this script_units collection. Will be used for debug output.
---@vararg any
function script_units:new(name, scriptunits) end

--- Sets the scriptunits collection into debug mode, for more output.
---@param debug_mode boolean debug mode
function script_units:set_debug(debug_mode) end

--- Adds one or more supplied script_unit objects to this scriptunits collection.
---@vararg any
function script_units:add_sunits(additional_script_units) end

--- Copies all script_unit objects associated with a supplied script_units collection into this script units collection.
---@param other_script_units script_units other script units
function script_units:merge(other_script_units) end

--- Removes a supplied script_unit object from this scriptunits collection.
---@param scriptunit_to_remove script_unit scriptunit to remove
function script_units:remove_sunit(scriptunit_to_remove) end

--- Removes one or more supplied script_unit objects from this scriptunits collection.
---@vararg any
function script_units:remove_sunits(script_unit_list) end

--- Returns a script_unit from this script_units collection that matches the supplied reference number or string. nil is returned if no matching script_unit is found.
---@param reference any Reference number or string.
function script_units:get_sunit_by_name(reference) end

--- Returns a script_unit from this script_units collection that contains the supplied battle_unit. nil is returned if no matching script_unit is found.
---@param unit battle_unit unit
function script_units:get_sunit_for_unit(unit) end

--- Returns the first script_unit in this script_units collection that contains a battle_unit of the supplied type. nil is returned if no matching script_unit is found.
---@param unit_type string Unit type, from the main_units table.
function script_units:get_sunit_by_type(unit_type) end

--- Returns the number of script_unit objects in this script_units collection.
function script_units:count() end

--- Returns the script_unit in this collection at the supplied index.
---@param index_value number index value
function script_units:item(index_value) end

--- Returns whether the script units collection contains the supplied object. Supported object types are script_unit, battle_unit and battle_unitcontroller.
---@param object any Object to test - supported types are script_unit, battle_unit and battle_unitcontroller.
function script_units:contains(object) end

--- Returns the internal table containing all the script_unit objects in this script_units collection. Be aware that modifications to this table will also modify this script_units object.
function script_units:get_sunit_table() end

--- Returns a table containing all battle_unit objects contained within this script_units collection. The table that's returned is built each time this function is called, so be wary of calling this function too often.
function script_units:get_unit_table() end

--- Returns another scriptunits collection containing all script_unit objects from the subject collection that pass the supplied test. The test should be supplied as a function that takes a scriptunit parameter and returns a boolean value. Should a call to the function with a specific scriptunit return true, that scriptunit will be added to the returned collection.
---@param name string Name for the returned scriptunits collection
---@param test function Function that takes a scriptunit parameter and returns a boolean value.
---@param assert_if_empty boolean If set to true, filter triggers a script assert if the returned collection is empty.
---@param max_size number Maximum number of units to add to the returned scriptunit collection.
function script_units:filter(name, test, assert_if_empty, max_size) end

--- Sorts the internal list of script_unit objects based on the supplied filter function. The filter function should take two script_unit arguments and return true if the first should be sorted before the second, and false otherwise. table:sort is used to perform the operation.
---@param filter_function function filter function
function script_units:sort(filter_function) end

--- Prints the list of script_unit objects this collection contains to the debug console spool.
function script_units:out() end

--- Returns a duplicate script_units collection with the supplied name.
---@param name string name
function script_units:duplicate(name) end

--- Returns a unitcontroller with control over all the units this script_units collection contains.
---@param army battle_army If no army is supplied, the function assumes that all units in the scriptunits collection are in the same army, and will assert if any aren't.
function script_units:get_unitcontroller(army) end

--- Returns the number of commanding general units the scriptunits collection contains.
function script_units:num_generals() end

--- Returns a commanding general scriptunit from the scriptunits collection. By default the first general scriptunit is returned. An index value may be given to specify a particular general to return.
---@param general_index number general index
function script_units:get_general_sunit(general_index) end

--- Returns a vector corresponding to the mean centre position of all the script_unit objects in the collection.
function script_units:centre_point() end

--- Returns the distance from the furthest unit from the centre, to the centre, which is an indication of how spread out the units in this collection are.
function script_units:radius() end

--- Returns the current cumulative width of all units in the collection in metres.
function script_units:width() end

--- Returns the average ordered bearing of all units in the collection, in degrees.
function script_units:average_bearing() end

--- Returns the northern-most script_unit.
function script_units:get_northernmost() end

--- Returns the southern-most script_unit.
function script_units:get_southernmost() end

--- Returns the western-most script_unit.
function script_units:get_westernmost() end

--- Returns the eastern-most script_unit.
function script_units:get_easternmost() end

--- Returns the closest script_unit in this collection to the supplied collection of units/positions, as well as the distance in m.
---@param position_collection any Position object or collection. Supported object types are vector, unit, script_unit, units, script_units, army, armies, alliance or table.
---@param only 2d consider 2D distance only (disregarding altitude)
function script_units:get_closest(position_collection, only) end

--- Returns the furthest script_unit in this collection from the supplied collection of units/positions, as well as the distance in m.
---@param position_collection any Position object or collection. Supported object types are battle_vector, battle_unit, script_unit, battle_units, script_units, battle_army, battle_armies, battle_alliance or table.
---@param only 2d consider 2D distance only (disregarding altitude)
function script_units:get_furthest(position_collection, only) end

--- Returns the script_unit in the collection that is closest to the calculated centre.
function script_units:get_centremost() end

--- Returns the furthest script_unit in this collection from the mean centre.
function script_units:get_outlying() end

--- Returns true if any unit in this scriptunits collection is routing or dead, or false otherwise.
---@param shattered_only boolean Only count shattered units.
---@param permit_rampaging boolean Don't automatically count rampaging units, check if they are actually routing too.
function script_units:are_any_routing_or_dead(shattered_only, permit_rampaging) end

--- Returns true if all units in this scriptunits collection are routing or dead, or false otherwise.
---@param shattered_only boolean Only count shattered units.
---@param permit_rampaging boolean Don't automatically count rampaging units, check if they are actually routing too.
function script_units:are_all_routing_or_dead(shattered_only, permit_rampaging) end

--- Prevents routing units within the collection from rallying, and routs all non-routing units over the specified period in ms so that all units are eventually routing.
---@param period_in_ms number Time in ms over which the units are routed. Must be positive.
function script_units:rout_over_time(period_in_ms) end

--- Have any of the script_unit objects in the collection deployed onto the battlefield.
function script_units:have_any_deployed() end

--- Have all of the script_unit objects in the collection deployed onto the battlefield.
function script_units:have_all_deployed() end

--- Returns the number of script_unit objects in the collection that are currently deployed onto the battlefield.
function script_units:num_deployed() end

--- Returns true if any script_unit in this collection is deployed on the battlefield and not routing or dead.
function script_units:are_any_active_on_battlefield() end

--- Returns true if script_unit:has_moved returns true for any unit in this collection. Call script_unit:cache_location() first to set a position from which each unit's distance is tested.
---@param position vector Position to test against. May be of limited usefulness when testing multiple units like this.
---@param threshold_distance distance Threshold distance in m.
function script_units:have_any_moved(position, threshold_distance) end

--- Returns the number of units in this collection that have moved when tested with script_unit:has_moved. Call script_unit:cache_location() first to set a position from which each unit's distance is tested.
---@param position vector Position to test against. May be of limited usefulness when testing multiple units like this.
---@param threshold_distance distance Threshold distance in m.
function script_units:num_moved(position, threshold_distance) end

--- Returns true if script_unit:has_moved returns true for all units in this collection. Call script_unit:cache_location() first to set a position from which each unit's distance is tested.
---@param position vector Position to test against. May be of limited usefulness when testing multiple units like this.
---@param threshold_distance distance Threshold distance in m.
function script_units:have_all_moved(position, threshold_distance) end

--- Returns true if any script_unit in this collection is moving fast.
function script_units:are_any_running() end

--- Returns true if all script_unit objects in this collection are moving fast.
function script_units:are_all_running() end

--- Returns true if any script_unit in this collection is under attack (uses script_unit:is_under_attack)
function script_units:is_under_attack() end

--- Returns true if any script_unit in this collection is in melee combat (uses script_unit:is_in_melee).
function script_units:is_in_melee() end

--- Returns the average unary hitpoints of all script_unit objects in this collection.
---@param shattered_considered_dead boolean Shattered units (or units that have routed and left the field) are considered dead, with 0 hitpoints.
function script_units:unary_hitpoints(shattered_considered_dead) end

--- Returns the total number of enemies killed by all units in this collection.
function script_units:number_of_enemies_killed() end

--- Performs a disordered teleport of all units contained within this collection to within a radius around a position, both supplied. A disordered teleport preserves the current orientation and width of each unit, but teleports them within the radius of the position if they're not already inside.<br />
--- The function is intended to assist in transitions between different sections of gameplay within a heavily scripted battle. We may wish for the player to start the latter section with their troops in unformed order, akin to where they were at the end of the previous section, but to ensure that none of the player's forces are too far away from a known position (i.e. where we'd like them to start the latter section of gameplay).<br />
--- Script control of the teleported units is automatically released after this function is called.
---@param target_position battle_vector target position
---@param radius_in_m number radius in m
---@param release_control boolean release control
function script_units:disordered_teleport(target_position, radius_in_m, release_control) end

--- Respawns the units in the collection at the locations they started the battle. This resets their health, fatigue, casualties and other stats.
---@param only_if_dead boolean Respawn each unit only if it is dead, or if it has routed off the battlefield.
---@param debug_output boolean Produce debug output about which units have been respawned.
function script_units:respawn_in_start_location(only_if_dead, debug_output) end

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
function script_units:is_hidden(all_units) end

--- Returns true if any script_unit in this collection is visible to the enemy, by the rules of the terrain visibility system. Note that a unit can be considered visible by this system but still be hidden in forests.
function script_units:is_visible_to_enemy() end

--- Deploys the units in this collection onto the battlefield in randomly-sized, randomly-timed batches. Units must have been scripted to not deploy automatically before this is called. Arguments can be used to influence the size and timing of the batches of units.
---@param min_units number Minimum size of random unit batch. Must be postive.
---@param max_units number Maximum size of random unit batch. Must be positive, and not less than the supplied min units value.
---@param min_period number Minimum time period between the arrival of batches in ms. Must be positive.
---@param max_period number Maximum time period between the arrival of batches in ms. Must be positive, and not less than the supplied minimum period.
---@param debug_out boolean Supply true to turn on debug output.
---@param spawn_immediately boolean Spawns the first wave immediately.
---@param allow_respawning boolean Allows units to be respawned and deployed again.
---@param new_wave_callback function Callback to call when a new wave in deployed. A table containing a list of script_unit objects representing the units being deployed will be passed to the callback when it is called.
function script_units:deploy_at_random_intervals(min_units, max_units, min_period, max_period, debug_out, spawn_immediately, allow_respawning, new_wave_callback) end

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

--- Returns a string which represents the serialised state of this script_units collection. This does not embody the full model state of the units but only selected information. It is mainly intended for use by script_units:save_state_to_svr which will save the returned string into the scripted value registry. This string can then be loaded by <a href="../campaign/campaign_manager.html#function:campaign_manager:load_army_state_from_svr">campaign_manager:load_army_state_from_svr, allowing campaign scripts to spoof the results from a scripted battle that occurs mid-campaign flow.
function script_units:serialise_state() end

--- Saves a string which represents the serialised state of this script_units collection to the scripted value registry. script_units:serialise_state is used to generate the state string, and core:svr_save_string is used to save the string. This is for use by scripts that wish to pass the state of an army, usually at the end of a battle, from battle script to campaign script, usually so that the latter can spoof the battle results in script. The function <a href="../campaign/campaign_manager.html#function:campaign_manager:load_army_state_from_svr">campaign_manager:load_army_state_from_svr can be used on the campaign-side to load the values saved by this string.
---@param name string Name for this svr entry, to be passed to core:svr_save_string.
function script_units:save_state_to_svr(name) end

--- Checks for a scriptedvalueregistry string with the supplied name, and attempts to apply the health values it contains to the units in this script_units collection. These svr strings would be set by either <a href="../campaign/campaign_manager.html#function:campaign_manager:save_army_state_to_svr">campaign_manager:save_army_state_to_svr in campaign or script_units:save_state_to_svr in battle.<br />
--- This is primarily intended to spoof casualties on a battle army that is coming from campaign, but where the army in battle is not logically related to that campaign army (for example, when loading from a campaign into a scripted xml battle).<br />
--- The function returns whether the application was successful. A successful application is one that modifies all units in the script_units collection (a "modification" from 100% health to 100% health would count), unless the allow_partial flag is set, in which case even a partial application would be considered successful. If the application is not successful then no changes are applied. Output is generated in all cases.
---@param name string Name of string saved in the scriptedvalueregistry.
---@param allow_partial boolean Allow a partial application of the state string. If this is set to true</code then the application will be successful even if not all sunits in this collection end up being touched.
function script_units:load_state_from_svr(name, allow_partial) end
