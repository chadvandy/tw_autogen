--- Anything that is a global value/function that should be defined by hand because the docs don't recognize it (ie. "cm" being campaign_manager's global variable) should go here!
--- This is manually created.

---@class UIC_Address : userdata

---@class campaign_manager : episodic_scripting
cm = {}

---@class campaignui
CampaignUI = {}

---@class battle_manager
bm = {}

---@class core
core = {}

---@param address UIC_Address
---@return UIC
function UIComponent(address) end

---@class common
common = {}

---@class ComponentContextObject
---@field Call fun(string):any

--- Takes a CCO Type Name and a Context ID and returns a lua interface for the CCO
---@return ComponentContextObject
function cco(context_type_id, context_id) end

---@param character CHARACTER_SCRIPT_INTERFACE
---@param bonus_value_key string
---@return integer
function get_characters_bonus_value(character, bonus_value_key) end