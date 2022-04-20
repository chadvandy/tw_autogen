
---@class battle_toggle_system
local battle_toggle_system = {}

--- Returns the toggle slot at the specified index value in the collection. The list is 1-based, the toggle slot at index 1 is the first toggle slot in the list.
---@param index number index
function battle_toggle_system:toggle_slot(index) end

--- Returns the toggle slot with the specified script_id.
---@param index number index
function battle_toggle_system:toggle_slot_script_id(index) end

--- Returns the size of the toggle slot list.
function battle_toggle_system:toggle_slot_count() end

--- Returns the map barrier at the specified index value in the collection. The list is 1-based, the map barrier at index 1 is the first map barrier in the list.
---@param index number index
function battle_toggle_system:map_barrier(index) end

--- Returns the map barrier with the specified script id.
---@param script_id string script id
function battle_toggle_system:map_barrier_script_id(script_id) end

--- Returns the size of the map barrier list.
function battle_toggle_system:map_barrier_count() end

--- Allows/Stops all armies to interact with toggleables
function battle_toggle_system:allow_army_interaction() end

--- Disable and refunds all built buildings
function battle_toggle_system:disable_and_refund_all_buildings() end

---@class battle_map_barrier
local battle_map_barrier = {}

--- Returns if the map barrier is enabled
function battle_map_barrier:enabled() end

--- Activates or deactivates a map barrier highlight.
---@param show_highlight boolean show highlight
function battle_map_barrier:highlight(show_highlight) end

--- Enables the map barrier. The army that is enabling the barrier must be specified.
---@param army battle_army army
function battle_map_barrier:enable(army) end

--- Disables the map barrier. The army that is disabling the barrier must be specified.
---@param army battle_army army
function battle_map_barrier:disable(army) end

--- Returns the position of the map barrier.
---@param position battle_vector position
function battle_map_barrier:position(position) end

--- Returns the record key of the map barrier.
function battle_map_barrier:record_key() end

--- Returns the composite_scenes of the map barrier.
function battle_map_barrier:composite_scenes() end

--- Returns whether the map barrier is linked to a toggle slot.
function battle_map_barrier:has_toggle_slot() end

--- Returns the toggle slot linked with the barrier. If no toggleable is linked then nothing is returned.
function battle_map_barrier:toggle_slot() end

---@class battle_toggle_slot
local battle_toggle_slot = {}

--- Returns whether the toggle slot is currently held by an alliance.
function battle_toggle_slot:is_held_by_alliance() end

--- Returns a handle to the holding alliance. If no alliance holds the toggleable slot then nothing is returned.
function battle_toggle_slot:holding_alliance() end

--- Returns whether the toggle slot is linked to a map barrier.
function battle_toggle_slot:has_map_barrier() end

--- Returns the map barrier linked with the toggle slot. If no map barrier is linked then nothing is returned.
function battle_toggle_slot:map_barrier() end

--- Returns the unique id for this toggle slot that the UI system uses.
function battle_toggle_slot:unique_ui_id() end

--- Returns the unique id for this toggle slot.
function battle_toggle_slot:unique_id() end

--- Returns the script id of the toggle slot. If no script id has been set in the map data then a blank string is returned.
function battle_toggle_slot:script_id() end

--- Activates or deactivates a highlight on a slot building place.
---@param show_highlight boolean show highlight
function battle_toggle_slot:highlight(show_highlight) end

--- Returns the position
function battle_toggle_slot:position() end

--- Returns the slot type of the toggle slot as a string. Slot types are listed in the toggle_system_types database table.
function battle_toggle_slot:slot_type() end
