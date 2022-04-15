
---@class intro_campaign_select_and_attack_advice
local intro_campaign_select_and_attack_advice = {}

--- 
function intro_campaign_select_and_attack_advice:action() end

--- 
function intro_campaign_select_and_attack_advice:start() end

--- 
function intro_campaign_select_and_attack_advice:wait_for_advisor() end

--- 
function intro_campaign_select_and_attack_advice:set_should_skip() end

--- 
function intro_campaign_select_and_attack_advice:set_skip_camera() end

--- Creates and returns an intro_campaign_select_and_attack_advice object.
---@param player_cqi number Command queue index of the player's army that they have to attack with.
---@param enemy_cqi number Command queue index of the target enemy army.
---@param initial_advice string Initial advice key, from the advice_threads table. This is delivered when the objective is issued to the player, and should set up the task narratively.
---@param sleection_objective string Initial selection objective key, from the scripted_objectives table. This is delivered when the objective is issued to the player, and should set up the task narratively.
---@param markers table a table containing one or more intro_campaign_camera_marker objects to be associated with this camera positions advice object.
function intro_campaign_select_and_attack_advice:new(player_cqi, enemy_cqi, initial_advice, sleection_objective, markers) end
