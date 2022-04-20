
---@class battle_reinforcements
local battle_reinforcements = {}

--- Returns the battle_reinforcement_line at the specified index value in the attacker reinforcement lines list.
---@param index number index
function battle_reinforcements:attacker_reinforcement_line(index) end

--- Returns the number of battle_reinforcement_line objects in the attacker reinforcement lines list. 
function battle_reinforcements:attacker_reinforcement_lines_count() end

--- Returns the battle_reinforcement_line at the specified index value in the defender reinforcement lines list.
---@param index number index
function battle_reinforcements:defender_reinforcement_line(index) end

--- Returns the number of battle_reinforcement_line objects in the defender reinforcement lines list.
function battle_reinforcements:defender_reinforcement_lines_count() end

--- Returns the battle_spawn_zone at the specified index value in the spawn zone list.
---@param index number index
function battle_reinforcements:spawn_zone(index) end

--- Returns the number of battle_spawn_zone objects in the spawn zone list. 
function battle_reinforcements:spawn_zone_count() end

--- Returns the battle_reinforcement_army at the specified index value in the reinforcement army list.
---@param index number index
function battle_reinforcements:reinforcement_army(index) end

--- Returns the number of battle_reinforcement_army objects in the reinforcement army list.
function battle_reinforcements:reinforcement_army_count() end

--- Returns a battle_reinforcement_army object associated with the supplied battle_army. If no battle_reinforcement_army is associated with the supplied army (e.g. it's not a reinforcing army) then nothing will be returned.
---@param army battle_army army
function battle_reinforcements:reinforcement_army_for_army(army) end

--- Randomly selects and returns a spawn zone among those provided, weighting the selection based on their actual width.
---@vararg any
function battle_reinforcements:random_spawn_zone(spawn_zones) end

--- Creates a event that adds currency that the player can spend on reinforcing units. The event will not actually be applied until reinforcements:unlock_support_units_event is called.
---@param event_name string Event name.
---@param currency number Currency to add when the event is unlocked.
function battle_reinforcements:set_cost_based_support_units_event(event_name, currency) end

--- Applies a supporting-units event with the supplied name, granting the reinforcement currency amount associated with the event to the player. The event should have been previously set up with reinforcements:set_cost_based_support_units_event.
---@param event_name string event name
function battle_reinforcements:unlock_support_units_event(event_name) end

--- Locks a supporting-units event with the supplied name, granting the reinforcement currency amount associated with the event to the player. The event should have been previously set up with reinforcements:set_cost_based_support_units_event.
---@param event_name string event name
function battle_reinforcements:lock_support_units_event(event_name) end

--- Links a capture point with an unlocking support units event, that way we can show in the CP tooltip The event should have been previously set up with reinforcements:set_cost_based_support_units_event.
---@param event_name string event_name
---@param capture_location battle_capture_location capture_location
function battle_reinforcements:link_support_units_event_with_capture_point(event_name, capture_location) end

---@class battle_reinforcement_line
local battle_reinforcement_line = {}

--- Returns the script_id of the reinforcement line. This can be set in the map data and facilitates scripted battle_army objects spawning in particular spawn zones.
function battle_reinforcement_line:script_id() end

--- Enables random deployment position along the reinforcement line. With this mode enabled on the reinforcement line, units will enter the battlefield at random locations along the line rather than from left to right in a uniform fashion.
function battle_reinforcement_line:enable_random_deployment_position() end

---@class battle_spawn_zone
local battle_spawn_zone = {}

--- Returns the unique numerical id of the spawn zone.
function battle_spawn_zone:unique_id() end

--- Returns the authored position of the spawn zone.
function battle_spawn_zone:position() end

--- Returns if the spawn zone contains a battle_reinforcement_line.
function battle_spawn_zone:has_reinforcement_line() end

--- Returns the battle_reinforcement_line linked with the spawn zone. If no reinforcement line is linked then nothing is returned.
function battle_spawn_zone:reinforcement_line() end

--- Returns whether the spawn zone can be used by the supplied battle_alliance.
---@param alliance battle_alliance alliance
function battle_spawn_zone:can_be_used_by_alliance(alliance) end

--- Returns whether the spawn zone is safe for the battle_alliance. A safe spawn zone is one in which forces of that alliance outnumber any enemy.
---@param alliance battle_alliance alliance
function battle_spawn_zone:is_safe_for_alliance(alliance) end

--- Activates or deactivates a highlight on the spawn zone.<br />
--- [opt=true] boolean show highlight
function battle_spawn_zone:highlight() end

---@class battle_reinforcement_army
local battle_reinforcement_army = {}

--- Returns the battle_army this reinforcement army is associated with. The units within this contained army are waiting to come on as reinforcements.
function battle_reinforcement_army:army() end

--- Returns the battle_army this reinforcement army targets. Units within this reinforcement army will be moved into the target army as they enter the battlefield.
function battle_reinforcement_army:target_army() end

--- Assigns the reinforcement army to a supplied spawn zone. This controls where the reinforcing units will appear on the battlefield when they reinforce.
---@param spawn_zone battle_spawn_zone spawn zone
function battle_reinforcement_army:assign_spawn_zone(spawn_zone) end
