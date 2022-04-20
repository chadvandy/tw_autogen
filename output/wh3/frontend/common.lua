
---@class common
local common = {}

--- Potentially adds the supplied ancillary to the character in the supplied context. When called, the function generates a random number between 0-100, and if this number is less than or equal to the supplied chance value, then the ancillary is added. The character to add the ancillary to is specified in the supplied context object, which must be a context object created by a character event (e.g. CharacterCompletedBattle, CharacterCreated).<br />
--- This function is somewhat archaic and should only be used in exported ancillary scripts. For general script usage force_add_ancillary is greatly preferred.
---@param ancillary_key string Ancillary key, from the ancillaries table.
---@param chance number Percentage chance that the ancillary will actually be added.
---@param context userdata Context object, provided by a character event.
function common:ancillary(ancillary_key, chance, context) end

--- Potentially adds the supplied trait points to the trait-recipient in the supplied context. When called, the function generates a random number between 0-100, and if this number is less than or equal to the supplied chance value then the trait points are added. The trait recipient is specified in the supplied context object, and the type of recipient must also be specified by a supplied string.<br />
--- This function is somewhat archaic and should only be used in exported trait scripts. For adding traits to characters in general scripts force_add_trait is greatly preferred.
---@param trait_key string Trait key, from the traits table.
---@param applicable_to string Specifies the type of object to apply the trait to. Valid strings here are agent (for all characters), region and unit. Not all recipient types may currently be supported.
---@param points number Number of trait points to add, if successful.
---@param chance number Percentage chance that the trait will actually be added.
---@param context userdata Context object, provided by an event.
function common:trait(trait_key, applicable_to, points, chance, context) end

--- Opens the in-game web browser with the supplied encyclopedia url.
---@param encyclopedia_url string encyclopedia url
---@param context userdata Context object, provided by an event.
function common:OpenBrowser(encyclopedia_url, context) end

--- Prevents advice from being triggered with common.advance_contextual_advice_thread. This can be useful for tutorials, but is not used by modern advice systems.
---@param should_suspend boolean should suspend
function common:suspend_contextual_advice(should_suspend) end

--- Directs the advisor to display the supplied advice string. This should only be used for debugging since localisation is bypassed.
---@param text string text
function common:advice(text) end

--- Directs the advisor to advance the specified thread by the supplied score increase. If any advice on that thread subsequently becomes eligible to be issued, then that advice is issued.
---@param advice_key string Advice key, from the advice_threads table.
---@param score_increase number Score to increase the advice thread by.
function common:advance_scripted_advice_thread(advice_key, score_increase) end

--- 
---@param advice_key string Advice key, from the advice_threads table.
---@param score_increase number Score to increase the advice thread by.
---@param x number X display co-ordinate to associate the advice with.
---@param y number Y display co-ordinate to associate the advice with.
function common:advance_scripted_advice_thread_located(advice_key, score_increase, x, y) end

--- Returns the advice thread score. This can indicate whether advice on this thread has already been played.
---@param thread_key string Advice thread key, from the advice_threads table.
function common:get_advice_thread_score(thread_key) end

--- Increments the advice thread score by the supplied amount, without playing any advice.
---@param thread_key string Advice thread key, from the advice_threads table.
---@param score number score
function common:increment_advice_thread_score(thread_key, score) end

--- Stores a key in the advice history, which can subsequently be tested with common.get_advice_history_string_seen. This allows scripts to test whether the player has ever encountered certain conditions in their playing history (e.g. "has ever started game"). The flag will be reset if the player resets their advice history.
---@param key string key
function common:set_advice_history_string_seen(key) end

--- Returns whether a key has ever been set in the advice history with common.set_advice_history_string_seen.
---@param key string key
function common:get_advice_history_string_seen(key) end

--- Returns the current advice level setting. The following table indicates potential returned values:<br />
--- Returned ValueAdvice Level<br />
--- 0Minimal
--- 1Low
--- 2High
function common:get_advice_level() end

--- Clears out the advice session history. This is the list of advice shown in this particular game session, accessed by the next/previous buttons on the advisor panel.
function common:clear_advice_session_history() end

--- Triggers a keyboard shortcut event. Valid shortcut events are defined in data\text\default_keys.xml.
---@param shortcut_name string shortcut name
function common:trigger_shortcut(shortcut_name) end

--- Simulates a key down followed by a key up key event. Valid key events are listed here: Simulating Keyboard Events
---@param event string event
function common:key_press(event) end

--- Triggers a key down key event. Note that the game will think the key is held down until a key up event is received. Valid key events are listed here: Simulating Keyboard Events
---@param event string event
function common:key_down(event) end

--- Triggers a key up event. Valid key events are listed here: Simulating Keyboard Events.
---@param event string event
function common:key_up(event) end

--- Triggers a mouse event at a specified position. Valid mouse events are listed in the cursor_mouse_events table.
---@param event string event
---@param screen_pos_x number screen pos x
---@param screen_pos_y number screen pos y
function common:mouse_event(event, screen_pos_x, screen_pos_y) end

--- Compels all uicomponents to fires UI script events such as ComponentMouseOn and ComponentAnimationFinished, regardless of whether they have a ScriptEventReporter callback set on them. This should only be used by modders since they can't modify ui layouts easily in order to add ScriptEventReporter callbacks. The game will throw an error if this is called in a configuration other than final release.
---@param force_reporting boolean Force reporting of script events on or off. Reporting is off by default, except when running an autotest.
function common:force_report_of_all_ui_script_events(force_reporting) end

--- Directs the advisor to consider issuing advice on the supplied advice thread. The supplied number of points are added to the thread - if a record from the advice_levels table subsequently becomes eligible to be issued, then that advice is issued.
---@param advice_thread string Advice thread key.
---@param points number Points to add to thread.
---@param context userdata context object supplied by game event.
function common:advance_contextual_advice_thread(advice_thread, points, context) end

--- Returns whether audio for any advice is currently playing.
function common:is_advice_audio_playing() end

--- Sets the volume level of a specific volume type. Valid volume types are given in the Volume Types section of this documentation. The volume level should be set as a number between 0 (inaudible) and 100 (full volume).
---@param volume_type number volume type
---@param volume_level number volume level
function common:set_volume(volume_type, volume_level) end

--- Gets the volume level of a specific volume type. Valid volume types are given in the Volume Types section of this documentation. The volume level will be returned as a number between 0 (inaudible) and 100 (full volume).
---@param volume_type number volume type
function common:get_volume(volume_type) end

--- Gradually fades the volume level of a specified volume type to a specified value over a specified interval. Valid volume types are given in the Volume Types section of this documentation. The volume level should be set as a number between 0 (inaudible) and 100 (full volume).
---@param volume_type number Volume type.
---@param target_level number Target volume level.
---@param fade_time number Fade time in seconds.
function common:fade_volume(volume_type, target_level, fade_time) end

--- Oneshot triggers a sound event with the sound engine with no position information. This is not suitable for long running events or looping events.
---@param sound_event_name string sound event name
function common:trigger_soundevent(sound_event_name) end

--- Returns whether the specified boolean user preference setting is true or not.
---@param preference_key string preference key
function common:pref_as_bool(preference_key) end

--- Returns the numeric value of the specified floating point user preference. Floating point number values will be marked with &lt;float&gt; in the preferences file.
---@param preference_key string preference key
function common:pref_as_float(preference_key) end

--- Returns the numeric value of the specified integer user preference. Integer values will be marked with &lt;int&gt; in the preferences file.
---@param preference_key string preference key
function common:pref_as_integer(preference_key) end

--- Returns the value of the specified tweaker as a string. Tweakers are game settings that may be easily set and changed during development, through methods such as startup scripts or the game console.
---@param tweaker_name string tweaker name
function common:tweaker_value(tweaker_name) end

--- Returns the game version string.
function common:game_version() end

--- Returns whether the game is currently running in autotest mode.
function common:is_autotest() end

--- Performs a VFS lookup of the supplied file and path, and returns whether the file exists in the virtual file system. The path should be specified from the working data folder.
---@param path string Path from data/ in which to look.
function common:vfs_exists(path) end

--- Returns the absolute file path of the game's working data directory.
function common:vfs_working_directory() end

--- Performs a VFS lookup in the specified relative path (root is data/) for files matching the supplied pattern. Returns a comma-delimited list of files found.
---@param path string Path from data/ in which to look.
---@param pattern string Search pattern.
function common:filesystem_lookup(path, pattern) end

--- Takes a screenshot and writes a tga file with the supplied filename. If no path is specified with the filename then the screenshot file is written into the binaries folder. The file path to the screenshots folder in appdata may be retrieved with common.get_appdata_screenshots_path.
---@param screenshot_filename string screenshot filename
function common:take_screenshot(screenshot_filename) end

--- Returns the full path to the screenshots directory in appdata.
function common:get_appdata_screenshots_path() end

--- Pauses or resumes VTune profiler. Supply true to pause or false to resume.
---@param pause boolean pause
function common:VTune_pause_resume(pause) end

--- Returns the icon path for the supplied ping icon type, specified by a numeric index. This allows script to create its own pings that don't go through the ping system (like ping icons attached to units - see <a href="../battle/script_unit.html#function:script_unit:add_ping_icon">script_unit:add_ping_icon). This function works in battle only.
---@param ping_type number ping type
function common:PingIconPath(ping_type) end

--- Retrieves a localised string from the database by its full localisation key. This is in the form [table]_[field]_[record_key]. If the lookup fails, an empty string is returned.
---@param localisation_key string localisation key
function common:get_localised_string(localisation_key) end

--- Returns whether subtitles are enabled or not in the player's preferences.
function common:subtitles_enabled() end

--- Returns the number of movies that can be played in parallel.
function common:num_movies_that_can_play_in_parallel() end

--- Returns whether a movie is currently playing on a specified track.
function common:is_movie_playing_on_track() end

--- Returns whether any movie is currently playing.
function common:is_any_movie_playing() end

--- Stops any currently playing movies.
function common:stop_all_movies() end

--- Returns the current frame number for the movie playing on the specified movie track. 0 is returned if no movie is playing.
function common:get_movie_current_frame_num() end

--- Returns the total number of frames in the movie playing on the specified movie track. 0 is returned if no movie is playing.
function common:get_movie_total_frames() end

--- Returns the duration in seconds of the movie playing on the specified movie track. 0 is returned if no movie is playing.
function common:get_movie_duration() end

--- Pass a shortcut key (see working_data/text/default_keys.xml) and a bool for enabling/disabling the shortcut
---@param true_to_enable string shortcut key (see (see working_data/text/default_keys.xml)
function common:enable_shortcut(true_to_enable) end

--- Pass a bool for enabling/disabling all shortcuts
---@param true_to_enable boolean false to disable
function common:enable_all_shortcuts(true_to_enable) end

--- Sets a custom text entry for display on the next loading screen. The text must be specified by a key corresponding to a record in the scripted_objectives table.
---@param key string key
function common:set_custom_loading_screen_text(key) end

--- Sets a record from the custom_loading_screens table to use for the next loading screen. The record is specified by string key.
---@param key string key
function common:set_custom_loading_screen_key(key) end

--- Specifies a layout from the working data/ui/loading_ui/ folder and a json data-file from the working data/ui/loading_ui/dynamic_loading_screen_data folder which drive a sequence of context-driven events throughout the next loading sequence.
---@param json_filename string JSON filename, from the data/ui/loading_ui/dynamic_loading_screen_data folder.
---@param layout_name string Layout name, from the data/ui/loading_ui/ folder.
function common:setup_dynamic_loading_screen(json_filename, layout_name) end

--- Will create a CcoScriptObject to context cache with specified value (or update existing objects value), and send notification of change so ContextInitScriptObject can refresh display of self and children
---@param unique_id string the unique id for the value so can set and get the value
function common:set_context_value(unique_id) end

--- Will look up the context object from the context cache or construct one with the type "context_object_typename" and the data (usually a CQI) from "construction_data", call the context function specified by context_function_id and return the value.
---@param object_id string Context object id on which to call the function. If omitted, the function is called on the CcoScriptObject object.
---@param function_id string Function id on the context object to call. This can also be an expression, but the result must return a context id.
function common:get_context_value(object_id, function_id) end

--- Calls a specified function on a specified context object that makes changes to the game. This allows script to use the context system to modify the state of the game.
---@param object_id string Context object id on which to call the function. If omitted, the function is called on the CcoScriptObject object.
---@param function_id string Function id on the context object to call. This can be expression.
function common:call_context_command(object_id, function_id) end

--- Triggers an error dialog which contains callstack of calling lua, useful for debugging.
---@param error_msg string error_msg
function common:show_error_with_callstack(error_msg) end

--- Triggers an error dialog without any callstack.
---@param error_msg string error_msg
function common:show_error(error_msg) end
