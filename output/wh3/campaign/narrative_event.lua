
---@class narrative_trigger
local narrative_trigger = {}

--- 
function narrative_trigger:add_narrative_event_payload_inheritance() end

--- Adds a stop callback to the narrative trigger. This will be called when the narrative trigger stops its main monitoring processes, either when a main monitor is satisfied and fires the target message(s), or when a cancel event is received while the main monitors are running. Each stop callback will be passed a flag to indicate whether the narrative trigger's target messages were fired.
---@param calllback function calllback
function narrative_trigger:add_stop_callback(calllback) end

--- 
function narrative_trigger:set_priority() end

--- 
function narrative_trigger:get_mission_manager() end

--- 
function narrative_trigger:set_force_no_intervention() end

--- 
function narrative_trigger:set_mission_issuer() end

--- 
function narrative_trigger:set_trigger_callback() end

--- 
function narrative_trigger:add_message_on_mission_completed() end

--- Sets whether the narrative trigger should start cancel message listeners with start message listeners. If the narrative trigger is set up with both start messages and cancel messages, then by default the cancel message listeners are not started until the start messages are received. Use this function to change this behaviour and allow the narrative trigger to be cancelled before a start message is received.
---@param value boolean value
function narrative_trigger:set_should_setup_cancel_listeners_with_start_listeners(value) end

--- 
function narrative_trigger:remove_advice_precondition() end

--- 
function narrative_trigger:add_advice_precondition() end

--- 
function narrative_trigger:add_intervention_configuration_callback() end

--- 
function narrative_trigger:add_trigger_condition() end

--- 
function narrative_trigger:add_precondition() end

--- 
function narrative_trigger:add_new_objective() end

--- 
function narrative_trigger:add_condition() end

--- Adds a script message/condition monitor record to this narrative trigger. This should only be called after the creation of the narrative trigger, but before it is started with narrative_trigger:start.
---@param message string Message name.
---@param condition function Alternatively the boolean value true may be supplied in place of a function, in which case the condition always passes.
---@param trigger_immediately boolean Instructs the narrative trigger to fire its target messages immediately if this event/condition pair pass. If false is specified here, and it's a singleplayer game, the triggering of the target messages happens within an intervention.
function narrative_trigger:add_monitor_message(message, condition, trigger_immediately) end

--- 
function narrative_trigger:is_running() end

--- 
function narrative_trigger:set_camera_scroll_target_callback() end

--- Adds a start callback to the narrative trigger. This will be called when the narrative trigger starts its main monitoring processes, either when the start message is received or on startup (if no start message was specified). If the game is saved and reloaded at this point, causing the main monitors to be restarted, then any start callbacks are called again.<br />
---A boolean flag will be passed to any start functions to indicate whether the main monitors are being started from a savegame. If the main monitors are not being started from a savegame then it means a start message has just been received - in this case the start message string is supplied to each callback as a second argument.
---@param calllback function calllback
function narrative_trigger:add_start_callback(calllback) end

--- Creates and returns a narrative trigger object. As with all narrative objects a unique name and faction key to which the trigger applies must be supplied.<br />
---The main events and conditions table must be an indexed table containing one or more subtables for each event/condition pair. Each subtable should contain elements at the following keys:<br />
---KeyData Description<br />
---eventGame event to listen for. This should be a model event and not a UI event to prevent the game desynchronising in multiplayer mode.
---conditionCondition check to perform at the time the related event is received. This should be a function which returns a boolean value. When called, the function will be passed the event context and the narrative trigger object as two separate arguments.In common with other event/condition systems elsewhere, the boolean value true may be supplied here in place of a function, in which case the condition always passes.
---immediateOptional boolean value which, if set to true, forces the narrative trigger to fire its trigger events immediately if this event/condition pair pass. If this value is false or is not supplied, the target message(s) are fired in an intervention which can delay their issue. In multiplayer mode the target message(s) are always fired immediately.
---<br />
---See the Usage section of this documentation for a declaration example.
---@param name string Unique name amongst narrative query objects.
---@param faction_key string Key of faction, from the factions database table, this narrative query is related to.
---@param target_message string String message which this narrative trigger fires when any event/condition pair are met. This may also be a table of multiple string message names, in which case all will be triggered.
---@param main_event_records table Main event and condition records. See the function documentation above for a description of the data format to supply here. This may be left blank, with main listeners added later using either narrative_trigger:add_monitor_event or narrative_trigger:add_monitor_message.
---@param start_message string If no start messages are supplied then the narrative trigger will start its main event monitors as soon as it is started.
---@param cancel_messages string Narrative messages on which to cancel the narrative trigger. This can be supplied as a single string or a table of multiple string message names.
---@param intervention_priority number Priority at which to trigger the internal intervention object, if one is declared. See intervention documentation for more information about intervention priorities.
function narrative_trigger:new(name, faction_key, target_message, main_event_records, start_message, cancel_messages, intervention_priority) end

--- Instruct this narrative trigger to act as if one of its main monitors has been triggered. The narrative trigger must be in the correct phase, where its main monitors are active. A reason string may be supplied for output purposes.
---@param reason string Reason string.
---@param immediate boolean Force the narrative trigger to trigger its target messages immediately. If this is set to false, and it's a singleplayer game, then the narrative trigger will trigger the target messages within an intervention.
function narrative_trigger:force_main_trigger(reason, immediate) end

--- 
function narrative_trigger:defer() end

--- 
function narrative_trigger:set_category() end

--- 
function narrative_trigger:has_been_seen_in_advice_history() end

--- 
function narrative_trigger:add_message_on_issued() end

--- 
function narrative_trigger:remove_precondition() end

--- Force this narrative trigger to trigger a message, associated with the faction related to this narrative trigger.
function narrative_trigger:trigger_message() end

--- 
function narrative_trigger:add_payload() end

--- Adds a event/condition monitor record to this narrative trigger. This should only be called after the creation of the narrative trigger, but before it is started with narrative_trigger:start.
---@param event string Event name.
---@param condition function Alternatively the boolean value true may be supplied in place of a function, in which case the condition always passes.
---@param trigger_immediately boolean Instructs the narrative trigger to fire its target messages immediately if this event/condition pair pass. If false is specified here, and it's a singleplayer game, the triggering of the target messages happens within an intervention.
function narrative_trigger:add_monitor_event(event, condition, trigger_immediately) end

--- Start the narrative trigger. If any start messages have been registered with the narrative trigger then a listener for these is started, otherwise the main event/condition listeners are started.<br />
---Some main monitor records must have been added to the narrative trigger prior to this function being called, either during construction (see narrative_trigger:new) or afterwards with narrative_trigger:add_monitor_event or narrative_trigger:add_monitor_message.
function narrative_trigger:start() end

--- Returns whether this narrative event has triggered in this campaign save.
function narrative_trigger:has_triggered_this_campaign() end

--- 
function narrative_trigger:remove_trigger_condition() end

--- 
function narrative_trigger:retrigger() end
