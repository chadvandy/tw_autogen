
---@class generated_battle
local generated_battle = {}

--- Creates a generated_battle. There should be only one of these per-battle script.
---@param screen_starts_black boolean The screen starts black. This should match the prepare_for_fade_in flag in the battle setup, which always seems to be true for quest battles. Furthermore, this flag is only considered if no intro cutscene callback is specified.
---@param prevent_player_deployment boolean Prevents player control during deployment.
---@param prevent_ai_deployment boolean Prevents deployment for the ai.
---@param intro_cutscene function Intro cutscene callback. This is called when deployment phase ends, unless generated_battle:set_cutscene_during_deployment is set.
---@param debug_mode boolean Turns on debug mode, for more output.
function generated_battle:new(screen_starts_black, prevent_player_deployment, prevent_ai_deployment, intro_cutscene, debug_mode) end

--- Sets the supplied intro cutscene callback specified in generated_battle:new to play at the start of deployment, rather than at the end.
---@param play_in_deployment boolean play in deployment
function generated_battle:set_cutscene_during_deployment(play_in_deployment) end

--- Stops battle_manager:end_battle() from being called at the end of the battle. Use this if you want to stop the battle from leaving the VictoryCoundown phase.
---@param stop_battle_end boolean stop battle end
function generated_battle:stop_end_battle(stop_battle_end) end

--- Returns true if the combat phase of the battle has started, false otherwise.
function generated_battle:has_battle_started() end

--- Returns the index of the alliance the player is a part of.
function generated_battle:get_player_alliance_num() end

--- Returns the index of the enemy alliance to the player.
function generated_battle:get_non_player_alliance_num() end

--- Returns the player-controlled generated_army with the supplied script name.
---@param script_name string script name
function generated_battle:get_player_army(script_name) end

--- Returns a generated_army corresponding to the supplied arguments. Use in one of two modes:<br />
--- &emsp;- Supply an alliance number, an army number, and (optionally) a script name. This is the original way armies were specified in quest battle scripts. Returns a generated_army corresponding to the supplied alliance/army numbers, containing all units where the name matches the supplied script name (or all of them if one was not supplied). WARNING: at time of writing the ordering of armies in an alliance beyond the first cannot be guaranteed if loading from campaign, so specifying an army index in this case may not be a good idea.<br />
--- &emsp;- Supply an alliance number and a script name. This supports the randomised ordering of armies in an alliance that we see from campaign.
---@param alliance_index number alliance index
---@param script_name string script name
function generated_battle:get_army(alliance_index, script_name) end

--- Allows the generated_battle object to listen for a message and trigger an arbitrary callback. The call gets passed to the underlying script_messager - see script_messager:add_listener.
---@param message_name string message name
---@param callback_to_call function callback to call
---@param persistent boolean persistent
function generated_battle:add_listener(message_name, callback_to_call, persistent) end

--- Removes any listener listening for a particular message. This call gets passed through to script_messager:remove_listener_by_message.
---@param message_name string message name
function generated_battle:remove_listener(message_name) end

--- Takes a string message, a string advice key, and an optional time offset in ms. Instruct the generated_battle to play a piece of advice on receipt of a message, with the optional time offset so that it doesn't happen robotically at the same moment as the message.
---@param message string message
---@param advice_key string advice key
---@param wait_offset_in_ms number wait offset in ms
function generated_battle:advice_on_message(message, advice_key, wait_offset_in_ms) end

--- Instruct the generated_battle to play a sound on receipt of a message.
---@param message string Play the sound on receipt of this message.
---@param sound battle_sound_effect Sound file to play.
---@param position battle_vector Position at which to play the sound. Supply nil to play the sound at the camera.
---@param wait_offset number Delay between receipt of the message and the supplied sound starting to play, in ms.
---@param end_message string Message to send when the sound has finished playing.
---@param minimum_duration number Minimum duration of the sound in ms. This is only used if an end message is supplied, and is handy during development for when the sound has not been recorded.
function generated_battle:play_sound_on_message(message, sound, position, wait_offset, end_message, minimum_duration) end

--- Instructs the generated_battle to stop a sound on receipt of a message.
---@param message string Stop the sound on receipt of this message.
---@param sound battle_sound_effect Sound file to stop.
---@param wait_offset number Delay between receipt of the message and the supplied sound being stopped, in ms.
function generated_battle:stop_sound_on_message(message, sound, wait_offset) end

--- Instructs the generated_battle to start a terrain composite scene on receipt of a message. Terrain composite scenes are general-purpose scene containers, capable of playing animations, sounds, vfx and more.
---@param message string Play the composite scene on receipt of this message.
---@param scene_key string Composite scene key.
---@param wait_offset number Delay between receipt of the message and the scene being started, in ms.
---@param group_name string Composite scene group name. If supplied, this prevents this composite scene being played at the same time as any other in the same group. See documentation for the underlying battle_manager:start_terrain_composite_scene function for more information.
---@param delay_if_queued number Delay before playing in ms if queued. This only applies if a group name is set. See battle_manager:start_terrain_composite_scene for more information.
function generated_battle:start_terrain_composite_scene_on_message(message, scene_key, wait_offset, group_name, delay_if_queued) end

--- Instructs the generated_battle to stop a terrain composite scene on receipt of a message.
---@param message string Stop the composite scene on receipt of this message.
---@param scene_key string Composite scene key.
---@param wait_offset number Delay between receipt of the message and the scene being stopped, in ms.
function generated_battle:stop_terrain_composite_scene_on_message(message, scene_key, wait_offset) end

--- Instructs the generated_battle to add a scripted obective to the objectives panel, or update an existing scripted objective, on receipt of a message. The scripted objective is automatically completed or failed when the battle ends, based on the winner of the battle.
---@param message string Add/update the objective on receipt of this message.
---@param objective_key string Objective key to add or update.
---@param wait_offset number Delay between receipt of the message and the objective being added/updated, in ms.
---@param objective_param_a number First numeric objective parameter, if required. See documentation for objectives_manager:set_objective.
---@param objective_param_b number Second numeric objective parameter, if required. See documentation for objectives_manager:set_objective.
function generated_battle:set_objective_on_message(message, objective_key, wait_offset, objective_param_a, objective_param_b) end

--- Instructs the generated_battle to add a scripted obective to the objectives panel with a topic_leader, or to update an existing scripted objective, on receipt of a message. The scripted objective is automatically completed or failed when the battle ends, based on the winner of the battle.
---@param message string Add/update the objective on receipt of this message.
---@param objective_key string Objective key to add or update.
---@param wait_offset number Delay between receipt of the message and the objective being added/updated, in ms.
---@param objective_param_a number First numeric objective parameter, if required. See documentation for objectives_manager:set_objective.
---@param objective_param_b number Second numeric objective parameter, if required. See documentation for objectives_manager:set_objective.
function generated_battle:set_objective_with_leader_on_message(message, objective_key, wait_offset, objective_param_a, objective_param_b) end

--- Instructs the generated_battle to mark a specified objective as complete, on receipt of a message. Note that objectives issued to the player are automatically completed if they win the battle.
---@param message string Complete the objective on receipt of this message.
---@param objective_key string Objective key to complete.
---@param wait_offset number Delay between receipt of the message and the objective being completed, in ms.
function generated_battle:complete_objective_on_message(message, objective_key, wait_offset) end

--- Instructs the generated_battle to mark a specified objective as failed, on receipt of a message. Note that objectives issued to the player are automatically failed if they lose the battle.
---@param message string Fail the objective on receipt of this message.
---@param objective_key string Objective key to fail.
---@param wait_offset number Delay between receipt of the message and the objective being failed, in ms.
function generated_battle:fail_objective_on_message(message, objective_key, wait_offset) end

--- Instructs the generated_battle to remove a specified objective from the UI on receipt of a message.
---@param message string Remove the objective on receipt of this message.
---@param objective_key string Objective key to remove.
---@param wait_offset number Delay between receipt of the message and the objective being removed, in ms.
function generated_battle:remove_objective_on_message(message, objective_key, wait_offset) end

--- Instructs the generated_battle to set a locatable objective on receipt of a message. See battle_manager:set_locatable_objective for more details.
---@param message string Add/update the locatable objective on receipt of this message.
---@param objective_key string Objective key to add or update.
---@param wait_offset number Delay between receipt of the message and the objective being added/updated, in ms.
---@param camera_position battle_vector Camera position to zoom camera to when objective button is clicked.
---@param camera_target battle_vector Camera target to zoom camera to when objective button is clicked.
---@param camera_move_time number Time the camera takes to pan to the objective when the objective button is clicked, in seconds.
function generated_battle:set_locatable_objective_on_message(message, objective_key, wait_offset, camera_position, camera_target, camera_move_time) end

--- Instructs the generated_battle to set a locatable objective using a callback on receipt of a message. The callback function should return two battle_vector objects that specify the camera position and target to zoom to - see battle_manager:set_locatable_objective_callback for more details.
---@param message string Add/update the locatable objective on receipt of this message.
---@param objective_key string Objective key to add or update.
---@param wait_offset number Delay between receipt of the message and the objective being added/updated, in ms.
---@param camera_position_generator function Camera position generator function. When called, this should return two battle_vector values that specify the camera position and target to move to.
---@param camera_move_time number Time the camera takes to pan to the objective when the objective button is clicked, in seconds.
function generated_battle:set_locatable_objective_callback_on_message(message, objective_key, wait_offset, camera_position_generator, camera_move_time) end

--- Instructs the generated_battle to add a battlefield ping icon on receipt of a message. This is a marker that appears in 3D space and can be used to point out the location of objectives to the player.
---@param message string Add the ping icon on receipt of this message.
---@param marker_position battle_vector Marker position.
---@param marker_type number Marker type. These have to be looked up from code.
---@param wait_offset number Delay between receipt of the message and the marker being added, in ms.
---@param duration number Duration that the marker should stay visible for, in ms. If not set then the marker stays on-screen until it is removed with generated_battle:remove_ping_icon_on_message.
function generated_battle:add_ping_icon_on_message(message, marker_position, marker_type, wait_offset, duration) end

--- Instructs the generated_battle to remove a battlefield ping icon on receipt of a message. The marker is specified by its position.
---@param message string Remove the ping icon on receipt of this message.
---@param marker_position battle_vector Marker position.
---@param wait_offset number Delay between receipt of the message and the marker being removed, in ms.
function generated_battle:remove_ping_icon_on_message(message, marker_position, wait_offset) end

--- Takes a string message, and a fade duration in seconds. Fades the scene from black to picture over the supplied duration when the supplied message is received.
---@param message string message
---@param duration number duration
function generated_battle:fade_in_on_message(message, duration) end

--- Takes a string message and a string custom loading screen key. Sets that loading screen key to be used as the loading screen on receipt of the string message. This is used to set a custom outro loading screen.
---@param message string message
---@param duration number duration
function generated_battle:set_custom_loading_screen_on_message(message, duration) end

--- Instructs the generated_battle to start a terrain effect on receipt of a message.
---@param message string Start the terrain effect on receipt of this message.
---@param effect_name string Effect name to start.
---@param wait_offset number Delay between receipt of the message and the effect being started, in ms.
function generated_battle:start_terrain_effect_on_message(message, effect_name, wait_offset) end

--- Instructs the generated_battle to stop a terrain effect on receipt of a message.
---@param message string Stop the terrain effect on receipt of this message.
---@param effect_name string Effect name to stop.
---@param wait_offset number Delay between receipt of the message and the effect being stopped, in ms.
function generated_battle:stop_terrain_effect_on_message(message, effect_name, wait_offset) end

--- Enqueues a help message for display on-screen on receipt of a message. The message appears above the army panel with a black background. See Help Message Queue for more information. Note that if the battle is ending, this message will not display.
---@param message string Enqueue the help message for display on receipt of this message.
---@param objective_key string Message key, from the scripted_objectives table.
---@param display_time number Time for which the help message should be displayed on-screen, in ms.
---@param display_time number Time for which the help message should be displayed on-screen, in ms.
---@param wait_offset number Delay between receipt of the message and the help message being enqueued, in ms.
---@param high_priority boolean High priority advice gets added to the front of the help queue rather than the back.
---@param message_on_trigger string Specifies a message to be sent when this help message is actually triggered for display.
function generated_battle:queue_help_on_message(message, objective_key, display_time, display_time, wait_offset, high_priority, message_on_trigger) end

--- Sets the victory countdown time for the battle to the specified value when the specified message is received. The victory countdown time is the grace period after the battle is deemed to have a victor, and before the battle formally ends, in which celebratory/commiseratory advice often plays. Set this to a negative number for the battle to never end after entering victory countdown phase, or 0 for it to end immediately. <br />
--- Note that it's possible to set a negative victory countdown period, then enter the phase, then set a victory countdown period of zero to end the battle immediately.
---@param message string Set victory countdown on receipt of this message.
---@param countdown_time number Victory countdown time in ms.
function generated_battle:set_victory_countdown_on_message(message, countdown_time) end

--- Blocks or unblocks a message from being triggered, on receipt of a message. Scripts listening for a blocked message will not be notified when that message is triggered. See script_messager:block_message for more information.
---@param message string Perform the blocking or unblocking on receipt of this message.
---@param message_to_block string Message to block or unblock.
---@param should_block boolean Should block the message. Set this to false to unblock a previously-blocked message.
function generated_battle:block_message_on_message(message, message_to_block, should_block) end

--- Takes a subject message, and then one or more other messages. When all of these other messages are received, the subject message is sent.
---@param message string Subject message to send.
---@vararg any
function generated_battle:message_on_all_messages_received(message, messages) end

--- Takes a subject message, and then one or more other messages. When any of these other messages are received, the subject message is sent.
---@param message string Subject message to send.
---@vararg any
function generated_battle:message_on_any_message_received(message, messages) end

--- Takes a string message and a wait time in ms. Waits for the specified interval and then triggers the message. If an optional start message is supplied as a third parameter then the timer will start when this message is received, otherwise it starts when the battle is started.<br />
--- A cancellation message may be supplied as a fourth parameter - this will cancel the timer if the message is received (whether the timer has been started or not).
---@param message string Message to send.
---@param wait_time number Wait time in ms before sending the message.
---@param start_message string Start message which begins the wait time countdown. If a value of true is supplied then the countdown starts as soon as this function is called.
---@param cancel_message string Cancellation message.
function generated_battle:message_on_time_offset(message, wait_time, start_message, cancel_message) end

--- Generates the supplied script message when the capture of a battle_capture_location begins. A number of filters may optionally be specified, for the holding alliance, the contesting alliance, and the script id and the type of the capture location. When a script event indicating the capture of a capture location has begun the supplied filters are checked and, should they all match, the supplied message is generated. Filters that are omitted are not checked.<br />
--- The script id and type filters perform a string compare, so a supplied script id filter "section_1" would pass for capture locations with ids "section_1", "section_1a", "end_section_1" but would not match "section_2", for example. Similarly a supplied type filter of "minor_key_building" would match "minor_key_building_defence" but not "major_key_building". Capture location types may be looked up in the capture_location_types database table.<br />
--- A start message may optionally be specified. If this is left blank then the listener will start when deployment ends. If the boolean value true is supplied as a start message the listener will start immediately, but this is highly situational.
---@param message string Message to send.
---@param start_message string Start message which begins the listening process. If a value of true is supplied then the process starts as soon as this function is called.
---@param script_id_filter string Capture location script id filter. If supplied, a string match of this filter is performed against the capture location script id as described above.
---@param type_filter string Capture location type filter. If supplied, a string match of this filter is performed against the capture location type as described above.
---@param holding_alliance_filter number Holding alliance filter. This may be an alliance index (1 or 2), a generated_army (the alliance of the army is used), or nil may be supplied to bypass this filter.
---@param contesting_alliance_filter number Contesting alliance filter. This may be an alliance index (1 or 2), a generated_army (the alliance of the army is used), or nil may be supplied to bypass this filter.
function generated_battle:message_on_capture_location_capture_commenced(message, start_message, script_id_filter, type_filter, holding_alliance_filter, contesting_alliance_filter) end

--- Generates the supplied script message when the capture of a battle_capture_location completes. A number of filters may optionally be specified, for the (previous) holding alliance, the contesting alliance, and the script id and the type of the capture location. When a script event indicating the capture of a capture location has completed the supplied filters are checked and, should they all match, the supplied message is generated. Filters that are omitted are not checked.<br />
--- The script id and type filters perform a string compare, so a supplied script id filter "section_1" would pass for capture locations with ids "section_1", "section_1a", "end_section_1" but would not match "section_2", for example. Similarly a supplied type filter of "minor_key_building" would match "minor_key_building_defence" but not "major_key_building". Capture location types may be looked up in the capture_location_types database table.<br />
--- A start message may optionally be specified. If this is left blank then the listener will start when deployment ends. If the boolean value true is supplied as a start message the listener will start immediately, but this is highly situational.
---@param message string Message to send.
---@param start_message string Start message which begins the listening process. If a value of true is supplied then the process starts as soon as this function is called.
---@param script_id_filter string Capture location script id filter. If supplied, a string match of this filter is performed against the capture location script id as described above.
---@param type_filter string Capture location type filter. If supplied, a string match of this filter is performed against the capture location type as described above.
---@param holding_alliance_filter number Holding alliance filter. This may be an alliance index (1 or 2), a generated_army (the alliance of the army is used), or nil may be supplied to bypass this filter.
---@param contesting_alliance_filter number Contesting alliance filter. This may be an alliance index (1 or 2), a generated_army (the alliance of the army is used), or nil may be supplied to bypass this filter.
function generated_battle:message_on_capture_location_capture_completed(message, start_message, script_id_filter, type_filter, holding_alliance_filter, contesting_alliance_filter) end

---@class generated_army
local generated_army = {}

--- Gets the script_name of the generated army.
function generated_army:get_script_name() end

--- Gets a unitcontroller with control over all units in the generated army. This can be useful for the intro cutscene which needs this to restrict player control.
function generated_army:get_unitcontroller() end

--- Returns the battle_alliance object that contains the units in this generated army.
function generated_army:get_alliance() end

--- Returns the battle_army object that contains the units in this generated army. If the units are reinforcing then they may instead belong to a dummy army before they enter the battlefield - use generated_army:get_reinforcement_source_army instead to access that army object.
function generated_army:get_army() end

--- Returns the temporary battle_army object that contains reinforcing units in this generated army, before they enter the battlefield. As they enter the battlefield they will be transferred to the proper army object which may be accessed with generated_army:get_army.<br />
--- If the units in this generated army are not reinforcing then there will be no source army and this function will return false.
function generated_army:get_reinforcement_source_army() end

--- Returns the battle difficulty. See the documentation for army:army_handicap for possible return values.
function generated_army:get_handicap() end

--- Returns the first scriptunit of the generated army.
function generated_army:get_first_scriptunit() end

--- Returns the script_unit within the generated army positioned furthest to the west.
function generated_army:get_most_westerly_scriptunit() end

--- Returns the script_unit within the generated army positioned furthest to the east.
function generated_army:get_most_easterly_scriptunit() end

--- Returns the script_unit within the generated army positioned furthest to the north.
function generated_army:get_most_northerly_scriptunit() end

--- Returns the script_unit within the generated army positioned furthest to the south.
function generated_army:get_most_southerly_scriptunit() end

--- Returns the amount of casualties this generated army has taken as a unary value e.g. 0.2 = 20% casualties.
function generated_army:get_casualty_rate() end

--- Returns the unary proportion (0 - 1) of the units in this generated army that are routing e.g. 0.2 = 20% routing.
---@param permit_rampaging boolean Permit rampaging, so that rampaging units are considered to be still controllable/not-routing. By default, rampaging units are considered to be routing.
function generated_army:get_rout_proportion(permit_rampaging) end

--- Returns the unary proportion (0 - 1) of the units in this generated army that are shattered e.g. 0.2 = 20% routing.
---@param permit_rampaging boolean Permit rampaging, so that rampaging units are considered to be still controllable/not-routing. By default, rampaging units are considered to be routing.
function generated_army:get_shattered_proportion(permit_rampaging) end

--- Returns true if any of the supplied unit types are present in the army, false otherwise.
function generated_army:are_unit_types_in_army() end

--- Sets the visibility on a generated_army, so that they are visible in an intro cutscene.
---@param visible boolean visible
function generated_army:set_visible_to_all(visible) end

--- Sets whether a generated_army is enabled - when disabled, they will be invisible and effectively not exist. See script_unit:set_enabled.
---@param enabled boolean enabled
function generated_army:set_enabled(enabled) end

--- Halts the generated_army.
function generated_army:halt() end

--- Orders the generated_army to celebrate.
function generated_army:celebrate() end

--- Orders the generated_army to taunt.
function generated_army:taunt() end

--- Orders the generated_army to trigger the charge sound.
function generated_army:play_sound_charge() end

--- Orders the generated_army to trigger the taunt sound.
function generated_army:play_sound_taunt() end

--- Adds a ping icon to a unit within the generated army. See script_unit:add_ping_icon.
---@param icon_type number Icon type. This is a numeric index defined in code.
---@param unit_index number Index of unit within the army to add the ping icon to.
---@param duration number Duration to show the ping icon, in ms. Leave blank to show the icon indefinitely.
function generated_army:add_ping_icon(icon_type, unit_index, duration) end

--- Removes a ping icon from a unit within the generated army.
---@param unit_index number Index of unit within the army to remove the ping icon from.
function generated_army:remove_ping_icon(unit_index) end

--- Teleports the generated army to a position offset from its start location. Supply no offset to teleport it directly to its start location.
---@param x_offset number x offset
---@param z_offset number z offset
function generated_army:teleport_to_start_location_offset(x_offset, z_offset) end

--- Instructs all the units in a generated army to move to the position/angle/width at which they started the battle.
---@param move_fast boolean move fast
function generated_army:goto_start_location(move_fast) end

--- Instructs all units in a generated army to go to a location offset from their current position. Supply a numeric x/z offset and a boolean argument specifying whether they should run.
---@param x_offset number x offset in m
---@param x_offset number z offset in m
---@param move_fast boolean move fast
function generated_army:goto_location_offset(x_offset, x_offset, move_fast) end

--- Instructs all units in a generated army to move to a position under control of a script_ai_planner. See script_ai_planner:move_to_position.
---@param position battle_vector position
function generated_army:move_to_position(position) end

--- Instructs all units in a generated army to advance upon the enemy.
function generated_army:advance() end

--- Instructs all units in a generated army to attack the enemy.
function generated_army:attack() end

--- Instructs all units in a generated army to attack a specific enemy force.
---@param enemy_force script_units enemy force
function generated_army:attack_force(enemy_force) end

--- Instructs all units in a generated army to rush the enemy, ie move fast, attack without forming up
function generated_army:rush() end

--- Instructs all units in a generated army to defend a position.
---@param radius number x co-ordinate in m
function generated_army:defend(radius) end

--- Instructs the generated army to release control of all its units to the player/general ai.
function generated_army:release() end

--- Teleports the units in the army to their start position with the supplied offset when the supplied message is received.
---@param message string message
---@param x_offset number x offset in m
---@param y_offset_y_offset_in_m number y offset y offset in m
function generated_army:teleport_to_start_location_offset_on_message(message, x_offset, y_offset_y_offset_in_m) end

--- Instructs the units in the army to move to the locations they started the battle at when the supplied message is received.
---@param message string message
---@param move_fast boolean move fast
function generated_army:goto_start_location_on_message(message, move_fast) end

--- Instructs the units in the army to move relative to their current locations when the supplied message is received.
---@param message string message
---@param x_offset number x offset in m
---@param z_offset number z offset in m
---@param move_fast boolean move fast
function generated_army:goto_location_offset_on_message(message, x_offset, z_offset, move_fast) end

--- Sets the enabled status of a generated army on receipt of a message.
---@param message string message
---@param enabled boolean enabled
function generated_army:set_enabled_on_message(message, enabled) end

--- Sets the formation of the units in the generated army to the supplied formation on receipt of a message. For valid formation strings, see documentation for script_units:change_formation.
---@param message string Message.
---@param formation string Formation name.
---@param release boolean set to true to release script control after issuing the command. Set this if the command is happening to the player's army.
function generated_army:set_formation_on_message(message, formation, release) end

--- Instructs all units in a generated army to move to a position under control of a script_ai_planner on receipt of a message. See generated_army:move_to_position.
---@param message string message
---@param position battle_vector position
function generated_army:move_to_position_on_message(message, position) end

--- Orders the units in the generated army to advance on the enemy upon receipt of a supplied message.
---@param message string Message.
---@param wait_offset number Time to wait in ms after receipt of the message before issuing the advance order.
function generated_army:advance_on_message(message, wait_offset) end

--- Orders the units in the generated army to attack the enemy upon receipt of a supplied message.
---@param message string Message.
---@param wait_offset number Time to wait after receipt of the message before issuing the attack order.
function generated_army:attack_on_message(message, wait_offset) end

--- Orders the units in the generated army to rush the enemy upon receipt of a supplied message.
---@param message string Message.
---@param wait_offset number Time to wait after receipt of the message before issuing the rush order.
function generated_army:rush_on_message(message, wait_offset) end

--- Orders the units in the generated army to attack a specified enemy force upon receipt of a supplied message.
---@param message string Message.
---@param target generated_army Target force.
---@param wait_offset number Time to wait after receipt of the message before issuing the attack order.
function generated_army:attack_force_on_message(message, target, wait_offset) end

--- Orders the units in the generated army to defend a specified position upon receipt of a supplied message.
---@param message string Message.
---@param radius number x co-ordinate in m.
---@param wait_offset number y co-ordinate in m.
function generated_army:defend_on_message(message, radius, wait_offset) end

--- Releases script control of the units in the generated army to the player/general AI upon receipt of a supplied message.
---@param message string Message.
---@param wait_offset number Time to wait after receipt of the message before the units are released.
function generated_army:release_on_message(message, wait_offset) end

--- Prevents the units in the generated army from entering the battlefield as reinforcements until the specified message is received, at which point they are deployed.
---@param message string Message.
---@param wait_offset number Time to wait after receipt of the message before issuing the reinforce order.
---@param wave_index number Set an integer value to notify the game that this is a new wave in a survival battle.
---@param is_final_wave boolean Set this to true to notify the game that this is the final wave in a survival battle. This value is disregarded if no wave index is specified.
function generated_army:reinforce_on_message(message, wait_offset, wave_index, is_final_wave) end

--- Routs the units in the generated army over the specified time period upon receipt of a supplied message. See script_units:rout_over_time.
---@param message string Message.
---@param period_in_ms number Period over which the units in the generated army should rout, in ms.
function generated_army:rout_over_time_on_message(message, period_in_ms) end

--- Prevents the units in the generated army from rallying if they ever rout upon receipt of a supplied message. See script_unit:prevent_rallying_if_routing.
---@param message string Message.
function generated_army:prevent_rallying_if_routing_on_message(message) end

--- Withdraw the units in the generated army upon receipt of a supplied message.
---@param message string Message.
function generated_army:withdraw_on_message(message) end

--- Activates or deactivates melee mode on units within the generated army on receipt of a supplied message. An additional flag specifies whether script control of the units should be released afterwards - set this to true if the player is controlling this army.
---@param message string Message.
---@param activate boolean Should activate melee mode.
---@param release boolean Release script control afterwards.
function generated_army:set_melee_mode_on_message(message, activate, release) end

--- Activates or deactivates a supplied behaviour on units within the generated army on receipt of a supplied message. An additional flag specifies whether script control of the units should be released afterwards - set this to true if the player is controlling this army.
---@param message string Message.
---@param behaviour string Behaviour to activate or deactivate. See documentation on script_unit:change_behaviour_active for a list of valid values.
---@param activate boolean Should activate behaviour.
---@param release boolean Release script control afterwards.
function generated_army:change_behaviour_active_on_message(message, behaviour, activate, release) end

--- Sets the units in the generated army to be invincible and fearless upon receipt of a supplied message. If the enable flag is set to false then the effect is undone, removing invincibility and setting morale behaviour to default.
---@param message string message
---@param enable_effect boolean enable effect
function generated_army:set_invincible_on_message(message, enable_effect) end

--- Refreshes the ammunition and fatigue of units in the generated army upon receipt of a supplied message.
---@param message string message
function generated_army:refresh_on_message(message) end

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

--- Assigns this army to a random spawn zone from the supplied collection on receipt of the supplied message. This will make units that deploy onto the battlefield from this army come on from the position of the spawn zone that is chosen. The spawn zone collection is a bespoke table data type - see the functions listed in the Spawn Zone Collections section of this documentation for more information.<br />
--- It is valid to call this function while the army is partially deployed. In this case, units that subsequently deploy will enter the battlefield from the position of the new spawn zone. This functiom may be used in conjuction with other functions such as generated_army:message_on_number_deployed, which broadcasts script messages when a certain number of units have deployed from the army. This function switches spawn zones in response to these messages, so that the enemy force appears from multiple directions. To facilitate this behaviour, this function persists in listening for its message after the message is first received, which is uncommon behaviour amongst generated battle message listeners.<br />
--- Note that this function breaks the generated battle system paradigm that generated army objects can represent a subset of a logical army. Units are assigned to spawn zones on a per-logical-army basis, so if this generated army shares a logical army with another generated army, then changing the spawn zone on this generated army will also change the spawn zone for the other. To increase visibility of this issue the function will throw a script error if called on a generated army that does not control all units for its associated logical army, unless the suppress warning flag is enabled.
---@param message string message
---@param spawn_zone_collection table spawn zone collection
---@param suppress_warning boolean suppress warning
function generated_army:assign_to_spawn_zone_from_collection_on_message(message, spawn_zone_collection, suppress_warning) end

--- Assigns this army to a specific battle_spawn_zone on receipt of the supplied message. This will make units that deploy onto the battlefield from this army come on from the position of the spawn zone that is chosen.<br />
--- It is valid to call this function while the army is partially deployed. In this case, units that subsequently deploy will enter the battlefield from the position of the new spawn zone. This functiom may be used in conjuction with other functions such as generated_army:message_on_number_deployed, which broadcasts script messages when a certain number of units have deployed from the army. This function switches spawn zones in response to these messages, so that the enemy force appears from multiple directions. To facilitate this behaviour, this function persists in listening for its message after the message is first received, which is uncommon behaviour amongst generated battle message listeners.<br />
--- Note that this function breaks the generated battle system paradigm that generated army objects can represent a subset of a logical army. Units are assigned to spawn zones on a per-logical-army basis, so if this generated army shares a logical army with another generated army, then changing the spawn zone on this generated army will also change the spawn zone for the other. To increase visibility of this issue the function will throw a script error if called on a generated army that does not control all units for its associated logical army, unless the suppress warning flag is enabled.
---@param message string message
---@param spawn_zone battle_spawn_zone spawn zone
---@param suppress_warning boolean suppress warning
function generated_army:assign_to_spawn_zone_on_message(message, spawn_zone, suppress_warning) end

--- Adds the scriptunits in this generated army to a survival battle wave on receipt of the supplied message. This will call battle_manager:add_survival_battle_wave and start a process which monitors these units and updates the UI as if they were a survival battle wave. Calling this has no effect on the actual behaviour of the units.<br />
--- The survival battle wave is specified by numeric index. Additional waves can be introduced by ascending index.
---@param message string message
---@param wave_index number wave index
---@param final_wave boolean final wave
function generated_army:add_to_survival_battle_wave_on_message(message, wave_index, final_wave) end

--- Continually refills the ammunition of all units in the generated army upon receipt of the supplied message.
---@param message string message
function generated_army:grant_infinite_ammo_on_message(message) end

--- Plays a battle_sound_effect associated with the army general on receipt of the supplied message. The sound will appear to come from the general unit in 3D (unless overridden in sound data), and the unit's standard VO will be suppressed while the sound is playing.
---@param message string Play the sound on receipt of this message.
---@param sound battle_sound_effect Sound file to play.
---@param wait_interval number Delay between receipt of the message and the supplied sound starting to play, in ms.
---@param end_message string Message to send when the sound has finished playing.
---@param minimum_duration number Minimum duration of the sound in ms. This is only used if an end message is supplied, and is handy during development for when the sound has not yet been recorded.
function generated_army:play_general_vo_on_message(message, sound, wait_interval, end_message, minimum_duration) end

--- Adds a ping marker to a specified unit within the generated army upon receipt of a supplied message.
---@param message string Trigger message
---@param icon_type number Icon type. This is a numeric index defined in code.
---@param unit_index number The unit to apply the ping marker to is specified by their index value within the generated army, so 1 would be the first unit (usually the general).
---@param duration number Duration to display the ping icon for, in ms
function generated_army:add_ping_icon_on_message(message, icon_type, unit_index, duration) end

--- Removes a ping marker from a specified unit within the generated army upon receipt of a supplied message.
---@param message string Trigger message
---@param unit_index number The unit to remove the ping marker from is specified by their index value within the generated army, so 1 would be the first unit (usually the general).
function generated_army:remove_ping_icon_on_message(message, unit_index) end

--- Adds an amount to the winds of magic reserve for the generated army upon receipt of a supplied message.
---@param message string Trigger message.
---@param modification_value number Winds of Magic modification value.
function generated_army:add_winds_of_magic_reserve_on_message(message, modification_value) end

--- Adds an amount to the current winds of magic level for the generated army upon receipt of a supplied message.
---@param message string Trigger message.
---@param modification_value number Winds of Magic modification value.
function generated_army:add_winds_of_magic_on_message(message, modification_value) end

--- On receipt of the supplied message, sets the army's visibility status to the supplied true or false value. True = the army will not be hidden by terrain LOS, false = the army can be (i.e. normal behaviour). Note that the target units will still be able to hide in forests or long grass. Also note that they may perform a fade in from the point this function is called, so may not be fully visible until several seconds later.<br />
--- If the release_control flag is set to true, control of the sunits is released after the operation is performed. Do this if the army belongs to the player, otherwise they won't be able to control them.
---@param message string message
---@param always_visible boolean always visible
---@param release_control boolean release control
function generated_army:set_always_visible_on_message(message, always_visible, release_control) end

--- Instructs this generated army to enable or disable a battle_map_barrier when the specified message is received. The map barrier is specified by toggle slot script id. If no toggle slot with the supplied script id is found on the map, or the toggle slot found is not linked to a map barrier, then a script error is produced.
---@param message string Change state of map barrier on receipt of this message.
---@param script_id string Script id specifiying the togggle slot the map barrier is linked to.
---@param enable boolean Enable the map barrier. Specify false here to disable the barrier instead.
function generated_army:enable_map_barrier_on_message(message, script_id, enable) end

--- Forces the enemies of the generated army to rout over time upon receipt of the supplied message. After the enemies have all routed, this generated army will win the battle.
---@param message string Trigger message.
---@param duration number Duration over which to rout the enemy in ms.
function generated_army:force_victory_on_message(message, duration) end

--- Immediately kills and removes the units in the generated army upon receipt of the supplied message.
---@param message string Trigger message.
function generated_army:remove_on_message(message) end

--- Fires the supplied message when the casualty rate of this generated army equals or exceeds the supplied threshold.
---@param message string Message to trigger.
---@param unary_threshold number Unary threshold (between 0 and 1).
function generated_army:message_on_casualties(message, unary_threshold) end

--- Triggers the supplied message when this generated army finds itself with the supplied distance of its enemy.
---@param message string Message to trigger.
---@param threshold_distance number Threshold distance in m.
function generated_army:message_on_proximity_to_enemy(message, threshold_distance) end

--- Triggers the supplied message when this generated army finds itself with the supplied distance of any allied generated armies.
---@param message string Message to trigger.
---@param threshold_distance number Threshold distance in m.
function generated_army:message_on_proximity_to_ally(message, threshold_distance) end

--- Triggers the supplied message when this generated army finds itself with the supplied distance of the supplied position.
---@param message string Message to trigger.
---@param position battle_vector Test position.
---@param threshold_distance number Threshold distance in m.
function generated_army:message_on_proximity_to_position(message, position, threshold_distance) end

--- Triggers the supplied message when the proportion of units routing or dead in this generated army exceeds the supplied unary threshold.
---@param message string Message to trigger.
---@param threshold number Unary threshold (0 - 1).
---@param permit_rampaging boolean Permit rampaging, so that rampaging units are considered to be still controllable/not-routing. By default, rampaging units are considered to be routing.
function generated_army:message_on_rout_proportion(message, threshold, permit_rampaging) end

--- Triggers the supplied message when the proportion of units that are shattered in this generated army exceeds the supplied unary threshold.
---@param message string Message to trigger.
---@param threshold number Unary threshold (0 - 1).
---@param permit_rampaging boolean Permit rampaging, so that rampaging units are considered to be still controllable/not-routing. By default, rampaging units are considered to be routing.
function generated_army:message_on_shattered_proportion(message, threshold, permit_rampaging) end

--- Triggers the supplied message when the units in the generated army are all fully deployed.
---@param message string Message to trigger.
function generated_army:message_on_deployed(message) end

--- Triggers the supplied message when any of the units in the generated army have deployed.
---@param message string Message to trigger.
function generated_army:message_on_any_deployed(message) end

--- Triggers the supplied message, potentially repeatedly, when a certain number of units in the generated army have been deployed. The function takes one or more number arguments and will count through those numbers in order each time a unit from the army deploys onto the battlefield. The supplied message will be triggered each time a supplied number in the sequence is counted down to 0.<br />
--- For example, if the generated army contains 10 units, and the message example_message is specified along with numerical arguments 2, 1, 3, the function will trigger that message after the second unit has been deployed (the first supplied number 2 is counted down), the third unit has been deployed (the second supplied number 1 is counted down, after the first) and the sixth unit has been deployed (the third number 3, after the first and second).<br />
--- If the repeat_pattern flag is set then the supplied list of numbers is read repeatedly until all units in the generated army are accounted for. Setting this flag and supplying numerical arguments 1, 2 would be the same as not setting this flag and supplying arguments 1, 2, 1, 2, 1, 2, 1, 2 etc.<br />
--- If the last unit being deployed does not complete the sequence (e.g 2, 2, 2 for an army that only contains five units) then no final message will be issued.
---@param message string Message to trigger.
---@param read_repeatedly boolean Read back to the start of the supplied list of numbers if there are still units in the generated army that are unassigned.
---@param numbers vararg Sequence of numbers on which to trigger the message, when counting number of units deployed.
function generated_army:message_on_number_deployed(message, read_repeatedly, numbers) end

--- Triggers the supplied message when any of the units in the generated army have become visible to the enemy.
---@param message string Message to trigger.
function generated_army:message_on_seen_by_enemy(message) end

--- Triggers the supplied message when the commander of the army corresponding to this generated army has died. Note that the commander of the army may not be in this generated army.
---@param message string Message to trigger.
function generated_army:message_on_commander_death(message) end

--- Triggers the supplied message when the commanding unit within this generated army is either dead or routing. If no commanding unit exists in the generated army, this function will throw a script error.
---@param message string Message to trigger.
function generated_army:message_on_commander_dead_or_routing(message) end

--- Triggers the supplied message when the commanding unit within this generated army is either dead or shattered. If no commanding unit is present, this function will throw a script error.
---@param message string Message to trigger.
function generated_army:message_on_commander_dead_or_shattered(message) end

--- Triggers the supplied message when any of the units in this generated army come under attack.
---@param message string Message to trigger.
function generated_army:message_on_under_attack(message) end

--- Triggers the supplied message if none of the units in the alliance to which this generated army belongs are a) deployed and b) not routing, shattered or dead
---@param message string Message to trigger.
function generated_army:message_on_alliance_not_active_on_battlefield(message) end

--- Triggers the supplied message if this generated army wins the battle.
---@param message string Message to trigger.
function generated_army:message_on_victory(message) end

--- Triggers the supplied message if this generated army loses the battle.
---@param message string Message to trigger.
function generated_army:message_on_defeat(message) end
