
---@class ai_planner
local ai_planner = {}

--- Adds units to the ai planner. One or more battle_unit objects may be specified as arguments. Each unit specified must belong to the battle_alliance from which the planner was created. If units are added to the planner after an order has been issued then those units will start following that order automatically.
---@vararg any
function ai_planner:add_units(units) end

--- Instructs units in the ai planner to adopt an offensive formation and then attack a specified unit and any other nearby enemies. Other enemies encountered along the way will be intelligently reacted to.
---@param target battle_unit target
function ai_planner:attack_unit(target) end

--- Clears the current order of the ai planner.
function ai_planner:clear_objective() end

--- Instructs units in the ai planner to adopt an movement formation and then move to a specified position.
---@param position battle_vector position
function ai_planner:move_to_position(position) end

--- Instructs units in the ai planner to attack a specified unit and any other nearby enemies, without too much reforming. Other enemies encountered along the way will be intelligently reacted to.
---@param target battle_unit target
function ai_planner:rush_unit(target) end

--- Removes units from the ai planner. One or more battle_unit objects may be specified as arguments. Each unit specified must have previously been added to the planner with ai_planner:add_units.
---@vararg any
function ai_planner:remove_units(units) end

--- Instructs units in the ai planner to adopt a defensive formation, then move to and defend a specified position from any enemies, staying within a specified radius.
---@param position battle_vector Position which the units will defend.
---@param radius number Radius in m around the position in which the units will roam.
function ai_planner:defend_position(position, radius) end
