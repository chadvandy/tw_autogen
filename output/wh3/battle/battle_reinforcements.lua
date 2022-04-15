
---@class battle_reinforcement_army
local battle_reinforcement_army = {}

--- 
function battle_reinforcement_army:unlock_support_units_event() end

--- 
function battle_reinforcement_army:highlight() end

--- Returns the battle_army this reinforcement army targets. Units within this reinforcement army will be moved into the target army as they enter the battlefield.
function battle_reinforcement_army:target_army() end

--- 
function battle_reinforcement_army:reinforcement_army_for_army() end

--- 
function battle_reinforcement_army:lock_support_units_event() end

--- 
function battle_reinforcement_army:reinforcement_army() end

--- 
function battle_reinforcement_army:script_id() end

--- 
function battle_reinforcement_army:can_be_used_by_alliance() end

--- Assigns the reinforcement army to a supplied spawn zone. This controls where the reinforcing units will appear on the battlefield when they reinforce.
---@param spawn_zone battle_spawn_zone spawn zone
function battle_reinforcement_army:assign_spawn_zone(spawn_zone) end

--- 
function battle_reinforcement_army:reinforcement_army_count() end

--- Returns the battle_army this reinforcement army is associated with. The units within this contained army are waiting to come on as reinforcements.
function battle_reinforcement_army:army() end

--- 
function battle_reinforcement_army:unique_id() end

--- 
function battle_reinforcement_army:reinforcement_line() end

--- 
function battle_reinforcement_army:attacker_reinforcement_line() end

--- 
function battle_reinforcement_army:link_support_units_event_with_capture_point() end

--- 
function battle_reinforcement_army:random_spawn_zone() end

--- 
function battle_reinforcement_army:defender_reinforcement_lines_count() end

--- 
function battle_reinforcement_army:is_safe_for_alliance() end

--- 
function battle_reinforcement_army:has_reinforcement_line() end

--- 
function battle_reinforcement_army:defender_reinforcement_line() end

--- 
function battle_reinforcement_army:spawn_zone_count() end

--- 
function battle_reinforcement_army:position() end

--- 
function battle_reinforcement_army:attacker_reinforcement_lines_count() end

--- 
function battle_reinforcement_army:spawn_zone() end

--- 
function battle_reinforcement_army:set_cost_based_support_units_event() end

--- 
function battle_reinforcement_army:enable_random_deployment_position() end
