
---@class scripted_tour
local scripted_tour = {}

--- Adds a skip action to the scripted tour, which will be called if the scripted tour is skipped (but not called if it is completed normally). An optional name may be added for the skip action, by which it may be removed later.
---@param skip_action function Skip callback to call if this scripted tour is skipped.
---@param name string Name for this skip action.
function scripted_tour:add_skip_action(skip_action, name) end

--- Adds an action to the scripted tour to be called at the same time as the last currently-registered action of the specified sequence. If no sequence is specified then the action is added to the main tour sequence, otherwise the action will be added to the sequence given. If additional actions are added after append_action is called 
---@param callback function Callback function to call.
---@param interval number Interval after the scripted tour starts at which the specified action should be triggered. This should be given in seconds in campaign, and in ms in battle and the frontend.
---@param sequence string Sequence to add the action to. If no sequence name is specified then the action will be added to the main sequence.
function scripted_tour:append_action(callback, interval, sequence) end

--- Sets whether the fullscreen highlight central window should allow interaction with the components it shows. Interaction is allowed by default, meaning components shown within the window will respond to mouse events - use this function to disable this interaction.
---@param allow_interaction boolean allow interaction
function scripted_tour:set_allow_fullscreen_highlight_window_interaction(allow_interaction) end

--- Instructs the scripted tour to end after it has been started. All running action sequences will be terminated.
function scripted_tour:complete() end

--- Enables or disables a fullscreen highlight over the uicomponents previously specified with scripted_tour:add_fullscreen_highlight. This is called automatically by the scripted tour at some point after the tour starts, unless it has been disabled by supplying a negative number to scripted_tour:set_fullscreen_highlight_delay. It may also be called by external scripts to manually enable/disable the fullscreen highlight - this isn't necessary in most cases, however.
---@param should_show boolean should show
function scripted_tour:show_fullscreen_highlight(should_show) end

--- Creates the skip button if it has not been created before, or gets a handle to it if it has, and returns that handle. This is mainly for internal use but could feasibly be used externally. The skip button and its container will be invisible until made visible by the normal working of the scripted tour system.
function scripted_tour:get_skip_button_container() end

--- Specifies a component to extend a fullscreen highlight over, by elements within its string path. Supply one or more strings that specify a path to the component, read left to right.
---@vararg any
function scripted_tour:add_fullscreen_highlight(path) end

--- Sets a padding value in pixels between the visible fullscreen highlight and the uicomponents it surrounds. This value is passed to the underlying core:show_fullscreen_highlight_around_components function. This should already be set to a sensible default - call this function can be used to override this.
---@param padding number Padding value in pixels
function scripted_tour:set_fullscreen_highlight_padding(padding) end

--- Adds a validation callback. The supplied function will be called when the scripted tour is triggered with scripted_tour:start, or validated with scripted_tour:is_currently_valid, and it must return a boolean value that indicates whether the validation rule passes.<br />
---Validation rules are checked in the same order in which they are added.
---@param callback function Validation function.
---@param reason any Reason value. This can be a value of any type. It will be returned to scripts that call scripted_tour:is_currently_valid if this validation rule fails.
function scripted_tour:add_validation_rule(callback, reason) end

--- Creates a scripted tour object. Each scripted tour must be given a unique string name and, optionally, an end callback which will be called when the scripted tour ends or is skipped.
---@param name string Unique name for the scripted tour.
---@param end_callback function End callback.
function scripted_tour:new(name, end_callback) end

--- Skips the scripted tour. This is called when the player clicks on the skip button, but may be called by external scripts. This will immediately terminate the tour and all running action sequences.
function scripted_tour:skip() end

--- Starts a listener for the supplied scripted event. Should it be received, and should the optional condition also pass, the current validation state is checked against that previously cached. If the validation state has changed then the ScriptEventScriptedTourValidationStateChanged is triggered which scripts elsewhere can listen for and react to. This allows UI scripts that may be displaying an option to launch a scripted tour to update the state of that launch option as the game context changes.
---@param event_name string Name of script event to monitor.
---@param condition function Condition to check if the event is received. 
function scripted_tour:add_validation_context_change_listener(event_name, condition) end

--- Scripted tours will hide all visible text_pointer objects upon completion by default. This function may be used to suppress this behaviour if desired.
---@param should_hide boolean should hide
function scripted_tour:set_should_hide_text_pointers_on_completion(should_hide) end

--- Remove a skip action from the scripted tour by name. If multiple skip actions share the same name then all will be removed.
---@param name string name
function scripted_tour:remove_skip_action(name) end

--- Instructs the scripted tour to complete an action sequence. Do this to cancel the sequence and prevent any further actions from that sequence being triggered. If no sequence name is specified then the main action sequence is completed.<br />
---Note that calling this function does not complete the tour as a whole, which must still be terminated with scripted_tour:complete.
---@param sequence_name string sequence name
function scripted_tour:complete_sequence(sequence_name) end

--- Checks whether this scripted tour is currently able to trigger. If the tour is not currently valid to trigger then the reason specified when setting the rule up with scripted_tour:add_validation_rule is returned.
function scripted_tour:is_currently_valid() end

--- Sets whether the skip button should be shown when a fullscreen highlight is enabled. By default the skip button is shown - use this function to suppress this behaviour.
---@param should_show boolean should show
function scripted_tour:set_show_skip_button(should_show) end

--- Moves the skip button to a supplied position on the screen. This position can be specified by numeric x/y screen co-ordinates, or by a string specifying a position. Recognised strings:<br />
---tltop-left cornertrtop-right cornerblbottom-left cornerbrbottom-right corner
---By default the skip button will appear in the bottom-right corner of the screen. This function may be called before the scripted tour starts to set skip button position prior to it being shown, or while the scripted tour is running to move it.
---@param should_show boolean should show
function scripted_tour:move_skip_button(should_show) end

--- Scripted tours will prevent camera movement whilst active, by default. Use this function to allow the player to move the camera while the scripted tour is active. It can be used before the tour starts or while the tour is running.
---@param allow_movement boolean allow movement
function scripted_tour:set_allow_camera_movement(allow_movement) end

--- Scripted tours will dismiss advice upon completion by default. This function may be used to suppress this behaviour if desired.
---@param should_dismiss boolean should dismiss
function scripted_tour:set_should_dismiss_advice_on_completion(should_dismiss) end

--- Starts the scripted tour or a scripted tour sequence. The first time this function is called the scripted tour as a whole starts. If no arguments are supplied the main action sequence commences, otherwise the actions associated with the specified sequence will start.
---@param sequence_name string sequence name
function scripted_tour:start(sequence_name) end

--- Sets a delay between the scripted tour starting and the fullscreen highlight being activated. If a negative number is set then the fullscreen highlight will not activate automatically - in this case client scripts may activate/deactivate it manually with scripted_tour:show_fullscreen_highlight.<br />
---The delay should be given in seconds in campaign, but ms in battle or the frontend.
---@param delay number delay
function scripted_tour:set_fullscreen_highlight_delay(delay) end

--- Manually shows or hides the skip button while the scripted tour is running. Generally this should not be called externally, as the scripted_tour will show the skip and hide the skip button automatically along with the fullscreen highlight.
---@param should_show boolean should show
function scripted_tour:show_skip_button(should_show) end

--- Adds an action to the scripted tour to be called at a specified time after the scripted tour starts. If no sequence is specified then the action is added to the main tour sequence, otherwise the action will be added to the sequence given.
---@param callback function Callback function to call.
---@param interval number Interval after the scripted tour starts at which the specified action should be triggered. This should be given in seconds in campaign, and in ms in battle and the frontend.
---@param sequence string Sequence to add the action to. If no sequence name is specified then the action will be added to the main sequence.
function scripted_tour:action(callback, interval, sequence) end
