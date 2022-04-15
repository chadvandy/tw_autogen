
---@class battle_building
local battle_building = {}

--- Sets whether the building can burn or not.
---@param is_flammable boolean is flammable
function battle_building:change_immune_to_catching_fire(is_flammable) end

--- Returns the previous fort wall building, if this building is part of a wall. If this building is not part of a wall then nil is returned.
function battle_building:previous() end

--- Returns whether this building is a fort wall or not.
function battle_building:is_fort_wall() end

--- Returns the category of this building, from the battlefield_building_categories database table.
function battle_building:category() end

--- Returns whether this building is a fort tower or not.
function battle_building:is_fort_tower() end

--- Returns a battle_vector representing the centre position of the building.
function battle_building:central_position() end

--- Destroys the building.
function battle_building:destroy() end

--- Returns the number of the battle_alliance that owns the building. If nobody owns this building then -1 is returned.
function battle_building:alliance_owner_id() end

--- Returns the next fort wall building, if this building is part of a wall. If this building is not part of a wall then nil is returned.
function battle_building:next() end

--- Sets whether the building takes damage from burning or not.
---@param takes_damage boolean takes damage
function battle_building:change_immune_to_fire_damage(takes_damage) end

--- Sets whether the building takes damage at all.
---@param takes_damage boolean takes damage
function battle_building:change_is_destructible(takes_damage) end

--- Sets the building on fire or not (if it is able to burn).
---@param set_on_fire boolean set on fire
function battle_building:change_on_fire(set_on_fire) end

--- Shows the building after it has been hidden with building:hide.
function battle_building:show() end

--- Hides the building, making it invisible.
function battle_building:hide() end

--- Returns the health of the building as a unary value (between 0 and 1).
function battle_building:health() end

--- Returns a battle_vector representing the position of the building. The vector will be positioned at the pivot point of the building, which is not necessarily at its centre.
function battle_building:position() end

--- Returns the orientation of the building in degrees.
function battle_building:orientation() end

--- Returns whether this building is selectable or not. Qualifying buildings can be selected and issued orders, such as certain towers.
function battle_building:is_selectable() end

--- Returns whether this building contains a gate or not.
function battle_building:has_gate() end

--- Returns the name of the building.
function battle_building:name() end
