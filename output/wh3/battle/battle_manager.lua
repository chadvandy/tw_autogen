
---@class battle_manager
local battle_manager = {}

--- Calls the supplied function repeatedly after the supplied period in seconds using a timer synchronised to the battle model. A string name for the callback may optionally be provided to allow the callback to be cancelled. Cancelling the callback is the only method to stop a repeat callback, once started.<br />
--- This function call is passed through to timer_manager:callback - this battle_manager alias is provided purely for convenience.
---@param callback_to_call function Callback to call.
---@param time number Time in milliseconds after to which to call the callback, repeatedly. The callback will be called each time this interval elapses.
---@param name string Callback name. If supplied, this callback can be cancelled at a later time with battle_manager:remove_callback.
function battle_manager:repeat_callback(callback_to_call, time, name) end

--- Allows advice to resume after battle_manager:advice_cease has been called.
function battle_manager:advice_resume() end

--- Wrapper for the battle:modify_battle_speed function, that prints output and notifies other systems that the model tick speed has changed.
---@param speed number New battle speed, as a unary proportion of normal speed. Supply a value of 1 to set the battle speed to normal, 0.5 for half speed, 0 for pause etc.
---@param silent boolean Silent flag - do not print output.
function battle_manager:modify_battle_speed(speed, silent) end

--- Returns the alliance number of the non-player alliance.
function battle_manager:get_non_player_alliance_num() end

--- Registers a function to be called when a command event is issued by the game. The function will be called with the command handler context supplied as a single argument, which can be queried for further information depending upon the command.<br />
--- This wraps the underlying functionality provided by battle:register_command_handler. See the documentation of that function for more information about what command events can be listened for, and what contextual information those events provide.
---@param command string Command name to listen for.
---@param callback function Callback to call when the command is triggered by the game.
---@param callback_name string Optional name by which this callback handler can be removed.
function battle_manager:register_command_handler_callback(command, callback, callback_name) end

--- A wrapper for ui_component. Searches the UI heirarchy and returns a uicomponent object with the supplied name. This overrides the base ui_component function provided by the underlying battle object, which returns a component object (which must be converted to be a UIComponent before use).
function battle_manager:ui_component() end

--- Hides any help message currently being shown. The help message queue may optionally also be cleared.
---@param clear_help_message_queue boolean clear help message queue
function battle_manager:hide_help_message(clear_help_message_queue) end

--- Causes a battle_manager:progress_on_advice_dismissed process that is listening for the advice to finish so that it can highlight the close button (i.e. the third parameter was set to true) to cancel this listener.
function battle_manager:progress_on_advice_dismissed_immediate_highlight() end

--- Returns true if any assault equipment with the optional supplied key exists on the battlefield. If no key is supplied then the function returns true if any assault equipment exists.
---@param key string Assault equipment key, from the battlefield_siege_vehicles table. If no key is supplied then the function returns true if any assault equipment is present.
function battle_manager:assault_equipment_exists(key) end

--- Shows/hides the top bar on the battle interface.
---@param should_show boolean Should show.
---@param immediate boolean Hide immediately. If the first parameter is false and this is true, the panel will not animate offscreen but will instead immediately disappear.
function battle_manager:show_top_bar(should_show, immediate) end

--- Returns the average altitude of the enemy army in m.
function battle_manager:get_enemy_army_altitude() end

--- Removes a scripted objective from the scripted objectives panel. This function passes its arguments through objectives_manager:remove_objective on the objectives manager - see the documentation on that function for more information.
---@param objective_key string Objective key, from the scripted_objectives table.
function battle_manager:remove_objective(objective_key) end

--- Disables or enables the help page button.
---@param disable boolean disable
function battle_manager:disable_help_page_button(disable) end

--- Calls a supplied callback when the advisor has stopped playing an audible sound.
---@param name string Name for this progress on advice finished process, by which it may be later cancelled if necessary.
---@param callback_to_call function Callback to call.
---@param delay number Delay in ms after the adisor stops before calling the callback.
---@param playtime number Playing time for the advice item. This sets a time after which battle_manager:progress_on_advice_finished will begin to actively poll whether the advice is still playing, as well as listening for the finish event. This is useful as it ensure this function works even during development when the advisor sound files have not yet been recorded.
function battle_manager:progress_on_advice_finished(name, callback_to_call, delay, playtime) end

--- Steals the escape key if it wasn't stolen before, and registers a callback to be called if the player presses it. The callback entry must be registered with a unique string name, by which it may be cancelled later if desired.<br />
--- Multiple escape key callbacks may be registered at one time, although only the most recently-registered callback is notified when the ESC key is pressed. Once an ESC key callback is called it is removed from the list, and the next ESC key press causes the next most recent callback to be notified, and so-on.
---@param callback_name string callback name
---@param callback function callback
---@param is_persistent boolean Key should remain stolen after callback is first called.
function battle_manager:steal_escape_key_with_callback(callback_name, callback, is_persistent) end

--- Sets up a locatable objective in battle. This will appear in the scripted objectives list alongside a zoom-to button which, when clicked, will zoom the camera to a location on the battlefield. The key of the objective text, as well as the camera position/target and zoom duration must all be supplied.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param camera_position battle_vector Final camera position.
---@param camera_target battle_vector Final camera target.
---@param zoom_duration number Duration of camera movement in seconds.
---@param show_topic_leader boolean Shows a topic_leader before displaying the objective.
function battle_manager:set_locatable_objective(objective_key, camera_position, camera_target, zoom_duration, show_topic_leader) end

--- Returns the local player's army object.
function battle_manager:get_player_army() end

--- Returns the automatically-generated script_units collection object, containing a script_unit for every unit, for the primary attacking army.
function battle_manager:get_scriptunits_for_main_attacker() end

--- Gets the difference in camera altitude between now and when the tracker was started. The returned value is absolute (always positive).
function battle_manager:get_camera_altitude_change() end

--- Cancels a running battle_manager:progress_on_advice_dismissed process.
---@param name string Process name, by which this progress listener was started.
function battle_manager:cancel_progress_on_advice_dismissed(name) end

--- Prints a debug list of all fort wall buildings on the map.
function battle_manager:print_fort_wall_buildings() end

--- Returns false if UI hiding has been disabled with battle_manager:enable_ui_hiding, otherwise true.
function battle_manager:is_ui_hiding_enabled() end

--- Shows/hides the ui options rollout panel.
---@param should_show boolean should show
function battle_manager:show_ui_options_panel(should_show) end

--- Returns whether any unit cards are selected.
function battle_manager:is_any_unit_selected() end

--- Unregisters a callback function registered with battle_manager:register_command_handler_callback. The callback function is specified by the command name and callback name specified when setting the callback up.
---@param command_name string command name
---@param callback_name string callback name
function battle_manager:unregister_command_handler_callback(command_name, callback_name) end

--- Allows script to prevents player movement of the camera without stealing input - other game interactions are still permitted. Supply false as an argument to disable camera movement.
---@param enable_movement boolean enable movement
function battle_manager:enable_camera_movement(enable_movement) end

--- Returns a table containing a battle_building object for each fort gate building on the map. The table will not be copied, so modifying the returned table will also modify the battle manager's internal version.
function battle_manager:get_fort_gate_buildings() end

--- Returns the name of the current battle phase.
function battle_manager:get_current_phase_name() end

--- Modifies the advisor panel to show the progress/close button in the bottom right, and also to highlight this button with an animated ring around it. This setting will persist across subsequent items of advice in a battle session until modified again.
---@param show_button boolean Show progress/close button.
---@param show_highlight boolean Show highlight on close button.
function battle_manager:modify_advice(show_button, show_highlight) end

--- Adds a script units collection to a survival battle wave by index number. A new survival battle wave process is created if one does not already exist for the supplied number.<br />
--- When a new survival battle wave is created, the battle manager starts a process which automatically monitors the health of all units in that wave, updating the UI accordingly. The state of the wave is set to "incoming" to start with, to "in_progress" when the units in the wave first enter combat, and then to "defeated" when those units are routed or killed. The progress value of the wave is also continually updated.
---@param index number Survival battle wave index. This should be an ascending integer for each new wave e.g. wave 1, wave 2 etc.
---@param script_units script_units Script units collection containing sunits to add to the wave.
---@param is_final_wave boolean Is this the final wave.
function battle_manager:add_survival_battle_wave(index, script_units, is_final_wave) end

--- Removes a callback previously added with battle_manager:callback or battle_manager:repeat_callback by name. All callbacks with a name matching that supplied will be cancelled and removed.<br />
--- This function call is passed through to timer_manager:remove_callback - this battle_manager alias is provided purely for convenience. See also battle_manager:remove_process, which also removes any watches with the specified name.
---@param name string Name of callback to remove.
function battle_manager:remove_callback(name) end

--- Registers a function to be called when a specified unit is selected by the player.
---@param subject_unit UNIT_SCRIPT_INTERFACE subject unit
---@param callback function callback
function battle_manager:register_unit_selection_callback(subject_unit, callback) end

--- Cancels any running advice, and clears any subsequent advice that may be queued.
---@param close_advisor boolean Closes the advisor if it's open
---@param force_immediate_stop boolean Forces immediate stop. By default the stopping action takes a short amount of time - the game seems happier with this. If set to true, this flag bypasses this behaviour. User beware.
function battle_manager:stop_advisor_queue(close_advisor, force_immediate_stop) end

--- Pauses the battle.
function battle_manager:pause() end

--- Unregisters a function registered with battle_manager:register_unit_selection_callback.
---@param subject_unit UNIT_SCRIPT_INTERFACE subject unit
function battle_manager:unregister_unit_selection_callback(subject_unit) end

--- Returns true if any cutscene object is currently showing a cutscene.
function battle_manager:is_any_cutscene_running() end

--- Shows/hides the unit portrait panel.
---@param should_show boolean Should show.
---@param immediate boolean Hide immediately. If the first parameter is false and this is true, the panel will not animate offscreen but will instead immediately disappear.
function battle_manager:show_portrait_panel(should_show, immediate) end

--- Immediately restarts the current battle.
function battle_manager:restart_battle() end

--- Starts a composite scene with the supplied key. If an optional group name is set then this composite scene will not play if another from the same group is active, but will instead be enqueued. When a composite scene in a group stops and a second in the same group is enqueued, then that second scene will begin to play automatically.
---@param key string Composite scene key.
---@param group_name string Composite group name.
---@param delay number Delay in milliseconds to wait before starting if this composite scene becomes enqueued behind another (allowing a minimum time separation between composite scenes of the same group to be specified). This has no effect if no group name is specified.
function battle_manager:start_terrain_composite_scene(key, group_name, delay) end

--- Returns a previously-created script_unit for the supplied battle_unit. If no matching script_unit can be found then nil is returned.
---@param unit battle_unit unit
function battle_manager:get_scriptunit_for_unit(unit) end

--- Randomly sorts a numerically-indexed table. This is safe to use in multiplayer, but will destroy the supplied table. It is faster than battle_manager:random_sort_copy.<br />
--- Note that records in this table that are not arranged in an ascending numerical index will be lost.<br />
--- Note also that the supplied table is overwritten with the randomly-sorted table, which is also returned as a return value.
function battle_manager:random_sort() end

--- Shows/hides the winds of magic panel.
---@param should_show boolean Should show.
---@param immediate boolean Hide immediately. If the first parameter is false and this is true, the panel will not animate offscreen but will instead immediately disappear.
function battle_manager:show_winds_of_magic_panel(should_show, immediate) end

--- Adds one or more lines of infotext to the infotext panel. This function passes through to infotext_manager:add_infotext - see the documentation on the infotext_manager page for more details.
---@param first_param any Can be a string key from the advice_info_texts table, or a number specifying an initial delay in ms after the panel animates onscreen and the first infotext item is shown.
---@vararg any
function battle_manager:add_infotext(first_param, additional_infotext_strings) end

--- Adds one or more lines of infotext simultaneously to the infotext panel. This function passes through to infotext_manager:add_infotext_simultaneously - see the documentation on the infotext_manager page for more details.
---@param first_param any Can be a string key from the advice_info_texts table, or a number specifying an initial delay in ms after the panel animates onscreen and the first infotext item is shown.
---@vararg any
function battle_manager:add_infotext_simultaneously(first_param, additional_infotext_strings) end

--- Stores a mapping for the specified campaign, that the supplied value should remap to the supplied replacement value. This can be subsequently looked up with battle_manager:get_value_for_campaign.
---@param campaign_key string Campaign key.
---@param value any Value to remap. This can be any value other than nil or false.
---@param replacement_value any Replacement value. This can be any value.
---@param allow_overwriting boolean Allow a previously-mapped value to be overwritten.
function battle_manager:remap_value_for_campaign(campaign_key, value, replacement_value, allow_overwriting) end

--- Unregisters a callback function registered with battle_manager:register_input_handler_callback. The callback function is specified by the input name and callback name specified when setting the callback up.
---@param command_name string command name
---@param callback_name string callback name
function battle_manager:unregister_input_handler_callback(command_name, callback_name) end

--- Removes a real callback previously added with battle_manager:real_callback or battle_manager:repeat_real_callback by name. All callbacks with a name matching that supplied will be cancelled and removed.<br />
--- This function call is passed through to timer_manager:remove_real_callback - this battle_manager alias is provided purely for convenience.
---@param name string Name of callback to remove.
function battle_manager:remove_real_callback(name) end

--- Sets up a scripted objective for the player which appears in the scripted objectives panel, with a topic_leader. This objective can then be updated, removed, or marked as completed or failed by the script at a later time.<br />
--- A key to the scripted_objectives table must be supplied with set_objective, and optionally one or two numeric parameters to show some running count related to the objective. To update these parameter values later, set_objective may be re-called with the same objective key and updated values.<br />
--- This function passes its arguments through objectives_manager:set_objective_with_leader on the objectives manager - see the documentation on that function for more information.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param param_a number First numeric objective parameter. If set, the objective will be presented to the player in the form [objective text]: [param a]. Useful for showing a running count of something related to the objective.
---@param param_b number Second numeric objective parameter. A value for the first must be set if this is used. If set, the objective will be presented to the player in the form [objective text]: [param a] / [param b]. Useful for showing a running count of something related to the objective.
---@param callback function Optional callback to call when the objective is shown.
function battle_manager:set_objective_with_leader(objective_key, param_a, param_b, callback) end

--- Returns whether the local player army is of the supplied faction.
---@param faction_key string faction key
function battle_manager:player_army_is_faction(faction_key) end

--- Changes game speed from one value to another over a total time (note that this will be elongated by the slowing action) over a given number of steps. Note that the script engine only updates once every 1/10th of a second so specifying steps of less than this will have weird results. Speeds are specified as multiples of normal game speed, so a value of 2 would be twice normal speed, 0.5 would be half, and so on.
---@param start_game_speed number start game speed
---@param target_game_speed number target game speed
---@param duration_in_ms number duration in ms
---@param steps number steps
function battle_manager:slow_game_over_time(start_game_speed, target_game_speed, duration_in_ms, steps) end

--- Starts the engagement monitor. This must be called before the "Deployed" phase change occurs (i.e. before the end of deployment).
function battle_manager:start_engagement_monitor() end

--- Shows/hides the start battle button. Any state set by a call to this function is restored if battle_manager:restore_ui_hiding is called.
---@param should_show boolean Should show.
---@param is_multiplayer boolean Set this to true if this is a multiplayer battle.
function battle_manager:show_start_battle_button(should_show, is_multiplayer) end

--- Deselects any currently-selected units.
function battle_manager:clear_selection() end

--- Adds a repeating real callback to be called each time the supplied interval elapses. Real timers are synchronised to UI updates, not to the game model - see Real Timers for more information.<br />
--- This function call is passed through to timer_manager:repeat_real_callback - this battle_manager alias is provided purely for convenience.
---@param callback function Callback to call.
---@param interval number Repeating interval after which to call the callback, in milliseconds.
---@param name string Callback name, by which it may be later removed with battle_manager:remove_real_callback. If omitted the repeating callback may not be cancelled.
function battle_manager:repeat_real_callback(callback, interval, name) end

--- Returns the proportion of units in the player's alliance engaged in melee. This proportion will be a unary value (0 - 1). battle_manager:start_engagement_monitor must have been called before the battle started for this to work.
function battle_manager:get_proportion_under_fire() end

--- Returns the closest capture location to the supplied position. If no capture location is present on the map then nil is returned.
---@param position battle_vector position
function battle_manager:get_closest_capture_location(position) end

--- Returns the local player's alliance object.
function battle_manager:get_player_alliance() end

--- Cancels any running processes started by battle_manager:slow_game_over_time.
function battle_manager:stop_slow_game_over_time() end

--- Returns whether the battle is currently in the conflict phase.
function battle_manager:is_conflict_phase() end

--- Returns the first army of the enemy alliance to the local player.
function battle_manager:get_first_non_player_army() end

--- Returns the cached distance between the two alliances. battle_manager:start_engagement_monitor must have been called before the battle started for this to work.
function battle_manager:get_distance_between_forces() end

--- Returns true if any advice has played in this battle session
function battle_manager:has_advice_played_this_battle() end

--- Gets the total distance the camera has travelled between now and when the tracker was started. This distance is not exact, but gives the calling script an indication of how much the player is moving the camera.
function battle_manager:get_camera_distance_travelled() end

--- Returns true if the local player is the attacker in the battle.
function battle_manager:player_is_attacker() end

--- Returns the number of reinforcing armies for an army in the specified alliance and army. The alliance and army are specified by index (indexes are always 1-based).
---@param alliance_id number alliance id
---@param army_id number army id
function battle_manager:num_reinforcing_armies_for_army_in_alliance(alliance_id, army_id) end

--- Returns the proportion of units in the player's alliance engaged in melee. This proportion will be a unary value (0 - 1). battle_manager:start_engagement_monitor must have been called before the battle started for this to work.
function battle_manager:get_proportion_engaged() end

--- Stops the camera movement tracker.
function battle_manager:stop_camera_movement_tracker() end

--- Resets an objective chain so that it may be called again. This function passes its arguments through objectives_manager:reset_objective_chain on the objectives manager - see the documentation on that function for more information.
---@param chain_name string Objective chain name.
function battle_manager:reset_objective_chain(chain_name) end

--- Enqueues a line of advice for delivery to the player. If there is no other advice playing, or nothing is blocking the advisor system, then the advice gets delivered immediately. Otherwise, the supplied advice will be queued and shown at an appropriate time.<br />
--- The function must be supplied an advice key from the advice_levels/advice_threads tables as its first parameter, unless the advisor entry is set to be debug (see below).
---@param advice_key string If the advice entry is set to be debug (see third parameter) the text supplied here will instead be shown directly in the advisor window (debug only)
---@param forced_duration number Forced duration in ms. This is a period that this advice must play for before another item of advice is allowed to start. By default, items of advice will only remain queued while the active advice is actually audibly playing, but by setting a duration the active advice can be held on-screen for longer than the length of its associated soundfile (unless it is closed by the player). This is useful during development to hold advice on-screen when no soundfile yet exists, and also for tutorial scripts which often wish to ensure that an item of advice is shown on-screen for a certain duration.
---@param debug boolean Sets whether the advice line is debug. If set to true, the text supplied as the first parameter is displayed in the advisor window as-is, without using it as a lookup key in the advice_levels table.
---@param start_callback function Start callback. If a function is supplied here it is called when the advice is actually played.
---@param start_callback_wait number Start callback wait period in ms. If a duration is specified it causes a delay between the advice being played and the start callback being called.
---@param condition playback Playback condition. If specified, it compels the advisor system to check this condition immediately before playing the advisor entry to decide whether to actually proceed. This must be supplied as a function block that returns a result. If this result evaluates to true, the advice is played.
function battle_manager:queue_advisor(advice_key, forced_duration, debug, start_callback, start_callback_wait, condition) end

--- Disables or enables the unit camera.
---@param disable boolean disable
function battle_manager:disable_unit_camera(disable) end

--- Shows/hides any army abilities on the right-side of the screen.
---@param should_show boolean Should show.
---@param immediate boolean Hide immediately. If the first parameter is false and this is true, the panel will not animate offscreen but will instead immediately disappear.
function battle_manager:show_army_abilities(should_show, immediate) end

--- Starts a new objective chain, with a topic_leader. This function passes its arguments through objectives_manager:activate_objective_chain_with_leader on the objectives manager - see the documentation on that function for more information.
---@param chain_name string Objective chain name.
---@param objective_key string Key of initial objective, from the scripted_objectives table.
---@param number_param_a number First numeric parameter - see the documentation for battle_manager:set_objective for more details.
---@param number_param_b number Second numeric parameter - see the documentation for battle_manager:set_objective for more details.
function battle_manager:activate_objective_chain_with_leader(chain_name, objective_key, number_param_a, number_param_b) end

--- Retrieves a value remapping for the current campaign. If the value has been remapped for this campaign then the replacement value is returned. If the value has not been remapped then the value itself is returned, un-remapped, or nil is returned if the return-unmapped-value parameter is set to false.
---@param value any value to remap. This can be any value other than nil or false.
---@param return_unmapped_value boolean Sets whether the function call should return the value as it was supplied if it was not remapped or not. If this is set to false and the value has not been remapped, then nil is returned.
function battle_manager:get_value_for_current_campaign(value, return_unmapped_value) end

--- Marks a scripted objective as completed for the player to see. Note that it will remain on the scripted objectives panel until removed with battle_manager:remove_objective. This function passes its arguments through objectives_manager:complete_objective on the objectives manager - see the documentation on that function for more information.<br />
--- Note also that is possible to mark an objective as complete before it has been registered with battle_manager:set_objective - in this case, it is marked as complete as soon as battle_manager:set_objective is called.
---@param objective_key string Objective key, from the scripted_objectives table.
function battle_manager:complete_objective(objective_key) end

--- Restores any conflict override setting previously cached with battle_manager:cache_conflict_time_update_overridden.
function battle_manager:restore_conflict_time_update_overridden() end

--- Retrieves a value remapping for the specified campaign. If the value has been remapped for the particular campaign then the replacement value is returned. If the value has not been remapped then the value itself is returned, un-remapped, or nil is returned if the return-unmapped-value parameter is set to false.
---@param campaign_key string Campaign key.
---@param value any value to remap. This can be any value other than nil or false.
---@param return_unmapped_value boolean Sets whether the function call should return the value as it was supplied if it was not remapped or not. If this is set to false and the value has not been remapped, then nil is returned.
function battle_manager:get_value_for_campaign(campaign_key, value, return_unmapped_value) end

--- Returns the first toggle slot found with the supplied script id. If no matching toggle slot is found then nil is returned.
---@param script_id string script id
function battle_manager:get_toggle_slot_by_script_id(script_id) end

--- Adds one or more lines of infotext to the infotext panel, with a topic_leader. This function passes through to infotext_manager:add_infotext_with_leader - see the documentation on the infotext_manager page for more details.
---@param first_param any Can be a string key from the advice_info_texts table, or a number specifying an initial delay in ms after the panel animates onscreen and the first infotext item is shown.
---@vararg any
function battle_manager:add_infotext_with_leader(first_param, additional_infotext_strings) end

--- Prints a list of all toggle slots on the battle map to the console.
function battle_manager:print_toggle_slots() end

--- Returns the average altitude of the player's army in m.
function battle_manager:get_player_army_altitude() end

--- Gets a table containing a battle_capture_location for each capture location that contributes to battle victory. The table is cached internally the first time this function is called.
function battle_manager:get_victory_locations() end

--- Cancels all running watches and callbacks. It's highly recommend to not call this except for debug purposes (and rarely, even then).
function battle_manager:clear_watches_and_callbacks() end

--- Generates debugging output that lists all capture locations on the battlefield.
function battle_manager:print_capture_locations() end

--- Assigns a supplied battle_army to a spawn zone from a collection. The spawn zone will be selected by battle_manager:get_random_spawn_zone_from_collection.
---@param army battle_army Army to assign.
---@param collection table Spawn zone collection.
---@param name string Optional army name for output. If supplied, some output is generated featuring this name should the assignment be successful.
function battle_manager:assign_army_to_spawn_zone_from_collection(army, collection, name) end

--- Returns a random number. If no min or max bounding values are supplied then the value returned is a float between 0 and 1. If a single integer number argument is supplied, then the value returned is an integer value from 1 to the max value. If two integer min/max arguments are supplied then the value returned is an integer value between the first and the second.
---@param first_number number First number argument - this is the maximum value for the returned random integer if no second argument is supplied, or the mininum value if a second argument is provided.
---@param max_number number Maximum value for the returned random integer.
function battle_manager:random_number(first_number, max_number) end

--- Enables/disables UI hiding. With UI hiding disabled the player will not be able to hide the UI by pressing K or alt-K. This function does not prevent the script from being able to hide or show the UI.<br />
--- Any state set by a call to this function is restored if battle_manager:restore_ui_hiding is called.
---@param should_enable boolean should enable
function battle_manager:enable_ui_hiding(should_enable) end

--- Adds a real callback to be called after the supplied interval has elapsed. Real timers are synchronised to UI updates, not to the game model - see Real Timers for more information.<br />
--- This function call is passed through to timer_manager:real_callback - this battle_manager alias is provided purely for convenience.
---@param callback function Callback to call.
---@param interval number Interval after which to call the callback, in milliseconds.
---@param name string Callback name, by which it may be later removed with battle_manager:remove_real_callback. If omitted the callback may not be cancelled.
function battle_manager:real_callback(callback, interval, name) end

--- Stops and removes any watch OR callback with the supplied name. Returns true if any were found, false otherwise.
---@param name string name
function battle_manager:remove_process(name) end

--- Sets up a locatable objective in battle. This will appear in the scripted objectives list alongside a zoom-to button which, when clicked, will zoom the camera to a location on the battlefield. Whereas battle_manager:set_locatable_objective requires static camera position/targets to be supplied, this function takes a function argument which, when called, should return a battle_vector camera position and a battle_vector camera target. This allows the camera position to be generated at runtime, to follow a unit for example.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param camera_position_generator function Camera position generator function. When called, this should return two battle_vector values that specify the camera position and target to move to.
---@param zoom_duration number Duration of camera movement in seconds.
---@param show_topic_leader boolean Shows a topic_leader before displaying the objective.
function battle_manager:set_locatable_objective_callback(objective_key, camera_position_generator, zoom_duration, show_topic_leader) end

--- Returns a table containing all spawn zones on the battlefield where the script id of the contained reinforcement line partially match any of the supplied names. The script_id of each spawn zone/reinforcement line pair is checked - should it contain any of the supplied string arguments then that spawn zone is added to the collection to be returned. Partial matches are possible, so a spawn zone with a reinforcement line called something like sz_section_3_rear will match against the argument section_3.<br />
--- The returned spawn zone collection is a table containing subtables, each of which contains a spawn zone and a count of how many time that spawn zone has had a reinforcement army assigned to it by script. The spawn zone collection can be passed to battle_manager:get_random_spawn_zone_from_collection to get a semi-random spawn zone from the collection.
---@param names vararg Spawn zone names to match, each of which should be a string.
function battle_manager:get_spawn_zone_collection_by_name(names) end

--- Returns whether the local player army is of the supplied subculture.
---@param subculture_key string subculture key
function battle_manager:player_army_is_subculture(subculture_key) end

--- Prints a debug list of all fort tower buildings on the map.
function battle_manager:print_fort_tower_buildings() end

--- Old-style battle-ending handlers. These can still be used but won't get called until the battle results screen is shown. Registers player victory and player defeat callbacks to be called at the end of the battle.
---@param player_victory_callback function player victory callback
---@param player_defeat_callback function player defeat callback
function battle_manager:register_results_callbacks(player_victory_callback, player_defeat_callback) end

--- Retrieves a handle to a battle_ui_manager object from the battle manager. One is created if it hasn't been created before.
function battle_manager:get_battle_ui_manager() end

--- Stops the engagement monitor.
function battle_manager:stop_engagement_monitor() end

--- Returns the path to the battle script folder.
function battle_manager:get_battle_folder() end

--- By default the watch system performs load balancing, where it tries to stagger its running watches so they don't all process on the same tick. If this is causes problems for any reason it can be disabled with set_load_balancing. Supply a boolean parameter to enable or disable load balancing.
function battle_manager:set_load_balancing() end

--- Establishes a listener which stops the advice system as soon as the battle results panel appears.
function battle_manager:stop_advice_on_battle_end() end

--- Returns the defending alliance object.
function battle_manager:get_defending_alliance() end

--- Returns the number of unit cards that are selected.
function battle_manager:num_units_selected() end

--- Ends an existing objective chain. This function passes its arguments through objectives_manager:end_objective_chain on the objectives manager - see the documentation on that function for more information.
---@param chain_name string Objective chain name.
function battle_manager:end_objective_chain(chain_name) end

--- Returns the number of units in the player's alliance engaged in melee. battle_manager:start_engagement_monitor must have been called before the battle started for this to work.
function battle_manager:get_num_units_engaged() end

--- Starts the camera movement tracker. Only tutorial scripts which need to query camera tracker information need to do this.
function battle_manager:start_camera_movement_tracker() end

--- Automatically creates and starts a cutscene in which the camera is moved to the supplied co-ordinates.
---@param position battle_vector Camera position.
---@param target battle_vector Camera target.
---@param duration number Duration of camera movement in seconds.
---@param end_callback function Function to call when cutscene ends (either naturally or by being skipped).
---@param fov number Field of view at target position in degrees. Supply 0 or nil to use the game default.
---@param skippable boolean Sets whether cutscene is skippable or not.
---@param skip_callback function Function to call when cutscene is skipped.
function battle_manager:scroll_camera_with_cutscene(position, target, duration, end_callback, fov, skippable, skip_callback) end

--- Returns the alliance number of the defending alliance in the battle.
function battle_manager:get_defending_alliance_num() end

--- Disables or enables the time speed controls.
---@param disable boolean disable
function battle_manager:disable_time_speed_controls(disable) end

--- Gets the cached position of the camera. This must be called after the position has been cached with battle_manager:cache_camera (else it will return false).
function battle_manager:get_cached_camera_pos() end

--- Causes a battle to immediately end when it enters the VictoryCountdown phase, or to immediately end if it is already in that phase. This function is most commonly used to end a battle that has entered the VictoryCountdown phase after battle_manager:setup_victory_callback has been called.
function battle_manager:end_battle() end

--- Caches whether conflict time is currently overridden. The cached value can be later restored with battle_manager:restore_conflict_time_update_overridden.
function battle_manager:cache_conflict_time_update_overridden() end

--- Calls a supplied function when a supplied sound effect has finished playing. A post-completion delay and a minimum play time - useful during development when sound effects (particularly voiceover) may not yet have been recorded - may also be supplied.
---@param name string Name for this progress-on-sound-effect-finished process. The process may be cancelled by the name supplied here by calling battle_manager:cancel_progress_on_sound_effect_finished before the callback is called.
---@param sound_effect battle_sound_effect Sound effect to monitor.
---@param callback function Callback to call.
---@param minimum_playtime number Delay in ms to wait after the sound effect has finished before calling the callback.
function battle_manager:progress_on_sound_effect_finished(name, sound_effect, callback, minimum_playtime) end

--- Enqueues a help message for showing on-screen.
---@param key string Help message key, from the scripted_objectives table.
---@param duration number Duration that the message will persist on-screen for in ms. If this is specified then a fade time must also be set.
---@param fade_time number Time that the message will take to fade on/fade off in ms. If this is specified then a duration must also be set.
---@param high_priority boolean Set this to true to set this message to high priority. High priority messages are bumped to the top of the queue.
---@param play_after_battle_victory boolean By default, help messages won't play after the battle has been won. Set this to true to allow this message to play after this point.
---@param callback function Callback to call when the message actually starts to show on-screen.
function battle_manager:queue_help_message(key, duration, fade_time, high_priority, play_after_battle_victory, callback) end

--- Enables or disables the countdown of the conflict timer. This function wraps the underlying battle interface function battle:change_conflict_time_update_overridden. Call with an argument of true to disable the countdown of the conflict timer, or false to enable it again. With conflict time update overridden, time can pass but the victory timer will not count down.
---@param disable_update boolean disable update
function battle_manager:change_conflict_time_update_overridden(disable_update) end

--- Prints a debug list of all fort gate buildings on the map.
function battle_manager:print_fort_gate_buildings() end

--- Stops and removes any watch with the supplied name. Returns true if any were found, false otherwise. Best practice is to use remove_process instead of this.
---@param name string name
function battle_manager:remove_process_from_watch_list(name) end

--- Returns a table containing a battle_building object for each fort wall building on the map. The table will not be copied, so modifying the returned table will also modify the battle manager's internal version.
function battle_manager:get_fort_wall_buildings() end

--- Hides any currently-shown subtitle.
function battle_manager:hide_subtitles() end

--- Returns a table containing a battle_building object for each fort tower building on the map. The table will not be copied, so modifying the returned table will also modify the battle manager's internal version.
function battle_manager:get_fort_tower_buildings() end

--- Returns whether the cinematic UI is currently enabled. The cinematic UI is enabled from script with battle:enable_cinematic_ui, and is commonly activated/deactivated by cutscenes.
function battle_manager:is_cinematic_ui_enabled() end

--- Pass-through function for infotext_manager:hide_infotext. Hides and clears the infotext panel with an animation.
function battle_manager:hide_infotext() end

--- Returns a vector position at the world origin.
function battle_manager:get_origin() end

--- Returns the automatically-generated script_units collection object, containing a script_unit for every unit, for the local player's primary enemy army.
function battle_manager:get_scriptunits_for_main_enemy_army_to_local_player() end

--- Shows a cutscene subtitle on-screen.
---@param subtitle_key string subtitle key
---@param full_key_supplied boolean If the key has been supplied in the full localisation format (i.e. [table]_[field_of_text]_[key_from_table]), set this to true.
---@param force_subtitle_on boolean Forces the subtitle to display, overriding the user's preferences.
function battle_manager:show_subtitle(subtitle_key, full_key_supplied, force_subtitle_on) end

--- Returns whether the battle is currently in deployment phase.
function battle_manager:is_deployment_phase() end

--- Shows or hides all units in the player's alliance. This is primarily intended for multiplayer cutscenes but could be used for other purposes.
---@param show boolean show
function battle_manager:show_player_alliance_units_for_mp_cutscenes(show) end

--- Prevents the unit details panel from being displayed, or allows it to be displayed again after it was previously prevented.
---@param disable boolean disable
function battle_manager:disable_unit_details_panel(disable) end

--- Disables or enables the battle speed cycling keyboard shortcuts.
---@param disable boolean disable
function battle_manager:disable_cycle_battle_speed(disable) end

--- Disables or enables the tactical map.
---@param disable boolean disable
function battle_manager:disable_tactical_map(disable) end

--- Marks a scripted objective as failed for the player to see. Note that it will remain on the scripted objectives panel until removed with battle_manager:remove_objective. This function passes its arguments through objectives_manager:fail_objective on the objectives manager - see the documentation on that function for more information.
---@param objective_key string Objective key, from the scripted_objectives table.
function battle_manager:fail_objective(objective_key) end

--- Returns the first commanding battle_unit found in the supplied units collection. Supported collection types are battle_units, battle_army and script_units. If no commanding unit is found then false is returned.
---@param unit_collection collection Unit collection object.
function battle_manager:get_general(unit_collection) end

--- Gets the cached target of the camera. This must be called after the position has been cached with battle_manager:cache_camera (else it will return false).
function battle_manager:get_cached_camera_targ() end

--- Returns whether all unit cards are selected.
function battle_manager:are_all_units_selected() end

--- Pass-through function for infotext_manager:clear_infotext. Clears the infotext panel.
function battle_manager:clear_infotext() end

--- Returns a random spawn zone from the supplied spawn zone collection, preferentially choosing a spawn zone that hasn't been used as much as the others.
---@param collection table collection
function battle_manager:get_random_spawn_zone_from_collection(collection) end

--- Enables/disables the spell browser button on the battle interface. A disabled button will still be visible, but greyed-out.
---@param should_enable boolean should enable
function battle_manager:enable_spell_browser_button(should_enable) end

--- Shows/hides the spell browser.
---@param should_show boolean Should show.
function battle_manager:show_spell_browser_button(should_show) end

--- Shows/hides the radar.
---@param should_show boolean Should show.
---@param immediate boolean Hide immediately. If the first parameter is false and this is true, the panel will not animate offscreen but will instead immediately disappear.
function battle_manager:show_radar_frame(should_show, immediate) end

--- Returns whether input focus has currently been stolen by battle_manager:steal_input_focus.
function battle_manager:is_input_focus_stolen() end

--- Cancels a process started by battle_manager:progress_on_sound_effect_finished with the supplied name.
function battle_manager:cancel_progress_on_sound_effect_finished() end

--- Shows/hides the army panel.
---@param should_show boolean Should show.
---@param immediate boolean Hide immediately. If the first parameter is false and this is true, the panel will not animate offscreen but will instead immediately disappear.
function battle_manager:show_army_panel(should_show, immediate) end

--- Stops a composite scene with the supplied key. If this composite scene was specified as belonging to a group when it was started, and other composite scenes in that group are enquened, then the next one will begin to play automatically (after an optional delay).
---@param key string Composite scene key.
function battle_manager:stop_terrain_composite_scene(key) end

--- Establishes a function to be called when the battle enters VictoryCountdown phase i.e. someone has won. This function also sets the duration of the victory countdown to infinite, meaning the battle will never end until battle_manager:end_battle is called. This allows calling scripts to do things like set up an outro cutscene or play some advice that wouldn't fit into the standard victory countdown duration (10 seconds).
---@param callback_to_call function callback to call
function battle_manager:setup_victory_callback(callback_to_call) end

--- Returns the alliance number of the attacking alliance in the battle.
function battle_manager:get_attacking_alliance_num() end

--- Returns the automatically-generated script_units collection object, containing a script_unit for every unit, for the primary defending army.
function battle_manager:get_scriptunits_for_main_defender() end

--- Registers a function to be called when an input event is issued by the game. This wraps the underlying functionality provided by battle:register_input_handler. See the documentation of that function for more information about what input events can be listened for.
---@param input string Input name to listen for.
---@param callback function Callback to call when the input is triggered by the game.
---@param callback_name string Optional name by which this input handler can be removed.
function battle_manager:register_input_handler_callback(input, callback, callback_name) end

--- Debug command to dump the watch list to the console output spool.
function battle_manager:print_watch_list() end

--- Shows/hides the army panel, winds of magic panel, portrait panel, top bar, radar frame and army abilities from script.
---@param should_show boolean should show
function battle_manager:show_ui(should_show) end

--- Returns whether the battle is currently in the victory countdown phase.
function battle_manager:is_victory_countdown_phase() end

--- Calls a supplied callback when the advisor panel is closed for any reason.
---@param name string Process name, by which this progress listener may be later cancelled if necessary.
---@param callback_to_call function Callback to call.
---@param delay number Delay in ms after the adisor closes before calling the callback.
---@param highlight_on_finish boolean Highlight the advisor close button upon finishing the currently-playing advice. This is useful for script that knows the advisor is playing, wants to highlight the close button when it finishes and be notified of when the player closes the advisor in any case.
function battle_manager:progress_on_advice_dismissed(name, callback_to_call, delay, highlight_on_finish) end

--- Disables or re-enables the display of the paused panel. With the paused panel disabled the game may still be paused, but the panel will not show.
---@param should_enable boolean should enable
function battle_manager:enable_paused_panel(should_enable) end

--- Caches the current position/target of the camera for later retrieval.
function battle_manager:cache_camera() end

--- Disables or enables the giving of any orders at all. This function wraps the battle:disable_orders function of the same name on the battle interface, adding console output.
---@param disable boolean disable
function battle_manager:disable_orders(disable) end

--- Steals or releases all input from the UI, disabling or re-enabing user input in the game. This calls/overrides the battle functions battle:steal_input_focus and battle:release_input_focus. The state set with this function will be re-established when battle_manager:restore_ui_hiding is called.
---@param steal_focus boolean Steal focus. Set to false to release focus.
---@param dont_restore boolean Don't add this action to the list of actions to restore if battle_manager:restore_ui_hiding is called.
function battle_manager:steal_input_focus(steal_focus, dont_restore) end

--- Gets an automatically-generated script_units collection object containing a script_unit for every unit in the specified army. If no scriptunits collection can be found for the supplied alliance/army/optional reinforcement index then false is returned.
---@param alliance_id number Alliance id. Alliances are specified by 1-based index, currently either 1 or 2.
---@param army_id number Army id, specified by 1-based index, so a value of 1 corresponds to the first army in the specified alliance.
---@param reinforcement_units_id number Specifies a reinforcing units to return the scriptunits for. If this argument is omitted, the scriptunits collection corresponding to the main (non-reinforcing) army is returned. Otherwise, the scriptunits collection corresponding to the specified reinforcing units is returned. If no reinforcing army could be found then a script error is thrown.
function battle_manager:get_scriptunits_for_army(alliance_id, army_id, reinforcement_units_id) end

--- Adds one or more lines of infotext simultaneously to the infotext panel, with a topic_leader. This function passes through to infotext_manager:add_infotext_simultaneously_with_leader - see the documentation on the infotext_manager page for more details.
---@param first_param any Can be a string key from the advice_info_texts table, or a number specifying an initial delay in ms after the panel animates onscreen and the first infotext item is shown.
---@vararg any
function battle_manager:add_infotext_simultaneously_with_leader(first_param, additional_infotext_strings) end

--- Calls the supplied function after the supplied interval in seconds using a timer synchronised to the battle model. A string name for the callback may optionally be provided to allow the callback to be cancelled later.<br />
--- This function call is passed through to timer_manager:callback - this battle_manager alias is provided purely for convenience.
---@param callback_to_call function Callback to call.
---@param interval number Interval in milliseconds after to which to call the callback.
---@param name string Callback name. If supplied, this callback can be cancelled at a later time (before it triggers) with battle_manager:remove_process or battle_manager:remove_callback.
function battle_manager:callback(callback_to_call, interval, name) end

--- Loads all scripted tour scripts. Calling this allows battle scripted tours to work.
function battle_manager:load_scripted_tours() end

--- Stops the advisor queue and prevents any more advice from being queued. The advice system will only subsequently restart if battle_manager:advice_resume is called.
function battle_manager:advice_cease() end

--- Returns the number of armies in the specified alliance. The alliance is specified by index, which should currently either be 1 or 2.
---@param alliance_id number alliance id
function battle_manager:num_armies_in_alliance(alliance_id) end

--- Returns the key of the campaign this battle was launched from. If this battle was not launched from a campaign then a blank string is returned.
function battle_manager:get_campaign_key() end

--- Pass-through function for infotext_manager:attach_to_advisor. This attaches or detaches the infotext panel from the advisor. By default they are attached, but by detaching them infotext may be triggered independently of advice.
---@param should_attach boolean should attach
function battle_manager:attach_to_advisor(should_attach) end

--- Registers a function to be called when a specified phase change occurs. Phase change notifications are sent to the script by the game when the battle changes phases, from 'Deployment' to 'Deployed' and on to 'VictoryCountdown' and 'Complete'. The battle manager writes debug output whenever a phase change occurs, regardless of whether any callback has been registered for it.<br />
--- This wraps the underlying functionality provided by battle:register_battle_phase_handler. See that function's documentation for a list of phase change events that may be listened for.
---@param phase_name string phase name
---@param callback function callback
function battle_manager:register_phase_change_callback(phase_name, callback) end

--- Sets whether the advisor system should close the advisor panel once an item of advice has finished playing. By default this is set to false, so use this function to turn this behaviour on.
---@param value boolean value
function battle_manager:set_close_queue_advice(value) end

--- Sets up a scripted objective for the player, which appears in the scripted objectives panel. This objective can then be updated, removed, or marked as completed or failed by the script at a later time.<br />
--- A key to the scripted_objectives table must be supplied with set_objective, and optionally one or two numeric parameters to show some running count related to the objective. To update these parameter values later, set_objective may be re-called with the same objective key and updated values.<br />
--- This function passes its arguments through objectives_manager:set_objective on the objectives manager - see the documentation on that function for more information.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param param_a number First numeric objective parameter. If set, the objective will be presented to the player in the form [objective text]: [param a]. Useful for showing a running count of something related to the objective.
---@param param_b number Second numeric objective parameter. A value for the first must be set if this is used. If set, the objective will be presented to the player in the form [objective text]: [param a] / [param b]. Useful for showing a running count of something related to the objective.
function battle_manager:set_objective(objective_key, param_a, param_b) end

--- Establishes a new watch. A supplied condition function is repeated tested and, when it returns true, a supplied target function is called. A wait period between the condition being met and the target being called must also be specified. A name for the watch may optionally be specified to allow other scripts to cancel it.<br />
--- The condition must be a function that returns a value - when that value is true (or evaluates to true) then the watch condition is met. The watch then waits the supplied time offset, which is specified in ms as the second parameter, before calling the callback supplied in the third parameter.
---@param condition function condition
---@param condition function Condition. Must be a function that returns a value. When the returned value is true, or evaluates to true, then the watch condition is met.
---@param wait_time number Time in ms that the watch waits once the condition is met before triggering the target callback
---@param target_callback function Target callback
---@param watch_name string Name for this watch process. Giving a watch a name allows it to be stopped/cancelled with battle_manager:remove_process.
function battle_manager:watch(condition, condition, wait_time, target_callback, watch_name) end

--- Starts a new objective chain. This function passes its arguments through objectives_manager:activate_objective_chain on the objectives manager - see the documentation on that function for more information.
---@param chain_name string Objective chain name.
---@param objective_key string Key of initial objective, from the scripted_objectives table.
---@param number_param_a number First numeric parameter - see the documentation for battle_manager:set_objective for more details.
---@param number_param_b number Second numeric parameter - see the documentation for battle_manager:set_objective for more details.
function battle_manager:activate_objective_chain(chain_name, objective_key, number_param_a, number_param_b) end

--- Creates and returns a battle_manager object. Only one battle_manager object may be created in a session - attempting to create a second just returns the first.
function battle_manager:new() end

--- Restores certain ui hiding behaviours established by calls to ui-hiding functions in this section, where those ui-hiding behaviours would be reset by disabling/re-enabling the cinematic ui. This is called by cutscene objects.
function battle_manager:restore_ui_hiding() end

--- Randomly sorts a numerically-indexed table. This is safe to use in multiplayer, and will preserve the original table, but it is marginally slower than battle_manager:random_sort.<br />
--- Note that records in the source table that are not arranged in an ascending numerical index will not be copied (they will not be deleted, however).
function battle_manager:random_sort_copy() end

--- Pass-through function for infotext_manager:remove_infotext. Removes a line of infotext from the infotext panel.
---@param infotext_key string infotext key
function battle_manager:remove_infotext(infotext_key) end

--- Returns the alliance number of the player's alliance.
function battle_manager:get_player_alliance_num() end

--- Returns the alliance object of the local player's enemy.
function battle_manager:get_non_player_alliance() end

--- Updates an existing objective chain. This function passes its arguments through objectives_manager:update_objective_chain on the objectives manager - see the documentation on that function for more information.
---@param chain_name string Objective chain name.
---@param objective_key string Key of initial objective, from the scripted_objectives table.
---@param number_param_a number First numeric parameter - see the documentation for battle_manager:set_objective for more details
---@param number_param_b number Second numeric parameter - see the documentation for battle_manager:set_objective for more details
function battle_manager:update_objective_chain(chain_name, objective_key, number_param_a, number_param_b) end

--- Cancels an escape key callback registered with battle_manager:steal_escape_key_with_callback by name.
---@param callback_name_to_cancel string callback name to cancel
function battle_manager:release_escape_key_with_callback(callback_name_to_cancel) end

--- Prints a string to the console for debug purposes. The string is prepended with a timestamp.
---@param output string output
function battle_manager:out(output) end

--- Returns the attacking alliance object.
function battle_manager:get_attacking_alliance() end

--- Disables or enables pausing.
---@param disable boolean disable
function battle_manager:disable_pausing(disable) end

--- Packaged function to set up a scripted battle on startup, and register a function to be called when the deployment phase ends (i.e. when battle starts). setup_battle will suppress a variety of unit sounds and steal input focus until the combat phase begins.
---@param deployment_end_callback function deployment end callback
function battle_manager:setup_battle(deployment_end_callback) end

--- Returns the automatically-generated script_units collection object, containing a script_unit for every unit, corresponding to the local player's army.
function battle_manager:get_scriptunits_for_local_players_army() end

--- Returns the number of units in the player's alliance under missile fire. battle_manager:start_engagement_monitor must have been called before the battle started for this to work.
function battle_manager:get_num_units_under_fire() end

--- Returns the closest siege vehicle to the supplied position. If no assault equipment is present on the map then nil is returned.
---@param position battle_vector position
function battle_manager:get_closest_vehicle(position) end

--- Cancels a running battle_manager:progress_on_advice_finished process.
---@param name string Name of the progress on advice finished process to cancel.
function battle_manager:cancel_progress_on_advice_finished(name) end

--- Returns the number of alliances in the battle. Currently there should always be two alliances.
function battle_manager:num_alliances() end
