--- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT MANUALLY.

---@class cutscene
local cutscene = {}

--- Creates a cutscene object. A cutscene must be given a string name, an object granting control over the player's army (to allow it to be taken away during the cutscene), a length, and, optionally, a function to call when the cutscene finishes.
---@param name string Name for cutscene.
---@param unit_controller any Either a unitcontroller with control over the player's army, or a script_units collection containing all of the player's units.
---@param duration number Cutscene duration in milliseconds. If nil or 0 is specified then the cutscene will be set to not end, and will only finish when skipped by the player or ended by an external process - see cutscene:set_do_not_end.
---@param end_callback function End callback. A callback is usually specified here, although not always.
---@return cutscene  cutscene object 
function cutscene:new(name, unit_controller, duration, end_callback) end

--- Creates a cutscene object that is bound to a cindyscene. When started, the scripted cutscene will automatically start the cindyscene, and will terminate when the cindyscene ends.
---@param name string Unique name for the cutscene.
---@param unit_controller any Either a battle_unitcontroller with control over the player's army, or a script_units collection containing all of the player's units.
---@param end_callback function End callback.
---@param cindy_scene string Cindy scene path.
---@param blend_in number Blend in time, in seconds.
---@param blend_out number Blend out time, in seconds.
---@return cutscene  cutscene object 
function cutscene:new_from_cindyscene(name, unit_controller, end_callback, cindy_scene, blend_in, blend_out) end

--- Sets the cutscene into debug mode for more output. Setting debug mode on a cutscene also allows the camera to be moved during cutscene playback, and keeps the UI visible.
---@param set_debug boolean Set cutscene into debug mode.
function cutscene:set_debug(set_debug) end

--- Instructs the cutscene to print a debug timestamp every model tick. This can be useful when trying to set up timings for cutscene events.
---@param enable_timestamps boolean enable timestamps
function cutscene:enable_debug_timestamps(enable_timestamps) end

--- Registers a new cinematic trigger listener. When the cindy scene triggers a script event with the supplied id in script, the supplied function is called.
---@param id string Cinematic trigger id. This should match the an id of a cinematic event triggered from a cindy scene played during this cutscene.
---@param callback function Callback to call.
function cutscene:add_cinematic_trigger_listener(id, callback) end

--- Adds an action to the cutscene. Specify a function callback to be called, and a time after the start of the cutscene to call it in ms. If relative mode has been set with cutscene:set_relative_mode then the specified time should instead be relative to the previously-enqueued action.
---@param action_callback function Action callback.
---@param action_time number Action time in ms. This can be 0, but cannot be greater than the length of the cutscene.
function cutscene:action(action_callback, action_time) end

--- Instructs the cutscene to play a sound. This sound is registered to the cutscene, so that it can query its status later and also stop it if the cutscene is skipped.
---@param sound battle_sound_effect sound
function cutscene:play_sound(sound) end

--- Instructs the cutscene to play a sound at a specified script_unit in 3D space. This sound is registered to the cutscene, so that it can query its status later and also stop it if the cutscene is skipped.
---@param sound battle_sound_effect sound
---@param target_sunit script_unit target sunit
function cutscene:play_vo(sound, target_sunit) end

--- Instructs a running cutscene to stall its progress until the advisor has finished speaking. This is designed to be called during a cutscene action to prevent one item of advice from colliding with another piece of advice, sound, or other event that it shouldn't overlap with. Since the length of an item of advice varies from language to language, it's sensible to insert wait_for_advisor calls into a cutscene script before starting subsequent advice.
function cutscene:wait_for_advisor() end

--- Instructs a running cutscene to stall its progress until any sounds started with cutscene:play_sound or cutscene:play_vo have finished. This is designed to be called during a cutscene action to prevent one sound from colliding with another sound or event that it shouldn't overlap with. Since the length of a localised sound varies from language to language, it's sensible to insert wait_for_vo calls into a cutscene script before starting subsequent sounds.
function cutscene:wait_for_vo() end

--- Returns a subtitles object stored internally by the cutscene.
---@return subtitles   
function cutscene:subtitles() end

--- Returns a camera object stored internally by the cutscene.
---@return camera   
function cutscene:camera() end

--- Returns the cutscene length in ms
---@return number  length in ms 
function cutscene:length() end

--- Returns true if any of the sounds the cutscene has been told to play with cutscene:play_sound or cutscene:play_vo are still playing, false otherwise.
---@return boolean  is playing sound 
function cutscene:is_playing_sound() end

--- Returns true if a scripted camera movement is currently happening, false otherwise.
---@return boolean  camera moving 
function cutscene:is_playing_camera() end

--- Returns true if this or any other scripted cutscene is currently running, false otherwise.
---@return boolean  any cutscene running 
function cutscene:is_any_cutscene_running() end

--- Returns true if this cutscene is currently running, false otherwise.
---@return boolean  this cutscene running 
function cutscene:is_active() end

--- Sets the cutscene to be skippable, and optionally also sets a function to be called when the player skips the cutscene.
---@param skippable boolean 
---@param skip_callback function skip callback
function cutscene:set_skippable(skippable, skip_callback) end

--- Sets a position/target to immediately reposition the camera at if the cutscene is skipped. This supercedes any Restore Camera if set.
---@param camera_position vector camera position
---@param camera_target vector camera target
function cutscene:set_skip_camera(camera_position, camera_target) end

--- Instructs the cutscene to restore the camera to either the position it occupied when the cutscene started, or a different position/target entirely. Note that if a skip camera/target has been set with cutscene:set_skip_camera and the cutscene is skipped, those positions will supercede these.
---@param move_time number Time over which to restore the camera in ms. Setting 0 would result in the camera cutting, setting 1000 would result in the camera panning over 1 second, and so on.
---@param override_position vector Override camera position. Supply a position here to set a specific restore camera position, or leave blank to use the position of the camera at the start of the cutscene.
---@param override_target vector Override camera target. Must be specified if a camera position is specified.
function cutscene:set_restore_cam(move_time, override_position, override_target) end

--- Sets a duration for the post-cutscene fade time, in seconds.<br />
--- If a negative fade time is specified, then the cutscene will fade to black when it ends/is skipped and will never fade back to picture. This is useful for outro cutscenes where no fade back to picture is desired. Battle scripts can later fade back to picture themselves if desired.
---@param duration number New post-cutscene fade-time. Note that unlike the majority of battle durations, camera durations (such as this) are specified in seconds.
---@param duration number New post-cutscene fade-time delay. If specified, this delays the fade-in effect. Unlike the first parameter it is set in ms.
function cutscene:set_post_cutscene_fade_time(duration, duration) end

--- Sets a music sound event to play during the cutscene.
---@param music_event string Music event name.
---@param fade_in number Fade in time in ms.
---@param fade_out number Fade out time in ms.
function cutscene:set_music(music_event, fade_in, fade_out) end

--- Sets the sound system to return to automatically selecting music events after the cutscene ends. Only takes effect if a custom music track has been set with cutscene:set_music.
---@param set_auto_playback boolean set auto playback
function cutscene:set_music_resume_auto_playback(set_auto_playback) end

--- Sets relative mode for enqueuing actions on the cutscene. With relative mode enabled, the time specified for each action is relative to the previously-added action, rather than absolute from the start of the cutscene. Relative mode is disabled by default.<br />
--- Relative mode must be set before any actions are enqueued with cutscene:action.
function cutscene:set_relative_mode() end

--- Sets up the cutscene as an intro cutscene of an ambush battle. This must be set if the cutscene is being shown over an ambush scene.
---@param is_ambush boolean Set to true to enable ambush behaviour.
---@param teleport_units_on_end boolean Set to true to teleport the ambushed units to the end of their ambush path once the cutscene ends.
function cutscene:set_is_ambush(is_ambush, teleport_units_on_end) end

--- Sets the battle speed to use while the cutscene is running. By default this value is 1, so the cutscene plays at normal battle speed.
---@param battle_speed number battle speed
function cutscene:set_battle_speed(battle_speed) end

--- Sets whether the cutscene should restore battle speed to that set prior to the cutscene starting. By default this behaviour is enabled.
---@param should_restore boolean should restore
function cutscene:set_should_restore_battle_speed(should_restore) end

--- Sets the cutscene to not end naturally. A cutscene set up in this manner may only be ended by being skipped or by an external script.
---@param do_not_end boolean do not end
function cutscene:set_do_not_end(do_not_end) end

--- Sets whether unit ID uicomponents should be disabled during the cutscene. By default they are disabled, but by supplying false as an argument this function can be used to make them display.
---@param disable_unit_ids boolean disable unit ids
function cutscene:set_should_disable_unit_ids(disable_unit_ids) end

--- Sets whether to suppress unit voices during the cutscene duration. By default they are disabled - enabling them (by supplying false as an argument) will cause units to audibly respond to orders given during the cutscene.
---@param suppress_voices boolean suppress voices
function cutscene:suppress_unit_voices(suppress_voices) end

--- Sets whether to enable the cinematic camera during the cutscene. By default it is enabled, but it can be disabled by supplying false as an argument to this function. The cinematic camera allows the camera to clip through terrain, so disable cinematic camera in circumstances where the path of the camera cannot be guaranteed (e.g. panning from a position relative to a unit to a fixed position, if there's a risk there'll be a hill in the way).
---@param enable_cinematic_camera boolean enable cinematic camera
function cutscene:set_should_enable_cinematic_camera(enable_cinematic_camera) end

--- Sets whether to wait for the advisor to finish before ending the cutscene. This is akin to calling cutscene:wait_for_advisor at the end of the cutscene - the termination of the cutscene is delayed until the advisor has finished speaking. By default, cutscenes do not wait for the advisor to finish before ending.
---@param wait_for_advisor boolean wait for advisor
function cutscene:set_wait_for_advisor_on_end(wait_for_advisor) end

--- Sets whether to wait for any sounds registered with cutscene:play_sound or cutscene:play_vo to finish before ending the cutscene. This is akin to calling cutscene:wait_for_vo at the end of the cutscene - the termination of the cutscene is delayed until all registered sounds have finished playing. By default, cutscenes do not wait for registered sounds to finish before ending.
---@param wait_for_sounds boolean wait for sounds
function cutscene:set_wait_for_vo_on_end(wait_for_sounds) end

--- Sets whether to close the advisor at the end of the cutscene. By default this behaviour is enabled (so the advisor closes), supply false as an argument to disable it.
---@param should_close_advisor boolean should close advisor
function cutscene:set_close_advisor_on_end(should_close_advisor) end

--- Sets whether to close the advisor when the cutscene begins. By default this behaviour is enabled, supply false as an argument to disable it.
---@param should_close_advisor boolean should close advisor
function cutscene:set_close_advisor_on_start(should_close_advisor) end

--- Sets whether the cutscene should re-enable the UI when it finishes. By default the cutscene re-enables the UI - supply false as an argument to prevent it from doing so. This can be useful for scripts which have turned off the UI and don't want cutscenes re-enabling it.
---@param should_enable_ui boolean should enable ui
function cutscene:enable_ui_on_end(should_enable_ui) end

--- Sets or changes the callback that is called when the cutscene is ended.
---@param end_callback function end callback
function cutscene:set_end_callback(end_callback) end

--- Sets whether the cutscene should call the end callback (supplied when the cutscene is created with cutscene:new) when skipped. By default the cutscene does call this callback - supply false as an argument to prevent it from doing so.
---@param should_call_callback boolean should call callback
function cutscene:set_call_end_callback_when_skipped(should_call_callback) end

--- Sets whether the cutscene should release script control of the player's army when finishing. By default the cutscene does release this control - supply false as an argument to prevent it from doing so. This is useful for scripts that may want to restrict the player's control of their army and don't want cutscenes un-restricting it.
---@param should_call_callback boolean should call callback
function cutscene:set_should_release_players_army(should_call_callback) end

--- Sets whether the cutscene should show cinematic bars while playing. By default the cutscene does show cinematic bars - supply false as an argument to prevent it from doing so.
---@param show_bars boolean show bars
function cutscene:set_show_cinematic_bars(show_bars) end

--- Sets whether the cutscene should show hide the UI while playing. By default the cutscene does hide the UI - supply false as an argument to prevent it from doing so.
---@param hide_UI boolean hide UI
function cutscene:set_should_hide_ui(hide_UI) end

--- Sets whether cutscene should restore any pre-existing scripted ui hiding state when the cutscene ends. By default this state is restored - supply false as an argument to prevent it from doing so.
---@param restore_hiding boolean restore hiding
function cutscene:set_should_restore_ui_hiding_on_end(restore_hiding) end

--- Sets whether the cutscene should steal input focus while playing, preventing player input. By default the cutscene does steal input - supply false as an argument to prevent it from doing so.
---@param steal_input boolean steal input
function cutscene:set_steal_input_focus(steal_input) end

--- Starts the cutscene. After this point it cannot be configured further.
function cutscene:start() end

--- Streams a line of subtitles. Use this method of subtitle display within an cutscene:action to animate the appearance of the supplied text over a supplied duration. Once a subtitle is shown with this function, it can later be hidden with cutscene:hide_custom_cutscene_subtitles (which is also called automatically when this function is called, to hide any subtitles already visible).<br />
--- This functionality is provided by an extension to the text_pointer system. As this behaviour is controlled by script, which only updates every 1/10th second, blocks of characters may appear at the same time instead of each character individually. This system should probably be moved into code at some point.
---@param subtitle_key string Subtitle key, from the scripted_subtitles table.
---@param style string Text pointer style, from the valid entries in text_pointer:set_style. "subtitle_with_frame" is in use by existing quest battles but more styles may be available.
---@param duration number Time the text takes to stream on-screen in ms.
---@param force boolean Force display of the subtitles. Setting this to true overrides the user's subtitle preference.
function cutscene:show_custom_cutscene_subtitle(subtitle_key, style, duration, force) end

--- Hides any visible custom cutscene subtitles. The hide effect will be animated, unless true is passed in as a single argument which hides the subtitles immediately.
---@param hide_immediately boolean hide immediately
function cutscene:hide_custom_cutscene_subtitles(hide_immediately) end

--- Shows or hides a "Press ESC to continue" subtitle prompt. It is intended that this should be called during an cutscene:action.
---@param should_show boolean should show
function cutscene:show_esc_prompt(should_show) end

--- Causes the cutscene to skip. This function is called internally when the ESC key is pressed, but it may also be called externally while the cutscene is running.
function cutscene:skip() end
