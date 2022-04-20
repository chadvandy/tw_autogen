
---@class intro_campaign_scripts
local intro_campaign_scripts = {}

---@class intro_campaign_camera_marker
local intro_campaign_camera_marker = {}

--- Creates and returns an intro_campaign_camera_marker object.
---@param name string Unique name camera marker.
---@param x number x co-ordinate of marker, using display co-ordinate system.
---@param y number y co-ordinate of marker, using display co-ordinate system.
---@param duration number duration of cutscene triggered by camera moving close to marker in seconds.
---@param trigger_distance number override for the distance at which the camera marker will trigger.
function intro_campaign_camera_marker:new(name, x, y, duration, trigger_distance) end

--- Sets a skip camera position for the camera marker, so that if the related cutscene is skipped then the camera gets repositioned. See campaign_cutscene:set_skip_camera for more information.
---@param x number skip camera x co-ordinate.
---@param y number skip camera x co-ordinate.
---@param d number skip camera d co-ordinate.
---@param b number skip camera b co-ordinate.
---@param h number skip camera h co-ordinate.
function intro_campaign_camera_marker:set_skip_camera(x, y, d, b, h) end

--- Adds a cutscene action related to this camera marker. After the camera marker is triggered the actions enqueued on the marker with this function are played as a campaign_cutscene. See campaign_cutscene:action for more information.
---@param callback function Callback to call.
---@param delay number Delay in seconds after the start of the cutscene at which to call this action.
function intro_campaign_camera_marker:action(callback, delay) end

--- Adds a campaign_cutscene:wait_for_advisor to the camera marker. This causes campaign_cutscene:wait_for_advisor to be called at the specified interval after the marker's cutscene begins playing.
---@param delay number Delay in seconds after the start of the cutscene at which to call campaign_cutscene:wait_for_advisor.
function intro_campaign_camera_marker:wait_for_advisor(delay) end

---@class intro_campaign_camera_positions_advice
local intro_campaign_camera_positions_advice = {}

--- Creates and returns an intro_campaign_camera_marker object.
---@param objective_key string Key for a record in the scripted_objectives table which is displayed as objective text. 
---@param completion_callback function Callback to call when all markers have been viewed.
---@param markers table a table containing one or more intro_campaign_camera_marker objects to be associated with this camera positions advice object.
function intro_campaign_camera_positions_advice:new(objective_key, completion_callback, markers) end

--- Sets whether the intro_campaign_camera_positions_advice should complete as soon as it is started. This can be useful to set during development to quickly progress through tutorial gameplay.
---@param should_skip boolean should skip
function intro_campaign_camera_positions_advice:set_should_skip(should_skip) end

--- Starts the camera positions advice sequence. This object will have no visible effect until this is called. 
function intro_campaign_camera_positions_advice:start() end

---@class intro_campaign_select_and_attack_advice
local intro_campaign_select_and_attack_advice = {}

--- Creates and returns an intro_campaign_select_and_attack_advice object.
---@param player_cqi number Command queue index of the player's army that they have to attack with.
---@param enemy_cqi number Command queue index of the target enemy army.
---@param initial_advice string Initial advice key, from the advice_threads table. This is delivered when the objective is issued to the player, and should set up the task narratively.
---@param sleection_objective string Initial selection objective key, from the scripted_objectives table. This is delivered when the objective is issued to the player, and should set up the task narratively.
---@param markers table a table containing one or more intro_campaign_camera_marker objects to be associated with this camera positions advice object.
function intro_campaign_select_and_attack_advice:new(player_cqi, enemy_cqi, initial_advice, sleection_objective, markers) end
