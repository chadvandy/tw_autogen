
---@class invasion_manager
local invasion_manager = {}

--- Adds a new invasion to the invasion manager
---@param key string The key of this invasion
---@param faction_key string The key of the faction that this invasion belongs to
---@param force_list string The units that will be part of this invasion
---@param spawn_location any Pass either a table of x/y coordinates or a string for the key of a preset location
function invasion_manager:new_invasion(key, faction_key, force_list, spawn_location) end

--- Adds a new invasion to the invasion manager created from an existing force
---@param key string The key of this invasion
---@param force force_interface The existing force to use with this invasion
function invasion_manager:new_invasion_from_existing_force(key, force) end

--- Create a new spawn location that can be used later by referencing its key
---@param key string The key of this location
---@param x number The X coordinate of this location
---@param y number The Y coordinate of this location
function invasion_manager:new_spawn_location(key, x, y) end

--- Returns an invasion from the invasion manager by its key
---@param key string The key of the invasion object
function invasion_manager:get_invasion(key) end

--- Removes an invasion from the invasion manager by its key
---@param key string The key of the invasion object
function invasion_manager:remove_invasion(key) end

--- Kills an invasion via the invasion manager, see the kill function on the invasion object for details
---@param key string The key of the invasion object
function invasion_manager:kill_invasion_by_key(key) end

---@class invasion
local invasion = {}

--- Sets the target for an invasion<br />
--- Target Types: REGION, CHARACTER, LOCATION, PATROL<br />
--- REGION - Requires the target to be set as a region key<br />
--- CHARACTER - Requires the target to be set as a character's CQI<br />
--- LOCATION - Requires the target to be set as a table containing an x and y variable, e.g. {x = 5, y = 3}<br />
--- PATROL - Requires the target to be set as a table containing any number of position tables, e.g. {{x = 5, y = 3}, {x = 9, y = 2}}
---@param target_type string The type of the target
---@param target any The actual target
---@param target_faction_key string The faction that is the indended target
function invasion:set_target(target_type, target, target_faction_key) end

--- Sets this invasion to no longer have a target
function invasion:remove_target() end

--- Add an aggravation radius to this invasion in which the force will attack all specified targets that enter its aggro range
---@param radius number The radius of the aggrevation range at which this invasion will trigger an attack
---@param target_list table A table containing faction keys of all the factions that will trigger an attack. If nil, will target any warring factions
---@param abort_timer number The number of turns after which this invasion will give up after chasing a target
function invasion:add_aggro_radius(radius, target_list, abort_timer) end

--- Removes all aggravation behaviour from this invasion
function invasion:remove_aggro_radius() end

--- Sets if the Invasion will abort if the owner of the target differs to the Invasions faction target
---@param abort boolean Will abort if true
function invasion:abort_on_target_owner_change(abort) end

--- Sets a General to be used when spawning this invasion
---@param character CHARACTER_SCRIPT_INTERFACE The general that will be used (can optionally be a character CQI)
function invasion:assign_general(character) end

--- Sets up a general to be created to command this invasion force when it is spawned
---@param make_faction_leader boolean If True this character will become the faction leader
---@param agent_subtype string The key of this characters intended subtype
---@param forename string The name key of this characters forename
---@param clan_name string The name key of this characters clan name
---@param family_name string The name key of this characters family name
---@param other_name string The name key of this characters other name
function invasion:create_general(make_faction_leader, agent_subtype, forename, clan_name, family_name, other_name) end

--- Sets whether the General leading this invasion should be immortal or not
---@param should_stop boolean General spawned will be immortal if True
function invasion:set_general_immortal(should_stop) end

--- Sets the Invasion should not move after completing it's objective
---@param should_stop boolean Will stop if True
function invasion:should_stop_at_end(should_stop) end

--- Allows you to apply an effect bundle to the forces in this invasion
---@param effect_key string The key of the effect bundle
---@param turns number The turns the effect bundle will be applied for after the invasion is started
function invasion:apply_effect(effect_key, turns) end

--- Allows you to add experience to the general in this invasion or set their level
---@param experience_amount number The amount of experience to apply
---@param by_level boolean If true the experience amount supplied will set the level of the character and not their xp
function invasion:add_character_experience(experience_amount, by_level) end

--- Allows you to add experience to the units of the army in this invasion
---@param unit_experience_amount number The amount of experience to apply
function invasion:add_unit_experience(unit_experience_amount) end

--- Allow you to add a respawn to the invasion so that if it dies it will respawn a set amount of times after a set delay
---@param respawn boolean If True this invasion will spawn after its force dies
---@param respawn_count number The amount of times the invasion will respawn before stopping
---@param respawn_delay number The delay before respawning another time after the force respawns
function invasion:add_respawn(respawn, respawn_count, respawn_delay) end

--- Allows you to set the invasion to maintain its army strength by adding a missing unit each turn with a percentage chance
---@param maintain boolean If True this invasion will attempt to maintain it strength
---@param respawn_count number The chance per turn to add one of its missing units
function invasion:should_maintain_army(maintain, respawn_count) end

--- Starts the invasion, spawning its force if neccessary and handing control of the force over to the script instead of the A.I
---@param maintain function If True this invasion will attempt to maintain it strength
---@param declare_war boolean If True the invasion will declare war on its targets
---@param invite_attacker_allies boolean If True the invasion will invite its allies when declaring war
---@param invite_defender_allies boolean If True the invasions target will invite its allies when declaring war
function invasion:start_invasion(maintain, declare_war, invite_attacker_allies, invite_defender_allies) end

--- Releases the invasion force back to AI control
function invasion:release() end

--- Kills this invasions General and the whole force (or just the General)
---@param general_only boolean If True only the Generate will be killed and the force will remain
function invasion:kill(general_only) end

--- Returns the character leading this invasion force
function invasion:get_general() end

--- Returns the character that is the current leader of this force even if it is a colonel
function invasion:get_commander() end

--- Returns the force interface of this invasion
function invasion:get_force() end

--- Checks if an invasion has a target
function invasion:has_target() end

--- Checks if an invasion has started
function invasion:has_started() end

--- Checks what turn this invasion was spawned on
function invasion:turn_spawned() end
