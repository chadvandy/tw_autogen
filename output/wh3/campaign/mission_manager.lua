
---@class mission_manager
local mission_manager = {}

--- Adds a new scripted objective, along with some text to display, a completion event and condition to monitor. An optional script name for this objective may also be specified, which can be useful if there is more than one objective.
---@param display_text string Display text for this objective. This should be supplied as a full localisation key, i.e. [table]_[field]_[key].
---@param event string Script event name of mission success condition.
---@param condition function While the mission is active the mission manager listens for the event specified in the second parameter. When it is received, the condition specified here is called. If it returns true, or if true was specified in place of a condition function, the mission objective is marked as being successfully completed.
---@param script_name string Script name for this objective. If specified, this allows calls to mission_manager:add_scripted_objective_success_condition, mission_manager:add_scripted_objective_failure_condition, mission_manager:force_scripted_objective_success or mission_manager:force_scripted_objective_failure to target this objective (they target the first objective by default).
function mission_manager:add_new_scripted_objective(display_text, event, condition, script_name) end

--- When it goes to trigger the mission manager will, by default, add the relevant mission/dilemma/incident type to the event whitelist so that it triggers even if event messages are currently suppressed (see campaign_manager:suppress_all_event_feed_messages). Events are commonly suppressed when an intervention is triggering, for example. Use this function to disable this behaviour, if required, so that the triggered event is not whitelisted and does not show.
---@param should_whitelist boolean should whitelist
function mission_manager:set_should_whitelist(should_whitelist) end

--- Returns true if the mission manager has been triggered but not yet completed.
function mission_manager:is_active() end

--- Adds a payload (reward) to the objective last added with mission_manager:add_new_objective. Many different payload types exists: faction_pooled_resource_transaction, add_mercenary_to_faction_pool, adjust_loyalty_for_faction, province_slaves_change, faction_slaves_change, money, influence, honour, grant_unit, grant_agent, ancillary, effect_bundle, rebellion, demolish_chain, damage_buildings, damage_character, building_restriction, unit_restriction, issue_mission, and game_victory. Each has a different parameter requirement - see existing examples or a programmer for more information.<br />
---The function will optionally attempt to combine this payload reward with others of the same type if they are found, if the enable combining parameter is set to true.
---@param payload string payload
---@param enable_payload_combining boolean enable payload combining
function mission_manager:add_payload(payload, enable_payload_combining) end

--- Sets an issuer for this mission, which determines some aspects of the mission's presentation. By default this is set to "CLAN_ELDERS", but use this function to change this. A list of valid mission issuers can be found in the mission_issuers table.
---@param mission_issuer string mission issuer
function mission_manager:set_mission_issuer(mission_issuer) end

--- Specifies a callback to call, one time, when the mission is first triggered. This can be used to set up other scripts or game objects for this mission.
---@param callback function callback
function mission_manager:add_first_time_trigger_callback(callback) end

--- Returns true if the mission manager has been triggered in the past, false otherwise. If triggered it might not still be running, as the mission could have been completed.
function mission_manager:has_been_triggered() end

--- Sets a victory type for this mission, which is used for victory conditions only. A list of valid victory types can be found in the victory_types table.
---@param victory_type string victory type
function mission_manager:set_victory_type(victory_type) end

--- Triggers the mission, causing it to be issued.
---@param dismiss_callback function Dismiss callback. If specified, this is called when the event panel is dismissed.
---@param callback_delay number Dismiss callback delay, in seconds. If specified this introduces a delay between the event panel being dismissed and the dismiss callback being called.
function mission_manager:trigger(dismiss_callback, callback_delay) end

--- Updates the displayed objective text of a scripted objective. This can be useful if some counter needs to be updated as progress towards an objective is made. A particular scripted objective may be specified by supplying a script key, otherwise this function will target the first scripted objective in the mission manager.<br />
---This should only be called after the mission manager has been triggered.
---@param display_text string Display text for this objective. This should be supplied as a full localisation key, i.e. [table]_[field]_[key].
---@param script_name string Script name of the scripted objective to update the key of.
function mission_manager:update_scripted_objective_text(display_text, script_name) end

--- Immediately forces the success of a scripted objective. A particular scripted objective may be specified by supplying a script key, otherwise this function will target the first scripted objective in the mission manager.<br />
---This should only be called after the mission manager has been triggered.
---@param script_name string Script name of the scripted objective to force the success of.
function mission_manager:force_scripted_objective_success(script_name) end

--- Immediately forces the failure of a scripted objective. A particular scripted objective may be specified by supplying a script key, otherwise this function will target the first scripted objective in the mission manager.<br />
---This should only be called after the mission manager has been triggered.
---@param script_name string Script name of the scripted objective to force the failure of.
function mission_manager:force_scripted_objective_failure(script_name) end

--- Adds a callback to call each time the mission is triggered, either for the first time or subsequently from a savegame. This can be used to set up other scripts or game objects for this mission each time the script is loaded, or to set up the mission manager itself with Persistent Values. Each-time callbacks are called after any first-time callbacks added with mission_manager:add_each_time_trigger_callback.
---@param callback function callback
function mission_manager:add_each_time_trigger_callback(callback) end

--- Adds a new failure condition to a scripted objective. scripted objective. If a script key is specified the failure condition is added to the objective with this key (assuming it exists), otherwise the failure condition is added to the first scripted objective.
---@param event string Script event name of mission failure condition.
---@param condition function While the mission is active the mission manager listens for the event specified in the second parameter. When it is received, the condition specified here is called. If it returns true, or if true was specified in place of a condition function, the mission objective is marked as being failed.
---@param script_name string Script name of the scripted objective to append this failure condition to.
function mission_manager:add_scripted_objective_failure_condition(event, condition, script_name) end

--- Returns true if the mission has been completed, false otherwise. Success, failure or cancellation all count as completion.
function mission_manager:is_completed() end

--- Sets a position for this mission, which is used to zoom to a location.
---@param x number Logical x co-ordinate
---@param y number Logical y co-ordinate
function mission_manager:set_position(x, y) end

--- Adds a new success condition to a scripted objective. scripted objective. If a script key is specified the success condition is added to the objective with this key (assuming it exists), otherwise the success condition is added to the first scripted objective.
---@param event string Script event name of mission success condition.
---@param condition function While the mission is active the mission manager listens for the event specified in the second parameter. When it is received, the condition specified here is called. If it returns true, or if true was specified in place of a condition function, the mission objective is marked as being successfully completed.
---@param script_name string Script name of the scripted objective to append this success condition to.
function mission_manager:add_scripted_objective_success_condition(event, condition, script_name) end

--- Sets a persistent value on the mission manager with a supplied string name. The value can be a boolean, number, string or table.
---@param name string name
---@param value any value
function mission_manager:set_persistent_value(name, value) end

--- Adds a heading key override for the objective last added with mission_manager:add_new_objective. This should be supplied as a string in the full localised text format [table]_[field]_[record].
---@param heading_key string heading key
function mission_manager:add_heading(heading_key) end

--- Adds a condition to the objective last added with mission_manager:add_new_objective. Multiple conditions are commonly added - each objective type has different mandatory and optional conditions.
---@param condition string condition
function mission_manager:add_condition(condition) end

--- Adds the mission payloads from another mission manager to this mission manager.
---@param mm mission_manager mm
function mission_manager:add_payload_from_mission_manager(mm) end

--- Sets a turn limit for the entire mission. This is optional.
---@param turn_limit number turn limit
function mission_manager:set_turn_limit(turn_limit) end

--- Activates/deactivates the showing of the mission event as it is triggered. By default, the event message is shown - this function may be used to disable this behaviour. When this setting is disabled, the mission manager will use cm:disable_event_feed_events to suppress the mission subcategory prior to triggering, and then again to unsuppress mission event once triggered.<br />
---This setting only takes effect if the mission manager is triggering a mission. It has no effect if the mission manager has been set to trigger an incident or dilemma with mission_manager:set_is_incident_in_db or mission_manager:set_is_dilemma_in_db.
---@param show_event boolean show event
function mission_manager:set_show_mission(show_event) end

--- Creates a mission manager object. A faction name for the mission recipient and a mission key must be specified at the very least. The mission key must match a record in the missions table, which must be present in all cases.<br />
---A mission success callback, a mission failure callback, a mission cancellation callback and a mission nearing-expiry callback may optionally also be specified. Setting any of these also sets the mission to be persistent, which creates extra requirements for how the mission manager is declared - see the section above on Persistence.
---@param faction_name string Name of faction that will be receiving this mission.
---@param mission_key string Key corresponding to a record in the missions table.
---@param success_callback function Callback to call if the mission is successfully completed. Setting this makes the mission manager persistent.
---@param failure_callback function Callback to call if the mission is failed. Setting this makes the mission manager persistent.
---@param cancellation_callback function Callback to call if the mission is cancelled. Setting this makes the mission manager persistent.
function mission_manager:new(faction_name, mission_key, success_callback, failure_callback, cancellation_callback) end

--- Returns a persistent value previously saved with mission_manager:set_persistent_value. If no persistent value has been saved on this mission manager with the supplied name.
function mission_manager:get_persistent_value() end

--- Resets a running mission manager, so that it is ready to be triggered again.
function mission_manager:reset() end

--- Adds a new objective type to the mission specification, and also sets the mission manager to construct its mission from a string.<br />
---Multiple objectives may be added to a mission with this function. The first shall be the primary objective of the mission, while subsequent additions shall be set up as secondary objectives.
---@param objective_type string objective type
function mission_manager:add_new_objective(objective_type) end

--- Adds a payload (on mission faiure) to the objective last added with mission_manager:add_new_objective. Many different payload types exists - the following list is pulled from code: faction_pooled_resource_transaction, add_mercenary_to_faction_pool, adjust_loyalty_for_faction, province_slaves_change, faction_slaves_change, money, influence, honour, grant_unit, grant_agent, effect_bundle, rebellion, demolish_chain, damage_buildings, damage_character, building_restriction, unit_restriction, issue_mission, and game_victory. Each has a different parameter requirement - see existing examples or a programmer for more information.
---@param payload string payload
function mission_manager:add_failure_payload(payload) end

--- Sets that the mission objectives should be constructed from records in the game database, and that the mission is actually an incident.
function mission_manager:set_is_incident_in_db() end

--- Sets that the mission objectives should be constructed from records in the game database, and that the mission is actually a dilemma.
---@param is_intervention boolean Is a dilemma in an intervention. If this is set to true, the dilemma will be triggered directly using campaign_manager:trigger_dilemma_raw, which can cause softlocks when triggered from outside of an intervention. If set to false or left blank then the dilemma will be triggered in campaign_manager:trigger_dilemma which attempts to package the dilemma in an intervention.
function mission_manager:set_is_dilemma_in_db(is_intervention) end

--- Sets that the mission objectives should be constructed from records in the game database.
function mission_manager:set_is_mission_in_db() end

--- Sets this mission to be a particular chapter mission, which affects how it is displayed and categorised on the UI.
---@param chapter_number number chapter number
function mission_manager:set_chapter(chapter_number) end

--- Adds a description key override for the objective last added with mission_manager:add_new_objective. This should be supplied as a string in the full localised text format [table]_[field]_[record].
---@param description_key string description key
function mission_manager:add_description(description_key) end

--- When it goes to trigger the mission manager will, if the mission is persistent (see Persistence), issue a call to cancel any mission with the key specified in mission_manager:new before issuing its mission. This behaviour can be disabled, or enabled for non-persistent missions, by calling this function.
---@param cancel_before_issuing boolean cancel before issuing
function mission_manager:set_should_cancel_before_issuing(cancel_before_issuing) end
