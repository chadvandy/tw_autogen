
---@class navigable_tour
local navigable_tour = {}

--- Creates and returns a navigable tour object. Each navigable tour must be given a unique string name and, optionally, an end callback which will be called when the scripted tour ends or is skipped.<br />
--- An optional tour title may also be supplied as a full [table]_[field]_[key]-style localised key. If supplied, the title of the navigable tour control panel will be set to the localised text specified by the key.
---@param name string Unique name for the scripted tour.
---@param end_callback function End callback.
---@param tour_title string Full localisation key to use for navigable tour title.
function navigable_tour:new(name, end_callback, tour_title) end

--- Sets the tour controls to appear above the infotext panel in the top-left of the screen. The tour controls panel will also be stretched horizontally to be the same width as the infotext panel.<br />
--- If false is supplied as an argument then the tour controls revert back to being underneath the infotext panel.
---@param tour_controls_above_infotext boolean tour controls above infotext
function navigable_tour:set_tour_controls_above_infotext(tour_controls_above_infotext) end

--- Sets the interval at the start of the tour before the tour controls are animated to visible. By default this value is set to 1 second. This value should be set in seconds in campaign, and milliseconds elsewhere.
---@param interval number interval
function navigable_tour:set_interval_before_tour_controls_visible(interval) end

--- Sets the scripted tour to start the first section automatically or not. By default, the first section is started automatically. Disable this behaviour with this function if the start action sequence is not of a predetermined length, such as a cutscene that must be dismissed.<br />
--- If the first section is not started automatically then it must be started manually with navigable_tour:start_next_section.
---@param should_start_automatically boolean should start automatically
function navigable_tour:set_start_first_section_automatically(should_start_automatically) end

--- Adds an action to the navigable tour's starting sequence.
---@param action function Action callback.
---@param action_time number Interval after the start of the tour at which to trigger the action. This should be given in seconds in campaign, and milliseconds otherwise.
function navigable_tour:start_action(action, action_time) end

--- Adds an action to the navigable tour's ending sequence.
---@param action function Action callback.
---@param action_time function Interval after the start of the tour at which to trigger the action. This should be given in seconds in campaign, and milliseconds otherwise.
function navigable_tour:end_action(action, action_time) end

--- Adds a navigable_tour_section to the navigable tour. Navigable tour sections should be added in the order in which they should be shown in game.
---@param navigable_tour_section navigable_tour_section navigable tour section
function navigable_tour:add_navigable_section(navigable_tour_section) end

--- Starts the navigable tour.
function navigable_tour:start() end

--- Cause the navigable tour to skip to the next section. If the start actions are being played then the first section of the tour is started.
function navigable_tour:start_next_section() end

--- Cause the navigable tour to skip to the previous section.
function navigable_tour:start_previous_section() end

--- Gets the scripted tour controls panel, creating it if it doesn't already exist. This is mainly for internal use but could feasibly be called externally.
---@param do_not_create boolean Do not create - if set to true, the tour controls are not created if they do not already exist.
function navigable_tour:get_scripted_tour_controls_uicomponent(do_not_create) end

--- Sets the priority to the supplied value, and caches the value previously set. The scripted tour controls priority can later be restored with restore_scripted_tour_controls_priority.<br />
--- The register_topmost flag can also be set to force the scripted tour controls to topmost.
function navigable_tour:cache_and_set_scripted_tour_controls_priority() end

--- Restores the scripted tour controls priority to a value previously cached with cache_and_set_scripted_tour_controls_priority.
function navigable_tour:restore_scripted_tour_controls_priority() end

---@class navigable_tour_section
local navigable_tour_section = {}

--- Creates and returns a new navigable tour section.
---@param name string name
---@param activate_controls boolean Activate scripted tour controls on start of this navigable tour section. Setting this to true means that the tour next/prev buttons will be active as soon as this tour section starts. In this case navigable_tour_section:activate_tour_controls does not need to be called within a tour action.
function navigable_tour_section:new(name, activate_controls) end

--- Adds a precondition check to be called when the navigable tour is started. The supplied function will be called and, should it return nil or false, the section will not be added to the navigable tour.<br />
--- If an optional error message string is added with the precondition then a script error displaying that message will be triggered should the precondition not pass.
---@param callback function Precondition callback. 
function navigable_tour_section:add_precondition(callback) end

--- Adds an action to be triggered while the navigable tour section is playing. Actions are added with an interval, which is the time after the start of the section that the action should occur.
---@param callback function Callback function to call.
---@param interval number Interval after the navigable tour section starts at which the specified action should be triggered. This should be given in seconds in campaign, and in ms in battle and the frontend.
function navigable_tour_section:action(callback, interval) end

--- Adds a skip action for this navigable tour section. Navigable tour sections should use skip callbacks to clean up after themselves. The skip action will be called when this section of the tour is skipped by the player during playback, either by navigating forwards or backwards to other tour sections or by closing the tour. Two boolean argument will be passed to the skip action function - the first, if true, indicates that the entire tour is ending, and the second, if true indicates that the tour is being skipped backwards rather than forwards.<br />
--- Skip actions may be added with an optional name, by which they be later removed.<br />
--- This function should only be called from within an action when the tour section is running.
---@param skip_action function skip action
---@param action_name string action name
function navigable_tour_section:add_skip_action(skip_action, action_name) end

--- Immediately removes any skip actions from this navigable tour section with the supplied name. This should only be called during an action within the tour section.
---@param action_name string action name
function navigable_tour_section:remove_skip_action(action_name) end

--- Activates the tour control panel during playback of the navigable tour section. This should only be called during an action within the tour section.<br />
--- If the activate-controls flag is not set when navigable_tour_section:new is called, as is the default behaviour, then the tour controls will remain inactive until this function is called during playback. If the last action in the tour section is called and the controls are still not active then this function will be called automatically. This failsafe behaviour prevents a situation where a section is playing and the tour controls never become active, but it should probably be avoided by either calling this function directly during an action within the section or setting the appropriate flag when calling navigable_tour_section:new.
function navigable_tour_section:activate_tour_controls() end

--- Highlights the next (or finish) button on the navigable tour controls during playback. This should only be called during an action within the tour section.
function navigable_tour_section:highlight_next_button() end

--- Is this navigable tour section playing right now.
function navigable_tour_section:is_playing() end
