
---@class battle_unit
local battle_unit = {}

--- Returns the script name for the unit, if any has been set. A script name for the unit may be set in the battle setup, either in the battle xml or on the appropriate record in the battle_set_piece_armies_units_junctions table if setting up a set-piece/quest battle. It is valid for multiple units in a given army to have the same script name.
function battle_unit:name() end

--- Returns the unique ui id for the unit, which should match the name of the corresponding unit card.
function battle_unit:unique_ui_id() end

--- Returns the unit type of the unit, from the land_units table.
function battle_unit:type() end

--- Returns the army object to which the unit currently belongs.
function battle_unit:army() end

--- Returns the index number of the alliance the unit belongs to, allowing its battle_alliance to be determined or looked up from a battle_alliances object.
function battle_unit:alliance_index() end

--- Returns the index number of the army the unit belongs to, allowing its battle_army to be determined or looked up from a battle_armies object (which itself can be determined from the value returned by unit:alliance_index).
function battle_unit:army_index() end

--- Returns the class of the unit, from the land_units table.
function battle_unit:unit_class() end

--- Returns whether this is the commanding unit of the army.
function battle_unit:is_commanding_unit() end

--- Returns whether this is a unit of infantry.
function battle_unit:is_infantry() end

--- Returns whether this is a unit of pikemen.
function battle_unit:is_pikemen() end

--- Returns whether this is a unit of anti-cavalry infantry.
function battle_unit:is_anti_cavalry_infantry() end

--- Returns whether the unit is cavalry.
function battle_unit:is_cavalry() end

--- Returns whether this is a unit of lancers.
function battle_unit:is_lancers() end

--- Returns whether this is a dismounted cavalry unit.
function battle_unit:is_dismounted_cavalry() end

--- Returns whether this is a chariot unit.
function battle_unit:is_chariot() end

--- Returns whether this unit fights on camels.
function battle_unit:is_camels() end

--- Returns whether this is a unit of elephants.
function battle_unit:is_elephants() end

--- Returns whether this is a unit of war beasts.
function battle_unit:is_war_beasts() end

--- Returns whether the unit is artillery.
function battle_unit:is_artillery() end

--- Returns whether the unit is artillery in an unlimbered state (it can fire, but not move).
function battle_unit:is_unlimbered_artillery() end

--- Returns whether the unit is artillery in a limbered state (i.e. it can move but not fire).
function battle_unit:is_limbered_artillery() end

--- Returns whether the unit is fixed artillery. Fixed artillery can never move.
function battle_unit:is_fixed_artillery() end

--- Returns whether the unit is a war machine.
function battle_unit:is_war_machine() end

--- Returns whether the unit can fly.
function battle_unit:can_fly() end

--- Returns whether the unit can fly and is currently flying.
function battle_unit:is_currently_flying() end

--- Returns whether the unit is currently on a ship.
function battle_unit:has_ships() end

--- Returns whether the unit has a ship but is not currently on it.
function battle_unit:is_dismounted_ships() end

--- Returns the centre position of the main squad of the unit.
function battle_unit:position() end

--- Returns the position to which the unit has been ordered to move to. Note that if the unit is attacking, as opposed to moving, then this will return the current position of the unit.
function battle_unit:ordered_position() end

--- Returns whether the unit can reach the supplied position.
---@param position battle_vector position
function battle_unit:can_reach_position(position) end

--- Returns the current orientation of the main squad of the unit in degrees.
function battle_unit:bearing() end

--- Returns the orientation of the position to which the unit has been ordered in degrees.
function battle_unit:ordered_bearing() end

--- Returns the width of the position to which the unit has been ordered in metres.
function battle_unit:ordered_width() end

--- Returns the position of the commanding officer of the unit.
function battle_unit:position_of_officer() end

--- Returns whether the supplied unit is currently under AI control.
function battle_unit:is_ai_controlled() end

--- Returns whether the supplied unit is currently under script control.
function battle_unit:is_script_controlled() end

--- Returns whether the supplied unit is currently under script control.
function battle_unit:is_player_controlled() end

--- Returns whether the supplied unit is in missile range of this unit.
---@param target_unit battle_unit target unit
function battle_unit:unit_in_range(target_unit) end

--- Returns the shortest distance in metres between this unit and a supplied unit, taking into account their bounding box rather than just working out the centre-to-centre distance.
---@param target_unit battle_unit target unit
function battle_unit:unit_distance(target_unit) end

--- Returns an arbitrary numeric indicator of this unit's current strength. Better units, or units in a better current condition, will return higher values that less capable units.
function battle_unit:strategic_value() end

--- Returns whether the unit is moving.
function battle_unit:is_moving() end

--- Returns whether the unit is moving fast (running/charging).
function battle_unit:is_moving_fast() end

--- Returns the unit's slow/walking movement speed in m/s.
function battle_unit:slow_speed() end

--- Returns the unit's fast/running movement speed in m/s.
function battle_unit:fast_speed() end

--- Returns whether the unit is currently idle.
function battle_unit:is_idle() end

--- Returns whether the unit is currently leaving the battlefield.
function battle_unit:is_leaving_battle() end

--- Returns whether this unit is currently valid for deployment, that means if the unit is not in a playable state or if its being deployed by the reinforcement system
function battle_unit:is_valid_for_deployment() end

--- Returns whether this unit is currently a valid target for enemies to attack. A unit might be invalid if they are entering or leaving the battlefield, hidden, or dead.
function battle_unit:is_valid_target() end

--- Returns whether the unit is currently garrisoned in a building.
function battle_unit:is_currently_garrisoned() end

--- Returns whether the unit is currently hidden in tall grass/trees. Note that this is a separate test from the unit being obscured from the enemy behind hills or other terrain features.
function battle_unit:is_hidden() end

--- Returns whether the unit is visible to a supplied alliance. This returns the last calculated result of the line-of-sight test that determines whether a unit is obscured from its enemy by terrain features.
---@param alliance battle_alliance alliance
function battle_unit:is_visible_to_alliance(alliance) end

--- Returns whether the unit is currently taking fire.
function battle_unit:is_under_missile_attack() end

--- Returns whether the unit is currently in melee combat.
function battle_unit:is_in_melee() end

--- Returns the number of enemy combatants this unit has killed in this battle.
function battle_unit:number_of_enemies_killed() end

--- Returns the number of soldiers the unit started the battle with.
function battle_unit:initial_number_of_men() end

--- Returns the number of soldiers currently alive in the unit.
function battle_unit:number_of_men_alive() end

--- Returns the number of soldiers currently alive in the unit, expressed as a unary fraction of the the initial size of the unit. A returned value of 0.75 would indicate that 25% of the soldiers in the unit that started the battle have died.
function battle_unit:unary_of_men_alive() end

--- Kills a specified number of soldiers in the unit. The optional second argument allows their bodies to be hidden - this is useful if it's desired that the unit 'disappear'.
---@param soldiers_to_kill number soldiers to kill
---@param hide_bodies boolean hide bodies
function battle_unit:kill_number_of_men(soldiers_to_kill, hide_bodies) end

--- Reduces hitpoints of the unit. The optional second argument allows their bodies to be hidden - this is useful if it's desired that the unit 'disappear'.
---@param unary_hitpoints number percentage of full hit points of unit to reduce
---@param hide_bodies boolean hide bodies
function battle_unit:reduce_hitpoints_unary(unary_hitpoints, hide_bodies) end

--- Heals the unit to the specified unary proportion of full strength i.e. 1.0 = full strength. If the allow-resurrection flag is set then dead entities may be resurrected, otherwise the function heals where it can. The function does not work in all circumstances, healing animals + handlers are not currently supported.
---@param unary_hitpoints number percentage of full hit points to heal to.
---@param allow_resurrection boolean Allow resurrection of dead entities.
function battle_unit:heal_hitpoints_unary(unary_hitpoints, allow_resurrection) end

--- Respawns the unit in a supplied position on the battlefield.
function battle_unit:respawn() end

--- Returns the hitpoint strength of all soldiers in the unit, expressed as a unary fraction of the the initial hitpoint strength of the unit. A returned value of 0.75 would indicate that the unit has lost 25% of the hitpoints it started the battle with.
function battle_unit:unary_hitpoints() end

--- Returns whether the morale of the unit is currently wavering.
function battle_unit:is_wavering() end

--- Returns whether the unit is currently routing.
function battle_unit:is_routing() end

--- Returns whether the unit is currently invulnerable.
function battle_unit:is_invulnerable() end

--- Returns whether the unit is currently rampaging.
function battle_unit:is_rampaging() end

--- Returns whether the unit is currently shattered (routing without possibility of return).
function battle_unit:is_shattered() end

--- Returns whether the unit is currently crumbling (undead's equivalent of routing).
function battle_unit:is_crumbling() end

--- Returns whether the unit is currently daemonically unstable (daemonic equivalent of routing).
function battle_unit:is_unstable() end

--- Returns whether the left flank of the unit is currently threatened by the enemy.
function battle_unit:is_left_flank_threatened() end

--- Returns whether the right flank of the unit is currently threatened by the enemy.
function battle_unit:is_right_flank_threatened() end

--- Returns whether the rear of the unit is currently threatened by the enemy.
function battle_unit:is_rear_flank_threatened() end

--- Returns the battle_unit threatening this unit's left flank. If no such unit is threatening then no value is returned.
function battle_unit:left_flank_threat() end

--- Returns the battle_unit threatening this unit's right flank. If no such unit is threatening then no value is returned.
function battle_unit:right_flank_threat() end

--- Returns the battle_unit threatening this unit's rear. If no such unit is threatening then no value is returned.
function battle_unit:rear_threat() end

--- Returns the battle_unit this unit is targeting. If no unit is being targeted then no value is returned.
function battle_unit:current_target() end

--- Returns whether the unit is currently on the top of a platform, such as a wall.
function battle_unit:is_on_top_of_platform() end

--- Returns whether the unit is currently controllable.
function battle_unit:is_controllable() end

--- Returns whether the unit is deploying or waiting to be
function battle_unit:is_deploying() end

--- Returns whether the unit has been deployed
function battle_unit:is_deployed() end

--- Returns the fatigue state of the unit as a string. Possible values are threshold_fresh, threshold_active, threshold_winded, threshold_tired, threshold_very_tired and threshold_exhausted.
function battle_unit:fatigue_state() end

--- Returns the remaining ammunition count of this unit.
function battle_unit:ammo_left() end

--- Returns the amount of ammunition the unit started the battle with.
function battle_unit:starting_ammo() end

--- Sets the current ammunition level of the unit to the supplied unary value. Setting a value of 0 would mean the unit would have no ammunition, whereas setting a value of 1 would mean the unit would have the amount of ammunition they started the battle with. It is permitted to set a value greater than 1, but the unit will appear to have full ammunition on the UI until its ammunition level drops back below 100%.
---@param unary_ammunition_level number unary ammunition level
function battle_unit:set_current_ammo_unary(unary_ammunition_level) end

--- Returns the missile range of this unit in metres.
function battle_unit:missile_range() end

--- Returns whether the unit can perform the specified special ability. Valid special abilities are defined in the unit_special_abilities database table.
---@param special_ability_key_ string special ability key 
function battle_unit:can_perform_special_ability(special_ability_key_) end

--- Disables or re-enables all passive special abilities of this unit. It only affects abilities owned by the unit.  Abilities specify if they are passive in the unit_special_abilities database table. Passive abilities are mostly buffs or infinite effects. This function works independently from unit:disable_special_ability so it will not re-enable abilities affected by it.
---@param disable boolean Disables or re-enables the ability (true for disabling it)
function battle_unit:disable_passive_special_abilities(disable) end

--- Disables or re-enables all non_passive special abilities of this unit. It only affects abilities owned by the unit.  Abilities specify if they are passive in the unit_special_abilitiesunit_special_abilities database table. Non-passive abilities are mostly direct damage spells or abilities. This function works independently from unit:disable_special_ability so it will not re-enable abilities affected by it.
---@param disable boolean Disables or re-enables the ability (true for disabling it)
function battle_unit:disable_non_passive_special_abilities(disable) end

--- Disables the specified special ability from this unit. It only affects the ability instance currently owned by the unit. This function works independently from unit:disable_passive_special_abilities and unit:disable_non_passive_special_abilities so it will not re-enable abilities affected by it.
---@param ability_key string ability_key
---@param disable boolean Disables or re-enables the ability (true for disabling it)
function battle_unit:disable_special_ability(ability_key, disable) end

--- Returns a lua table of passive special abilities owned by this unit. Abilities specify if they are passive in the table unit_special_abilities. Passive abilities are mostly buffs or infinite effects - they are abilities activated automatically, not by the player.
function battle_unit:owned_passive_special_abilities() end

--- Returns a lua table of non-passive special abilities owned by this unit. Abilities specify if they are passive in the table unit_special_abilities. Non-passive abilities are abilities activated by the player, mostly direct damage abilities and spells.
function battle_unit:owned_non_passive_special_abilities() end

--- Returns all special abilities owned by an unit. Valid special abilities are defined in the special_abilities table.
function battle_unit:owned_special_abilities() end

--- Returns the number of special abilities this unit has.
function battle_unit:num_special_abilities() end

--- Returns whether the unit can use any special abilities that cost magic.
function battle_unit:can_use_magic() end

--- Activates or deactivates a special ability usage flag on the unit. Valid flags are listed at the top of this section.
---@param flag_key string flag key
function battle_unit:set_special_abilities_flags(flag_key) end

--- Returns whether the unit can use a particular behaviour this battle. Valid behaviours are currently as follows: defend, drop_siege_equipment, abandon_artillery_engines, change_formation_spacing, dismantle_artillery_piece, dismount, fire_at_will, skirmish, release_animals, unlimber, board_ship, and formed_attack.
---@param behaviour string behaviour
function battle_unit:can_use_behaviour(behaviour) end

--- Returns whether a particular behaviour is currently active. Valid behaviours are currently as follows: defend, drop_siege_equipment, abandon_artillery_engines, change_formation_spacing, dismantle_artillery_piece, dismount, fire_at_will, skirmish, release_animals, unlimber, board_ship, and formed_attack.
---@param behaviour string behaviour
function battle_unit:is_behaviour_active(behaviour) end

--- Enables or disables a global attribute on the unit. Attribute keys are listed above, in the Unit Attributes section description.
---@param attribute_key string attribute key
function battle_unit:set_stat_attribute(attribute_key) end

--- Returns whether a unit currently has an attribute. Attribute keys are listed above, in the Unit Attributes section description.
---@param attribute_key string attribute key
function battle_unit:has_attribute(attribute_key) end

--- Compels the unit to make a charge sound effect.
function battle_unit:trigger_sound_charge() end

--- Compels the unit to make a taunt sound effect.
function battle_unit:trigger_sound_taunt() end

--- Compels the unit leader to play an animation.
---@param animation_key string animation key
---@param loop_animation boolean loop animation
function battle_unit:play_anim_for_captain(animation_key, loop_animation) end

--- Prevents or allows the unit to deploy as a reinforcement from a specific spawn zone if provided. If set to false, and the unit has not yet entered the battlefield, then the unit will not be able to deploy until the function is called again with an argument of true.<br />
--- Calling this command has no effect if the unit is not part of a reinforcement army.
---@param enable boolean Enable reinforcement.
---@param spawn_zone_index number Index of spawn zone to use, if coming on as a reinforcement.
function battle_unit:deploy_reinforcement(enable, spawn_zone_index) end

--- Selects the unit in the user interface.
function battle_unit:select_in_ui() end

--- Activates or deactivates a highlight on the unit.
---@param highlight boolean highlight
function battle_unit:highlight(highlight) end

--- Makes a player unit look like it is allied, rather than part of the controlled army. This is useful for specific scripted situations where it's intended to grant allied units to player control.<br />
--- Call this function with true as a single argument to mark the controlled unit as an ally, and then again supplying false to mark the unit as part of the player's army again.
---@param mark_as_ally boolean mark as ally
function battle_unit:mark_as_ally(mark_as_ally) end
