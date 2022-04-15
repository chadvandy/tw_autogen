
---@class active_pointer
local active_pointer = {}

--- 
function active_pointer:set_panel_width() end

--- 
function active_pointer:set_close_button_component() end

--- Sets up a listener that attempts to show this active pointer once the specified active pointer closes. Unlike active_pointer:wait_for_active_pointer this doesn't demand that the specified active pointer must have first been shown before this active pointer can be shown - this active pointer could trigger before the specified active pointer (from a different event, for example).<br />
--- This active pointer must have registered itself in the advice history for this function to work.
---@param active_pointer_name string Name of active pointer to wait for. The active pointer being waited for must have registered itself in the advice history.
---@param delay_override number Delay override, which will be supplied to active_pointer:show_when_ready if this monitor tries to show the pointer. This is the delay between the uicomponent stopping moving/becoming visible and the text pointer actually being shown. This should be supplied in seconds in campaign, and in milliseconds in battle and the frontend. The default value is 1 second, or 1000ms, or whatever has been set with active_pointer:set_default_delay.
---@param timeout_override number Timeout period override, which will be supplied to active_pointer:show_when_ready if this monitor tries to show the pointer. The timeout is the elapsed period after which the show_when_ready process will halt if the target uicomponent has not stopped moving or become visible. In campaign this should be supplied in seconds, and defaults to either 5 or whatever value has been set with active_pointer:set_default_timeout. In battle and the frontend, the timeout period is set in milliseconds and defaults to 5000.
function active_pointer:show_after_active_pointer(active_pointer_name, delay_override, timeout_override) end

--- 
function active_pointer:set_close_button_callback() end

--- 
function active_pointer:add_component_text() end

--- Sets a default timeout period for this active pointer, which is the period over which active_pointer:show_when_ready will poll the target uicomponent to see if it becomes visible and stops moving. If the timeout period elapses then the attempt to show the text pointer is stopped. By default this is 5 seconds in campaign, or 5000ms in battle or the frontend.
---@param timeout number Default timeout value. This should be set in seconds in campaign, and milliseconds in battle or in the frontend.
function active_pointer:set_default_timeout(timeout) end

--- 
function active_pointer:set_panel_width_to_screen() end

--- 
function active_pointer:set_stream_duration() end

--- Adds a hide-on-event record for this active pointer. If the event is received while the active pointer is being shown, and the optional conditional check passes, then the active pointer is hidden. An optional flag specifies whether this hide should happen immediately, without any fade animation.
---@param event_name string Script event name.
---@param condition function/boolean Conditional check. This can be a function that returns a boolean, or true to always pass when the supplied event is received.
---@param hide_immediately boolean Hide the text pointer immediately, without a fade animation.
function active_pointer:add_hide_on_event_record(event_name, condition, hide_immediately) end

--- 
function active_pointer:do_not_release_escape_key() end

--- 
function active_pointer:set_stream_by_char() end

--- 
function active_pointer:set_worldspace_display_height() end

--- 
function active_pointer:set_topmost() end

--- 
function active_pointer:new_from_component() end

--- 
function active_pointer:get_text_label() end

--- 
function active_pointer:set_text_show_animation() end

--- Sets the active pointer to trigger when a script event is received, with an optional conditional check that must be passed.<br />
--- This active pointer must have registered itself in the advice history for this function to work.
---@param event string Event name.
---@param condition boolean/function Conditional check. This may be omitted, or true may be supplied to always trigger whenever the supplied event is received.
---@param delay_override number Delay override, which will be supplied to active_pointer:show_when_ready if this monitor tries to show the pointer. This is the delay between the uicomponent stopping moving/becoming visible and the text pointer actually being shown. This should be supplied in seconds in campaign, and in milliseconds in battle and the frontend. The default value is 1 second, or 1000ms, or whatever has been set with active_pointer:set_default_delay.
---@param timeout_override number Timeout period override, which will be supplied to active_pointer:show_when_ready if this monitor tries to show the pointer. The timeout is the elapsed period after which the show_when_ready process will halt if the target uicomponent has not stopped moving or become visible. In campaign this should be supplied in seconds, and defaults to either 5 or whatever value has been set with active_pointer:set_default_timeout. In battle and the frontend, the timeout period is set in milliseconds and defaults to 5000.
function active_pointer:show_on_event(event, condition, delay_override, timeout_override) end

--- Prevents this active pointer from being shown before another active pointer has been shown. An active pointer may wait for multiple other active pointers, each wait being registered with a call to this function. Should multiple waits be set up for an active pointer, it will fail to display until all active pointers being waited for have finished showing.<br />
--- This function sets up an active_pointer:show_after_active_pointer process automatically, which attempts to show this pointer once the active pointer being waited for is dismissed.<br />
--- This active pointer must have registered itself in the advice history for this function to work.
---@param active_pointer_name string Name of active pointer to wait for. The active pointer being waited for must have registered itself in the advice history.
---@param delay_override number Delay override, which will be supplied to active_pointer:show_when_ready if this monitor tries to show the pointer. This is the delay between the uicomponent stopping moving/becoming visible and the text pointer actually being shown. This should be supplied in seconds in campaign, and in milliseconds in battle and the frontend. The default value is 1 second, or 1000ms, or whatever has been set with active_pointer:set_default_delay.
---@param timeout_override number Timeout period override, which will be supplied to active_pointer:show_when_ready if this monitor tries to show the pointer. The timeout is the elapsed period after which the show_when_ready process will halt if the target uicomponent has not stopped moving or become visible. In campaign this should be supplied in seconds, and defaults to either 5 or whatever value has been set with active_pointer:set_default_timeout. In battle and the frontend, the timeout period is set in milliseconds and defaults to 5000.
function active_pointer:wait_for_active_pointer(active_pointer_name, delay_override, timeout_override) end

--- 
function active_pointer:add_show_callback() end

--- 
function active_pointer:set_show_close_button() end

--- Sets a default delay period for this active pointer, which is the period between when active_pointer:show_when_ready has detected that the pointer is ready to be shown and when the pointer is actually shown. Any default set here may be overridden when active_pointer:show_when_ready, active_pointer:show_after_active_pointer or active_pointer:show_on_event are called.
---@param delay number Delay value. This should be set in seconds in campaign, and milliseconds in battle or in the frontend.
function active_pointer:set_default_delay(delay) end

--- 
function active_pointer:add_hide_callback() end

--- 
function active_pointer:set_show_pointer_end_without_line() end

--- Creates and returns a new active text pointer object.
---@param name string Name for this text pointer. If this pointer is storing a record in the advice history (which is the default behaviour, and must be opted-out of by setting this suppress record in advice argument to true on this function) then the supplied name must be unique.
---@param orientation string Orientation of the pointer arrow that is drawn. Supported values are "topleft", "topright", "bottomleft" and "bottomright".
---@param uicomponent_specifier uicomponent/function Specifier of uicomponent to point at. This can either be a uicomponent object or a function that returns a uicomponent. It's strongly recommended that if the text pointer is not being displayed immediately after being created that a function is used.
---@param text_key string Localised text key to display, in [table]_[field]_[key] format.
---@param x_proportion number Unary x proportion specifying a pointed position relative to the dimensions of the specified component. Supply 0 to point at the left edge of the component, 1 to point at the right edge of the component, or 0.5 to point at the middle of the component, for example. Values less than zero or greater than one are valid.
---@param y_proportion number Unary y proportion specifying a pointed position relative to the dimensions of the specified component. Supply 0 to point at the top edge of the component, 1 to point at the bottom edge of the component, or 0.5 to point at the middle of the component, for example. Values less than zero or greater than one are valid.
---@param width number Width of the text pointer panel in pixels.
---@param suppress_record boolean Sets this active pointer to not record a record of whether it's been triggered in advice history. If this is set to true then the active pointer is not registered with the script core, and it doesn't need to have a unique name. However, the active pointer will not be able to automatically listen for events.
function active_pointer:new(name, orientation, uicomponent_specifier, text_key, x_proportion, y_proportion, width, suppress_record) end

--- 
function active_pointer:has_ever_been_shown() end

--- 
function active_pointer:set_text_hide_animation() end

--- 
function active_pointer:set_label_offset() end

--- 
function active_pointer:new_from_position_offset_to_text_pointer() end

--- 
function active_pointer:set_hide_on_close_button_clicked() end

--- 
function active_pointer:hide() end

--- 
function active_pointer:set_text_state_override() end

--- 
function active_pointer:set_panel_hide_animation() end

--- Immediately shows the text pointer, unless it's been set to pay attention to advice history (and has already been shown).
function active_pointer:show() end

--- 
function active_pointer:set_panel_show_animation() end

--- Shows the active text pointer when the target uicomponent that was specified when the active pointer was created is not moving, is visible, and is fully onscreen. If this does not happen within the timeout period (default 5 seconds) then the process is cancelled.
---@param delay_override number Delay between the uicomponent stopping moving/becoming visible and the text pointer actually being shown. This should be supplied in seconds in campaign, and in milliseconds in battle and the frontend. The default value is 1 second, or 1000ms, or whatever has been set with active_pointer:set_default_delay.
---@param timeout_override number Timeout period override. The timeout is the elapsed period after which the show_when_ready process will halt if the target uicomponent has not stopped moving or become visible. In campaign this should be supplied in seconds, and defaults to either 5 or whatever value has been set with active_pointer:set_default_timeout. In battle and the frontend, the timeout period is set in milliseconds and defaults to 5000.
function active_pointer:show_when_ready(delay_override, timeout_override) end

--- 
function active_pointer:set_priority() end

--- 
function active_pointer:set_should_pulse() end

--- 
function active_pointer:set_highlight_close_button() end

--- 
function active_pointer:set_style() end

--- 
function active_pointer:set_panel_state_override() end

--- 
function active_pointer:is_showing() end

--- 
function active_pointer:set_layout() end

--- 
function active_pointer:set_pointer_width() end

--- 
function active_pointer:ignore_hide_all_text_pointers() end

--- 
function active_pointer:set_position_as_subtitle() end

--- 
function active_pointer:set_line_end_state_override() end

--- 
function active_pointer:set_layout_path() end
