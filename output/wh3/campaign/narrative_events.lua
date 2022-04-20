
---@class narrative_events
local narrative_events = {}

--- Creates and starts a how-they-play narrative event. This shows the how-they-play event message for the supplied faction key in singelplayer mode. In multiplayer mode nothing is shown and the narrative flow proceeds immediately.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:how_they_play(unique_name, faction_key, trigger_message) end

--- Creates and starts an event message narrative event. An event message with the specified title, primary and secondary text will be shown.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param title_text_key string Text key of title for the event message to create, in full localised [table]_[field]_[record_key] format.
---@param primary_text_key string Text key of primary text for the event message to create, in full localised [table]_[field]_[record_key] format.
---@param secondary_text_key string Text key of secondary text for the event message to create, in full localised [table]_[field]_[record_key] format.
---@param persistent boolean Persistence flag to pass to campaign_manager:show_message_event.
---@param index number Index value to pass to campaign_manager:show_message_event. This determines the header image shown.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:event_message(unique_name, faction_key, title_text_key, primary_text_key, secondary_text_key, persistent, index, trigger_message) end

--- Creates and starts an event message narrative event. An event message with the specified title, primary and secondary text will be shown. It will be shown as it is triggered, regardless of which faction is taking their turn.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param title_text_key string Text key of title for the event message to create, in full localised [table]_[field]_[record_key] format.
---@param primary_text_key string Text key of primary text for the event message to create, in full localised [table]_[field]_[record_key] format.
---@param secondary_text_key string Text key of secondary text for the event message to create, in full localised [table]_[field]_[record_key] format.
---@param persistent boolean Persistence flag to pass to campaign_manager:show_message_event.
---@param index number Index value to pass to campaign_manager:show_message_event. This determines the header image shown.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:event_message_not_player_turn_only(unique_name, faction_key, title_text_key, primary_text_key, secondary_text_key, persistent, index, trigger_message) end

--- Creates and starts a narrative event that starts an intervention with the supplied configuration and trigger callbacks. This allows the calling script to customise what happens within the intervention. It can also be used to trigger an intervention with a customised setup (e.g. must-trigger) which can be useful for starting a series of narrative events that would otherwise wait behind an event panel.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param configuration_callback function Intervention configuration callback. If supplied, this is passed to narrative_event:add_intervention_configuration_callback to pre-configure the intervention associated with the narrative event prior to it being triggered. The callback will be passed the intervention object as a single argument when called.
---@param trigger_callback function Trigger callback to call when the intervention is triggered. If supplied, this is passed to narrative_event:set_trigger_callback. The callback will be passed the string triggering message, and a callback which can be used to prevent the narrative event completing immediately. Call the callback with false as an argument to stop it completing, then later with true as an argument to complete.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:intervention(unique_name, faction_key, configuration_callback, trigger_callback, trigger_message) end

--- Creates and starts a narrative event that calls a supplied callback when triggered. When called, the supplied callback will be passed the narrative event, the key of the faction to which it applies, the triggering message, and the allow_issue_completed_callback as four arguments.<br />
--- The allow_issue_completed_callback passed to the callback may be called with false supplied as an argument to prevent the narrative event from completing automatically. It will only later complete when the allow_issue_completed_callback is called again with true supplied as an argument. This mechanism allows the callback to control when the narrative event completes, rather than it completing immediately.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param callback function Callback to call.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:callback(unique_name, faction_key, callback, trigger_message) end

--- Creates and starts a narrative event that waits a supplied interval in seconds when triggered.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param interval number Interval in seconds to wait.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:interval(unique_name, faction_key, interval, trigger_message) end

--- Creates and starts a narrative event that saves a value to the savegame with campaign_manager:set_saved_value when triggered.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param value_key string Key of value to save.
---@param value any Value to save. Supported data types are boolean, number, string and table.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:set_saved_value(unique_name, faction_key, value_key, value, trigger_message) end

--- Creates and starts a narrative event that marks an advice string as 'seen' in the advice history. This is useful for marking that a particular stage has been reached in the narrative flow of events, and it can be later tested with narrative_queries.advice_history. The string is reset if the player resets the advice history.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param value_key string Key of value to mark as seen.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:set_advice_string_seen(unique_name, faction_key, value_key, trigger_message) end

--- Creates and starts a fullscreen movie narrative event.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param movie_path string Path of movie to play. See the documentation of cm:register_instant_movie for more information.
---@param start_fade_duration number Duration in seconds over which to fade the picture to black before playing the movie.
---@param end_fade_duration number Duration in seconds over which to fade back to picture after playing the movie.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:fullscreen_movie(unique_name, faction_key, movie_path, start_fade_duration, end_fade_duration, trigger_message) end

--- Creates and starts a scripted cutscene narrative event. The cutscene constructor function campaign_cutscene:new is used.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param cutscene_duration number Duration of scripted cutscene in seconds.
---@param cutscene_config function This function will be called after the cutscene is created and before it is played. It can be used by client scripts to configure the cutscene object and populate it with actions. The function will be passed the cutscene object as a single argument.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:scripted_cutscene(unique_name, faction_key, cutscene_duration, cutscene_config, trigger_message) end

--- Creates and starts a scripted cutscene narrative event with a cindyscene. The cutscene constructor function campaign_cutscene:new_from_cindyscene is used.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param cindyscene_path string Path to cindyscene, from the working data folder.
---@param blend_in number Cindyscene blend in duration in seconds.
---@param blend_out number Cindyscene blend out duration in seconds.
---@param cutscene_config function This function will be called after the cutscene is created and before it is played. It can be used by client scripts to configure the cutscene object and populate it with actions, if required. The function will be passed the cutscene object as a single argument.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:cindy_cutscene(unique_name, faction_key, cindyscene_path, blend_in, blend_out, cutscene_config, trigger_message) end

--- Creates and starts a narrative event that fades the camera to black or to picture when triggered.<br />
--- If the fade is to black, the narrative system will wait for the fade to finish before continuing. If the fade is to picture, then the narrative system continues immediately without waiting for the fade to complete.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param fade_duration number Duration of camera fade in seconds.
---@param to_black boolean Sets whether the camera should fade to black. Supply false to fade to picture instead.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:camera_fade(unique_name, faction_key, fade_duration, to_black, trigger_message) end

--- Creates and starts a narrative event that cancels a custom mission when triggered.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param mission_key string Key of the mission to cancel, from the missions database table. The mission will be cancelled for the specified faction.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:cancel_mission(unique_name, faction_key, mission_key, trigger_message) end

--- Creates and starts a narrative event that issues a generic scripted mission. One or more event/condition pairs to pass to the underlying mission_manager must be supplied in a table. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key of mission text to display, from the mission_text database table. This must be set up for scripted missions such as this.
---@param camera_scroll_callback table A table containing one or more event/condition records. Each record should be a table with a string "event" element and a "condition" element that's either a condition function or true.
---@param mission_issuer function A camera scroll callback, to be supplied to narrative_event:set_camera_scroll_target_callback.
---@param mission_rewards string Key of mission issuer, from the mission_issuers database table.
---@param trigger_message table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param inherit_list string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:generic(unique_name, faction_key, advice_key, mission_key, mission_text, camera_scroll_callback, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to defeat an army belonging to a specific enemy faction. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param enemy_faction_key string Key of target enemy faction, from the factions database table.
---@param target_cqi number Camera scroll target character cqi. If this is supplied the camera will scroll to the specified character when the mission is issued (assuming the narrative event decides to move the camera), otherwise it will scroll to the nearest character in the target faction to the local player's forces.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:defeat_enemy_army(unique_name, faction_key, advice_key, mission_key, enemy_faction_key, target_cqi, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to defeat an army belonging to a specific enemy faction. Advice may optionally be supplied to be issued with the mission. narrative_event:set_category is used to give this narrative event a higher priority than one created with narrative_events.defeat_enemy_army.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param enemy_faction_key string Key of target enemy faction, from the factions database table.
---@param target_cqi number Camera scroll target character cqi. If this is supplied the camera will scroll to the specified character when the mission is issued (assuming the narrative event decides to move the camera), otherwise it will scroll to the nearest character in the target faction to the local player's forces.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:defeat_initial_enemy_army(unique_name, faction_key, advice_key, mission_key, enemy_faction_key, target_cqi, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to defeat an army belonging to a specified culture or list of cultures. Advice may optionally be supplied to be issued with the mission.<br />
--- As this is a scripted mission a text key for the mission objective must be supplied.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text_key string Text key of mission ojective to show, in the full [table]_[field]_[key] format.
---@param culture_key string Key of target culture, from the cultures database table. This can also be a table of strings if multiple target cultures are desired.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:defeat_army_of_culture(unique_name, faction_key, advice_key, mission_key, mission_text_key, culture_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to defeat an army belonging to a specified. Advice may optionally be supplied to be issued with the mission.<br />
--- As this is a scripted mission a text key for the mission objective must be supplied.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:defeat_chaos_army(unique_name, faction_key, advice_key, mission_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to gain a specified amount of a specified pooled resource. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param resource_key string Key of pooled resource, from the pooled_resources database table.
---@param resource_quantity string Absolute quantity of pooled resource the faction has to acquire to complete the mission.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:gain_pooled_resource(unique_name, faction_key, advice_key, mission_key, resource_key, resource_quantity, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to gain a specified amount of the Kislev Devotion pooled resource. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param resource_quantity string Absolute quantity of pooled resource the faction has to acquire to complete the mission.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:gain_devotion(unique_name, faction_key, advice_key, mission_key, resource_quantity, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to gain a specified amount of the Kislev Supporters pooled resource. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param resource_quantity string Absolute quantity of pooled resource the faction has to acquire to complete the mission.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:gain_supporters(unique_name, faction_key, advice_key, mission_key, resource_quantity, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission for the specified faction to gain a specified amount of one or more specified pooled resources. Unlike narrative_events.gain_pooled_resource this sets up a scripted mission, where script is responsible for the completion of the mission. This allows multiple pooled resources to be considered at the same time, either additively or not, allowing mission constructs such as "earn x of pooled resources a, b and c together", or "earn x of pooled resources a, b or c".<br />
--- As it is a scripted mission, mission objective text must be supplied. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key of mission text to display, from the mission_text database table. This must be set up for scripted missions such as this.
---@param pooled_resource_key string Key of the pooled resource to monitor, from the pooled_resources database table. This may also be a table of string pooled resource keys if multiple pooled resources are to be monitored.
---@param lower_threshold number Lower threshold level of the pooled resource(s) at which the mission completes. If not supplied, then there is no lower pooled resource bound at which the mission completes.
---@param upper_threshold number Upper threshold level of the pooled resource(s) at which the mission completes. If not supplied, then there is no upper pooled resource bound at which the mission completes. One or both of the lower and upper thresholds must be provided.
---@param additive boolean If set to true the value of all supplied specified pooled resources is counted towards the threshold value. If false is supplied, then the mission only completes when one of the pooled resources specified reaches the threshold value.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
---@param is_regular_income string Message to trigger when the mission has completed. This can be a table of strings if multiple on-completed messages are desired.
function narrative_events:gain_pooled_resource_scripted(unique_name, faction_key, advice_key, mission_key, mission_text, pooled_resource_key, lower_threshold, upper_threshold, additive, mission_issuer, mission_rewards, trigger_message, inherit_list, is_regular_income) end

--- Creates and starts a narrative event that issues a mission to capture a settlement, optionally belonging to a specific enemy faction. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param enemy_faction_key string Key of target enemy faction, from the factions database table. If no key is specified then the capture of any settlement qualifies.
---@param scroll_target string if multiple target settlements are desired. If no value is supplied then the capture of any settlement qualifies. 
---@param mission_issuer any Camera scroll target. This can be a string region key, a string faction key (region is looked up before faction), or a number character cqi. If this is supplied the camera will scroll to the specified target when the mission is issued (assuming the narrative event decides to move the camera).
---@param mission_rewards string Key of mission issuer, from the mission_issuers database table.
---@param trigger_message table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param inherit_list string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
function narrative_events:capture_settlement(unique_name, faction_key, advice_key, mission_key, enemy_faction_key, scroll_target, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to raze or own all specified settlements. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param region_key string Region key of target settlement, from the campaign_map_regions database table. If more than one target settlement is desired a table of region keys can be supplied.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:raze_or_own_settlements(unique_name, faction_key, advice_key, mission_key, region_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to control a number of provinces. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param provinces number Target number of provinces to control.
---@param province_key string Key of specific province to control. This may also be a table of string keys if multiple are desired.
---@param scroll_target any Camera scroll target. This can be a string region key, a string faction key (region is looked up before faction), or a number character cqi. If this is supplied the camera will scroll to the specified target when the mission is issued (assuming the narrative event decides to move the camera).
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:control_provinces(unique_name, faction_key, advice_key, mission_key, provinces, province_key, scroll_target, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to enact one or more commandments. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param enactments number Target number of commandments to enact.
---@param commandment_key string Key of specific commamdment to enact.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:enact_commandment(unique_name, faction_key, advice_key, mission_key, enactments, commandment_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to destroy one or more factions. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param target_faction_key string Faction key of target faction, from the factions database table. This may also be a table of multiple target faction keys.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:destroy_faction(unique_name, faction_key, advice_key, mission_key, target_faction_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to recruit a number of units across all armies. Unit keys may optionally be supplied . Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param units number Target number of units to recruit.
---@param unit_key string Optional unit key of unit that must be recruited, from the land_units database table. This may also be a table of string unit keys. If a value is supplied here then recruited units only count towards the total if their unit keys match. If no value is supplied then any unit matches.
---@param exclude_existing boolean Excluding pre-existing units from the count.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:recruit_units(unique_name, faction_key, advice_key, mission_key, units, unit_key, exclude_existing, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to construct a number of buildings of zero or more building chains. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param buildings number Target number of buildings to construct.
---@param building_chain string Key of building chain the building must be a part of, from the building_chains database table. This may also be a table of string chain keys. If a value is supplied here then the constructed buildings only count towards the total if they belong to a specified chain. If no value is supplied then any constructed building counts towards the total.
---@param exclude_existing boolean Excluding pre-existing buildings from the count.
---@param scroll_target any Camera scroll target. This can be a string region key, a string faction key (region is looked up before faction), or a number character cqi. If this is supplied the camera will scroll to the specified target when the mission is issued (assuming the narrative event decides to move the camera).
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:construct_n_of_building_chain(unique_name, faction_key, advice_key, mission_key, buildings, building_chain, exclude_existing, scroll_target, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission that completes when a building is completed by the specified faction, optionally passing a supplied condition function. Advice may optionally be supplied to be issued with the mission.<br />
--- If supplied, the condition function will be passed the building provided by the BuildingCompleted event and the narrative event object as separate arguments. It should return a value that evaluates to a boolean to indicate whether the condition has passed. It can also return true as a second returned value to suppress output from this function. This can be useful if the condition function produces its own output.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key that specifies the objective text, from the mission_texts table.
---@param condition function Condition function to pass. If no condition function is supplied then the condition always passes.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:construct_building_with_condition(unique_name, faction_key, advice_key, mission_key, mission_text, condition, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission that completes when a building is completed by the specified faction, optionally passing a supplied condition function. The condition function is run on every building in the faction when a building is completed and if the number passing the test is greater than a supplied threshold then the mission is successfully completed. Advice may optionally be supplied to be issued with the mission.<br />
--- If supplied, the condition function will be called for each building in the faction when the BuildingCompleted event is received. When called, it will be passed the building and the narrative event object as separate arguments. It should return a value that evaluates to a boolean to indicate whether the condition has passed. It can also return true as a second returned value to suppress output from this function. This can be useful if the condition function produces its own output.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key that specifies the objective text, from the mission_texts table.
---@param condition function Condition function to pass. If no condition function is supplied then the condition always passes.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:construct_buildings_with_condition(unique_name, faction_key, advice_key, mission_key, mission_text, condition, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission that completes when a building that unlocks technologies is completed by the specified faction, optionally passing a supplied condition function. Advice may optionally be supplied to be issued with the mission.<br />
--- If supplied, the condition function will be passed the building object provided by the BuildingCompleted event and the narrative event object as separate arguments. It should return a value that evaluates to a boolean to indicate whether the condition has passed. It can also return true as a second returned value to suppress output from this function. This can be useful if the condition function produces its own output.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param condition function Additional condition function to pass. If a condition is supplied, it will need to be passed in addition to the base "unlocks technologies" requirement.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:construct_technology_enabling_building(unique_name, faction_key, advice_key, mission_key, condition, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to upgrade any settlement. An optional building level that the settlement building must reach may be supplied. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:upgrade_any_settlement(unique_name, faction_key, advice_key, mission_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to research one or more technologies. An optional list of technologies that must be included may be supplied. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param technologies number Number of technologies that must be researched.
---@param mandatory_tech string The key of any mandatory technology that must be researched before the mission can be completed. This may be supplied as a table of strings if multiple are desired.
---@param additive boolean Sets whether pre-existing technologies count towards the total.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:research_technology(unique_name, faction_key, advice_key, mission_key, technologies, mandatory_tech, additive, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to gain a certain level of income. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param income number Income level to be gained.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:gain_income(unique_name, faction_key, advice_key, mission_key, income, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to reduce upkeep. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text_key string Key of mission objective text, from the mission_texts database table.
---@param threshold number Threshold percentage of upkeep-expenditure to income which the player must reach to succeed the mission.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:reduce_upkeep(unique_name, faction_key, advice_key, mission_key, mission_text_key, threshold, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to recruit any hero. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:recruit_any_hero(unique_name, faction_key, advice_key, mission_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to use any hero against the enemy. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:use_hero(unique_name, faction_key, advice_key, mission_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to win a supplied number of battles with any hero. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param win_threshold number Number of victories to attain.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:win_battles_with_hero(unique_name, faction_key, advice_key, mission_key, win_threshold, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to win a set piece/quest battle. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param battle_key string Key of set piece battle, from the battles database table.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:win_set_piece_battle(unique_name, faction_key, advice_key, mission_key, battle_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to perform one or more rituals. Advice may optionally be supplied to be issued with the mission.<br />
--- An optional total number of rituals may be specified, or a ritual key or a ritual category. If a total number greater than one is specified then the ritual key is disregarded. See narrative_events.perform_ritual_scripted for a version of this function that triggers a scripted mission
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param num_rituals number Number of rituals to enact. If a value other than 1 is specified then any ritual key is disregarded.
---@param ritual_key string Key of ritual to enact, from the rituals database table. If no ritual is specified then any ritual counts. This is disregarded if the total is greater than one.
---@param ritual_category_key string Category key of ritual to enact, from the ritual_categories database table. If no ritual category is specified then any ritual counts.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:perform_ritual(unique_name, faction_key, advice_key, mission_key, num_rituals, ritual_key, ritual_category_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to perform one or more rituals. Advice may optionally be supplied to be issued with the mission.<br />
--- An optional total number of rituals may be specified, and zero or more ritual keys, ritual categories and target faction keys. As this is a scripted mission, a mission text key must be specified also.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key of mission text to display, from the mission_text database table. This must be set up for scripted missions such as this.
---@param num_rituals number Number of rituals to enact.
---@param ritual_keys string Key(s) of ritual(s) to enact, from the rituals database table. This can be a string ritual key or a table of strings. If no ritual keys are specified then any rituals match.
---@param ritual_categories string Key(s) of ritual category/categories to enact, from the ritual_categories database table. This can be a string category key or a table of strings. If no categories are specified then any rituals match.
---@param target_faction_keys string Key(s) of any target factions, from the factions database table. This can be a string faction key or a table of strings. If no target factions are specified then any targets match.
---@param listen_for_completion boolean Listen for the ritual being completed, rather than the ritual being started.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:perform_ritual_scripted(unique_name, faction_key, advice_key, mission_key, mission_text, num_rituals, ritual_keys, ritual_categories, target_faction_keys, listen_for_completion, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to perform a kislev motherland ritual. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:perform_motherland_ritual(unique_name, faction_key, advice_key, mission_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to perform a daemon prince ascension. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:perform_ascension(unique_name, faction_key, advice_key, mission_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to concoct a Nurgle plague. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param quantity number Quantity of plagues to to concoct.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:concoct_plague(unique_name, faction_key, advice_key, mission_key, quantity, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to construct a foreign slot. It must be specified whether foreign slot is allied to the settlement owner or not. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param corruption_type string Corruption type, from the pooled_resources database table.
---@param threshold_value number Threshold value which the corruption must meet or exceed in an adjacent region for the mission to be completed.
---@param culture_key string Culture key of region owner to exclude. If an eligible region has a faction owner with this culture, the region will not be included.
---@param mission_text string Key of mission text to display, from the mission_text database table. This must be set up for scripted missions such as this.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:spread_corruption_to_adjacent_region(unique_name, faction_key, advice_key, mission_key, corruption_type, threshold_value, culture_key, mission_text, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to construct a foreign slot. It must be specified whether foreign slot is allied to the settlement owner or not. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key of mission text to display, from the mission_text database table. This must be set up for scripted missions such as this.
---@param should_be_allied boolean Should the foreign slot be allied to the owner of the settlement in which it's created to count towards this mission.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:construct_foreign_slot(unique_name, faction_key, advice_key, mission_key, mission_text, should_be_allied, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to construct any building in any foreign slot. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key of mission text to display, from the mission_text database table. This must be set up for scripted missions such as this.
---@param should_be_allied boolean Should the building be constructed in an allied foreign slot. If false is supplied, the building should be constructed in a non-allied foreign slot. If nil is supplied, a building constructed in any foreign slot will count.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:construct_foreign_slot_building(unique_name, faction_key, advice_key, mission_key, mission_text, should_be_allied, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to equip an armory item. An optional armory item (or list of armory items) may be supplied, which the equipped armory item must match for the mission to succeed. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key of mission text to display, from the mission_text database table. This must be set up for scripted missions such as this.
---@param item_key string The key of an armory item, from the armory_items database table, that the equipped item must match. This may also be a table of item keys. If nil is supplied then any item equipped by a character in the subject faction will match.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:equip_armory_item(unique_name, faction_key, advice_key, mission_key, mission_text, item_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to equip any daemonic gift armory item. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:equip_any_daemonic_gift(unique_name, faction_key, advice_key, mission_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission for a character in the specified faction to perform a character/hero action. Optional lists of qualifying abilities, target factions and/or performing character subtypes may be supplied which the ability performed must match. It may also be specified that the action must have been successful. As with other narrative events, advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key of mission text to display, from the mission_text database table. This must be set up for scripted missions such as this.
---@param ability_key string The key of the ability to perform, from the abilities database table. This may also be a table of ability keys. If nil is supplied then any ability performed will match.
---@param target_faction_key string The key of the target faction, from the factions database table. This may also be a table of faction keys. If nil is supplied then any faction target will match.
---@param character_subtype string The subtype key of the performing character, from the agent_subtypes database table. This may also be a table of character subtype keys. If nil is supplied then any performing character will match.
---@param must_be_success boolean If set to true this specifies that the action performed must have had a successful outcome.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:perform_character_action(unique_name, faction_key, advice_key, mission_key, mission_text, ability_key, target_faction_key, character_subtype, must_be_success, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission for a character in the specified faction to embed a hero in an army. An optional list of hero character subtypes may be supplied, which specify eligible hero types to embed. It may also be specified that the action must have been successful. As with other narrative events, advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key of mission text to display, from the mission_text database table. This must be set up for scripted missions such as this.
---@param character_subtype string The subtype key of the performing character, from the agent_subtypes database table. This may also be a table of character subtype keys. If nil is supplied then any performing character will match.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:embed_agent(unique_name, faction_key, advice_key, mission_key, mission_text, character_subtype, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to spread a number of Nurgle plagues. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key of mission text to display, from the mission_text database table. This must be set up for scripted missions such as this.
---@param item_key string The key of an armory item, from the armory_items database table, that the equipped item must match. This may also be a table of item keys. If nil is supplied then any item equipped by a character in the subject faction will match.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:spread_plagues(unique_name, faction_key, advice_key, mission_key, mission_text, item_key, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to unlock a number of Nurgle plague symptoms. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key of mission text to display, from the mission_text database table. This must be set up for scripted missions such as this.
---@param num_symptoms number The number of symptoms that must be unlocked for the mission to be succeeded.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:unlock_symptoms(unique_name, faction_key, advice_key, mission_key, mission_text, num_symptoms, mission_issuer, mission_rewards, trigger_message, inherit_list) end

--- Creates and starts a narrative event that issues a mission to enter a particular military force stance. Advice may optionally be supplied to be issued with the mission.
---@param unique_name string Unique name amongst other declared narrative events.
---@param faction_key string Key of the faction to which this narrative event applies, from the factions database table.
---@param advice_key string Key of advice to issue with this mission, if any, from the advice_threads database table.
---@param mission_key string Key of mission to issue, from the missions database table.
---@param mission_text string Key of mission text to display, from the mission_text database table. This must be set up for scripted missions such as this.
---@param stance_number number Stance number, as returned by the stance_adopted() method provided by the ForceAdoptsStance event.
---@param mission_issuer string Key of mission issuer, from the mission_issuers database table.
---@param mission_rewards table Rewards to add to the mission. This should be a table of strings. See the documentation for mission_manager:add_payload for more information on the string formatting and available options.
---@param trigger_message string Script message on which the narrative event should trigger. This can also be a table of strings if multiple trigger messages are desired.
---@param inherit_list string Message to trigger when the narrative event has finished issuing. This can be a table of strings if multiple on-issued messages are desired.
function narrative_events:enter_stance(unique_name, faction_key, advice_key, mission_key, mission_text, stance_number, mission_issuer, mission_rewards, trigger_message, inherit_list) end
