
---@class topic_leader
local topic_leader = {}

--- Creates and returns a new topic leader object.
---@param name string Names for this topic leader. The topic leader uicomponent will be named after this.
---@param text_key string Localisation key (or unlocalised text) to use for the first data entry in the topic leader. This should be supplied in the full [table]_[field]_[key] localisation format, or just as a plain unlocalised string if the fourth argument is set to true.
---@param text_state string Component state for the first text entry on the topic leader. If nil is supplied then the default state is used.
---@param unlocalised boolean Use the string supplied as the second argument to this function for display directly, instead of using it to look up a localised key. This can be useful for debugging, but shouldn't be used for released content.
function topic_leader:new(name, text_key, text_state, unlocalised) end

--- Adds a new line of content to the topic leader.
---@param text_key string Localisation key (or unlocalised text) to display. This should be supplied in the full [table]_[field]_[key] localisation format, or just as a plain unlocalised string if the third argument is set to true.
---@param text_state string Component state for the text entry. If nil is supplied then the default state is used.
---@param unlocalised boolean Use the string supplied as the first argument to this function for display directly, instead of using it to look up a localised key. This can be useful for debugging, but shouldn't be used for released content.
function topic_leader:add_content(text_key, text_state, unlocalised) end

--- Sets the uicomponent state of the text uicomponent of the topic leader. Use this to customise how the text is displayed.
---@param state string state
function topic_leader:set_text_state(state) end

--- Sets the duration for which the leader uicomponent should hold in place before beginning to animate off-screen. This duration is set in milliseconds, in all game modes. The default value is 2000ms.
---@param hold_duration_in_ms number hold duration in ms
function topic_leader:set_hold_duration(hold_duration_in_ms) end

--- Sets a screen position to which the topic leader should shrink to when playing its shrink animation.
---@param x number x co-ordinate in pixels.
---@param y number y co-ordinate in pixels.
function topic_leader:set_shrink_target(x, y) end

--- Sets a uicomponent target to which the topic leader should shrink to when playing its shrink animation. This sets the topic leader to shrink to the top-left of the uicomponent, offset by the optionally-supplied offset co-ordinates. The position of the uicomponent is computed when topic_leader:start is called.
---@param uicomponent UIC UIComponent to which the topic leader should shrink towards when its shrink animation is played.
---@param x number x offset co-ordinate in pixels.
---@param y number y offset co-ordinate in pixels.
function topic_leader:set_shrink_target_uicomponent(uicomponent, x, y) end

--- Adds a shrink callback for the topic leader. This function will be called topic_leader:shrink is called, immediately prior to the topic leader beginning its shrink animation. This functionality may be used to set up the shrink target, amongst other things. Multiple shrink callbacks may be added to one topic leader.
---@param callback function callback
function topic_leader:add_shrink_callback(callback) end

--- Creates the topic leader uicomponent and starts its animated sequence.
function topic_leader:start() end

--- Forces the topic leader to start playing its shrink animation. Once the topic leader is displayed the shrink animation will play automatically after the hold duration has elapsed, but this function can be called to force it to play early.
function topic_leader:shrink() end

--- Immediately hides the topic leader, if it's showing, and destroys all running processes and listeners started by it.
function topic_leader:hide() end
