--- Anything that is a global value/function that should be defined by hand because the docs don't recognize it (ie. "cm" being campaign_manager's global variable) should go here!
--- This is manually created.

---@class UIC_Address : userdata

---@class campaign_manager : episodic_scripting
---@field game_interface episodic_scripting
---@field save_counter integer 
cm = {}

---@class campaignui
CampaignUI = {}

---@class core
core = {}



---@param address UIC_Address
---@return UIC
function UIComponent(address) end

---@class common
common = {}

---@class ComponentContextObject
---@field Call fun(self: ComponentContextObject, expression: string):any

--- Takes a CCO Type Name and a Context ID and returns a lua interface for the CCO
---@return ComponentContextObject
function cco(context_type_id, context_id) end

---@param character CHARACTER_SCRIPT_INTERFACE
---@param bonus_value_key string
---@return integer
function get_characters_bonus_value(character, bonus_value_key) end

---@alias GAMEMODE 0|1|2|3
---@type GAMEMODE
__game_mode = 0

---@type GAMEMODE
__lib_type_battle = 0;
---@type GAMEMODE
__lib_type_campaign = 1;
---@type GAMEMODE
__lib_type_frontend = 2;
---@type GAMEMODE
__lib_type_autotest = 3;

---@param faction FACTION_SCRIPT_INTERFACE
---@param bonus_value_key string
---@return integer
function get_factions_bonus_value(faction, bonus_value_key) end

---@class episodic_scripting
local episodic_scripting = {}
---Returns a dilemma builder interface
---@param dilemma_key string
---@return CAMPAIGN_DILEMMA_BUILDER_SCRIPT_INTERFACE
function episodic_scripting:create_dilemma_builder(dilemma_key)
    return {}
end

---Create a payload builder and return it.
---@return CAMPAIGN_PAYLOAD_BUILDER_SCRIPT_INTERFACE
function episodic_scripting:create_payload()
    return {}
end

---comment
---@param builder CAMPAIGN_DILEMMA_BUILDER_SCRIPT_INTERFACE
---@param faction FACTION_SCRIPT_INTERFACE
function episodic_scripting:launch_custom_dilemma_from_builder(builder, faction)
    
end


---@alias SHARED_STATE_ENTITIES FACTION_SCRIPT_INTERFACE|CHARACTER_SCRIPT_INTERFACE|REGION_SCRIPT_INTERFACE
---comment
---@param interface SHARED_STATE_ENTITIES
---@param state_key string
---@param value boolean|number|string
function episodic_scripting:set_script_state(interface, state_key, value)

end

--- Instantly sets the primary slot level of the supplied settlement. The settlement is specified by SETTLEMENT_SCRIPT_INTERFACE - see the Model Hierarchy documentation for more information. The supplied level Will be clamped to the maximum level of the chain.<br />
--- The new primary slot building will be returned, as a BUILDING_SCRIPT_INTERFACE object.
---@param settlement SETTLEMENT_SCRIPT_INTERFACE
---@param level integer
---@return BUILDING_SCRIPT_INTERFACE
function episodic_scripting:instantly_set_settlement_primary_slot_level(settlement, level) end

--------Campaign, Battle, and Frontend-------

---@type number
VOLUME_TYPE_VO = 0

---@type string
path = ""

-----------------Battle Only-----------------

---@class battle
local battle = {}

---@class battle_manager : battle
---@alias bm battle_manager
battle_manager = {}

---@class battle_manager : battle
---@field all_scriptunits table<number, script_unit> Indexed by the unique_ui_id. The indexes are not all consecutive. See also battle_manager:get_scriptunit_for_unit
---@field unit_selection_callback_list table[] This is meant to be used internally by battle_manager:register_unit_selection_callback. But there are circumstances where paperpancake has needed to access this list directly. You can ping paperpancake if you have questions.
battle_manager = {}

---@class battle_manager 
bm = {}

---@return battle_manager
function get_bm() end

---@class script_unit
---@field unit battle_unit
---@field uc battle_unitcontroller
script_unit = {}

---@class script_ai_planner
script_ai_planner = {}

--- @param obj battle_unit|script_unit|script_units|battle_units|battle_army|battle_armies|battle_alliance|table
--- @param shattered_only? boolean [opt=false]
--- @param permit_rampaging? boolean [opt=false]
--- @return boolean
function is_routing_or_dead(obj, shattered_only, permit_rampaging) end

--- @param obj battle_unit|script_unit|script_units|battle_units|battle_army|battle_armies|battle_alliance|table
--- @param permit_rampaging? boolean [opt=false]
--- @return boolean
function is_shattered_or_dead(obj, permit_rampaging) end

---------------------------------


---@class Forced_Battle_Manager
Forced_Battle_Manager = {
	forced_battles_list ={
	},
	active_battle = false
}

---@class forced_battle
forced_battle = {}

---wrapper function for the most basic type of forced battle. If you want to do something more elaborate you can construct it out of the other functions below.
---@param target_force_cqi integer
---@param generated_force_faction string
---@param generated_force_template string
---@param generated_force_size integer
---@param generated_force_power integer
---@param generated_force_is_attacker boolean
---@param destroy_generated_force_after_battle boolean
---@param is_ambush boolean
---@param opt_player_victory_incident string|nil
---@param opt_player_defeat_incident string|nil
---@param opt_general_subtype string|nil
---@param opt_general_level integer|nil
---@param opt_effect_bundle string|nil
---@param opt_player_is_generated_force boolean|nil
function Forced_Battle_Manager:trigger_forced_battle_with_generated_army(
	target_force_cqi,
	generated_force_faction,
	generated_force_template,
	generated_force_size,
	generated_force_power,
	generated_force_is_attacker,
	destroy_generated_force_after_battle,
	is_ambush,
	opt_player_victory_incident,
	opt_player_defeat_incident,
	opt_general_subtype,
	opt_general_level,
	opt_effect_bundle,
	opt_player_is_generated_force
	)
end

---Used to start the longer form construction of a forced battle
---the battle will persist so you can call the same battle several times.
---@param key string
---@return forced_battle
function Forced_Battle_Manager:setup_new_battle(key)
    return {}
end


---get an existing forced battle by its key
---@param key string
---@return forced_battle
function Forced_Battle_Manager:get_battle(key)
    return {}
end

---assigns a force to the forced battle manager.
---the force is generated via the Invasion Manager system.
---force needs a unique ref
---if opt_destroy_after_battle is set to false, the force will persist if it survives the forced battle.
---an effect bundle can be assigned to the force that will be applied on spawn
---@param force_key string
---@param unit_list string
---@param faction_key string
---@param destroy_after_battle boolean
---@param opt_effect_bundle string|nil
---@param opt_general_subtype string|nil
---@param opt_general_level integer|nil
function forced_battle:add_new_force(force_key, unit_list, faction_key, destroy_after_battle, opt_effect_bundle,opt_general_subtype,opt_general_level)

end

--- immediately trigger a forced battle between two forces
--- this will force a war if one doesn't already exist!
--- this can use CQIs of existing forces or new forces created within the manager
--- x/y coordinates only required if target force is a created force
--- attacking forces must be able to attack (not garrisoned or in a stance)
--- defaults to not an ambush. Be wary of using ambushes if they can occur on tiles without the correct ambush setup (e.g. sea tiles, settlement maps)
---@param attacker_force integer|string
---@param target_force integer|string
---@param opt_target_x integer|nil
---@param opt_target_y integer|nil
---@param opt_is_ambush boolean|nil
function forced_battle:trigger_battle(attacker_force, target_force, opt_target_x, opt_target_y, opt_is_ambush)


end

---define a custom event to fire if the battle fails due to things we can't control for in the script, e.g. can't force attacker into correct stance
---the defined event will include the context of the attacker force
--- this allows you to define a custom response (e.g. an incident telling the player to change stance) 
---@param script_event string
function forced_battle:add_battle_failed_script_event(script_event)

end

---	assign a CDIR event to be fired after the battle is resolved.
----event type can be "dilemma" or "incident"
--- event_key refers to a DB event. This must match the type specified.
--- opt_side can be either "attacker_victory", "defender_victory", or "retreat". If not specified, will fire in either case.
--- A battle can have separate events for attacker/defender victory, but not more than one for each.
---@param event_type "dilemma"|"incident"
---@param event_key string
---@param opt_trigger_condition "attacker_victory"|"defender_victory"|"retreat"|nil
function forced_battle:add_post_battle_event(event_type,event_key,opt_trigger_condition)

end