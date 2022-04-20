
---@class battle_capture_location
local battle_capture_location = {}

--- Activates or deactivates a highlights on the capture location.
---@param show_highlight boolean show highlight
function battle_capture_location:highlight(show_highlight) end

--- Returns the position of the capture location.
function battle_capture_location:position() end

--- Returns the unique_id of the capture location.
function battle_capture_location:unique_id() end

--- Returns the script id of the capture location. This can be set in the terrain editor. A blank string is returned if no script id is set.
function battle_capture_location:script_id() end

--- Returns the type of the capture location, from the capture_location_types table.
function battle_capture_location:type() end

--- Enables or disables the capture location.
---@param enable boolean enable
function battle_capture_location:set_enabled(enable) end

--- Returns whether the capture location is enabled.
function battle_capture_location:is_enabled() end

--- Locks or unlocks the capture location.
---@param lock boolean lock
function battle_capture_location:set_locked(lock) end

--- Returns whether the capture location is locked.
function battle_capture_location:is_locked() end

--- Returns whether the capture of this capture location contributes towards victory in the battle.
function battle_capture_location:contributes_to_victory() end

--- Changes the army who owns the capture location to the supplied army. If no battle_army argument is supplied then the capture location is set to neutral.
---@param holding_army battle_army holding army
function battle_capture_location:change_holding_army(holding_army) end

--- Returns whether the capture location is currently controlled by an alliance.
function battle_capture_location:is_held() end

--- Returns the id of the alliance who owns the capture location. If no alliance owns the capture location then 0 will be returned;
function battle_capture_location:holding_alliance_id() end

--- Returns the army that owns the capture location. If no army holds the capture location then nothing is returned.
function battle_capture_location:holding_army() end

--- Returns whether the capture location is currently being contested.
function battle_capture_location:is_contested() end

--- Returns the army currently contesting the capture location is currently being contested. If the capture location is not being contested then nothing is returned.
function battle_capture_location:contesting_army() end

--- Returns the id of the alliance currently contesting the capture location. If no alliance is currently contesting the capture location then nothing will be returned.
function battle_capture_location:contesting_alliance_id() end

--- Sets income cap for the whole alliance
---@param alliance_id number alliance_id
---@param income_cap number income_cap
function battle_capture_location:set_income_cap_for_alliance(alliance_id, income_cap) end

--- Sets income cap for specific army
---@param army_id_ number army_id 
---@param income_cap number income_cap
function battle_capture_location:set_income_cap_for_army(army_id_, income_cap) end

---@class battle_capture_location_manager
local battle_capture_location_manager = {}

--- Retrieves a battle_capture_location using a supplied script id. If no capture location exists with the supplied script id then nothing is returned.
function battle_capture_location_manager:capture_location_from_script_id() end

--- Retrieves a battle_capture_location by numerical index. If no capture location exists at the supplied index then nothing is returned. The number of capture locations on the battlefield can be queried using battle_capture_location_manager:count.
function battle_capture_location_manager:item() end

--- Retrieves the number of battle_capture_location objects on the battlefield. Each individual capture location can be retrieved with battle_capture_location_manager:item.
function battle_capture_location_manager:count() end
