
---@class battle_toggle_slot
local battle_toggle_slot = {}

--- Returns the slot type of the toggle slot as a string. Slot types are listed in the toggle_system_types database table.
function battle_toggle_slot:slot_type() end

--- Activates or deactivates a highlight on a slot building place.
---@param show_highlight boolean show highlight
function battle_toggle_slot:highlight(show_highlight) end

--- 
function battle_toggle_slot:enable() end

--- 
function battle_toggle_slot:record_key() end

--- 
function battle_toggle_slot:map_barrier_script_id() end

--- 
function battle_toggle_slot:disable_and_refund_all_buildings() end

--- Returns the script id of the toggle slot. If no script id has been set in the map data then a blank string is returned.
function battle_toggle_slot:script_id() end

--- 
function battle_toggle_slot:has_toggle_slot() end

--- Returns the unique id for this toggle slot.
function battle_toggle_slot:unique_id() end

--- Returns the unique id for this toggle slot that the UI system uses.
function battle_toggle_slot:unique_ui_id() end

--- Returns whether the toggle slot is linked to a map barrier.
function battle_toggle_slot:has_map_barrier() end

--- 
function battle_toggle_slot:map_barrier_count() end

--- Returns the map barrier linked with the toggle slot. If no map barrier is linked then nothing is returned.
function battle_toggle_slot:map_barrier() end

--- Returns a handle to the holding alliance. If no alliance holds the toggleable slot then nothing is returned.
function battle_toggle_slot:holding_alliance() end

--- 
function battle_toggle_slot:toggle_slot_script_id() end

--- 
function battle_toggle_slot:toggle_slot() end

--- 
function battle_toggle_slot:toggle_slot_count() end

--- 
function battle_toggle_slot:composite_scenes() end

--- Returns the position
function battle_toggle_slot:position() end

--- 
function battle_toggle_slot:enabled() end

--- Returns whether the toggle slot is currently held by an alliance.
function battle_toggle_slot:is_held_by_alliance() end

--- 
function battle_toggle_slot:allow_army_interaction() end

--- 
function battle_toggle_slot:disable() end
