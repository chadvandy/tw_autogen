
---@class navigable_tour_section
local navigable_tour_section = {}

--- 
function navigable_tour_section:get_scripted_tour_controls_uicomponent() end

--- 
function navigable_tour_section:set_tour_controls_above_infotext() end

--- Adds a skip action for this navigable tour section. Navigable tour sections should use skip callbacks to clean up after themselves. The skip action will be called when this section of the tour is skipped by the player during playback, either by navigating forwards or backwards to other tour sections or by closing the tour. Two boolean argument will be passed to the skip action function - the first, if true, indicates that the entire tour is ending, and the second, if true indicates that the tour is being skipped backwards rather than forwards.<br />
---Skip actions may be added with an optional name, by which they be later removed.<br />
---This function should only be called from within an action when the tour section is running.
---@param skip_action function skip action
---@param action_name string action name
function navigable_tour_section:add_skip_action(skip_action, action_name) end

--- 
function navigable_tour_section:add_navigable_section() end

--- 
function navigable_tour_section:cache_and_set_scripted_tour_controls_priority() end

--- Highlights the next (or finish) button on the navigable tour controls during playback. This should only be called during an action within the tour section.
function navigable_tour_section:highlight_next_button() end

--- Creates and returns a new navigable tour section.
---@param name string name
---@param activate_controls boolean Activate scripted tour controls on start of this navigable tour section. Setting this to true means that the tour next/prev buttons will be active as soon as this tour section starts. In this case navigable_tour_section:activate_tour_controls does not need to be called within a tour action.
function navigable_tour_section:new(name, activate_controls) end

--- 
function navigable_tour_section:end_action() end

--- 
function navigable_tour_section:start_previous_section() end

--- 
function navigable_tour_section:set_start_first_section_automatically() end

--- Immediately removes any skip actions from this navigable tour section with the supplied name. This should only be called during an action within the tour section.
---@param action_name string action name
function navigable_tour_section:remove_skip_action(action_name) end

--- 
function navigable_tour_section:start_action() end

--- 
function navigable_tour_section:start_next_section() end

--- Is this navigable tour section playing right now.
function navigable_tour_section:is_playing() end

--- 
function navigable_tour_section:restore_scripted_tour_controls_priority() end

--- Adds an action to be triggered while the navigable tour section is playing. Actions are added with an interval, which is the time after the start of the section that the action should occur.
---@param callback function Callback function to call.
---@param interval number Interval after the navigable tour section starts at which the specified action should be triggered. This should be given in seconds in campaign, and in ms in battle and the frontend.
function navigable_tour_section:action(callback, interval) end

--- 
function navigable_tour_section:start() end

--- Adds a precondition check to be called when the navigable tour is started. The supplied function will be called and, should it return nil or false, the section will not be added to the navigable tour.<br />
---If an optional error message string is added with the precondition then a script error displaying that message will be triggered should the precondition not pass.
---@param callback function Precondition callback. 
function navigable_tour_section:add_precondition(callback) end

--- Activates the tour control panel during playback of the navigable tour section. This should only be called during an action within the tour section.<br />
---If the activate-controls flag is not set when navigable_tour_section:new is called, as is the default behaviour, then the tour controls will remain inactive until this function is called during playback. If the last action in the tour section is called and the controls are still not active then this function will be called automatically. This failsafe behaviour prevents a situation where a section is playing and the tour controls never become active, but it should probably be avoided by either calling this function directly during an action within the section or setting the appropriate flag when calling navigable_tour_section:new.
function navigable_tour_section:activate_tour_controls() end

--- 
function navigable_tour_section:set_interval_before_tour_controls_visible() end
