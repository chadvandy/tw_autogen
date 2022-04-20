
---@class battle
local battle = {}

--- Prints some output to the console. If this function is called on a battle_manager object then it is overridden by battle_manager:out, which prepends a timestamp to the output before printing it.
---@param output string output
function battle:out(output) end

--- Shows an assert dialog with the supplied message.
---@param message string message
function battle:error(message) end

--- Creates and returns a battle_alliances object listing all alliances on the battlefield.
function battle:alliances() end

--- Returns the index number of the battle_alliance that corresponds to the player on the local machine. This can be used to look up the player's battle_alliance from within the battle_alliances collection that may be retrieved with battle:alliances. In any singleplayer battle this should return 1.
function battle:local_alliance() end

--- Returns the index number of the battle_army (within the relevant battle_armies collection object) that corresponds to the player on the local machine. This can be used to look up the player's battle_army
function battle:local_army() end

--- Returns whether the local game client is spectating the battle or not.
function battle:is_spectator() end

--- Creates and returns a battle_buildings object listing all buildings on the battlefield.
function battle:buildings() end

--- Creates and returns a battle_assault_equipment object listing all vehicles (such as siege towers and battering rams) on the battlefield.
function battle:assault_equipment() end

--- Creates and returns a battle_debug_drawing object, allowing the script to draw debug lines on the battlefield.
function battle:debug_drawing() end

--- Creates and returns a battle_capture_location_manager object, which can be queried to gain handles to individual battle_capture_location objects.
function battle:capture_location_manager() end

--- Creates and returns a battle_camera object.
function battle:camera() end

--- Creates and returns a battle_subtitles object.
function battle:subtitles() end

--- Creates and returns a battle_reinforcements object.
function battle:reinforcements() end

--- Creates and returns a battle_toggle_system object
function battle:toggle_system() end

--- Creates and returns a battle_composite_scenes_system object
function battle:composite_scenes_system() end

--- Registers a function (by string name) as a handler for input events. Input events are triggered when the player makes certain inputs. Valid input events are:<br />
--- "move forward"<br />
--- "move forward fast"<br />
--- "move backward"<br />
--- "move left"<br />
--- "move right"<br />
--- "rotate right"<br />
--- "rotate left"<br />
--- "move up"<br />
--- "move down"<br />
--- "rotate up"<br />
--- "rotate down"<br />
--- "edge rotate right"<br />
--- "edge rotate left"<br />
--- "edge move left"<br />
--- "edge move right"<br />
--- "edge move forward"<br />
--- "edge move backward"<br />
--- When an input event occurs, the registered function is called with the relevant input event string as a single argument. Note that the function being registered must have already been declared when register_input_handler is called.<br />
--- Once registered, an input handler may be unregistered with battle:unregister_input_handler.
---@param input_handler_function string input handler function
function battle:register_input_handler(input_handler_function) end

--- Unregisters the currently-registered input handler function. An input handler may be registered with battle:register_input_handler.
function battle:unregister_input_handler() end

--- Registers a function (by string name) as a handler for user selection events. These events are triggered when the player selects or deselects units. When such an event occurs, the registered function is called with two arguments - the first being a battle_unit object representing the unit concerned, the second being a boolean flag indicating whether the unit is being selected or deselected. Note that the function being registered must have already been declared when register_unit_selection_handler is called.
---@param input_handler_function string input handler function
function battle:register_unit_selection_handler(input_handler_function) end

--- Unregisters the currently-registered unit selection handler function. A unit selection handler may be registered with battle:register_unit_selection_handler.
function battle:unregister_unit_selection_handler() end

--- Registers a function (by string name) as a handler for command events. Command events are triggered when the player (or script) issues certain commands. When such an event occurs, the registered function is called and passed an event object as a single argument. This object provides several methods which can be used to determine information about the issued command. These methods are listed below:<br />
--- MethodDescription<br />
--- event:get_name()Returns the string name of the issued command. This is provided for every event type.
--- event:get_bool1()Returns a boolean value related to the issued command, if any.
--- event:get_string1()Returns a string value related to the issued command, if any.
--- event:get_position()Returns a battle_vector related to the issued command, if any.
--- event:get_unit()Returns a battle_unit related to the issued command, if any.
--- event:get_building()Returns a battle_building related to the issued command, if any.
--- Note that each event type only provides methods that are relevant. The list of valid event types, and what methods they provide, are listed here:<br />
--- Event TypeEvent DescriptionMethod ProvidedMethod Return TypeMethod Description<br />
--- Group CreatedA group has been createdevent:get_name()stringName of event
--- Group DestroyedA group has been disbandedevent:get_name()stringName of event
--- Repair ModeA command to repair a ship has been issuedevent:get_name()stringName of event
--- <td rowspan=2>Move<td rowspan=2>A movement command has been issuedevent:get_name()stringName of eventevent:get_bool1()booleanIndicates whether the unit is now moving fast/running
--- Move Orientation WidthA movement command with orientation and width has been issuedevent:get_name()stringName of event
--- Move Rotation AngleA rotation command has been issuedevent:get_name()stringName of event
--- <td rowspan=2>Change Speed<td rowspan=2>The speed of a unit has been toggledevent:get_name()stringName of eventevent:get_bool1()booleanIndicates whether the unit is now moving fast/running
--- <td rowspan=3>Attack Unit<td rowspan=3>A command to attack a unit has been issuedevent:get_name()stringName of eventevent:get_bool1()booleanIndicates whether the unit is now moving fast/runningevent:get_unit()battle_unitReturns the target unit
--- <td rowspan=2>Change Skirmish<td rowspan=2>Skirmish mode has been toggled on a unitevent:get_name()stringName of eventevent:get_bool1()booleanIndicates whether skirmish mode is now enabled
--- <td rowspan=2>Change Melee<td rowspan=2>Melee mode has been toggled on a unitevent:get_name()stringName of eventevent:get_bool1()booleanIndicates whether melee mode is now enabled
--- <td rowspan=2>Change Formation<td rowspan=2>A command to change formation has been issuedevent:get_name()stringName of eventevent:get_string1()stringReturns the name of the formation
--- <td rowspan=3>Attack Building<td rowspan=3>A command to attack a building has been issuedevent:get_name()stringName of eventevent:get_bool1()booleanIndicates whether the unit is now moving fast/runningevent:get_building()battle_buildingReturns the target building
--- <td rowspan=3>Climb/Dock Building<td rowspan=3>A command to climb a building has been issuedevent:get_name()stringName of eventevent:get_bool1()booleanIndicates whether the unit is now moving fast/runningevent:get_building()battle_buildingReturns the target building
--- <td rowspan=2>Special Ability<td rowspan=2>A command to use a special ability has been issuedevent:get_name()stringName of eventevent:get_string1()stringReturns the name of the special ability
--- <td rowspan=2>Shot Type<td rowspan=2>A command to change shot type has been issuedevent:get_name()stringName of eventevent:get_string1()stringReturns the name of the shot type
--- Fire At WillFire-at-will mode has been toggled on a unitevent:get_name()stringName of event
--- <td rowspan=2>Broadside Attack<td rowspan=2>A broadside attack command has been issuedevent:get_name()stringName of eventevent:get_bool1()booleanReturns true if the broadside is on the left side of the ship, false otherwise
--- <td rowspan=2>Naval Shot Type<td rowspan=2>A command to change the shot type of a ship has been issuedevent:get_name()stringName of eventevent:get_string1()stringReturns the name of the shot type
--- RamA command to ram a ship has been issuedevent:get_name()stringName of event
--- <td rowspan=2>Withdraw<td rowspan=2>A command to withdraw a unit has been issuedevent:get_name()stringName of eventevent:get_bool1()booleanIndicates whether the unit is now moving fast/running
--- HaltA command to halt a unit has been issuedevent:get_name()stringName of event
--- Double ClickThe double-click UI gesture has been issued for the selected unitsevent:get_name()stringName of event
--- <td rowspan=3>Entity Hit<td rowspan=3>A unit has been hit by a projectileevent:get_name()stringName of eventevent:get_bool1()booleanIndicates whether artillery fired the projectileevent:get_unit()battle_unitReturns the unit that was hit
--- <td rowspan=2>Double Click Unit Card<td rowspan=2>A unit card has been double-clicked uponevent:get_name()stringName of eventevent:get_unit()battle_unitReturns the subject unit
--- <td rowspan=2>Unit Left Battlefield<td rowspan=2>A unit has left the battlefieldevent:get_name()stringName of eventevent:get_unit()battle_unitReturns the subject unit
--- <td rowspan=2>Battle Results<td rowspan=2>The battle has finished and the results have been issuedevent:get_name()stringName of eventevent:get_bool1()booleanIndicates whether the local alliance won the battle
--- Note that the function being registered must have already been declared when register_command_handler is called.
---@param command_handler_function string command handler function
function battle:register_command_handler(command_handler_function) end

--- Unregisters the currently-registered command handler function. A command handler may be registered with battle:register_command_handler.
function battle:unregister_command_handler() end

--- Registers a function (by string name) as a handler for battle phase changes. Battle phase changes are triggered when the battle moves into various distinct phases, the most important being the deployment and deployment (combat) phases. When a battle phase occurs, the registered function is called and passed the string name of the new battle phase as a single argument. Valid phases are listed below:<br />
--- Phase NameDescription<br />
--- StartupThis phase change is triggered after the scripts are loaded.
--- PrebattleWeatherTriggered after Startup phase.
--- PrebattleCinematicTriggered after PrebattleWeather phase.
--- DeploymentDeployment phase, when both alliances get to position their troops prior to combat.
--- DeployedCombat phase, in which the battle is fought.
--- VictoryCountdownA victor for the battle has been determined, and the battle is counting down to completion.
--- CompleteThe battle is completed.
--- Note that the function being registered must have already been declared when register_unit_selection_handler is called. Furthermore, it is recommended that battle_manager:register_phase_change_callback is used in place of this function.
---@param function_name string Function name to call when phase change event occurs.
function battle:register_battle_phase_handler(function_name) end

--- Unregisters the currently-registered phase change handler function. A phase change handler may be registered with battle:register_battle_phase_handler.
function battle:unregister_battle_phase_handler() end

--- Immediately ends the current battle phase, moving on to the next phase. The main use for this function is to force deployment phase to end - calling this function has no effect in combat phase. More information about battle phases can be found in the Battle Phases section of this documentation.
function battle:end_current_battle_phase() end

--- Returns whether a timer exists for the specified function name. If a timer does exist, the amount of model time remaining before it triggers in ms is also returned as a second return parameter.
---@param function_name string function name
function battle:timer_exists(function_name) end

--- Registers a singleshot timer. A function name must be specified as a string, along with an interval. The battle model then calls the function with the given name after the specified interval. No arguments may be specified for the function. Only one timer instance can be registered for a given function - repeated calls to battle:register_singleshot_timer or battle:register_repeating_timer will overwrite any previous timers.<br />
--- It is strongly recommended that client scripts do not call this directly but instead use the battle_manager:callback function, which allows arguments to be passed, multiple instances of timers for the same callback, and more flexible cancellation of the callback.
---@param function_name string Function name.
---@param interval number Interval in ms.
function battle:register_singleshot_timer(function_name, interval) end

--- Registers a repeating timer. A function name must be specified as a string, along with an interval. The battle model then calls the function with the given name each time the specified interval elapses. No arguments may be specified for the function. Only one timer instance can be registered for a given function. Only one timer instance can be registered for a given function - repeated calls to battle:register_singleshot_timer or battle:register_repeating_timer will overwrite any previous timers.<br />
--- It is strongly recommended that client scripts do not call this directly but instead use the battle_manager:repeat_callback function, which allows arguments to be passed, multiple instances of timers for the same callback, and more flexible cancellation of the callback.
---@param function_name string Function name.
---@param interval number Interval in ms.
function battle:register_repeating_timer(function_name, interval) end

--- Unegisters a timer (whether registered with battle:register_singleshot_timer or battle:register_repeating_timer), by it's string function name. In the case of a singleshot function this must be called before the function is triggered. <br />
--- It is strongly recommended that client scripts use battle_manager:callback, battle_manager:repeat_callback and then battle_manager:remove_process due to ease-of-use.
---@param function_name string Function name to unregister.
function battle:unregister_timer(function_name) end

--- Returns the amount of model time that's elapsed since the start of the battle, in milliseconds.
function battle:time_elapsed_ms() end

--- Returns the model tick time in milliseconds. This is the target interval over which the battle model repeatedly updates - 100ms or 200ms.
function battle:model_tick_time_ms() end

--- Returns the duration remaining before the battle time limit expires, in seconds. If no time limit is set then -1 is returned.
function battle:remaining_conflict_time() end

--- Adjusts the game speed. The value supplied should be a unary proportion of normal speed, for example:<br />
--- Set a speed of 1 to run the battle at normal speed.<br />
--- Set a speed of 3 to run the battle at triple speed.<br />
--- Set a speed of 0.5 to run the battle at half speed.<br />
--- Set a speed of 0 to pause the battle.<br />
--- Beware that pausing the battle will prevent model time from advancing, which will also affect script.<br />
--- The battle speed may be restored to the value previously set by the player by calling battle:restore_battle_speed.
---@param battle_speed number battle speed
function battle:modify_battle_speed(battle_speed) end

--- Returns the current game speed.
function battle:current_battle_speed() end

--- Restores the game speed to the value that was previously set when battle:modify_battle_speed was last called.
function battle:restore_battle_speed() end

--- Enables or disables the countdown of the conflict timer. Call with an argument of true to disable the countdown of the conflict timer, or false to enable it again. With conflict time update overridden, time can pass but the victory timer will not count down.
---@param disable_update boolean disable update
function battle:change_conflict_time_update_overridden(disable_update) end

--- Change the victory countdown limit. This is the grace period that begins counting down once a victor in the battle has been determined but before the battle actually ends, and is usually ten seconds. Battle scripts can use this function to adjust the duration of this countdown in order to display outro advice or cutscene content without having it cut off.<br />
--- Supply a limit of less than 0 to make the victory countdown period infinite. If the battle enters the victory countdown phase with an infinite period set, and then a limit of 0 is set with a subsequent call to this function, the battle complete phase will trigger immediately.
---@param time_limit number Time limit in seconds.
function battle:change_victory_countdown_limit(time_limit) end

--- Force battle end to not wait for chasing routers
function battle:force_cant_chase_down_routers() end

--- Preloads a cindy scene. Calling this prior to a cindy scene being played can help prevent a noticeable stall at the start of playback.
---@param scene_path string Path to the cindy scene manager file, from the working data folder.
function battle:cindy_preload(scene_path) end

--- Starts a cindy scene. This plays a cindy cinematic, taking control of the camera. battle:cindy_preload can be called prior to calling this function to preload the scene data.
---@param scene_path string Path to the cindy scene manager file, from the working data folder.
---@param blend_in number Blend in duration in seconds.
---@param blend_out number Blend out duration in seconds.
function battle:cindy_playback(scene_path, blend_in, blend_out) end

--- Starts a cindy scene without a camera track. This can be run in parallel with a scene initiated with battle:cindy_playback. battle:cindy_preload can be called prior to calling this function to preload the scene data.
---@param scene_path string Path to the cindy scene manager file, from the working data folder.
---@param clear_scene boolean Clear animated scenes on completion.
---@param save_to_replay boolean Saves the cindy scene into the battle replay, so if the replay is loaded the cindy scene plays again.
function battle:cindy_playback_no_camera(scene_path, clear_scene, save_to_replay) end

--- Stops a cindy scene that was started with battle:cindy_playback.
---@param clear_animated_scenes boolean clear animated scenes
function battle:stop_cindy_playback(clear_animated_scenes) end

--- Stops a cindy scene that was started with battle:cindy_playback_no_camera.
---@param clear_animated_scenes boolean clear animated scenes
function battle:stop_cindy_playback_no_camera(clear_animated_scenes) end

--- Starts a composite scene. The composite scene should be specified by its path from the working data folder.
---@param scene_key string Composite scene key.
function battle:start_terrain_composite_scene(scene_key) end

--- Stops a composite scene. The composite scene should be specified by its path from the working data folder.
---@param scene_key string Composite scene key.
function battle:stop_terrain_composite_scene(scene_key) end

--- Manually triggers an aide-de-camp message at a specified location on the battlefield.
---@param adc_key string Aide-de-camp key, from the aide_de_camp_speeches database table.
---@param x number X co-ordinate of message, in m.
---@param y number Y co-ordinate (altitude) of message, in m.
---@param z number Z co-ordinate of message, in m.
---@param for_player boolean Aide-de-camp message is for the player's alliance.
function battle:play_adc(adc_key, x, y, z, for_player) end

--- Prevents advice from being triggered with common.advance_contextual_advice_thread, which has the effect of suspending advice not triggered deliberately by battle scripts. This has been made largely redundant by changes in the way scripts trigger advice, but can still be called.
---@param should_suspend boolean should suspend
function battle:suspend_contextual_advice(should_suspend) end

--- Dismisses the advisor, if currently shown.
function battle:close_advisor() end

--- Returns whether or not any advice is currently playing. A value of true is returned if no advice is playing, false if it is.
function battle:advice_finished() end

--- Returns whether or not any voiceover sounds are currently playing. A value of true is returned if no voiceover sounds are playing, false otherwise.
function battle:vo_finished() end

--- Disables or re-enables unit voices in battle. If unit voices are suppressed, ambient voiceover related to units will not be played.
---@param should_suppress boolean should suppress
function battle:suppress_unit_voices(should_suppress) end

--- Disables or re-enables unit musicians in battle.
---@param should_suppress boolean should suppress
function battle:suppress_unit_musicians(should_suppress) end

--- Enables or disables the automatic management of music by the game. Music-auto-playback should be disabled using this function if music is to be scripted.
---@param auto_playback boolean Automatic music playback enabled.
function battle:set_music_auto_playback(auto_playback) end

--- Sets whether scripted music should loop.
---@param should_loop boolean should loop
function battle:set_music_loop(should_loop) end

--- Plays a specified piece of music. The music to play is specified by its sound event name.
---@param music_name string music name
function battle:play_music(music_name) end

--- Plays a specified piece of music with a custom fade-in duration. The music to play is specified by its sound event name.
---@param music_name string Music sound event.
---@param fade_time number Fade time in seconds.
function battle:play_music_custom_fade(music_name, fade_time) end

--- Stops the currently-playing music.
---@param skipped boolean whether this stop was because of a skipped cutscene
function battle:stop_music(skipped) end

--- Stops the currently-playing music with a custom fade time.
---@param skipped boolean whether this stop was because of a skipped cutscene
---@param fade_time number Fade time in seconds.
function battle:stop_music_custom_fade(skipped, fade_time) end

--- Gets the volume level of a specific volume type. Valid volume types are given in the Volume Types section of this documentation. The volume level will be returned as a number between 0 (inaudible) and 100 (full volume).
---@param volume_type number volume type
function battle:get_volume(volume_type) end

--- Sets the volume level of a specific volume type. Valid volume types are given in the Volume Types section of this documentation. The volume level should be set as a number between 0 (inaudible) and 100 (full volume).
---@param volume_type number volume type
---@param volume_level number volume level
function battle:set_volume(volume_type, volume_level) end

--- Gradually fades the volume level of a specified volume type to a specified value over a specified interval. Valid volume types are given in the Volume Types section of this documentation. The volume level should be set as a number between 0 (inaudible) and 100 (full volume).
---@param volume_type number Volume type.
---@param target_level number Target volume level.
---@param fade_time number Fade time in seconds.
function battle:fade_volume(volume_type, target_level, fade_time) end

--- Sets the value of the given music vm variable, this can be read by the battle music script
---@param variable_name string variable name
function battle:set_music_vm_variable(variable_name) end

--- Adds a 3d ping marker model at a specified [x/y/z] position. It is sufficient just to supply the position, but a type can be used to change the model displayed - see the table below for a list of ping types.<br />
--- List of ping types:<br />
--- Type NumberType Name
--- 0MPT_NONE
--- 1MPT_STANDARD
--- 2MPT_MOVE
--- 3MPT_ATTACK
--- 4MPT_DEFEND
--- 5MPT_HELP_MOUNTABLE_ARTILLERY
--- 6MPT_HELP_DISEMBARK
--- 7MPT_NOTIFICATION
--- 8MPT_SCRIPT_LOOK_AT
--- 9MPT_SCRIPT_MOVE_TO
--- 10MPT_SCRIPT_SELECT
--- 11MPT_SCRIPT_POINTER
--- 12MPT_SCRIPT_LOOK_AT_VFX
--- 13MPT_SCRIPT_MOVE_TO_VFX
--- 14MPT_SCRIPT_SELECT_VFX
--- 15MPT_SCRIPT_OBJECTIVE
--- 16MPT_SCRIPT_BATTLE_TRAP
--- The waypoint flag can be used to link models together. The rotation flag can be used to specify a rotation for the model - the default is to just fade the camera.
---@param x number X co-ordinate in metres.
---@param y number Y co-ordinate (altitude) in metres. This parameter specifies the height above the water plane, so if mis-set the marker can appear under the ground.
---@param x number X co-ordinate in metres.
---@param type number Marker type - see list of valid marker types above.
---@param is_waypoint boolean Is waypoint.
---@param rotation number Rotation.
function battle:add_ping_icon(x, y, x, type, is_waypoint, rotation) end

--- Removes the ping marker that was previously added with battle:add_ping_icon at a specified [x/y/z] position.
---@param x number X co-ordinate in metres.
---@param y number Y co-ordinate (altitude) in metres.
---@param x number X co-ordinate in metres.
function battle:remove_ping_icon(x, y, x) end

--- Shows an objective message on-screen. This is an old method of showing an objective-style message, which will fade in at the bottom-centre of the screen, remain on-screen for a specified period and then fade out.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param duration number Duration that the objective should remain on-screen in ms.
---@param fade_duration number Duration over which the objective should fade to transparent once its display duration has elapsed.
function battle:show_objective(objective_key, duration, fade_duration) end

--- Adds an animated arrow on the terrain that can be used to indicate a path for the player. The arrow will animate between two or four supplied battle_vector positions.<br />
--- The function returns a numeric index for the animated arrow. If necessary, this can be used to remove the arrow with battle:remove_animated_arrow.
---@param animation_time number Time over which the arrow animation should play, in seconds.
---@param remain_time number Time for which the arrow should remain after its animation has finished, in seconds.
---@param loop boolean Sets whether the animation should loop indefinitely. If this is set then battle:remove_animated_arrow is the only method of removing the arrow.
---@vararg any
function battle:add_animated_arrow(animation_time, remain_time, loop, positions) end

--- Removes an animated arrow previously added with battle:add_animated_arrow. The arrow to remove is specified by the numeric index returned by add_animated_arrow.
---@param arrow_index number arrow index
function battle:remove_animated_arrow(arrow_index) end

--- Plays a fullscreen movie during a battle. The movie should be specified by a file path from the Movies folder in working data (see the videos table for examples of valid paths).
---@param movie_path string Path to movie file. The file extension may be omitted.
---@param play_movie_audio boolean Play movie audio - if false is supplied then game audio is heard instead.
function battle:play_movie(movie_path, play_movie_audio) end

--- Returns whether or not a fullscreen movie is currently playing.
function battle:is_movie_playing() end

--- Searches from the root uicomponent for a uicomponent with the specified name, returning the first that matches. It is encouraged that find_uicomponent is used in place of this function.
---@param uicomponent_name string uicomponent name
function battle:ui_component(uicomponent_name) end

--- Enables or disables a script lock on the state of the cinematic UI. Additional parameters may be used to enable/disable the mouse cursor and cinematic bars respectively.<br />
--- Note that it is rare for clients scripts to need to call this directly - consider using the cutscene functionality provided by the script libraries.
---@param enable_cinematic_ui boolean Enable or disables the script lock on the cinematic UI. By setting this, the script will lock the state of the cinematic UI (whether the cursor is shown, or the cinematic bars are visible). If this is set the wider UI will not be able to show/unshow the cursor or cinematic bars until the lock is disabled again.
---@param show_cursor boolean Shows or hides the cursor. If this flag is not supplied then the state of the cursor will remain unchanged.
---@param enable_cinematic_bars boolean Enables the cinematic bars. If this flag is not supplied then the state of the cinematic bars will remain unchanged.
function battle:enable_cinematic_ui(enable_cinematic_ui, show_cursor, enable_cinematic_bars) end

--- Enables or disables the unit IDs - the flags or icons floating above each unit in battle. This provides exactly the same functionality as battle:set_banners_enabled, except the removal/reinstatement of banners in this case will be preserved in replays.<br />
--- Note that the cutscene functionality provided by the script libraries automatically disables unit ids while the cutscene is playing - use cutscene:set_should_disable_unit_ids to disable this for a given cutscene rather than calling this function directly.
---@param show_ids boolean show ids
function battle:enable_unit_ids(show_ids) end

--- Enables or disables the cinematic camera. The cinematic camera is not limited by altitude or proximity to the player's army - it can be positioned anywhere on the battlefield, including below the ground. This can be enabled for cutscenes but should be disabled for live gameplay.<br />
--- Note that it is rare for clients scripts to need to call this directly - consider using the cutscene functionality provided by the script libraries. A cutscene can be prevented from enabling the cinematic camera with cutscene:set_should_enable_cinematic_camera.
---@param enable_cinematic_camera boolean enable cinematic camera
function battle:enable_cinematic_camera(enable_cinematic_camera) end

--- Enables or disables tooltips.
---@param enable_tooltips boolean enable tooltips
function battle:enable_tooltips(enable_tooltips) end

--- Forces tooltips into minimised mode.
---@param set_minimised_tooltips boolean set minimised tooltips
function battle:force_minimised_tooltips(set_minimised_tooltips) end

--- Disables or enables grouping functionality.
---@param disable_grouping boolean disable grouping
function battle:disable_groups(disable_grouping) end

--- Disables or enables formations functionality.
---@param disable_formations boolean disable formations
function battle:disable_formations(disable_formations) end

--- Disables or enables the giving of any orders at all.
---@param disable_orders boolean disable orders
function battle:disable_orders(disable_orders) end

--- Steals the escape key from the UI. This prevents the UI from intercepting ESC key presses and allows script to detect and process them instead. When the escape key is stolen, a script function called Esc_Key_Pressed will be called when the escape key is pressed by the player.<br />
--- Note that the escape key will remain stolen from the UI until battle:release_escape_key is called.
function battle:steal_escape_key() end

--- Releases the stolen escape key from the script, allows the UI to intercepting ESC key presses again. This must be called at some point after battle:steal_escape_key is called.
function battle:release_escape_key() end

--- Steals all keyboard input from the UI, effectively disabling the keyboard in the game. After input focus is stolen by a call to this function, it must be released again with battle:release_input_focus at some point.
function battle:steal_input_focus() end

--- Releases keyboard input back to the UI after its theft with battle:steal_input_focus.
function battle:release_input_focus() end

--- Disables or re-enables a keyboard shortcut by name. A list of keyboard shortcuts is available from the UI team.
---@param shortcut_name string shortcut name
---@param should_disable boolean should disable
function battle:disable_shortcut(shortcut_name, should_disable) end

--- Enables or disables the unit IDs - the flags or icons floating above each unit in battle. This provides exactly the same functionality as battle:enable_unit_ids, except the removal/reinstatement of banners in this case will be not preserved in replays.<br />
--- Note that the cutscene functionality provided by the script libraries automatically disables unit ids while the cutscene is playing - use cutscene:set_should_disable_unit_ids to disable this for a given cutscene rather than calling this function directly.
---@param show_ids boolean show ids
function battle:set_banners_enabled(show_ids) end

--- Returns whether this battle is a replay.
function battle:is_replay() end

--- Returns the value of the is_tutorial flag. This can be set in the battle setup to activate certain behaviours.
function battle:is_tutorial() end

--- Returns whether this battle is running in multiplayer mode.
function battle:is_multiplayer() end

--- Returns whether this is a battle fought from campaign.
function battle:is_from_campaign() end

--- Returns whether this battle is a quest battle.
function battle:is_quest_battle() end

--- Returns the value of the prepare_for_fade_in flag. This can be set in the battle setup to show a black screen when the battle starts up.
function battle:prepare_for_fade_in() end

--- Returns whether a victor has been decided in the battle, or whether the battle has been determined to be a draw. This happens when the VictoryCountdown phase change occurs.
function battle:battle_outcome_decided() end

--- Returns the id of the alliance which has won the battle. If battle results are not finalised then 0 is returned. If the battle result is drawn then -1 is returned.
function battle:victorious_alliance() end

--- Returns true if the battle result has been finalised and is a draw, or false otherwise.
function battle:is_draw() end

--- Returns whether or not the battle is a siege battle.
function battle:is_siege_battle() end

--- Returns whether or not the battle is an ambush battle.
function battle:is_ambush_battle() end

--- Returns whether this is a storm of magic battle.
function battle:is_storm_of_magic_battle() end

--- Returns the battle type as a string.
function battle:battle_type() end

--- Returns the unit scale factor as a multiplier. The value returned is a multiplier of the unit size if the scale is set to ultra, so the multiplier should be greater than 0 and less than or equal to 1.
function battle:unit_scale_factor() end

--- Returns the unit scale factor index. This is 0 for small unit sizes, 1 for normal unit sizes, 2 for large unit sizes and 3 for ultra unit sizes.
function battle:unit_scale_factor_index() end

--- Returns the height of the terrain at the specified x/y co-ordinates. This is intended for use to calculate camera and ping marker positions.
---@param x number X co-ordinate in m.
---@param y number Y co-ordinate in m.
function battle:get_terrain_height(x, y) end

--- Returns whether an area is clear of pathfinding restrictions. The area is specified by a position, a bearing, and the width/depth of a bounding box centred at that position and drawn at that bearing.
---@param position battle_vector Position.
---@param bearing number Bearing in degrees.
---@param width number Width of oriented-bounding box in metres.
---@param depth number Depth of oriented-bounding box in metres.
---@param is_naval boolean Is the area on sea.
function battle:is_area_clear(position, bearing, width, depth, is_naval) end

--- Returns the ground type at a supplied position.
---@param position battle_vector position
function battle:ground_type(position) end

--- Generate a battle-synchronised random number between 0 and 1.
function battle:random_number() end

--- Returns whether this battle has been loaded in benchmarking mode or not. This should only return true if the battle was loaded through the benchmark menu on the frontend.
function battle:is_benchmarking_mode() end

--- Ends a currently-running benchmark, showing benchmarking statistics and ending the battle.
function battle:end_benchmark() end

--- Causes the game to completely shut down.
function battle:quit_to_windows_from_script() end

--- Returns a path to the screenshots directory. This is used by the autotest system.
function battle:appdata_screenshots() end

--- Enables or disables a unit attribute for all units on the battlefield. Attribute keys are listed in the Unit Attributes section of this documentation.
---@param attribute_key string attribute key
function battle:set_stat_attribute(attribute_key) end

--- Activates or deactivates a special ability flag for all units on the battlefield. Valid special ability flags are listed in the Special Ability Flags section of this documentation.
---@param flag_key string flag key
function battle:set_special_abilities_flags(flag_key) end

--- Disable all abilities on the battle
function battle:disable_all_abilities() end

--- Disable all abilities on the battle
function battle:enable_all_abilities() end

--- Notifies the game that a survival battle has started.
function battle:notify_survival_started() end

--- Notifies the game how many total waves there are in a survival battle.
function battle:notify_survival_total_waves() end

--- Instructs the game that a survival battle wave has changed state. This function is used to create a new survival battle wave, or update the state of an existing wave. Waves are specified a numeric index, starting from 0 - if a wave index is specified that the system has not seen before, then a new wave is started.<br />
--- A survival battle wave can occupy one of three states - incoming, in_progress or defeated. The new state of the wave must be specified as a string.
---@param wave_index number Index of survival battle wave to update (or create, if index has not been used before).
---@param new_state string New state of survival battle wave, either incoming, in_progress or defeated.
---@param is_final_wave boolean Is this wave the final wave in the battle.
function battle:notify_wave_state_changed(wave_index, new_state, is_final_wave) end

--- Instructs the game that a survival battle wave unit composition has been changed on a specific wave id.<br />
--- A survival battle wave can occupy one of three states - incoming, in_progress or defeated. The new state of the wave must be specified as a string.
---@param wave_index number Index of survival battle wave to update (or create, if index has not been used before).
---@param new_state string New state of survival battle wave, either incoming, in_progress or defeated.
---@param is_final_wave boolean Is this wave the final wave in the battle.
function battle:notify_wave_units_changed(wave_index, new_state, is_final_wave) end

--- Updates the progress bar on the UI of the specified survival battle wave. This gives the player an indication of how far through the wave they are.
---@param wave_index number Index of survival battle wave to update. This should match the index of the wave previously specified to battle:notify_wave_state_changed.
---@param progress number Progress of the survival battle wave, specified as a unary (0-1) value.
function battle:notify_wave_progress_changed(wave_index, progress) end

--- Notifies the game that all survival battle waves are completed. This informs battle victory conditions related to survival battle waves that the survival battle has been successfully completed.
function battle:notify_survival_completion() end

--- Ends the battle in favour of one side or the other. A draw may also be specified.<br />
--- A reason string must be specified from the following list:<br />
--- none<br />
--- timeout<br />
--- kill_or_rout<br />
--- kill_enemy<br />
--- capture_settlement<br />
--- capture_locations<br />
--- sink_or_surrender_fleet<br />
--- autoresolve<br />
--- surrender<br />
--- mp_disconnected<br />
--- scripted<br />
--- capture_baggage_train<br />
--- avatar_autoresolve<br />
--- mp_insufficient_human_players<br />
--- scored_resoultion<br />
--- tug_of_war<br />
--- capture_location_score<br />
--- wave_completion<br />
--- capture_tickets<br />
--- kill_or_rout_ignore_reinforcements<br />
--- kill_or_rout_no_support_available<br />
--- decision
---@param winning_alliance_number number Winning alliance number. If 0 is supplied then the battle will end as a draw.
---@param reason string Reason why the battle is ending - see list above.
---@param immediate boolean End the battle immediately. If false the battle will end in the next conflict phase update.
---@param force_winner boolean Force the winning alliance value. If false is supplied the winning alliance will only be set if the battle has not already decided on a victor.
function battle:force_battle_end(winning_alliance_number, reason, immediate, force_winner) end

--- Forces a particular result for the battle being fought, for either the winner or the loser of the battle.
---@param result_key string Result key, from the battle_result_types database table.
---@param for_winner boolean Is the result for the battle winner - supply false to apply the result for the loser instead.
function battle:force_custom_battle_result(result_key, for_winner) end

--- Trigger a projectile launch from one position to another. Be careful to shoot downwards if you have artillery projectiles, as they are designed to be lobbed.
---@param projectile_key string Projectile key from the projectiles table.
---@param launch_position battle_vector Launch position.
---@param target_position battle_vector Target position.
function battle:trigger_projectile_launch(projectile_key, launch_position, target_position) end

--- Unlocks a steam achievement by string key. Achievements have to be set up elsewhere to be unlockable with this function.
---@param achievement_key string achievement key
function battle:unlock_achievement(achievement_key) end

--- Writes out a battle xml file with the supplied filename containing the current battle setup. This can be useful for creating scripted battles.
---@param filename string filename
function battle:output_battle_xml(filename) end

--- Called by the unit balance tests. Saves the unit pair battle statistics and stats in DBLOG. (text file or SQL database depending of build the configuration. 
---@param engagement_winner battle_unit unit_1
function battle:save_unit_pair_balance_data(engagement_winner) end
