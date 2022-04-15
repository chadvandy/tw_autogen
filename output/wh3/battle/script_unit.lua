
---@class script_units
local script_units = {}

--- 
function script_units:has_moved() end

--- 
function script_units:highlight_unit_card() end

--- Prevents routing units within the collection from rallying, and routs all non-routing units over the specified period in ms so that all units are eventually routing.
---@param period_in_ms number Time in ms over which the units are routed. Must be positive.
function script_units:rout_over_time(period_in_ms) end

--- Returns the furthest script_unit in this collection from the supplied collection of units/positions, as well as the distance in m.
---@param position_collection any Position object or collection. Supported object types are battle_vector, battle_unit, script_unit, battle_units, script_units, battle_army, battle_armies, battle_alliance or table.
---@param only 2d consider 2D distance only (disregarding altitude)
function script_units:get_furthest(position_collection, only) end

--- 
function script_units:position_offset() end

--- 
function script_units:teleport_to_location_offset() end

--- 
function script_units:teleport_to_start_location() end

--- Have all of the script_unit objects in the collection deployed onto the battlefield.
function script_units:have_all_deployed() end

--- 
function script_units:refresh() end

--- Checks for a scriptedvalueregistry string with the supplied name, and attempts to apply the health values it contains to the units in this script_units collection. These svr strings would be set by either <a href="../campaign/campaign_manager.html#function:campaign_manager:save_army_state_to_svr">campaign_manager:save_army_state_to_svr in campaign or script_units:save_state_to_svr in battle.<br />
--- This is primarily intended to spoof casualties on a battle army that is coming from campaign, but where the army in battle is not logically related to that campaign army (for example, when loading from a campaign into a scripted xml battle).<br />
--- The function returns whether the application was successful. A successful application is one that modifies all units in the script_units collection (a "modification" from 100% health to 100% health would count), unless the allow_partial flag is set, in which case even a partial application would be considered successful. If the application is not successful then no changes are applied. Output is generated in all cases.
---@param name string Name of string saved in the scriptedvalueregistry.
---@param allow_partial boolean Allow a partial application of the state string. If this is set to true</code then the application will be successful even if not all sunits in this collection end up being touched.
function script_units:load_state_from_svr(name, allow_partial) end

--- Returns a commanding general scriptunit from the scriptunits collection. By default the first general scriptunit is returned. An index value may be given to specify a particular general to return.
---@param general_index number general index
function script_units:get_general_sunit(general_index) end

--- Returns the number of script_unit objects in this script_units collection.
function script_units:count() end

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

--- Copies all script_unit objects associated with a supplied script_units collection into this script units collection.
---@param other_script_units script_units other script units
function script_units:merge(other_script_units) end

--- 
function script_units:taunt() end

--- Stops the kill aura started on this collection with script_units:start_kill_aura.
function script_units:stop_kill_aura() end

--- 
function script_units:turn_to_face() end

--- 
function script_units:cache_destination_and_halt() end

--- 
function script_units:change_behaviour_active() end

--- 
function script_units:get_cached_width() end

--- Sets the scriptunits collection into debug mode, for more output.
---@param debug_mode boolean debug mode
function script_units:set_debug(debug_mode) end

--- Returns the average ordered bearing of all units in the collection, in degrees.
function script_units:average_bearing() end

--- 
function script_units:max_casualties() end

--- 
function script_units:set_enabled() end

--- 
function script_units:army() end

--- 
function script_units:goto_location_offset_when_deployed() end

--- Returns true if all units in this scriptunits collection are routing or dead, or false otherwise.
---@param shattered_only boolean Only count shattered units.
---@param permit_rampaging boolean Don't automatically count rampaging units, check if they are actually routing too.
function script_units:are_all_routing_or_dead(shattered_only, permit_rampaging) end

--- 
function script_units:cache_location() end

--- 
function script_units:set_stat_attribute() end

--- 
function script_units:new_by_reference() end

--- 
function script_units:kill() end

--- 
function script_units:halt() end

--- 
function script_units:morale_behavior_rout() end

--- 
function script_units:get_cached_destination_bearing() end

--- 
function script_units:play_sound_taunt() end

--- 
function script_units:teleport_to_start_location_offset() end

--- 
function script_units:start_attack_closest_enemy() end

--- 
function script_units:cache_health() end

--- Cancels/stops a running process started with script_units:deploy_at_random_intervals.
function script_units:cancel_deploy_at_random_intervals() end

--- Returns true if any script_unit in this collection is under attack (uses script_unit:is_under_attack)
function script_units:is_under_attack() end

--- 
function script_units:invincible_if_standing() end

--- Returns true if script_unit:has_moved returns true for all units in this collection. Call script_unit:cache_location() first to set a position from which each unit's distance is tested.
---@param position vector Position to test against. May be of limited usefulness when testing multiple units like this.
---@param threshold_distance distance Threshold distance in m.
function script_units:have_all_moved(position, threshold_distance) end

--- Returns true if script_unit:has_moved returns true for any unit in this collection. Call script_unit:cache_location() first to set a position from which each unit's distance is tested.
---@param position vector Position to test against. May be of limited usefulness when testing multiple units like this.
---@param threshold_distance distance Threshold distance in m.
function script_units:have_any_moved(position, threshold_distance) end

--- 
function script_units:remove_ping_icon() end

--- 
function script_units:set_invincible_for_time_proportion() end

--- 
function script_units:fearless_until_casualties() end

--- Returns the total number of enemies killed by all units in this collection.
function script_units:number_of_enemies_killed() end

--- 
function script_units:goto_location_offset() end

--- Returns the number of commanding general units the scriptunits collection contains.
function script_units:num_generals() end

--- Returns true if any script_unit in this collection is moving fast.
function script_units:are_any_running() end

--- 
function script_units:kill_proportion_over_time() end

--- 
function script_units:cache_destination() end

--- 
function script_units:stop_goto_location_offset_when_deployed() end

--- 
function script_units:goto_start_location_offset() end

--- 
function script_units:mark_as_ally() end

--- 
function script_units:set_always_visible_no_hidden() end

--- Returns the furthest script_unit in this collection from the mean centre.
function script_units:get_outlying() end

--- 
function script_units:add_ping_icon() end

--- 
function script_units:get_enemy_alliance() end

--- Returns whether the script units collection contains the supplied object. Supported object types are script_unit, battle_unit and battle_unitcontroller.
---@param object any Object to test - supported types are script_unit, battle_unit and battle_unitcontroller.
function script_units:contains(object) end

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

--- Returns the western-most script_unit.
function script_units:get_westernmost() end

--- 
function script_units:morale_behavior_default() end

--- 
function script_units:prevent_rallying_if_routing() end

--- 
function script_units:withdraw() end

--- 
function script_units:hide_unbreakable_in_ui() end

--- 
function script_units:restore_cached_ammo() end

--- Removes a supplied script_unit object from this scriptunits collection.
---@param scriptunit_to_remove script_unit scriptunit to remove
function script_units:remove_sunit(scriptunit_to_remove) end

--- Returns a script_unit from this script_units collection that matches the supplied reference number or string. nil is returned if no matching script_unit is found.
---@param reference any Reference number or string.
function script_units:get_sunit_by_name(reference) end

--- 
function script_units:get_cached_bearing() end

--- 
function script_units:release_control() end

--- Returns a string which represents the serialised state of this script_units collection. This does not embody the full model state of the units but only selected information. It is mainly intended for use by script_units:save_state_to_svr which will save the returned string into the scripted value registry. This string can then be loaded by <a href="../campaign/campaign_manager.html#function:campaign_manager:load_army_state_from_svr">campaign_manager:load_army_state_from_svr, allowing campaign scripts to spoof the results from a scripted battle that occurs mid-campaign flow.
function script_units:serialise_state() end

--- 
function script_units:set_invincible() end

--- 
function script_units:cache_ammo() end

--- 
function script_units:modify_ammo() end

--- 
function script_units:grant_infinite_ammo() end

--- Adds one or more supplied script_unit objects to this scriptunits collection.
---@vararg any
function script_units:add_sunits(additional_script_units) end

--- Returns a table containing all battle_unit objects contained within this script_units collection. The table that's returned is built each time this function is called, so be wary of calling this function too often.
function script_units:get_unit_table() end

--- Removes one or more supplied script_unit objects from this scriptunits collection.
---@vararg any
function script_units:remove_sunits(script_unit_list) end

--- 
function script_units:set_melee_mode() end

--- 
function script_units:get_enemy_alliance_num() end

--- 
function script_units:set_always_visible_no_hidden_no_leave_battle() end

--- Returns the number of units in this collection that have moved when tested with script_unit:has_moved. Call script_unit:cache_location() first to set a position from which each unit's distance is tested.
---@param position vector Position to test against. May be of limited usefulness when testing multiple units like this.
---@param threshold_distance distance Threshold distance in m.
function script_units:num_moved(position, threshold_distance) end

--- Returns a script_unit from this script_units collection that contains the supplied battle_unit. nil is returned if no matching script_unit is found.
---@param unit battle_unit unit
function script_units:get_sunit_for_unit(unit) end

--- 
function script_units:teleport_to_location() end

--- Prints the list of script_unit objects this collection contains to the debug console spool.
function script_units:out() end

--- 
function script_units:kill_proportion() end

--- 
function script_units:morale_behavior_fearless() end

--- 
function script_units:morale_behavior_default_if_standing() end

--- Returns true if all script_unit objects in this collection are moving fast.
function script_units:are_all_running() end

--- Returns the distance from the furthest unit from the centre, to the centre, which is an indication of how spread out the units in this collection are.
function script_units:radius() end

--- Pulses a highlight effect on all the unit cards associated with this scriptunits collection, using script_unit:highlight_unit_card.
---@param should_highlight boolean Set to true to turn the highlight effect on, false to turn it off.
---@param pulse_strength number Sets the strength of the pulse effect. A higher supplied value leads to a more pronounced pulse effect. The default value is 5.
---@param force_highlight boolean Overrides the disabling of help page highlighting with battle_ui_manager:set_help_page_link_highlighting_permitted. Set this to true if the script explicitly wants to highlight the UI cards when help page link highlighting is disabled (useful in tutorials).
function script_units:highlight_unit_cards(should_highlight, pulse_strength, force_highlight) end

--- Stops an attack process started with script_units:attack_enemy_scriptunits.
function script_units:stop_attack_enemy_scriptunits() end

--- Instructs this scriptunits collection to attack another, acting entirely under script control. This is best used for a close-quarters scripted engagement where no AI randomness or maneouvring is desired.
---@param enemy_script_units script_units enemy script_units
---@param should_run boolean should run
function script_units:attack_enemy_scriptunits(enemy_script_units, should_run) end

--- Activates a kill aura around these units that cause a specified enemy/other script_units to take casualties when they come within a specified range. Only one kill aura process may be active on a scriptunit at a time.
---@param target_sunits script_units Target script_units collection.
---@param range number Range in m at which the enemy script_units begin to take casualties.
---@param casualties_proportion number Proportion of casualties taken per second. This should be specified as a unary proportion of the unit's initial strength, so the default value of 0.02 represents 2% of the initial strength per second.
function script_units:start_kill_aura(target_sunits, range, casualties_proportion) end

--- Performs a disordered teleport of all units contained within this collection to within a radius around a position, both supplied. A disordered teleport preserves the current orientation and width of each unit, but teleports them within the radius of the position if they're not already inside.<br />
--- The function is intended to assist in transitions between different sections of gameplay within a heavily scripted battle. We may wish for the player to start the latter section with their troops in unformed order, akin to where they were at the end of the previous section, but to ensure that none of the player's forces are too far away from a known position (i.e. where we'd like them to start the latter section of gameplay).<br />
--- Script control of the teleported units is automatically released after this function is called.
---@param target_position battle_vector target position
---@param radius_in_m number radius in m
---@param release_control boolean release control
function script_units:disordered_teleport(target_position, radius_in_m, release_control) end

--- Sorts the internal list of script_unit objects based on the supplied filter function. The filter function should take two script_unit arguments and return true if the first should be sorted before the second, and false otherwise. table:sort is used to perform the operation.
---@param filter_function function filter function
function script_units:sort(filter_function) end

--- 
function script_units:stop_kill_proportion_over_time() end

--- Returns true if any script_unit in this collection is deployed on the battlefield and not routing or dead.
function script_units:are_any_active_on_battlefield() end

--- 
function script_units:has_taken_casualties() end

--- 
function script_units:goto_start_location() end

--- Returns the number of script_unit objects in the collection that are currently deployed onto the battlefield.
function script_units:num_deployed() end

--- Returns the average unary hitpoints of all script_unit objects in this collection.
---@param shattered_considered_dead boolean Shattered units (or units that have routed and left the field) are considered dead, with 0 hitpoints.
function script_units:unary_hitpoints(shattered_considered_dead) end

--- 
function script_units:get_cached_destination_position() end

--- 
function script_units:set_always_visible_no_leave_battle() end

--- Returns the first script_unit in this script_units collection that contains a battle_unit of the supplied type. nil is returned if no matching script_unit is found.
---@param unit_type string Unit type, from the main_units table.
function script_units:get_sunit_by_type(unit_type) end

--- Respawns the units in the collection at the locations they started the battle. This resets their health, fatigue, casualties and other stats.
---@param only_if_dead boolean Respawn each unit only if it is dead, or if it has routed off the battlefield.
---@param debug_output boolean Produce debug output about which units have been respawned.
function script_units:respawn_in_start_location(only_if_dead, debug_output) end

--- Returns the script_unit in the collection that is closest to the calculated centre.
function script_units:get_centremost() end

--- 
function script_units:celebrate() end

--- 
function script_units:alliance() end

--- 
function script_units:get_cached_position() end

--- 
function script_units:stop_prevent_rallying_if_routing() end

--- 
function script_units:refill_ammo() end

--- Returns the internal table containing all the script_unit objects in this script_units collection. Be aware that modifications to this table will also modify this script_units object.
function script_units:get_sunit_table() end

--- 
function script_units:goto_cached_location() end

--- Returns the southern-most script_unit.
function script_units:get_southernmost() end

--- Returns the northern-most script_unit.
function script_units:get_northernmost() end

--- Returns the current cumulative width of all units in the collection in metres.
function script_units:width() end

--- 
function script_units:set_invisible_to_all() end

--- Returns the closest script_unit in this collection to the supplied collection of units/positions, as well as the distance in m.
---@param position_collection any Position object or collection. Supported object types are vector, unit, script_unit, units, script_units, army, armies, alliance or table.
---@param only 2d consider 2D distance only (disregarding altitude)
function script_units:get_closest(position_collection, only) end

--- Saves a string which represents the serialised state of this script_units collection to the scripted value registry. script_units:serialise_state is used to generate the state string, and core:svr_save_string is used to save the string. This is for use by scripts that wish to pass the state of an army, usually at the end of a battle, from battle script to campaign script, usually so that the latter can spoof the battle results in script. The function <a href="../campaign/campaign_manager.html#function:campaign_manager:load_army_state_from_svr">campaign_manager:load_army_state_from_svr can be used on the campaign-side to load the values saved by this string.
---@param name string Name for this svr entry, to be passed to core:svr_save_string.
function script_units:save_state_to_svr(name) end

--- Returns the script_unit in this collection at the supplied index.
---@param index_value number index value
function script_units:item(index_value) end

--- Returns true if any unit in this scriptunits collection is routing or dead, or false otherwise.
---@param shattered_only boolean Only count shattered units.
---@param permit_rampaging boolean Don't automatically count rampaging units, check if they are actually routing too.
function script_units:are_any_routing_or_dead(shattered_only, permit_rampaging) end

--- Returns true if any script_unit in this collection is hidden in long grass or trees. If true is supplied as a single argument, then all units in the collection must be hidden for the function to return true.
---@param all_units boolean all units
function script_units:is_hidden(all_units) end

--- Returns a vector corresponding to the mean centre position of all the script_unit objects in the collection.
function script_units:centre_point() end

--- 
function script_units:morale_behavior_fearless_if_standing() end

--- Creates a new script units collection.
---@param name string Name for this script_units collection. Will be used for debug output.
---@vararg any
function script_units:new(name, scriptunits) end

--- 
function script_units:get_cached_destination_width() end

--- Have any of the script_unit objects in the collection deployed onto the battlefield.
function script_units:have_any_deployed() end

--- Returns a unitcontroller with control over all the units this script_units collection contains.
---@param army battle_army If no army is supplied, the function assumes that all units in the scriptunits collection are in the same army, and will assert if any aren't.
function script_units:get_unitcontroller(army) end

--- Returns true if any script_unit in this collection is visible to the enemy, by the rules of the terrain visibility system. Note that a unit can be considered visible by this system but still be hidden in forests.
function script_units:is_visible_to_enemy() end

--- Returns a duplicate script_units collection with the supplied name.
---@param name string name
function script_units:duplicate(name) end

--- Returns true if any script_unit in this collection is in melee combat (uses script_unit:is_in_melee).
function script_units:is_in_melee() end

--- Returns the eastern-most script_unit.
function script_units:get_easternmost() end

--- 
function script_units:set_always_visible() end

--- 
function script_units:goto_cached_destination() end

--- 
function script_units:rout_on_casualties() end

--- 
function script_units:play_sound_charge() end

--- Returns another scriptunits collection containing all script_unit objects from the subject collection that pass the supplied test. The test should be supplied as a function that takes a scriptunit parameter and returns a boolean value. Should a call to the function with a specific scriptunit return true, that scriptunit will be added to the returned collection.
---@param name string Name for the returned scriptunits collection
---@param test function Function that takes a scriptunit parameter and returns a boolean value.
---@param assert_if_empty boolean If set to true, filter triggers a script assert if the returned collection is empty.
---@param max_size number Maximum number of units to add to the returned scriptunit collection.
function script_units:filter(name, test, assert_if_empty, max_size) end

--- 
function script_units:deploy_reinforcement() end

--- 
function script_units:stop_attack_closest_enemy() end

--- 
function script_units:teleport_to_cached_location() end

--- 
function script_units:take_control() end
