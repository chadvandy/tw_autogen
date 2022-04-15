
---@class intervention
local intervention = {}

--- Completes the intervention without stopping its listeners. This is useful if an intervention decides it doesn't want to trigger after all after intervention:start has been called.
function intervention:cancel() end

--- By default, interventions will wait for open dilemmas to be dismissed before triggering. Use this function to suppress this behaviour, if necessary. This should only be used in very specific circumstances.
---@param wait_for_dilemmas boolean wait for dilemmas
function intervention:set_wait_for_dilemma(wait_for_dilemmas) end

--- By default, interventions will wait for any open blocking panels (technology, diplomacy, recruitment etc) to be dismissed before triggering. Use this function to suppress this behaviour, if necessary.
---@param wait_for_panels boolean wait for panels
function intervention:set_wait_for_fullscreen_panel_dismissed(wait_for_panels) end

--- Adds a callback to call when the intervention has completed.
---@param callback function callback
function intervention:set_completion_callback(callback) end

--- Perform the whitelisting of event types that have been registered with intervention:add_whitelist_event_type. This is intended to be called while the intervention is actually running to make pending events display suddenly.
function intervention:whitelist_events() end

--- Registers that this intervention shares a turn countdown with another. If this is set on an intervention then when it restarts its turn countdown it will instruct the other intervention to restart its turn countdown also. This can be useful for advice interventions that share a common purpose.<br />
---Note that interventions that take or cede priority to another (see Taking and Ceding Priority) cannot share turn countdowns with other interventions.
---@param intervention_name string Name of intervention that this intervention shares its turn countdown with. This only needs to be called on one of the two interventions.
function intervention:register_shared_turn_countdown_intervention(intervention_name) end

--- By default, interventions wait for a short period before triggering. Use this function to suppress this wait behaviour.
---@param suppress_pause boolean suppress pause
function intervention:set_reduce_pause_before_triggering(suppress_pause) end

--- Precondition wrapper function that adds a precondition to the intervention that a particular help page must be unvisited. The intervention won't be able to start or trigger if the advice history reveals that the specified help page has been visited. This may be useful for low-priority advice scripts that don't wish to trigger if the help page on the advice topic has been seen.
---@param help_page_name string help page name
function intervention:add_precondition_unvisited_page(help_page_name) end

--- Scrolls the camera to a settlement during an intervention, showing advice and optionally showing infotext and a mission. This should only be called while this intervention is actually running after having been triggered.
---@param region_key string Region key.
---@param advice_key string Advice key.
---@param infotext table Table of string infotext keys.
---@param mission mission_manager Mission manager of mission to trigger, if any.
---@param duration number Duration of camera scroll in seconds. If no duration is specified then CampaignUI.ZoomToSmooth is used for the camera movement, which produces a smoother movement than campaign_manager:scroll_camera_with_direction.
---@param scroll_callback function Callback to call when the camera movement is complete.
---@param continuation_callback function If supplied, this callback will be called when the intervention would usually complete. It will be passed this intervention object as a single argument, and takes on the responsibility for calling intervention:complete to relinquish control.
function intervention:scroll_camera_to_settlement_for_intervention(region_key, advice_key, infotext, mission, duration, scroll_callback, continuation_callback) end

--- Set this intervention to trigger regardless of cost. This means that, assuming this intervention doesn't fail its precondition it is guaranteed to trigger when its trigger conditions are met. Interventions that must trigger will trigger ahead of other interventions, even if the former's assigned cost is more than the latter's. Its cost is still counted towards the maximum cost per-session, however, so if an intervention that must trigger and costs 80 points triggers, and another that costs 30 points and is not set to must trigger is queued up behind it, the second will not be able to fire as the maximum cost is exceeded.<br />
---If triggered at the same time as another intervention which is also set to disregard cost then they will trigger in order of cost priority. Both will always trigger, though, even if their combined cost is more than the maximum session allowance.<br />
---If the must trigger immediately flag is also set to true then this intervention will trigger the instant its trigger conditions pass, assuming that another intervention is not currently playing. This suppresses the grace period that normally happens when an intervention passes its trigger conditions to allow other interventions to be tested that are potentially more important. Only set this to true for interventions that convey essential narrative events.
---@param must_trigger boolean must trigger
---@param must_trigger_immediately boolean must trigger immediately
function intervention:set_must_trigger(must_trigger, must_trigger_immediately) end

--- Adds a trigger event and condition to the intervention. The supplied event is listened for and, when received, the supplied condition function is called, with the context of the received event as a single parameter. Should the condition function return true the trigger is satisfied and the intervention is enqueued for triggering.<br />
---Alternatively the value true may be specified in place of a condition function - in this case, the intervention is enqueued for triggering as soon as the specified event is received.
---@param event_name string Event name to listen for.
---@param condition_check function Condition check to call when the event is received. Alternatively, true may be specified.
function intervention:add_trigger_condition(event_name, condition_check) end

--- Adds a precondition to the intervention that the player's faction key must match the supplied string to be able to start or trigger.
---@param faction_key string Faction key, from the factions database table.
function intervention:add_player_faction_precondition(faction_key) end

--- Registers that this intervention takes priority over another intervention with the supplied name, so that they cannot run at the same time. If the supplied intervention attempts to start and this intervention is already started, the supplied intervention will fail to start. If this intervention starts and the supplied intervention has already started, the supplied intervention will be stopped.<br />
---Furthermore, when this intervention stops it will notify the supplied intervention, which will then start.<br />
---Only persistent interventions can take priority over another. Transient interventions do not support this mechanism.
---@param intervention_name string Name of intervention to take priority over.
function intervention:take_priority_over_intervention(intervention_name) end

--- Adds a function to be called when the intervention completes or is cancelled. If the context changes while this intervention is active it is not set to lock the ui then the intervention manager will complete the intervention while it's running. In this case, the intervention itself needs to know how to clean itself up - adding cleanup functions using this mechanism permits this.<br />
---Multiple cleanup callbacks may be added to any given intervention.
---@param callback function callback
function intervention:add_cleanup_callback(callback) end

--- Adds a precondition function to the intervention. This function will be called by the intervention from time to time and should return true if the intervention is allowed to start or trigger, false otherwise. Should the precondition return false when the intervention calls it the intervention will shut down.<br />
---Multiple preconditions may be added to an intervention.
---@param precondition function precondition
function intervention:add_precondition(precondition) end

--- Returns whether this intervention has ever triggered in this campaign.
function intervention:has_ever_triggered() end

--- If a turn countdown restart number is set, the intervention will attempt to restart the given number of turns after stopping. This countdown also applies if the intervention fails to start. Transient interventions do not support turn countdown restarts.
---@param turns number turns
function intervention:set_turn_countdown_restart(turns) end

--- Returns the turn number of which this intervention last triggered in this campaign. If this intervention has never triggered then -1 is returned.
function intervention:get_turn_last_triggered() end

--- Sets the minimum player advice level setting at which this intervention will be allowed to trigger. By default this value is 0, so the intervention will trigger regardless of advice level. Valid minimum advice levels are:<br />
---0Minimal advice - will trigger when advice level is set to minimal, low or high1Low advice - will trigger when advice level is set to low or high2High advice - will only trigger when the advice level is set to high
---@param min_advice_level number min advice level
function intervention:set_min_advice_level(min_advice_level) end

--- Shows advice and optionally some infotext and a mission. This should only be called while this intervention is actually running after having been triggered.
---@param advice_key string Advice key.
---@param infotext table Table of string infotext keys.
---@param mission mission_manager Mission manager of mission to trigger, if any.
---@param mission_delay number Delay in seconds after triggering intervention before triggering mission.
---@param continuation_callback function If supplied, this callback will be called when the intervention would usually complete. It will be passed this intervention object as a single argument, and takes on the responsibility for calling intervention:complete to relinquish control.
function intervention:play_advice_for_intervention(advice_key, infotext, mission, mission_delay, continuation_callback) end

--- Scrolls the camera to a supplied position on the campaign map during an intervention, showing advice and optionally showing infotext and a mission. This should only be called while this intervention is actually running after having been triggered.
---@param region_key string Target region key. If a region is supplied here the shroud over it will be lifted while the intervention is playing.
---@param x number Display x co-ordinate of position to scroll to.
---@param y number Display y co-ordinate of position to scroll to.
---@param advice_key string Advice key.
---@param infotext table Table of string infotext keys.
---@param mission mission_manager Mission manager of mission to trigger, if any.
---@param duration number Duration of camera scroll in seconds. If no duration is specified then CampaignUI.ZoomToSmooth is used for the camera movement, which produces a smoother movement than campaign_manager:scroll_camera_with_direction.
---@param scroll_callback function Callback to call when the camera movement is complete.
---@param continuation_callback function If supplied, this callback will be called when the intervention would usually complete. It will be passed this intervention object as a single argument, and takes on the responsibility for calling intervention:complete to relinquish control.
function intervention:scroll_camera_for_intervention(region_key, x, y, advice_key, infotext, mission, duration, scroll_callback, continuation_callback) end

--- Registers that this intervention cedes priority to another intervention with the supplied name, so that they cannot run at the same time. This is the reverse of intervention:take_priority_over_intervention. If the supplied intervention starts and this intervention is already started, this intervention will be stopped. If this intervention starts and the supplied intervention has already started, this intervention will not start.<br />
---Furthermore, when the supplied intervention stops it will notify this intervention, which will then start.<br />
---Only persistent interventions can take priority over another. Transient interventions do not support this mechanism.
---@param intervention_name string Name of intervention to give priority to.
function intervention:give_priority_to_intervention(intervention_name) end

--- Scrolls the camera to a character during an intervention, showing advice and optionally showing infotext and a mission. This should only be called while this intervention is actually running after having been triggered.
---@param cqi number Character cqi.
---@param advice_key string Advice key.
---@param infotext table Table of string infotext keys.
---@param mission mission_manager Mission manager of mission to trigger, if any.
---@param duration number Duration of camera scroll in seconds. If no duration is specified then CampaignUI.ZoomToSmooth is used for the camera movement, which produces a smoother movement than campaign_manager:scroll_camera_with_direction.
---@param scroll_callback function Callback to call when the camera movement is complete.
---@param continuation_callback function If supplied, this callback will be called when the intervention would usually complete. It will be passed this intervention object as a single argument, and takes on the responsibility for calling intervention:complete to relinquish control.
function intervention:scroll_camera_to_character_for_intervention(cqi, advice_key, infotext, mission, duration, scroll_callback, continuation_callback) end

--- By default, interventions will wait for a battle sequence to complete before triggering. A battle sequence is from when the pre-battle panel opens, to when the camera returns to its gameplay position after any battle panels have closed. Use this function to allow interventions to trigger during battle sequences if required. This is useful for delivering pre-battle or post-battle advice.
---@param wait_for_battle boolean wait for battle
function intervention:set_wait_for_battle_complete(wait_for_battle) end

--- If advice has been disabled with campaign_manager:set_advice_enabled then by default interventions won't attempt to play. Use this function to modify this behaviour for this intervention if required.
---@param allow_intervention boolean allow intervention
function intervention:set_allow_when_advice_disabled(allow_intervention) end

--- Sets the minimum number of turns since either the start of the campaign or when the advice history was last reset before this intervention is eligible to trigger. This is useful for ensuring non-essential advice is spaced out at the start of the campaign.
---@param minimum_turn number minimum turn
function intervention:set_min_turn(minimum_turn) end

--- Completes the intervention when it's running. This function (or intervention:cancel) must be called at some point after the intervention has been triggered, as they are the only way the intervention will end and relinquish control of the game. The wrapper functions intervention:play_advice_for_intervention, intervention:scroll_camera_to_character_for_intervention and intervention:scroll_camera_to_settlement_for_intervention all call this function internally so if using one of those to control the behaviour of the intervention when triggered then this function does not need to be called.
function intervention:complete() end

--- Starts the intervention. An intervention must be started in order to trigger. This only needs to be called once per-intervention through the lifetime of a campaign - if an intervention is started, and the campaign is saved and loaded, the intervention will automatically be restarted from the savegame, even if it's triggered and stopped.
function intervention:start() end

--- Adds an event type to be whitelisted if intervention:whitelist_events is called.
---@param event_type string event type
function intervention:add_whitelist_event_type(event_type) end

--- Returns the set minimum turn value.
function intervention:get_min_turn() end

--- Adds a restart event and conditional check. Should the event be received and the conditional check return true, then the intervention will restart. Transient interventions may not have restart callbacks added.
---@param event_name string Event name to listen for.
---@param check function Conditional check to test when event is received. This should be a function that returns a boolean value, and it will be passed the context of the event listened for as a single parameter. Alternatively, true may be specified in place of a function, in which case the intervention is restarted as soon as the event is received.
function intervention:add_restart_callback(event_name, check) end

--- Adds a precondition to the intervention that the player's faction must be the supplied subculture to be able to start or trigger. The subculture is supplied by key.
---@param subculture_key string Subculture key, from the cultures_subcultures database table.
function intervention:add_player_subculture_precondition(subculture_key) end

--- Creates a intervention object. This should happen in the root of the script somewhere, so that the object is declared and set up by the time the first tick happens so that it can be properly restarted from a savegame.
---@param name string Unique name for the intervention.
---@param cost number Priority cost for the intervention. When an intervention triggers, all interventions that wish to trigger at the same time will be sorted by cost, and triggered in that order (with the cheapest first). Once the total cost of all interventions triggered in a sequence exceeds a certain value (100) no more interventions can trigger. This mechanism prevents the player from being overly spammed with advice.
---@param callback function Callback to call when the intervention gets to trigger.
---@param debug_mode boolean Activates debug mode for this intervention, causing it to output more.
---@param is_transient boolean Sets this intervention to be transient. The details of transient interventions are not saved into the savegame.
function intervention:new(name, cost, callback, debug_mode, is_transient) end

--- Sets or resets the trigger callback that gets called when the intervention is triggered. This must be set before intervention:start() is called, otherwise the intervention will fail to start.
---@param callback function callback
function intervention:set_callback(callback) end

--- Sets whether or not this intervention can only happen on the player's turn. By default, interventions can only trigger if it's the player's turn. Use this function to allow interventions to trigger in the end-turn sequence, which is useful for advice triggering over diplomacy or battles.<br />
---If an intervention is set to trigger on just the player's turn and it is trigger during the end-turn sequence, it will cancel itself and then trigger again when the player's turn starts.
---@param player_turn_only boolean player turn only
function intervention:set_player_turn_only(player_turn_only) end

--- Adds a precondition to the intervention that the player's faction must not be the supplied subculture to be able to start or trigger. The subculture is supplied by key.
---@param subculture_key string Subculture key, from the cultures_subcultures database table.
function intervention:add_player_not_subculture_precondition(subculture_key) end

--- Adds a precondition to the intervention that the player's faction key must not match the supplied string to be able to start or trigger.
---@param faction_key string Faction key, from the factions database table.
function intervention:add_player_not_faction_precondition(faction_key) end

--- Precondition wrapper function that adds a precondition to the intervention that a particular advice key must not have been triggered. The intervention won't be able to start or trigger if the advice history reveals that the advice key has been triggered before. This is useful for interventions that trigger advice - by using this function to specify a precondition, an advice intervention may prevent itself from starting or triggering if the advice it intends to deliver has been heard before.
---@param advice_key string advice key
function intervention:add_advice_key_precondition(advice_key) end

--- Set this intervention to prevent the player saving the game while it's active.<br />
---By default, interventions do not lock the ui whilst triggering. Use this function to change this behaviour. Interventions set to lock the ui will also prevent the game from being saved.
---@param diregard_cost boolean diregard cost
function intervention:set_should_prevent_saving_game(diregard_cost) end

--- Set this intervention to lock the ui whilst triggering, or not. Interventions set to not lock the ui will be sent to the back of the queue when they come to trigger. When the intervention triggers, it will not attempt to lock army movement, army attacking or the end turn button. Should the player move, attack or end the turn while an intervention is active, the queued of interventions queued up behind it will be cleared and any interventions it contained will be restarted. Interventions set to not lock the ui are therefore more liable to be cancelled and restarted than interventions that do lock the ui.<br />
---By default, interventions do not lock the ui whilst triggering. Use this function to change this behaviour.
---@param diregard_cost boolean diregard cost
function intervention:set_should_lock_ui(diregard_cost) end
