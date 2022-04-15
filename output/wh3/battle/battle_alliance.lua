
---@class battle_alliance
local battle_alliance = {}

--- Returns whether this alliance is attacking in the battle.
function battle_alliance:is_attacker() end

--- Immediately forces victory for this alliance.
function battle_alliance:force_battle_victory() end

--- Creates and returns an ai_planner object attached to this alliance. Consider creating a script_ai_planner instead of calling this function directly.
function battle_alliance:create_ai_unit_planner() end

--- Forces any AI in this alliance to prioritise defensive behaviour.
function battle_alliance:force_ai_plan_type_defend() end

--- Forces any AI in this alliance to prioritise attacking behaviour.
function battle_alliance:force_ai_plan_type_attack() end

--- Creates and returns a battle_armies object listing all armies in the alliance.
function battle_alliance:armies() end
