
---@class narrative_event
local narrative_event = {}

--- Creates and returns a narrative event object. An advice key, infotext, and mission key may optionally be specified. Alternatively, narrative elements (e.g. cutscenes, event messages) can be triggered by adding them as an on-trigger callback using narrative_event:set_trigger_callback.
---@param name string Unique name amongst narrative event objects.
---@param faction_key string Key of faction, from the factions database table, to issue the content to.
---@param advice_key string Advice key to play with content, from the advice_threads table.
---@param infotext table Infotext to issue with advice. This should be a table of strings, each specifying a record from the advice_info_texts table.
---@param mission_key string Key of mission record from missions table to issue.
---@param completion_message string Script message to trigger when the supplied mission is completed. This can also be a table of strings if multiple completion messages are desired.
---@param suppress_completion_event boolean Suppress mission completion event messages when this mission completes. This is experimental functionality.
function narrative_event:new(name, faction_key, advice_key, infotext, mission_key, completion_message, suppress_completion_event) end

--- Returns whether this narrative event is currently active and listening for its various trigger conditions. This becomes true when narrative_event:start is called and false when the narrative event triggers.
function narrative_event:is_running() end

--- Returns whether this narrative event has triggered in this campaign save.
function narrative_event:has_triggered_this_campaign() end

--- Returns whether this narrative event has ever been triggered in any campaign, from the advice history. This is mainly for internal use but can be called externally if required.
function narrative_event:has_been_seen_in_advice_history() end

--- Adds a new scripted objective to the internally-created mission manager. See mission_manager:add_new_objective for more information.
---@param objective_type string objective type
function narrative_event:add_new_objective(objective_type) end

--- Adds a new condition to the mission objective most recently added with narrative_event:add_new_objective. See mission_manager:add_condition for more information.
---@param condition string condition
function narrative_event:add_condition(condition) end

--- Adds a new payload to the mission objective most recently added with narrative_event:add_new_objective. See mission_manager:add_payload for more information.
---@param payload string payload
function narrative_event:add_payload(payload) end

--- Sets a mission issuer for the internally-generated mission manager. See mission_manager:set_mission_issuer for more information.
---@param issuer string issuer
function narrative_event:set_mission_issuer(issuer) end

--- Returns the internally-created mission manager, which can be used to further customise the mission to be generated.
function narrative_event:get_mission_manager() end

--- Marks this narrative event as inheriting from another narrative event. The other narrative event is specified by the unique name and faction key supplied on creation.
---@param narrative_event_name string narrative event name
---@param faction_key string faction key
function narrative_event:add_narrative_event_payload_inheritance(narrative_event_name, faction_key) end

--- Adds a script message that is triggered when this narrative event begins to issue. Multiple messages to be triggered can be added by calling this function multiple times. If the narrative event wraps its contents within an intervention then this intervention will have started by the time these messages are triggered. This means that other scripts can respond to these messages and trigger their own interventions, which will queue up behind the intervention currently playing.
---@param message string message
function narrative_event:add_message_on_issued(message) end

--- Adds a script message that fires when the mission associated with this narrative event is completed, either successfully or unsuccessfully. Multiple messages to be triggered can be added by calling this function multiple times. Other scripts can listen for this message and respond accordingly.<br />
--- If no mission is associated with this narrative event then this setting will have no effect.
---@param message string message
function narrative_event:add_message_on_mission_completed(message) end

--- Adds a callback to be called when this narrative event is triggered. This can be used to trigger narrative event actions like a cutscene or a fullscreen movie if a mission is not being triggered, or can be used to trigger actions in addition to a mission.
---@param callback function callback
function narrative_event:set_trigger_callback(callback) end

--- Sets the category of the narrative event. Supply a constant value from the table above.
---@param category_enum number category enum
function narrative_event:set_category(category_enum) end

--- Sets the priority for the intervention created by this narrative event, if one is created. If a priority is not set with this function then one is determined from the category (see narrative_event:set_category).<br />
--- The supplied value should be a number between 0 (high priority) and 100 (lowest). See the intervention documentation for more details.
---@param priority number priority
function narrative_event:set_priority(priority) end

--- Sets a camera scroll target callback. This function will be stored and then later called when the narrative event is triggered. It should return either a string, a number or a table that specifies a scroll target for the narrative event. Note that the narrative event may decide not to scroll the camera in any case due to advice settings, in which case this function would not be called - see the documentation for Narrative Event Categories for more information.<br />
--- If the function returns a string, a region is looked up with this key and, if found, the region's settlement is used as the camera scroll target. If no region is found then a faction is looked up with the key. If found, the closest military force from the faction to the camera is used for the scroll target.<br />
--- If the function returns a number then it is assumed to be a character command queue index value. The character looked up by this cqi is used as the camera scroll target.<br />
--- The function may also return an indexed table that specifies a display position e.g. {100, 200}.<br />
--- If the function returns nil or any of the above queries fail then no scroll target is set.
---@param callback function callback
function narrative_event:set_camera_scroll_target_callback(callback) end

--- Adds a precondition function.
---@param precondition function Precondition function. This should be a function that returns a boolean value. Should the value evaluate to false when the precondition is called, the precondition is failed.
---@param name string Name by which this precondition function may later be removed with narrative_event:remove_precondition.
---@param fail_message string Script message to transmit in the event that this precondition fails. This can either be a string or an indexed table of strings if multiple messages are required.
function narrative_event:add_precondition(precondition, name, fail_message) end

--- Removes a previously-added precondition by name.
---@param name string Name of precondition to remove.
function narrative_event:remove_precondition(name) end

--- Adds an advice precondition function.
---@param precondition function Advice precondition function. This should be a function that returns a boolean value. Should the value evaluate to false when the precondition is called, the precondition is failed.
---@param name string Name for this advice precondition, by which it may be later removed with narrative_event:remove_advice_precondition.
function narrative_event:add_advice_precondition(precondition, name) end

--- Removes a previously-added advice precondition by name.
---@param name string name
function narrative_event:remove_advice_precondition(name) end

--- Adds a trigger message and condition. If the narrative event has been started and the supplied script message is received, and the optional condition passes, and no preconditions fail, then the narrative event will attempt to trigger.
---@param message string Message name.
---@param condition function Conditional function to execute when the supplied message is received. The condition function will be passed the message context. If the function returns true then the check passes. If no function is specified then the check will always pass.
---@param name string Name for this trigger listener. If specified, the trigger listener may be later removed during configuration by narrative_event:remove_trigger_condition.
function narrative_event:add_trigger_condition(message, condition, name) end

--- Removes a previously-added trigger condition by name.
function narrative_event:remove_trigger_condition() end

--- Forces the narrative event to not bother creating an intervention and instead trigger its contents directly, as it would in multiplayer mode. Missions associated with this narrative event will still be triggered, but associated advice will not be shown.
---@param value boolean value
function narrative_event:set_force_no_intervention(value) end

--- Adds a configuration callback for the intervention object the narrative event may create internally (interventions are created in singleplayer mode only). If any configuration callbacks have been supplied then they are called as the intervention is created, which is generally just as it's triggered. Configuration callbacks will be passed the intervention object as a single argument, which they can then make configuration calls upon.<br />
--- Setting a configuration callback allows calling scripts to tailor aspects of the intervention's presentation, such as allowing it to trigger over the top of fullscreen panels or not on the player's turn.<br />
--- Multiple configuration callbacks may be added to a narrative event. They will be called in the order that they were added.
---@param callback function callback
function narrative_event:add_intervention_configuration_callback(callback) end

--- Starts the narrative event listeners. If the narrative event has already triggered this campaign, or if its payload has already been inherited, then the listeners will not be started.<br />
--- If the optional flag is set, the narrative event will attempt to trigger immediately on startup.
---@param trigger_immediately boolean trigger immediately
function narrative_event:start(trigger_immediately) end

---@class narrative_query
local narrative_query = {}

--- Creates and returns a narrative query object. As with all narrative objects a unique name and faction key to which the query applies must be supplied.<br />
--- The query records table must be an indexed table containing one or more subtables. Each subtable should contain elements at the following keys:<br />
--- KeyData Description<br />
--- messageMessage to trigger if the related query function returns true (or a value that equates to true). This can be a single string or a table of strings if multiple pass messages are desired.
--- fail_messageOptional message to trigger if the related query function returns false (or a value that equates to false). This can be a single string or a table of strings if multiple pass messages are desired.
--- queryA function that should return a boolean value which determines whether the query passes or fails. The function will be passed two arguments:The context of the message which triggered the narrative query.The narrative query object itself.
--- <br />
--- See the Usage section of this documentation for a declaration example.
---@param name string Unique name amongst narrative query objects.
---@param faction_key string Key of faction, from the factions database table, this narrative query is related to.
---@param trigger_message string String name of message which triggers this narrative query. This may also be a table of multiple string message names, any of which will trigger the query.
---@param query_records table Query records - see the function documentation for a description of the data format to supply here.
function narrative_query:new(name, faction_key, trigger_message, query_records) end

--- Starts the narrative query's listeners.
function narrative_query:start() end

--- Defers the query, instructing it to not transmit any success or failure messages at that time. The query may be re-run with narrative_query:retrigger.<br />
--- This function may only be called from within one of the narrative query's condition callbacks.
function narrative_query:defer() end

--- Retriggers a deferred query.
function narrative_query:retrigger() end

---@class narrative_trigger
local narrative_trigger = {}

--- Creates and returns a narrative trigger object. As with all narrative objects a unique name and faction key to which the trigger applies must be supplied.<br />
--- The main events and conditions table must be an indexed table containing one or more subtables for each event/condition pair. Each subtable should contain elements at the following keys:<br />
--- KeyData Description<br />
--- eventGame event to listen for. This should be a model event and not a UI event to prevent the game desynchronising in multiplayer mode.
--- conditionCondition check to perform at the time the related event is received. This should be a function which returns a boolean value. When called, the function will be passed the event context and the narrative trigger object as two separate arguments.In common with other event/condition systems elsewhere, the boolean value true may be supplied here in place of a function, in which case the condition always passes.
--- immediateOptional boolean value which, if set to true, forces the narrative trigger to fire its trigger events immediately if this event/condition pair pass. If this value is false or is not supplied, the target message(s) are fired in an intervention which can delay their issue. In multiplayer mode the target message(s) are always fired immediately.
--- <br />
--- See the Usage section of this documentation for a declaration example.
---@param name string Unique name amongst narrative query objects.
---@param faction_key string Key of faction, from the factions database table, this narrative query is related to.
---@param target_message string String message which this narrative trigger fires when any event/condition pair are met. This may also be a table of multiple string message names, in which case all will be triggered.
---@param main_event_records table Main event and condition records. See the function documentation above for a description of the data format to supply here. This may be left blank, with main listeners added later using either narrative_trigger:add_monitor_event or narrative_trigger:add_monitor_message.
---@param start_message string If no start messages are supplied then the narrative trigger will start its main event monitors as soon as it is started.
---@param cancel_messages string Narrative messages on which to cancel the narrative trigger. This can be supplied as a single string or a table of multiple string message names.
---@param intervention_priority number Priority at which to trigger the internal intervention object, if one is declared. See intervention documentation for more information about intervention priorities.
function narrative_trigger:new(name, faction_key, target_message, main_event_records, start_message, cancel_messages, intervention_priority) end

--- Returns whether this narrative event has triggered in this campaign save.
function narrative_trigger:has_triggered_this_campaign() end

--- Adds a event/condition monitor record to this narrative trigger. This should only be called after the creation of the narrative trigger, but before it is started with narrative_trigger:start.
---@param event string Event name.
---@param condition function Alternatively the boolean value true may be supplied in place of a function, in which case the condition always passes.
---@param trigger_immediately boolean Instructs the narrative trigger to fire its target messages immediately if this event/condition pair pass. If false is specified here, and it's a singleplayer game, the triggering of the target messages happens within an intervention.
function narrative_trigger:add_monitor_event(event, condition, trigger_immediately) end

--- Adds a script message/condition monitor record to this narrative trigger. This should only be called after the creation of the narrative trigger, but before it is started with narrative_trigger:start.
---@param message string Message name.
---@param condition function Alternatively the boolean value true may be supplied in place of a function, in which case the condition always passes.
---@param trigger_immediately boolean Instructs the narrative trigger to fire its target messages immediately if this event/condition pair pass. If false is specified here, and it's a singleplayer game, the triggering of the target messages happens within an intervention.
function narrative_trigger:add_monitor_message(message, condition, trigger_immediately) end

--- Sets whether the narrative trigger should start cancel message listeners with start message listeners. If the narrative trigger is set up with both start messages and cancel messages, then by default the cancel message listeners are not started until the start messages are received. Use this function to change this behaviour and allow the narrative trigger to be cancelled before a start message is received.
---@param value boolean value
function narrative_trigger:set_should_setup_cancel_listeners_with_start_listeners(value) end

--- Adds a start callback to the narrative trigger. This will be called when the narrative trigger starts its main monitoring processes, either when the start message is received or on startup (if no start message was specified). If the game is saved and reloaded at this point, causing the main monitors to be restarted, then any start callbacks are called again.<br />
--- A boolean flag will be passed to any start functions to indicate whether the main monitors are being started from a savegame. If the main monitors are not being started from a savegame then it means a start message has just been received - in this case the start message string is supplied to each callback as a second argument.
---@param calllback function calllback
function narrative_trigger:add_start_callback(calllback) end

--- Adds a stop callback to the narrative trigger. This will be called when the narrative trigger stops its main monitoring processes, either when a main monitor is satisfied and fires the target message(s), or when a cancel event is received while the main monitors are running. Each stop callback will be passed a flag to indicate whether the narrative trigger's target messages were fired.
---@param calllback function calllback
function narrative_trigger:add_stop_callback(calllback) end

--- Start the narrative trigger. If any start messages have been registered with the narrative trigger then a listener for these is started, otherwise the main event/condition listeners are started.<br />
--- Some main monitor records must have been added to the narrative trigger prior to this function being called, either during construction (see narrative_trigger:new) or afterwards with narrative_trigger:add_monitor_event or narrative_trigger:add_monitor_message.
function narrative_trigger:start() end

--- Force this narrative trigger to trigger a message, associated with the faction related to this narrative trigger.
function narrative_trigger:trigger_message() end

--- Instruct this narrative trigger to act as if one of its main monitors has been triggered. The narrative trigger must be in the correct phase, where its main monitors are active. A reason string may be supplied for output purposes.
---@param reason string Reason string.
---@param immediate boolean Force the narrative trigger to trigger its target messages immediately. If this is set to false, and it's a singleplayer game, then the narrative trigger will trigger the target messages within an intervention.
function narrative_trigger:force_main_trigger(reason, immediate) end
