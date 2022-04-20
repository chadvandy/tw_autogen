--- Anything that is a global value/function that should be defined by hand because the docs don't recognize it (ie. "cm" being campaign_manager's global variable) should go here!

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