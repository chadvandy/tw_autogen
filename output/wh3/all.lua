--- Anything that is a global value/function that should be defined by hand because the docs don't recognize it (ie. "cm" being campaign_manager's global variable) should go here!
--- This is manually created.

---@class UIC_Address : userdata

---@class campaign_manager : episodic_scripting
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