
---@class advice_manager
local advice_manager = {}

--- Creates and returns a new advice manager. Client scripts do not need to call this, however by doing so they will be able to set it into debug mode for more output with advice_manager:set_debug, or disable advice with advice_manager:lock_advice.
---@param debug_mode boolean debug mode
function advice_manager:new(debug_mode) end

--- Sets debug mode on the advice manager for more output
---@param debug_mode boolean debug mode
function advice_manager:set_debug(debug_mode) end

--- Adds an advice lock level to the advice manager, preventing the advice manager from triggering any advice. No advice monitors will trigger if any advice lock is active, and advice only unlocked when all advice locks are removed with advice_manager:unlock_advice.
function advice_manager:lock_advice() end

--- Removes an advice lock level to the advice manager, potentially allowing the advice manager to trigger advice again. Advice locks are added with advice_manager:lock_advice. No advice monitors will trigger if any advice lock is active, and advice only unlocked when all advice locks are removed with advice_manager:unlock_advice.
function advice_manager:unlock_advice() end

---@class advice_monitor
local advice_monitor = {}

--- Creates and returns a new advice monitor.
---@param name string Name for the advice monitor. Must be unique amongst advice monitors.
---@param priority number Priority of the advice. When two items of advice wish to trigger at the same time, the advice with the higher priority is triggered.
---@param advice_key string Key of the advice to trigger. The history of this advice thread is also checked when monitor is started - if it has been heard before then the monitor does not start.
---@param infotext table Table of infotext keys to show alongside the advice.
function advice_monitor:new(name, priority, advice_key, infotext) end

--- Sets the minimum advice level at which the advice may be allowed to trigger. If the advice level is set to less than that required by the advice monitor when the advice monitor is started, then the monitor will immediately terminate. By default, advice monitors allow their advice to trigger if the advice level is set to low or high.
---@param advice_level number Minimum advice level. Valid values are 0 (minimul advice), 1 (low advice) and 2 (high advice).
function advice_monitor:set_advice_level(advice_level) end

--- Sets whether this advice can interrupt other advice. By default this is disabled.
---@param can_interrupt boolean can interrupt
function advice_monitor:set_can_interrupt_other_advice(can_interrupt) end

--- Sets a delay period before the advice is actually triggered. This is 1000ms by default.
---@param delay_in_ms number delay in ms
function advice_monitor:set_delay_before_triggering(delay_in_ms) end

--- Sets the duration for which this advice monitor blocks other non-interrupting advice for. By default this is 60000ms.
---@param duration_in_ms number duration in ms
function advice_monitor:set_duration(duration_in_ms) end

--- Sets a callback for the advice monitor to call at the point the advice is triggered (i.e. after any delay set with advice_monitor:set_delay_before_triggering).
---@param callback function Callback to call.
---@param dont_trigger_advice boolean If set to true, this monitor will trigger the callback but will not trigger the supplied advice or infotext itself. Set this to true if the callback takes care of triggering the advice itself.
function advice_monitor:set_trigger_callback(callback, dont_trigger_advice) end

--- Sets a callback for the advice monitor to call at the point the advice is halted.
---@param callback function Callback to call.
function advice_monitor:set_halt_callback(callback) end

--- Sets the advice monitor to automatically halt or not when the battle ends. Advice monitors do halt when the battle ends by default - use this function to suppress this behaviour.
---@param halt_on_end boolean halt on end
function advice_monitor:set_halt_advice_on_battle_end(halt_on_end) end

--- Adds an ignore advice history condition callback. Advice history conditions are queried when the advice monitor is started and, if any return true or a value that evaluates to true then advice history for this advice monitor will be disregarded when it decides whenther to start.
---@param condition function condition
function advice_monitor:add_ignore_advice_history_condition(condition) end

--- Adds an ignore advice history condition for a tweaker. If the supplied tweaker is set, then the advice monitor will ignore its advice history condition. Tweakers are used during development and the game should not be released with any tweakers active. Therefore, a script error will be thrown if the tweaker is set to remind developers to unset it at some point.
---@param tweaker_name string tweaker name
function advice_monitor:add_ignore_advice_history_tweaker(tweaker_name) end

--- Adds a start condition for the advice monitor, which determines when the advice monitor will begin monitoring its trigger conditions. Supply one of the following combination of arguments:<br />
--- A condition function that returns a boolean value. In this case, the condition will be repeatedly called until it returns true. Once this happens the advice monitor will begin monitoring for the trigger condition.<br />
--- A condition function that returns a boolean value, and an event. In this case, the event will be listened for and, when received, the condition function called. Should it return true the advice monitor will begin monitoring for the trigger condition.<br />
--- true in place of a condition function, and an event. In this case, the advice monitor will begin monitoring for the trigger condition as soon as the event is received, with no conditional check.
---@param condition function Conditional function. Supply a function that returns a boolean value, or true (if also supplying an event).
---@param event string Event to test.
function advice_monitor:add_start_condition(condition, event) end

--- Adds a trigger condition for the advice monitor. Supply one of the following combination of arguments:<br />
--- A condition function that returns a boolean value. In this case, the condition will be polled until it passes, at which point the advice will be considered for playing.<br />
--- A condition function that returns a boolean value, and an event. In this case, the event will be listened for and, when received, the condition checked. Should it pass, the advice will be considered for playing.<br />
--- true in place of a condition function, and an event. In this case, the advice will be considered for playback when the event is received.
---@param condition function Conditional function. Supply a function that returns a boolean value, or true (if also supplying an event).
---@param event string Event to test.
function advice_monitor:add_trigger_condition(condition, event) end

--- Adds a halt condition for the advice monitor. Supply one of the following combination of arguments:<br />
--- A condition function that returns a boolean value. In this case, the condition will be polled until it passes, at which point the monitor halts.<br />
--- A condition function that returns a boolean value, and an event. In this case, the event will be listened for and, when received, the condition checked. Should it pass, the advice monitor will halt.<br />
--- true in place of a condition function, and an event. In this case, the advice monitor will halt when the event is received.
---@param condition function Conditional function. Supply a function that returns a boolean value, or true (if also supplying an event).
---@param event string Event to test.
function advice_monitor:add_halt_condition(condition, event) end

--- Halts this advice monitor when another advice monitor successfully triggers its advice. The other advice monitor is specified by its name.
---@param name string Name of advice monitor to halt on.
function advice_monitor:add_halt_on_advice_monitor_triggering(name) end

--- Halts another advice monitor when this monitor successfully triggers. The other advice monitor is specified by its name.
---@param name string Name of advice monitor to halt when this monitor triggers.
function advice_monitor:add_halt_advice_monitor_on_trigger(name) end
