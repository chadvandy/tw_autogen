--- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT MANUALLY.

---@class text_pointer
local text_pointer = {}

--- Creates a text_pointer object pointing to a supplied position on the screen.
---@param name string Name for the text pointer. Must be unique amongst text pointers.
---@param display_mode string "subtitle", a special mode, whereby the text pointer appears and behaves as a cutscene subtitle in the lower cinematic bar. x/y positions are disregarded in this case.
---@param length number Length of the attached arrow pointer and line. Can be zero.
---@param x_position number X position. This is either the absolute position on-screen, or the position in 3D space if the pointer display mode is set to worldspace. 
---@param y_position number Y position. This is either the absolute position on-screen, or the position in 3D space if the pointer display mode is set to worldspace.
---@return text_pointer   
function text_pointer:new(name, display_mode, length, x_position, y_position) end

--- Creates a text_pointer object pointing to a supplied uicomponent. The uicomponent may either be supplied directly or as a function that returns a uicomponent.
---@param name string Name for the text pointer. Must be unique amongst text pointers.
---@param display_mode string "subtitle", a special mode, whereby the text pointer appears and behaves as a cutscene subtitle in the lower cinematic bar. x/y positions are disregarded in this case.
---@param length number Length of the attached arrow pointer and line. Can be zero.
---@param ui_component any UI component to point at. This can be supplied as either a uicomponent or a function that returns a uicomponent. By default the pointer will point to the middle of the component - use the offset parameters to change this.
---@param x_proportion number Unary x proportion specifying a pointed position relative to the dimensions of the specified component. Supply zero to point at the left edge of the component, one to point at the right edge of the component, or 0.5 to point at the middle of the component, for example. Values less than zero or greater than one are valid.
---@param y_proportion number Unary y proportion specifying a pointed position relative to the dimensions of the specified component. Supply zero to point at the top edge of the component, one to point at the bottom edge of the component, or 0.5 to point at the middle of the component, for example. Values less than zero or greater than one are valid.
---@return text_pointer   
function text_pointer:new_from_component(name, display_mode, length, ui_component, x_proportion, y_proportion) end

--- Creates a text_pointer object with a position relative to another text pointer. This can be used to make text pointers appear in a sequence on the screen.
---@param name string Name for the text pointer. Must be unique amongst text pointers.
---@param text_pointer text_pointer Text pointer object to display relative to.
---@param x_offset number Supplying a value of 10 would mean a gap of 10 pixels between the two text pointers, with this text pointer on the right of the other, while a value of -10 would mean a gap of 10 pixels with this text pointer on the left.
---@param y_offset number Supplying a value of 10 would mean a gap of 10 pixels between the two text pointers, with this text pointer below the other (as a higher value of y means a position further down the screen), while a value of -10 would mean a gap of 10 pixels with this text pointer above the other.
---@return text_pointer   
function text_pointer:new_from_position_offset_to_text_pointer(name, text_pointer, x_offset, y_offset) end

--- Sets the path to the folder that contains the component layout file. Default value is "UI/Common UI/".
---@param path string path
function text_pointer:set_layout_path(path) end

--- Sets the name of the layout to use for this text pointer. Default value is "text_pointer_text_only".
---@param path string path
function text_pointer:set_layout(path) end

--- Returns the text label uicomponent
---@return UIC  text label 
function text_pointer:get_text_label() end

--- Sets the width of the pointer line. Default width is 5 pixels.
---@param pointer_width number pointer width
function text_pointer:set_pointer_width(pointer_width) end

--- Sets the width of the text panel on-screen. The default width is set by the component layout.
---@param panel_width number Width of panel on-screen in pixels.
---@param shrink_horizontally boolean Shrink text horizontally if on one line.
function text_pointer:set_panel_width(panel_width, shrink_horizontally) end

--- Sets the width of the text panel on-screen to be the screen width minus a supplied numeric value.
---@param difference number Width of panel on-screen will be the screen width minus this value, in pixels.
---@param shrink_horizontally boolean Shrink text horizontally if on one line.
function text_pointer:set_panel_width_to_screen(difference, shrink_horizontally) end

--- Sets the height in campaign, or height offset in battle, of the pointed position if the pointer is displayed in worldspace mode. This is important to set in campaign as the script has no way of determining the height of the terrain at a position in worldspace, so it must be supplied here. In battle, where the script can find the height of the terrain at a point, this sets the vertical offset from the ground.<br />
--- Without setting a height in campaign, a worldspace pointer will appear pointing to a height of 0 which will likely be beneath the terrain being pointed at.
---@param display_height number display height
function text_pointer:set_worldspace_display_height(display_height) end

--- Without setting a label offset, the text label with be centred to the position being pointed at e.g. centred directly above it if the display mode is set to "bottom", centred to the left if the display mode is set to "right" etc. Set a label offset to move the label relative to this position.
---@param x_offset number x offset
---@param y_offset number y offset
function text_pointer:set_label_offset(x_offset, y_offset) end

--- Sets whether the line end should be drawn without the line.
---@param show_line_end_without_line boolean show line end without line
function text_pointer:set_show_pointer_end_without_line(show_line_end_without_line) end

--- Sets the component priority of the text pointer. This determines what components the text pointer is drawn on top of, and what components it is drawn underneath.
---@param priority number priority
function text_pointer:set_priority(priority) end

--- Sets the text pointer components to be topmost in the UI heirarchy.
---@param topmost boolean topmost
function text_pointer:set_topmost(topmost) end

--- Sets the text pointer to pulse-highlight when it shows.
---@param pulse boolean Set to true to enable pulsing.
---@param pulse_strength number Pulse strength override. Supply a positive number here to modify the strength of the pulse. Default value is 5.
function text_pointer:set_should_pulse(pulse, pulse_strength) end

--- Sets the text pointer to stream its text, and optionally sets the duration over which the text is to be streamed.
---@param should_stream boolean should stream
---@param stream_duration number stream duration
function text_pointer:set_stream_by_char(should_stream, stream_duration) end

--- Sets just the duration over which the text is to be streamed.
---@param stream_duration number stream duration
function text_pointer:set_stream_duration(stream_duration) end

--- Sets a different panel show animation. Any animation set here must be present on the panel component in the text pointer layout. Default is "show".
---@param animation_name string animation name
function text_pointer:set_panel_show_animation(animation_name) end

--- Sets a different panel hide animation. Any animation set here must be present on the panel component in the text pointer layout. Default is "hide".
---@param animation_name string animation name
function text_pointer:set_panel_hide_animation(animation_name) end

--- Sets a text show animation. Any animation set here must be present on the line component in the text pointer layout.
---@param animation_name string animation name
function text_pointer:set_text_show_animation(animation_name) end

--- Sets a text hide animation. Any animation set here must be present on the line component in the text pointer layout.
---@param animation_name string animation name
function text_pointer:set_text_hide_animation(animation_name) end

--- Sets a different state for the text pointer panel. Any state set here must be present on the panel component in the text pointer layout.
---@param state_name string state name
function text_pointer:set_panel_state_override(state_name) end

--- Sets a different state for each line of text pointer panel. Any state set here must be present on the line component in the text pointer layout.
---@param state_name string state name
function text_pointer:set_text_state_override(state_name) end

--- Sets a different state for the line end uicomponent. Any state set here must be present on the line_end component in the text_pointer_line_parent layout.
---@param state_name string state name
function text_pointer:set_line_end_state_override(state_name) end

--- Shows a close button on the text pointer. By default a close button is not shown.
---@param show_button boolean show button
function text_pointer:set_show_close_button(show_button) end

--- Hides the text pointer when the close button is clicked. By default, this is enabled, so the panel closes when the button is clicked.
---@param close_on_click boolean close on click
function text_pointer:set_hide_on_close_button_clicked(close_on_click) end

--- Set a callback to call when the close button is clicked. An optional delay may also be set. Calling this also sets the close button to show.<br />
--- A callback set using this function will not be called if the text pointer is hidden by external script - use text_pointer:add_hide_callback to set a callback that would be called in this case.
---@param callback function Callback
---@param delay number Delay before calling callback, in s (campaign) or ms (battle/frontend)
function text_pointer:set_close_button_callback(callback, delay) end

--- Set a callback to call when the text pointer is hidden. An optional delay may also be set. A further optional flag sets the close button to show.
---@param callback function Callback
---@param delay number Delay before calling callback, in s (campaign) or ms (battle/frontend)
---@param show_close_button boolean Sets the close button to show on the text pointer. If no value is specified then the current behaviour remains untouched.
function text_pointer:add_hide_callback(callback, delay, show_close_button) end

--- Overrides the component to use as the close button, by name.
---@param component_name string component name
function text_pointer:set_close_button_component(component_name) end

--- Instructs the text pointer to highlight the close button when it shows, with an optional delay between the time of showing and the time the close button is highlighted. Immediately highlights the close button if the text pointer is already showing.
---@param delay number This is disregarded if the text pointer is already showing at the time this function is called.
function text_pointer:set_highlight_close_button(delay) end

--- Sets the text pointer to position itself/behave as a cutscene subtitle, in the lower cinematic bar. This is akin to setting the pointer display mode to "subtitle" in text_pointer:new.
---@param as_subtitle position as subtitle
function text_pointer:set_position_as_subtitle(as_subtitle) end

--- Sets the text displayed by a specified child uicomponent of the text pointer to a localised value. Use this method to show customised text on the text pointer.
---@param component_name string Name of text component on the text pointer.
---@param localised_text string Full database key of localised text, in the form [table]_[localised_field]_[record_key].
---@param from_streaming exempt Exempts this text from being streamed, if the text pointer is set to stream text.
function text_pointer:add_component_text(component_name, localised_text, from_streaming) end

--- Adds a callback to call when the text pointer is shown with text_pointer:show.
---@param callback function callback
function text_pointer:add_show_callback(callback) end

--- Makes the text pointer visible.
---@param display MILITARY_FORCE_SCRIPT_INTERFACE Forces the text pointer to display. This flag is only considered if the text pointer has been set to behave as a subtitle with text_pointer:set_position_as_subtitle, and if set to true causes the text pointer to override the player's subtitles preferences.
function text_pointer:show(display) end

--- Hides the text pointer. Supply true as a single argument to hide it immediately and prevent it from animating.
---@param immediately hide Hide the text pointer immediately without any animation.
---@param event suppress Suppress the scripted event that triggers - this is for internal use.
function text_pointer:hide(immediately, event) end

--- Returns whether the text pointer is currently showing.
---@return boolean  is showing 
function text_pointer:is_showing() end

--- Returns whether the text pointer has ever been shown.
---@return boolean  ever shown 
function text_pointer:has_ever_been_shown() end

--- Set whether to ignore core:hide_all_text_pointers() when it's called.
---@param should_ignore boolean should ignore
function text_pointer:ignore_hide_all_text_pointers(should_ignore) end

--- Set whether the escape key will be release when ignore text_pointer:hide() is called.
---@param should_stop_release boolean should stop release
function text_pointer:do_not_release_escape_key(should_stop_release) end

--- Sets the style of this text pointer. Setting a style automatically sets a range of configuration options common to that style - inspect the script function to find out what exactly gets set or to add more styles.<br />
--- Multiple styles may be set on a given text pointer if the configuration options do not overlap (if they do then the later settings will overwrite the earlier settings).<br />
--- Currently-supported styles are:<br />
--- title_and_textSets the layout of the text pointer to "text_pointer_title_and_text". When setting this style the calling script must also supply two strings specifying the text db key of the title and the text to display.
--- text_onlySets the layout of the text pointer to "text_pointer_text_only". When setting this style the calling script must also supply a string specifying the text db key of the text to display.
--- topmostSets the pointer to be topmost and with a component priority of 1500.
--- semitransparentSets the "topmost" style and the panel state to "semitransparent".
--- semitransparent_highlightSets the "semitransparent" style and sets the close button to highlight two seconds after it is shown.
--- semitransparent_highlight_dont_closeSets the "semitransparent_highlight" style. The text pointer will not close when the close button is clicked, however.
--- subtitle_with_frameSets the pointer into subtitle mode with a frame.
--- activeSets the "topmost" style, and sets the panel into the appropriate visual style for the active text pointer interface.
--- minimalistSets the "minimalist" style but without a close button.
--- 
---@param style string style
---@vararg any
function text_pointer:set_style(style, ...) end

---@class active_pointer
local active_pointer = {}

--- Creates and returns a new active text pointer object.
---@param name string Name for this text pointer. If this pointer is storing a record in the advice history (which is the default behaviour, and must be opted-out of by setting this suppress record in advice argument to true on this function) then the supplied name must be unique.
---@param orientation string Orientation of the pointer arrow that is drawn. Supported values are "topleft", "topright", "bottomleft" and "bottomright".
---@param uicomponent_specifier uicomponent/function Specifier of uicomponent to point at. This can either be a uicomponent object or a function that returns a uicomponent. It's strongly recommended that if the text pointer is not being displayed immediately after being created that a function is used.
---@param text_key string Localised text key to display, in [table]_[field]_[key] format.
---@param x_proportion number Unary x proportion specifying a pointed position relative to the dimensions of the specified component. Supply 0 to point at the left edge of the component, 1 to point at the right edge of the component, or 0.5 to point at the middle of the component, for example. Values less than zero or greater than one are valid.
---@param y_proportion number Unary y proportion specifying a pointed position relative to the dimensions of the specified component. Supply 0 to point at the top edge of the component, 1 to point at the bottom edge of the component, or 0.5 to point at the middle of the component, for example. Values less than zero or greater than one are valid.
---@param width number Width of the text pointer panel in pixels.
---@param suppress_record boolean Sets this active pointer to not record a record of whether it's been triggered in advice history. If this is set to true then the active pointer is not registered with the script core, and it doesn't need to have a unique name. However, the active pointer will not be able to automatically listen for events.
---@return active_pointer  active text pointer 
function active_pointer:new(name, orientation, uicomponent_specifier, text_key, x_proportion, y_proportion, width, suppress_record) end

--- Sets a default delay period for this active pointer, which is the period between when active_pointer:show_when_ready has detected that the pointer is ready to be shown and when the pointer is actually shown. Any default set here may be overridden when active_pointer:show_when_ready, active_pointer:show_after_active_pointer or active_pointer:show_on_event are called.
---@param delay number Delay value. This should be set in seconds in campaign, and milliseconds in battle or in the frontend.
function active_pointer:set_default_delay(delay) end

--- Sets a default timeout period for this active pointer, which is the period over which active_pointer:show_when_ready will poll the target uicomponent to see if it becomes visible and stops moving. If the timeout period elapses then the attempt to show the text pointer is stopped. By default this is 5 seconds in campaign, or 5000ms in battle or the frontend.
---@param timeout number Default timeout value. This should be set in seconds in campaign, and milliseconds in battle or in the frontend.
function active_pointer:set_default_timeout(timeout) end

--- Adds a hide-on-event record for this active pointer. If the event is received while the active pointer is being shown, and the optional conditional check passes, then the active pointer is hidden. An optional flag specifies whether this hide should happen immediately, without any fade animation.
---@param event_name string Script event name.
---@param condition function/boolean Conditional check. This can be a function that returns a boolean, or true to always pass when the supplied event is received.
---@param hide_immediately boolean Hide the text pointer immediately, without a fade animation.
function active_pointer:add_hide_on_event_record(event_name, condition, hide_immediately) end

--- Immediately shows the text pointer, unless it's been set to pay attention to advice history (and has already been shown).
function active_pointer:show() end

--- Shows the active text pointer when the target uicomponent that was specified when the active pointer was created is not moving, is visible, and is fully onscreen. If this does not happen within the timeout period (default 5 seconds) then the process is cancelled.
---@param delay_override number Delay between the uicomponent stopping moving/becoming visible and the text pointer actually being shown. This should be supplied in seconds in campaign, and in milliseconds in battle and the frontend. The default value is 1 second, or 1000ms, or whatever has been set with active_pointer:set_default_delay.
---@param timeout_override number Timeout period override. The timeout is the elapsed period after which the show_when_ready process will halt if the target uicomponent has not stopped moving or become visible. In campaign this should be supplied in seconds, and defaults to either 5 or whatever value has been set with active_pointer:set_default_timeout. In battle and the frontend, the timeout period is set in milliseconds and defaults to 5000.
function active_pointer:show_when_ready(delay_override, timeout_override) end

--- Prevents this active pointer from being shown before another active pointer has been shown. An active pointer may wait for multiple other active pointers, each wait being registered with a call to this function. Should multiple waits be set up for an active pointer, it will fail to display until all active pointers being waited for have finished showing.<br />
--- This function sets up an active_pointer:show_after_active_pointer process automatically, which attempts to show this pointer once the active pointer being waited for is dismissed.<br />
--- This active pointer must have registered itself in the advice history for this function to work.
---@param active_pointer_name string Name of active pointer to wait for. The active pointer being waited for must have registered itself in the advice history.
---@param delay_override number Delay override, which will be supplied to active_pointer:show_when_ready if this monitor tries to show the pointer. This is the delay between the uicomponent stopping moving/becoming visible and the text pointer actually being shown. This should be supplied in seconds in campaign, and in milliseconds in battle and the frontend. The default value is 1 second, or 1000ms, or whatever has been set with active_pointer:set_default_delay.
---@param timeout_override number Timeout period override, which will be supplied to active_pointer:show_when_ready if this monitor tries to show the pointer. The timeout is the elapsed period after which the show_when_ready process will halt if the target uicomponent has not stopped moving or become visible. In campaign this should be supplied in seconds, and defaults to either 5 or whatever value has been set with active_pointer:set_default_timeout. In battle and the frontend, the timeout period is set in milliseconds and defaults to 5000.
function active_pointer:wait_for_active_pointer(active_pointer_name, delay_override, timeout_override) end

--- Sets up a listener that attempts to show this active pointer once the specified active pointer closes. Unlike active_pointer:wait_for_active_pointer this doesn't demand that the specified active pointer must have first been shown before this active pointer can be shown - this active pointer could trigger before the specified active pointer (from a different event, for example).<br />
--- This active pointer must have registered itself in the advice history for this function to work.
---@param active_pointer_name string Name of active pointer to wait for. The active pointer being waited for must have registered itself in the advice history.
---@param delay_override number Delay override, which will be supplied to active_pointer:show_when_ready if this monitor tries to show the pointer. This is the delay between the uicomponent stopping moving/becoming visible and the text pointer actually being shown. This should be supplied in seconds in campaign, and in milliseconds in battle and the frontend. The default value is 1 second, or 1000ms, or whatever has been set with active_pointer:set_default_delay.
---@param timeout_override number Timeout period override, which will be supplied to active_pointer:show_when_ready if this monitor tries to show the pointer. The timeout is the elapsed period after which the show_when_ready process will halt if the target uicomponent has not stopped moving or become visible. In campaign this should be supplied in seconds, and defaults to either 5 or whatever value has been set with active_pointer:set_default_timeout. In battle and the frontend, the timeout period is set in milliseconds and defaults to 5000.
function active_pointer:show_after_active_pointer(active_pointer_name, delay_override, timeout_override) end

--- Sets the active pointer to trigger when a script event is received, with an optional conditional check that must be passed.<br />
--- This active pointer must have registered itself in the advice history for this function to work.
---@param event string Event name.
---@param condition boolean/function Conditional check. This may be omitted, or true may be supplied to always trigger whenever the supplied event is received.
---@param delay_override number Delay override, which will be supplied to active_pointer:show_when_ready if this monitor tries to show the pointer. This is the delay between the uicomponent stopping moving/becoming visible and the text pointer actually being shown. This should be supplied in seconds in campaign, and in milliseconds in battle and the frontend. The default value is 1 second, or 1000ms, or whatever has been set with active_pointer:set_default_delay.
---@param timeout_override number Timeout period override, which will be supplied to active_pointer:show_when_ready if this monitor tries to show the pointer. The timeout is the elapsed period after which the show_when_ready process will halt if the target uicomponent has not stopped moving or become visible. In campaign this should be supplied in seconds, and defaults to either 5 or whatever value has been set with active_pointer:set_default_timeout. In battle and the frontend, the timeout period is set in milliseconds and defaults to 5000.
function active_pointer:show_on_event(event, condition, delay_override, timeout_override) end
