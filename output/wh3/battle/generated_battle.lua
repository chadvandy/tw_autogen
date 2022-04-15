
---@class generated_army
local generated_army = {}

--- Instructs all units in a generated army to attack a specific enemy force.
---@param enemy_force script_units enemy force
function generated_army:attack_force(enemy_force) end

--- 
function generated_army:message_on_capture_location_capture_commenced() end

--- Returns the unary proportion (0 - 1) of the units in this generated army that are routing e.g. 0.2 = 20% routing.
---@param permit_rampaging boolean Permit rampaging, so that rampaging units are considered to be still controllable/not-routing. By default, rampaging units are considered to be routing.
function generated_army:get_rout_proportion(permit_rampaging) end

--- 
function generated_army:message_on_any_message_received() end

--- 
function generated_army:set_locatable_objective_callback_on_message() end

--- Routs the units in the generated army over the specified time period upon receipt of a supplied message. See script_units:rout_over_time.
---@param message string Message.
---@param period_in_ms number Period over which the units in the generated army should rout, in ms.
function generated_army:rout_over_time_on_message(message, period_in_ms) end

--- 
function generated_army:start_terrain_composite_scene_on_message() end

--- Triggers the supplied message if this generated army loses the battle.
---@param message string Message to trigger.
function generated_army:message_on_defeat(message) end

--- Sets the visibility on a generated_army, so that they are visible in an intro cutscene.
---@param visible boolean visible
function generated_army:set_visible_to_all(visible) end

--- Returns the battle_alliance object that contains the units in this generated army.
function generated_army:get_alliance() end

--- 
function generated_army:set_locatable_objective_on_message() end

--- 
function generated_army:message_on_time_offset() end

--- Releases script control of the units in the generated army to the player/general AI upon receipt of a supplied message.
---@param message string Message.
---@param wait_offset number Time to wait after receipt of the message before the units are released.
function generated_army:release_on_message(message, wait_offset) end

--- Fires the supplied message when the casualty rate of this generated army equals or exceeds the supplied threshold.
---@param message string Message to trigger.
---@param unary_threshold number Unary threshold (between 0 and 1).
function generated_army:message_on_casualties(message, unary_threshold) end

--- Triggers the supplied message when any of the units in this generated army come under attack.
---@param message string Message to trigger.
function generated_army:message_on_under_attack(message) end

--- 
function generated_army:stop_terrain_composite_scene_on_message() end

--- Returns the script_unit within the generated army positioned furthest to the west.
function generated_army:get_most_westerly_scriptunit() end

--- Triggers the supplied message when the commanding unit within this generated army is either dead or shattered. If no commanding unit is present, this function will throw a script error.
---@param message string Message to trigger.
function generated_army:message_on_commander_dead_or_shattered(message) end

--- Triggers the supplied message when the commanding unit within this generated army is either dead or routing. If no commanding unit exists in the generated army, this function will throw a script error.
---@param message string Message to trigger.
function generated_army:message_on_commander_dead_or_routing(message) end

--- Sets the enabled status of a generated army on receipt of a message.
---@param message string message
---@param enabled boolean enabled
function generated_army:set_enabled_on_message(message, enabled) end

--- 
function generated_army:set_custom_loading_screen_on_message() end

--- 
function generated_army:set_objective_with_leader_on_message() end

--- Gets a unitcontroller with control over all units in the generated army. This can be useful for the intro cutscene which needs this to restrict player control.
function generated_army:get_unitcontroller() end

--- Triggers the supplied message when the commander of the army corresponding to this generated army has died. Note that the commander of the army may not be in this generated army.
---@param message string Message to trigger.
function generated_army:message_on_commander_death(message) end

--- 
function generated_army:get_player_army() end

--- Triggers the supplied message when any of the units in the generated army have become visible to the enemy.
---@param message string Message to trigger.
function generated_army:message_on_seen_by_enemy(message) end

--- Triggers the supplied message, potentially repeatedly, when a certain number of units in the generated army have been deployed. The function takes one or more number arguments and will count through those numbers in order each time a unit from the army deploys onto the battlefield. The supplied message will be triggered each time a supplied number in the sequence is counted down to 0.<br />
--- For example, if the generated army contains 10 units, and the message example_message is specified along with numerical arguments 2, 1, 3, the function will trigger that message after the second unit has been deployed (the first supplied number 2 is counted down), the third unit has been deployed (the second supplied number 1 is counted down, after the first) and the sixth unit has been deployed (the third number 3, after the first and second).<br />
--- If the repeat_pattern flag is set then the supplied list of numbers is read repeatedly until all units in the generated army are accounted for. Setting this flag and supplying numerical arguments 1, 2 would be the same as not setting this flag and supplying arguments 1, 2, 1, 2, 1, 2, 1, 2 etc.<br />
--- If the last unit being deployed does not complete the sequence (e.g 2, 2, 2 for an army that only contains five units) then no final message will be issued.
---@param message string Message to trigger.
---@param read_repeatedly boolean Read back to the start of the supplied list of numbers if there are still units in the generated army that are unassigned.
---@param numbers vararg Sequence of numbers on which to trigger the message, when counting number of units deployed.
function generated_army:message_on_number_deployed(message, read_repeatedly, numbers) end

--- Instructs the units in the army to move relative to their current locations when the supplied message is received.
---@param message string message
---@param x_offset number x offset in m
---@param z_offset number z offset in m
---@param move_fast boolean move fast
function generated_army:goto_location_offset_on_message(message, x_offset, z_offset, move_fast) end

--- Triggers the supplied message when any of the units in the generated army have deployed.
---@param message string Message to trigger.
function generated_army:message_on_any_deployed(message) end

--- Adds an amount to the current winds of magic level for the generated army upon receipt of a supplied message.
---@param message string Trigger message.
---@param modification_value number Winds of Magic modification value.
function generated_army:add_winds_of_magic_on_message(message, modification_value) end

--- Triggers the supplied message when the units in the generated army are all fully deployed.
---@param message string Message to trigger.
function generated_army:message_on_deployed(message) end

--- Triggers the supplied message when the proportion of units that are shattered in this generated army exceeds the supplied unary threshold.
---@param message string Message to trigger.
---@param threshold number Unary threshold (0 - 1).
---@param permit_rampaging boolean Permit rampaging, so that rampaging units are considered to be still controllable/not-routing. By default, rampaging units are considered to be routing.
function generated_army:message_on_shattered_proportion(message, threshold, permit_rampaging) end

--- 
function generated_army:add_listener() end

--- Orders the units in the generated army to attack the enemy upon receipt of a supplied message.
---@param message string Message.
---@param wait_offset number Time to wait after receipt of the message before issuing the attack order.
function generated_army:attack_on_message(message, wait_offset) end

--- Orders the units in the generated army to rush the enemy upon receipt of a supplied message.
---@param message string Message.
---@param wait_offset number Time to wait after receipt of the message before issuing the rush order.
function generated_army:rush_on_message(message, wait_offset) end

--- Triggers the supplied message if this generated army wins the battle.
---@param message string Message to trigger.
function generated_army:message_on_victory(message) end

--- Prevents the units in the generated army from deploying as reinforcements when called, and instructs them to enter the battlefield in random chunks upon receipt of a supplied message. Supply min/max values for the number of units to be deployed at one time, and a min/max period between deployment chunks. Each chunk will be of a random size between the supplied min/max, and will deploy onto the battlefield at a random interval between the supplied min/max period after the previous chunk. This process will repeat until all units in the generated army are deployed, or until the cancel message is received. See script_units:deploy_at_random_intervals for more information.<br />
--- A cancel message may also be supplied, which will stop the reinforcement process either before or after the trigger message is received.
---@param message string Trigger message.
---@param min_units number Minimum number of units to deploy in chunk.
---@param max_units number Maximum number of units to deploy in chunk.
---@param min_period string Minimum duration between chunks.
---@param max_period string Maximum duration between chunks.
---@param cancel_message string Cancel message. If specified, this stops the deployment once received.
---@param spawn_immediately boolean Spawns the first wave immediately.
---@param allow_respawning boolean Allow units to respawn that have previously been deployed.
---@param wave_index number Set an integer value to notify the game that this is a new wave in a survival battle.
---@param is_final_wave boolean Set this to true to notify the game that this is the final wave in a survival battle. This value is disregarded if no wave index is specified.
---@param ongoing_output boolean Generate ongoing debug output as units are deployed.
function generated_army:deploy_at_random_intervals_on_message(message, min_units, max_units, min_period, max_period, cancel_message, spawn_immediately, allow_respawning, wave_index, is_final_wave, ongoing_output) end

--- Activates or deactivates melee mode on units within the generated army on receipt of a supplied message. An additional flag specifies whether script control of the units should be released afterwards - set this to true if the player is controlling this army.
---@param message string Message.
---@param activate boolean Should activate melee mode.
---@param release boolean Release script control afterwards.
function generated_army:set_melee_mode_on_message(message, activate, release) end

--- Continually refills the ammunition of all units in the generated army upon receipt of the supplied message.
---@param message string message
function generated_army:grant_infinite_ammo_on_message(message) end

--- Triggers the supplied message if none of the units in the alliance to which this generated army belongs are a) deployed and b) not routing, shattered or dead
---@param message string Message to trigger.
function generated_army:message_on_alliance_not_active_on_battlefield(message) end

--- Immediately kills and removes the units in the generated army upon receipt of the supplied message.
---@param message string Trigger message.
function generated_army:remove_on_message(message) end

--- Returns the battle_army object that contains the units in this generated army. If the units are reinforcing then they may instead belong to a dummy army before they enter the battlefield - use generated_army:get_reinforcement_source_army instead to access that army object.
function generated_army:get_army() end

--- Orders the units in the generated army to advance on the enemy upon receipt of a supplied message.
---@param message string Message.
---@param wait_offset number Time to wait in ms after receipt of the message before issuing the advance order.
function generated_army:advance_on_message(message, wait_offset) end

--- Sets whether a generated_army is enabled - when disabled, they will be invisible and effectively not exist. See script_unit:set_enabled.
---@param enabled boolean enabled
function generated_army:set_enabled(enabled) end

--- 
function generated_army:has_battle_started() end

--- Instructs all units in a generated army to rush the enemy, ie move fast, attack without forming up
function generated_army:rush() end

--- 
function generated_army:message_on_capture_location_capture_completed() end

--- Removes a ping marker from a specified unit within the generated army upon receipt of a supplied message.
---@param message string Trigger message
---@param unit_index number The unit to remove the ping marker from is specified by their index value within the generated army, so 1 would be the first unit (usually the general).
function generated_army:remove_ping_icon_on_message(message, unit_index) end

--- Instructs this generated army to enable or disable a battle_map_barrier when the specified message is received. The map barrier is specified by toggle slot script id. If no toggle slot with the supplied script id is found on the map, or the toggle slot found is not linked to a map barrier, then a script error is produced.
---@param message string Change state of map barrier on receipt of this message.
---@param script_id string Script id specifiying the togggle slot the map barrier is linked to.
---@param enable boolean Enable the map barrier. Specify false here to disable the barrier instead.
function generated_army:enable_map_barrier_on_message(message, script_id, enable) end

--- 
function generated_army:start_terrain_effect_on_message() end

--- 
function generated_army:set_victory_countdown_on_message() end

--- 
function generated_army:play_sound_on_message() end

--- On receipt of the supplied message, sets the army's visibility status to the supplied true or false value. True = the army will not be hidden by terrain LOS, false = the army can be (i.e. normal behaviour). Note that the target units will still be able to hide in forests or long grass. Also note that they may perform a fade in from the point this function is called, so may not be fully visible until several seconds later.<br />
--- If the release_control flag is set to true, control of the sunits is released after the operation is performed. Do this if the army belongs to the player, otherwise they won't be able to control them.
---@param message string message
---@param always_visible boolean always visible
---@param release_control boolean release control
function generated_army:set_always_visible_on_message(message, always_visible, release_control) end

--- Adds a ping marker to a specified unit within the generated army upon receipt of a supplied message.
---@param message string Trigger message
---@param icon_type number Icon type. This is a numeric index defined in code.
---@param unit_index number The unit to apply the ping marker to is specified by their index value within the generated army, so 1 would be the first unit (usually the general).
---@param duration number Duration to display the ping icon for, in ms
function generated_army:add_ping_icon_on_message(message, icon_type, unit_index, duration) end

--- 
function generated_army:advice_on_message() end

--- Adds an amount to the winds of magic reserve for the generated army upon receipt of a supplied message.
---@param message string Trigger message.
---@param modification_value number Winds of Magic modification value.
function generated_army:add_winds_of_magic_reserve_on_message(message, modification_value) end

--- Orders the generated_army to trigger the charge sound.
function generated_army:play_sound_charge() end

--- Halts the generated_army.
function generated_army:halt() end

--- Sets the formation of the units in the generated army to the supplied formation on receipt of a message. For valid formation strings, see documentation for script_units:change_formation.
---@param message string Message.
---@param formation string Formation name.
---@param release boolean set to true to release script control after issuing the command. Set this if the command is happening to the player's army.
function generated_army:set_formation_on_message(message, formation, release) end

--- Plays a battle_sound_effect associated with the army general on receipt of the supplied message. The sound will appear to come from the general unit in 3D (unless overridden in sound data), and the unit's standard VO will be suppressed while the sound is playing.
---@param message string Play the sound on receipt of this message.
---@param sound battle_sound_effect Sound file to play.
---@param wait_interval number Delay between receipt of the message and the supplied sound starting to play, in ms.
---@param end_message string Message to send when the sound has finished playing.
---@param minimum_duration number Minimum duration of the sound in ms. This is only used if an end message is supplied, and is handy during development for when the sound has not yet been recorded.
function generated_army:play_general_vo_on_message(message, sound, wait_interval, end_message, minimum_duration) end

--- Returns the temporary battle_army object that contains reinforcing units in this generated army, before they enter the battlefield. As they enter the battlefield they will be transferred to the proper army object which may be accessed with generated_army:get_army.<br />
--- If the units in this generated army are not reinforcing then there will be no source army and this function will return false.
function generated_army:get_reinforcement_source_army() end

--- Adds the scriptunits in this generated army to a survival battle wave on receipt of the supplied message. This will call battle_manager:add_survival_battle_wave and start a process which monitors these units and updates the UI as if they were a survival battle wave. Calling this has no effect on the actual behaviour of the units.<br />
--- The survival battle wave is specified by numeric index. Additional waves can be introduced by ascending index.
---@param message string message
---@param wave_index number wave index
---@param final_wave boolean final wave
function generated_army:add_to_survival_battle_wave_on_message(message, wave_index, final_wave) end

--- Assigns this army to a specific battle_spawn_zone on receipt of the supplied message. This will make units that deploy onto the battlefield from this army come on from the position of the spawn zone that is chosen.<br />
--- It is valid to call this function while the army is partially deployed. In this case, units that subsequently deploy will enter the battlefield from the position of the new spawn zone. This functiom may be used in conjuction with other functions such as generated_army:message_on_number_deployed, which broadcasts script messages when a certain number of units have deployed from the army. This function switches spawn zones in response to these messages, so that the enemy force appears from multiple directions. To facilitate this behaviour, this function persists in listening for its message after the message is first received, which is uncommon behaviour amongst generated battle message listeners.<br />
--- Note that this function breaks the generated battle system paradigm that generated army objects can represent a subset of a logical army. Units are assigned to spawn zones on a per-logical-army basis, so if this generated army shares a logical army with another generated army, then changing the spawn zone on this generated army will also change the spawn zone for the other. To increase visibility of this issue the function will throw a script error if called on a generated army that does not control all units for its associated logical army, unless the suppress warning flag is enabled.
---@param message string message
---@param spawn_zone battle_spawn_zone spawn zone
---@param suppress_warning boolean suppress warning
function generated_army:assign_to_spawn_zone_on_message(message, spawn_zone, suppress_warning) end

--- Assigns this army to a random spawn zone from the supplied collection on receipt of the supplied message. This will make units that deploy onto the battlefield from this army come on from the position of the spawn zone that is chosen. The spawn zone collection is a bespoke table data type - see the functions listed in the Spawn Zone Collections section of this documentation for more information.<br />
--- It is valid to call this function while the army is partially deployed. In this case, units that subsequently deploy will enter the battlefield from the position of the new spawn zone. This functiom may be used in conjuction with other functions such as generated_army:message_on_number_deployed, which broadcasts script messages when a certain number of units have deployed from the army. This function switches spawn zones in response to these messages, so that the enemy force appears from multiple directions. To facilitate this behaviour, this function persists in listening for its message after the message is first received, which is uncommon behaviour amongst generated battle message listeners.<br />
--- Note that this function breaks the generated battle system paradigm that generated army objects can represent a subset of a logical army. Units are assigned to spawn zones on a per-logical-army basis, so if this generated army shares a logical army with another generated army, then changing the spawn zone on this generated army will also change the spawn zone for the other. To increase visibility of this issue the function will throw a script error if called on a generated army that does not control all units for its associated logical army, unless the suppress warning flag is enabled.
---@param message string message
---@param spawn_zone_collection table spawn zone collection
---@param suppress_warning boolean suppress warning
function generated_army:assign_to_spawn_zone_from_collection_on_message(message, spawn_zone_collection, suppress_warning) end

--- Orders the generated_army to trigger the taunt sound.
function generated_army:play_sound_taunt() end

--- Triggers the supplied message when this generated army finds itself with the supplied distance of any allied generated armies.
---@param message string Message to trigger.
---@param threshold_distance number Threshold distance in m.
function generated_army:message_on_proximity_to_ally(message, threshold_distance) end

--- Returns the unary proportion (0 - 1) of the units in this generated army that are shattered e.g. 0.2 = 20% routing.
---@param permit_rampaging boolean Permit rampaging, so that rampaging units are considered to be still controllable/not-routing. By default, rampaging units are considered to be routing.
function generated_army:get_shattered_proportion(permit_rampaging) end

--- 
function generated_army:set_cutscene_during_deployment() end

--- 
function generated_army:queue_help_on_message() end

--- 
function generated_army:remove_listener() end

--- Gets the script_name of the generated army.
function generated_army:get_script_name() end

--- Refreshes the ammunition and fatigue of units in the generated army upon receipt of a supplied message.
---@param message string message
function generated_army:refresh_on_message(message) end

--- Instructs all units in a generated army to advance upon the enemy.
function generated_army:advance() end

--- 
function generated_army:message_on_all_messages_received() end

--- Sets the units in the generated army to be invincible and fearless upon receipt of a supplied message. If the enable flag is set to false then the effect is undone, removing invincibility and setting morale behaviour to default.
---@param message string message
---@param enable_effect boolean enable effect
function generated_army:set_invincible_on_message(message, enable_effect) end

--- Instructs all the units in a generated army to move to the position/angle/width at which they started the battle.
---@param move_fast boolean move fast
function generated_army:goto_start_location(move_fast) end

--- Activates or deactivates a supplied behaviour on units within the generated army on receipt of a supplied message. An additional flag specifies whether script control of the units should be released afterwards - set this to true if the player is controlling this army.
---@param message string Message.
---@param behaviour string Behaviour to activate or deactivate. See documentation on script_unit:change_behaviour_active for a list of valid values.
---@param activate boolean Should activate behaviour.
---@param release boolean Release script control afterwards.
function generated_army:change_behaviour_active_on_message(message, behaviour, activate, release) end

--- Orders the units in the generated army to attack a specified enemy force upon receipt of a supplied message.
---@param message string Message.
---@param target generated_army Target force.
---@param wait_offset number Time to wait after receipt of the message before issuing the attack order.
function generated_army:attack_force_on_message(message, target, wait_offset) end

--- Triggers the supplied message when this generated army finds itself with the supplied distance of its enemy.
---@param message string Message to trigger.
---@param threshold_distance number Threshold distance in m.
function generated_army:message_on_proximity_to_enemy(message, threshold_distance) end

--- Withdraw the units in the generated army upon receipt of a supplied message.
---@param message string Message.
function generated_army:withdraw_on_message(message) end

--- Prevents the units in the generated army from rallying if they ever rout upon receipt of a supplied message. See script_unit:prevent_rallying_if_routing.
---@param message string Message.
function generated_army:prevent_rallying_if_routing_on_message(message) end

--- Removes a ping icon from a unit within the generated army.
---@param unit_index number Index of unit within the army to remove the ping icon from.
function generated_army:remove_ping_icon(unit_index) end

--- Prevents the units in the generated army from entering the battlefield as reinforcements until the specified message is received, at which point they are deployed.
---@param message string Message.
---@param wait_offset number Time to wait after receipt of the message before issuing the reinforce order.
---@param wave_index number Set an integer value to notify the game that this is a new wave in a survival battle.
---@param is_final_wave boolean Set this to true to notify the game that this is the final wave in a survival battle. This value is disregarded if no wave index is specified.
function generated_army:reinforce_on_message(message, wait_offset, wave_index, is_final_wave) end

--- Orders the generated_army to celebrate.
function generated_army:celebrate() end

--- Returns the script_unit within the generated army positioned furthest to the north.
function generated_army:get_most_northerly_scriptunit() end

--- Instructs all units in a generated army to attack the enemy.
function generated_army:attack() end

--- Triggers the supplied message when the proportion of units routing or dead in this generated army exceeds the supplied unary threshold.
---@param message string Message to trigger.
---@param threshold number Unary threshold (0 - 1).
---@param permit_rampaging boolean Permit rampaging, so that rampaging units are considered to be still controllable/not-routing. By default, rampaging units are considered to be routing.
function generated_army:message_on_rout_proportion(message, threshold, permit_rampaging) end

--- 
function generated_army:fail_objective_on_message() end

--- Forces the enemies of the generated army to rout over time upon receipt of the supplied message. After the enemies have all routed, this generated army will win the battle.
---@param message string Trigger message.
---@param duration number Duration over which to rout the enemy in ms.
function generated_army:force_victory_on_message(message, duration) end

--- Instructs all units in a generated army to move to a position under control of a script_ai_planner on receipt of a message. See generated_army:move_to_position.
---@param message string message
---@param position battle_vector position
function generated_army:move_to_position_on_message(message, position) end

--- 
function generated_army:stop_sound_on_message() end

--- 
function generated_army:remove_objective_on_message() end

--- 
function generated_army:block_message_on_message() end

--- Instructs the generated army to release control of all its units to the player/general ai.
function generated_army:release() end

--- Returns the battle difficulty. See the documentation for army:army_handicap for possible return values.
function generated_army:get_handicap() end

--- Instructs all units in a generated army to defend a position.
---@param radius number x co-ordinate in m
function generated_army:defend(radius) end

--- 
function generated_army:stop_terrain_effect_on_message() end

--- Instructs all units in a generated army to move to a position under control of a script_ai_planner. See script_ai_planner:move_to_position.
---@param position battle_vector position
function generated_army:move_to_position(position) end

--- 
function generated_army:get_non_player_alliance_num() end

--- Instructs all units in a generated army to go to a location offset from their current position. Supply a numeric x/z offset and a boolean argument specifying whether they should run.
---@param x_offset number x offset in m
---@param x_offset number z offset in m
---@param move_fast boolean move fast
function generated_army:goto_location_offset(x_offset, x_offset, move_fast) end

--- 
function generated_army:fade_in_on_message() end

--- 
function generated_army:new() end

--- Returns the script_unit within the generated army positioned furthest to the south.
function generated_army:get_most_southerly_scriptunit() end

--- Returns the first scriptunit of the generated army.
function generated_army:get_first_scriptunit() end

--- 
function generated_army:stop_end_battle() end

--- 
function generated_army:get_player_alliance_num() end

--- Teleports the generated army to a position offset from its start location. Supply no offset to teleport it directly to its start location.
---@param x_offset number x offset
---@param z_offset number z offset
function generated_army:teleport_to_start_location_offset(x_offset, z_offset) end

--- Triggers the supplied message when this generated army finds itself with the supplied distance of the supplied position.
---@param message string Message to trigger.
---@param position battle_vector Test position.
---@param threshold_distance number Threshold distance in m.
function generated_army:message_on_proximity_to_position(message, position, threshold_distance) end

--- Returns the amount of casualties this generated army has taken as a unary value e.g. 0.2 = 20% casualties.
function generated_army:get_casualty_rate() end

--- Orders the generated_army to taunt.
function generated_army:taunt() end

--- Returns true if any of the supplied unit types are present in the army, false otherwise.
function generated_army:are_unit_types_in_army() end

--- Instructs the units in the army to move to the locations they started the battle at when the supplied message is received.
---@param message string message
---@param move_fast boolean move fast
function generated_army:goto_start_location_on_message(message, move_fast) end

--- Teleports the units in the army to their start position with the supplied offset when the supplied message is received.
---@param message string message
---@param x_offset number x offset in m
---@param y_offset_y_offset_in_m number y offset y offset in m
function generated_army:teleport_to_start_location_offset_on_message(message, x_offset, y_offset_y_offset_in_m) end

--- Adds a ping icon to a unit within the generated army. See script_unit:add_ping_icon.
---@param icon_type number Icon type. This is a numeric index defined in code.
---@param unit_index number Index of unit within the army to add the ping icon to.
---@param duration number Duration to show the ping icon, in ms. Leave blank to show the icon indefinitely.
function generated_army:add_ping_icon(icon_type, unit_index, duration) end

--- 
function generated_army:set_objective_on_message() end

--- Orders the units in the generated army to defend a specified position upon receipt of a supplied message.
---@param message string Message.
---@param radius number x co-ordinate in m.
---@param wait_offset number y co-ordinate in m.
function generated_army:defend_on_message(message, radius, wait_offset) end

--- 
function generated_army:complete_objective_on_message() end

--- Returns the script_unit within the generated army positioned furthest to the east.
function generated_army:get_most_easterly_scriptunit() end
