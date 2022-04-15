
---@class battle_alliances
local battle_alliances = {}

--- Returns the battle_alliance at the specified index in the alliances list. At present there are always two alliances on the battlefield, with the first being the attacker and the second being the defender. The list is 1-based, so supplying 1 as an argument will return the first alliance.
---@param index number index
function battle_alliances:item(index) end

--- Returns the size of the alliances list. At present this will always be 2. 
function battle_alliances:count() end
