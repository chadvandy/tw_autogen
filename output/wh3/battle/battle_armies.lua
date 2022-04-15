
---@class battle_armies
local battle_armies = {}

--- Returns the battle_army at the specified index in the armies list. The list is 1-based, so supplying 1 as an argument will return the first army in the alliance.
---@param index number index
function battle_armies:item(index) end

--- Returns the size of the armies list.
function battle_armies:count() end
