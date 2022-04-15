
---@class battle_capture_location_manager
local battle_capture_location_manager = {}

--- 
function battle_capture_location_manager:holding_alliance_id() end

--- 
function battle_capture_location_manager:highlight() end

--- 
function battle_capture_location_manager:is_contested() end

--- 
function battle_capture_location_manager:set_locked() end

--- 
function battle_capture_location_manager:contesting_army() end

--- 
function battle_capture_location_manager:change_holding_army() end

--- 
function battle_capture_location_manager:script_id() end

--- 
function battle_capture_location_manager:is_enabled() end

--- Retrieves a battle_capture_location using a supplied script id. If no capture location exists with the supplied script id then nothing is returned.
function battle_capture_location_manager:capture_location_from_script_id() end

--- 
function battle_capture_location_manager:type() end

--- 
function battle_capture_location_manager:is_held() end

--- 
function battle_capture_location_manager:set_enabled() end

--- Retrieves a battle_capture_location by numerical index. If no capture location exists at the supplied index then nothing is returned. The number of capture locations on the battlefield can be queried using battle_capture_location_manager:count.
function battle_capture_location_manager:item() end

--- 
function battle_capture_location_manager:set_income_cap_for_army() end

--- 
function battle_capture_location_manager:set_income_cap_for_alliance() end

--- 
function battle_capture_location_manager:contesting_alliance_id() end

--- Retrieves the number of battle_capture_location objects on the battlefield. Each individual capture location can be retrieved with battle_capture_location_manager:item.
function battle_capture_location_manager:count() end

--- 
function battle_capture_location_manager:contributes_to_victory() end

--- 
function battle_capture_location_manager:holding_army() end

--- 
function battle_capture_location_manager:is_locked() end

--- 
function battle_capture_location_manager:position() end

--- 
function battle_capture_location_manager:unique_id() end
