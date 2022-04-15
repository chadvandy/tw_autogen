
---@class script_messager
local script_messager = {}

--- Removes any listener by name.
---@param message_name string message name
function script_messager:remove_listener_by_name(message_name) end

--- Triggers a string message. This prompts the messager system to notify any listeners for the subject message and call the callback that those listeners registered. An optional table of context data can be supplied to be passed through to the listening scripts.
---@param message_name string message name
---@param context_data table context data
function script_messager:trigger_message(message_name, context_data) end

--- Adds a listener for a message. If the specified message is received, the specified callback is called. If the third parameter is set to true then the listener will continue after it calls the callback and will listen indefinitely.
---@param message string Message to listen for.
---@param callback_to_call function Target to call when the message is received and the optional condition passes.
---@param persistent boolean Continue to listen after the target callback has been called.
---@param condition function Condition function which must pass for the target callback to be called. The condition function is called when the message is received, and will be passed the message context as a single argument. It must return true, or a value that equates to true in a boolean comparison, for the condition to pass. If no condition function is supplied then the condition always passes.
---@param listener_name string Name for this listener, by which it may be later cancelled.
function script_messager:add_listener(message, callback_to_call, persistent, condition, listener_name) end

--- Removes any listener listening for a particular message.
---@param message_name string message name
function script_messager:remove_listener_by_message(message_name) end

--- Blocks or unblocks a message from being transmitted in the future. If a message is blocked, no listeners will be notified when script_messager:trigger_message is called.
---@param message_name string message name
---@param should_block boolean should block
function script_messager:block_message(message_name, should_block) end

--- Gets or creates a script_messager object.
function script_messager:new() end
