
---@class battle_units
local battle_units = {}

--- Returns the battle_unit at the specified index in the units list. The list is 1-based, so supplying 1 as an argument will return the first unit in the army.
---@param index number index
function battle_units:item(index) end

--- Returns the size of the units list.
function battle_units:count() end

--- Returns the battle_unit at the specified index in the mountable artillery list. The list is also 1-based.
---@param index number index
function battle_units:mountable_artillery_item(index) end

--- Kills the commander of the army.
function battle_units:kill_commander() end
