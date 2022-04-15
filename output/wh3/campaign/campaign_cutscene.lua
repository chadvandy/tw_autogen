
---@class campaign_cutscene
local campaign_cutscene = {}

--- Creates a cutscene object that is bound to a cindyscene. When started, the scripted cutscene will automatically start the cindyscene, and will terminate when the cindyscene ends.
---@param name string Unique name for the cutscene.
---@param end_callback function End callback.
---@param cindy_scene string Cindy scene path.
---@param blend_in number Blend in time, in seconds.
---@param blend_out number Blend out time, in seconds.
function campaign_cutscene:new_from_cindyscene(name, end_callback, cindy_scene, blend_in, blend_out) end

--- Registers a new action with the cutscene. The action is supplied a function callback, which is called at the appropriate time after the cutscene has been started (assuming the cutscene is not skipped beforehand).
---@param callback function Action callback to call.
---@param delay number Delay in seconds after the cutscene starts before calling this action callback.
function campaign_cutscene:action(callback, delay) end

--- Registers a new cinematic trigger listener. When the cindy scene triggers a script event with the supplied id in script, the supplied function is called.
---@param id string Cinematic trigger id. This should match the an id of a cinematic event triggered from a cindy scene played during this cutscene.
---@param callback function Callback to call.
function campaign_cutscene:add_cinematic_trigger_listener(id, callback) end

--- This function, when called, causes the cutscene to repeatedly stall while the advisor is still speaking and only allow the cutscene to progress once the advisor has finished. If the cutscene contains multiple lines of advice that are played one after the other, this function can be used to ensure that each item of advice only triggers once the previous item has finished playing, so they don't speak over the top of each other. This is useful when laying out multiple items of advice in a cutscene where the length of advice items cannot be known in different languages - a localised version of an advice item in German, for example, might be many seconds longer than the equivalent in English.<br />
--- If a delay argument is passed in then the call to this function is enqueued as an campaign_cutscene:action with that delay. Alternatively, it may be called with no delay within an action.
---@param delay number Delay in seconds after the cutscene starts before invoking this function.
function campaign_cutscene:wait_for_advisor(delay) end

--- Sets the cutscene music trigger argument to be passed to the music system when the cutscene starts
---@param music_trigger_argument string A uniquely identifying name for the cutscene relevant to the music system
function campaign_cutscene:set_music_trigger_argument(music_trigger_argument) end

--- Sets co-ordinates to which the game camera is restored when the cutscene ends. If a restore camera position is specified, the camera is scrolled to that position at the end of the cutscene over the supplied time in seconds. This is useful when it's desired to return the camera to the position it started the cutscene at when the cutscene finishes, or to a different position.<br />
--- If no co-ordinates are supplied, the cutscene system takes the current position of the game camera as the restore camera position.<br />
--- Note that if a skip camera position is set with campaign_cutscene:set_skip_camera, and the cutscene is skipped, the camera will be skipped and not restored. If the cutscene is skipped, has no skip camera position but has a restore camera position set, the camera will be immediately repositioned at the restore camera position while the screen is faded to black.
---@param time number Time in seconds over which to scroll the camera.
---@param x number x co-ordinate. If no co-ordinates are set here the function takes the camera position at the moment the function is called.
---@param y number y co-ordinate.
---@param d number d co-ordinate.
---@param b number b co-ordinate.
---@param h number h co-ordinate.
function campaign_cutscene:set_restore_camera(time, x, y, d, b, h) end

--- This function is called internally when the cutscene has been skipped by the player. Additionally, it may be called by external scripts to force the running cutscene to skip.
function campaign_cutscene:skip() end

--- Tells the cutscene whether to show settlement labels while playing or not. Cutscenes by default will hide settlement labels - use this function to disable this behaviour.
---@param disable_labels boolean disable labels
function campaign_cutscene:set_disable_settlement_labels(disable_labels) end

--- Sets whether the cutscene should be skippable or not, and also allows the optional specification of a callback to be called if the cutscene is skipped. Note that if a skip callback and end callback are both set, both will be called (in that order).
---@param set_skippable boolean set skippable
---@param skip_callback function skip callback
function campaign_cutscene:set_skippable(set_skippable, skip_callback) end

--- Issues a call to dismiss the advice without triggering the end of the cutscene. Normally a cutscene skips when advice is dismissed - use this function during an campaign_cutscene:action to circumvent this behaviour.
function campaign_cutscene:dismiss_advice() end

--- Tells the cutscene whether to make neighbouring regions visible or not. Cutscenes by default will not do this - use this function to enable this behaviour if required. The 'neighbouring' regions in this case are those regions adjacent to the regions currently unshrouded.<br />
--- Setting this property to true also enables the shroud.
---@param disable_labels boolean disable labels
function campaign_cutscene:set_neighbouring_regions_visible(disable_labels) end

--- Tells the cutscene whether to restore the ui when it ends, or not. Cutscenes by default will restore the ui - use this function to disable this behaviour. This is useful in highly specific circumstances.
---@param restore_ui boolean restore ui
function campaign_cutscene:set_restore_ui(restore_ui) end

--- Sets the cutscene into debug mode for more output.
---@param set_debug boolean set debug
function campaign_cutscene:set_debug(set_debug) end

--- Starts the cutscene.
function campaign_cutscene:start() end

--- Creates a cutscene object. A cutscene must be given a unique string name, a length in seconds and optionally an end callback.
---@param name string Unique name for the cutscene.
---@param duration number Cutscene duration in seconds. If nil or 0 is specified then the cutscene will be set to not end, and will only finish when skipped by the player or ended by an external process - see campaign_cutscene:set_do_not_end.
---@param end_callback function End callback.
---@param send_metrics_data bool Send performance data to metrics.
function campaign_cutscene:new(name, duration, end_callback, send_metrics_data) end

--- Sets the cutscene end callback. This replaces any end callback previously set (e.g. with campaign_cutscene:new).
---@param end_callback function end callback
function campaign_cutscene:set_end_callback(end_callback) end

--- Shows or hides a "Press ESC to continue" subtitle prompt. It is intended that this should be called during an campaign_cutscene:action.
---@param should_show boolean should show
function campaign_cutscene:show_esc_prompt(should_show) end

--- Tells the cutscene whether to show the advisor close button after the cutscene is finished or not. By default the close button is not shown - use this function to show the button at the end of the cutscene.
---@param show_advisor_close_button boolean show advisor close button
function campaign_cutscene:set_show_advisor_close_button_on_end(show_advisor_close_button) end

--- Sets the cutscene to show cinematic borders whilst playing, or not. Cutscenes by default will show cinematic borders - use this function to disable this behaviour.
---@param show_borders boolean show borders
function campaign_cutscene:set_use_cinematic_borders(show_borders) end

--- Sets a position at which the game camera is repositioned to if the cutscene is skipped. The reposition happens behind a fade to black so the player does not see it.<br />
--- If no position is supplied, the cutscene system takes the current position of the game camera as the skip camera position.<br />
--- Note that this reposition will not happen if the cutscene is not skipped. 
---@param x number x co-ordinate. If no co-ordinates are set here the function takes the camera position at the moment the function is called.
---@param y number y co-ordinate.
---@param d number d co-ordinate.
---@param b number b co-ordinate.
---@param h number h co-ordinate.
function campaign_cutscene:set_skip_camera(x, y, d, b, h) end

--- Sets whether the dismiss the advisor at the end of the cutscene. By default the advisor is skipped - use this function to disable this behaviour.
---@param dismiss_advice boolean dismiss advice
function campaign_cutscene:set_dismiss_advice_on_end(dismiss_advice) end

--- Instructs the cutscene to steal input immediately, before campaign_cutscene:start() is called. This is useful for campaign intro cutscenes as there's a short window of opportunity for the player to interact with the game as the loading screen is fading out, before the cutscene starts.<br />
--- Note that cutscenes don't steal input when debug mode is set with campaign_cutscene:set_debug or campaign_cutscene:set_debug_all, which affects this command too.
function campaign_cutscene:steal_input_immediately() end

--- Sets whether the cutscene should immediately fade to black, and then optionally fade back to picture (after an optional delay), or not. By default the cutscene system will fade to black immediately if the cutscene is skipped, then wait a second, then fade to picture after a second. Use this function to change this behaviour.
---@param fade_to_black boolean Fade to black immediately on skip.
---@param fade_to_picture_time number Time in seconds over which the cutscene will fade back to picture. If a negative number is supplied, or no fade to black is set, then no fade to picture is performed.
---@param fade_to_picture_delay number Time in seconds after the cutscene is skipped between the fade to black and the subsequent fade back to picture.
function campaign_cutscene:set_fade_on_skip(fade_to_black, fade_to_picture_time, fade_to_picture_delay) end

--- Returns true if the cutscene is currently running, false otherwise.
function campaign_cutscene:is_active() end

--- Sets whether the cutscene should call the end callback (supplied when the cutscene is created with <a href="../battle/cutscene.html#function:cutscene:new">cutscene:new) when skipped. By default the cutscene does call this callback - supply false as an argument to prevent it from doing so.
---@param should_call_callback boolean should call callback
function campaign_cutscene:set_call_end_callback_when_skipped(should_call_callback) end

--- Sets the cutscene to not terminate once its duration is reached. If this is enabled, the cutscene can only be ended by being skipped or by being terminated by external script.
---@param do_not_end boolean do not end
function campaign_cutscene:set_do_not_end(do_not_end) end

--- Returns true if the cutscene has an end callback specified, false otherwise.
function campaign_cutscene:has_end_callback() end

--- Sets all campaign cutscenes into debug mode for more output.
---@param set_debug boolean set debug
function campaign_cutscene:set_debug_all(set_debug) end

--- Tells the cutscene whether to restore the shroud after completion to the state it was in before the cutscene started, or not. By default the shroud is restored - use this function to disable this behaviour if required.
---@param restore_shroud boolean restore shroud
function campaign_cutscene:set_restore_shroud(restore_shroud) end

--- Immediately starts playback of a cindy scene. This is intended to be called within an campaign_cutscene:action callback. If a cindy scene is started this way, the cutscene will automatically terminate it if the cutscene is skipped.
---@param path string cindy xml path, from the data/ folder.
---@param blend_in number Blend in duration in seconds.
---@param blend_out number Blend out duration in seconds.
function campaign_cutscene:cindy_playback(path, blend_in, blend_out) end

--- Tells the cutscene whether to show the shroud during playback, or not. By default the shroud is displayed - use this function to disable it if required.
---@param disable_shroud boolean disable shroud
function campaign_cutscene:set_disable_shroud(disable_shroud) end
