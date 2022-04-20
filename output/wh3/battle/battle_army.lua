
---@class battle_army
local battle_army = {}

--- Creates and returns a battle_units object listing all units in the army.
function battle_army:units() end

--- Returns the key of the army's faction, from the factions database table.
function battle_army:faction_key() end

--- Returns the subculture key of the army's faction, from the cultures_subcultures database table.
function battle_army:subculture_key() end

--- Returns the folder path of the flag icons used for the army's faction, from the flags_path field of the factions database table.
function battle_army:flag_path() end

--- Returns whether the army's faction is a rebel faction.
function battle_army:is_rebel() end

--- Returns the alliance object to which the army belongs.
function battle_army:alliance() end

--- Enables a reinforcement army to deploy from the spawn zone of the specified id, allowing it to start reinforcing. A reinforcing army must be enabled through some mechanism before it can enter the battle. In standard campaign battles, a reinforcing army is enabled through a player-facing timer - this function can be called to enable an army before the timer finishes, for example.
---@param spawn_zone_unique_id number spawn zone unique id
function battle_army:enable_reinforcement(spawn_zone_unique_id) end

--- Creates and returns a battle_unitcontroller object associated with this army. Consider using the generated_battle or script_unit framework, or at least the helper functions documented in the section Unitcontroller Creation rather than calling this directly.
function battle_army:create_unit_controller() end

--- Returns whether the army commander is alive or not.
function battle_army:is_commander_alive() end

--- Returns whether the army commander is invincible or not.
function battle_army:is_commander_invincible() end

--- Returns whether this army is controlled by a human player.
function battle_army:is_player_controlled() end

--- Returns the army handicap, which indicates the difficulty level the battle is being played at. A returned value of 1 equates to easy difficulty, 0 to normal difficulty, -1 to hard difficulty and -2 to very hard difficulty.
function battle_army:army_handicap() end

--- Returns the remaining recharge left for an armies magic pool. This is rate of recharge compared to max possible recharge rate. 0 is slowest speed, 1 is quickest.
function battle_army:winds_of_magic_remaining_recharge_rate() end

--- Returns the reserve magic this army can spend. This is the total amount of magic available to this army that hasn't yet entered its current pool. As the current pool is spent on casting spells, magic flows to it from the reserve pool until that pool is empty.
function battle_army:winds_of_magic_reserve() end

--- Returns the current amount of magic this army has available to spend.
function battle_army:winds_of_magic_current() end

--- Adds the supplied amount to the winds of magic reserve for the army. The reserve is the total amount of magic the army has left to spend, that hasn't yet entered its current pool.
---@param magic_to_add number magic to add
function battle_army:modify_winds_of_magic_reserve(magic_to_add) end

--- Adds the supplied amount to the current winds of magic for the army. The optional flag specifies that it should not be taken from the reserve - if set, the magic is directly added to the current pool with the reserve pool left untouched.
---@param magic_to_add number magic to add
---@param add_directly boolean add directly
function battle_army:modify_winds_of_magic_current(magic_to_add, add_directly) end

--- Allows/Stops this army to interact with toggleables
---@param allow_use_toggleables boolean allow use toggleables
function battle_army:allow_use_toggleables(allow_use_toggleables) end

--- Returns a battle_units collection containing reinforcements waiting to deploy. Supply an optional index if there are multiple units collections waiting to reinforce.
---@param reinforcement_collection number reinforcement collection
function battle_army:get_reinforcement_units(reinforcement_collection) end

--- Returns true if this army is a reinforcement army
function battle_army:is_reinforcement_army() end

--- Returns the target army of the reinforcement if it is one
function battle_army:get_reinforcement_target_army() end

--- Return the number of battle_units collections that are reinforcements waiting to deploy for this army.
function battle_army:num_reinforcement_units() end

--- Return the unique of this army.
function battle_army:unique_id() end

--- Allows aide-de-camp messages being generated for this army.
function battle_army:enable_reinforcement_adc() end

--- Prevents reinforcement aide-de-camp messages being generated for this army.
---@param number_of_messages_allowed_before_disabling_them number number of messages allowed before disabling them
function battle_army:suppress_reinforcement_adc(number_of_messages_allowed_before_disabling_them) end

--- Changes the army's faction mid-battle.
---@param faction_key string faction key
function battle_army:change_faction(faction_key) end

--- Sets whether the army destruction morale effect can apply to this army or not.
---@param enable_effect boolean enable effect
function battle_army:enable_army_destruction_morale_effect(enable_effect) end

--- Instructs the army to quit the battle.
function battle_army:quit_battle() end

--- Activates or deactivates a highlight on the deployment area related to this army.
---@param should_highlight boolean should highlight
function battle_army:highlight_deployment_areas(should_highlight) end

--- Instructs the army to target a special ability at a supplied position.
---@param key string Key of the special ability, from the army_special_abilities database table.
---@param position battle_vector Position to target the special ability at.
---@param bearing number Bearing of the special ability in degrees. This is optional and is not required for all abilities.
---@param width number Width of the special ability in metres. This is optional and is not required for all abilities.
function battle_army:use_special_ability(key, position, bearing, width) end

--- Returns whether this army has access to the specified battle currency.
---@param currency_type string Key of the battle currency, from the battle_secondary_currency_types database table.
function battle_army:has_currency(currency_type) end

--- Returns the current quantity of the specified battle currency available to this army.
---@param currency_type string Key of the battle currency, from the battle_secondary_currency_types database table.
function battle_army:currency_amount(currency_type) end

--- Resets the quantity of the specified battle currency available to this army to 0.
---@param currency_type string Key of the battle currency, from the battle_secondary_currency_types database table.
function battle_army:reset_currency_amount(currency_type) end
