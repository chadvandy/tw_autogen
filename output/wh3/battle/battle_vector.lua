
---@class battle_vector
local battle_vector = {}

--- Creates a new battle_vector object. Initial co-ordinates may optionally be specified.
---@param x number x
---@param y number y
---@param z number z
function battle_vector:new(x, y, z) end

--- Returns the x co-ordinate stored by the vector. This is the east-west position.
function battle_vector:get_x() end

--- Returns the y co-ordinate stored by the vector. This is the height of the vector position from the water plane.
function battle_vector:get_y() end

--- Returns the z co-ordinate stored by the vector. This is the north-south position.
function battle_vector:get_z() end

--- Returns the distance from the origin [0, 0, 0] to the position of this vector in metres.
function battle_vector:length() end

--- Returns the distance from the origin [0, 0] to the position of this vector in metres, disregarding any height differences.
function battle_vector:length_xz() end

--- Sets a new position for the vector. The new position may be specified as a single vector argument or as three numeric co-ordinate arguments.
---@param vector_or_x obj Either a vector specifying the new position, or a number specifying the new x co-ordinate.
---@param y number A number specifying the new y co-ordinate. This is not needed if a vector was supplied as the first argument.
---@param z number A number specifying the new z co-ordinate. This is not needed if a vector was supplied as the first argument.
function battle_vector:set(vector_or_x, y, z) end

--- Sets a new x co-ordinate for the vector.
---@param x number x co-ordinate in metres.
function battle_vector:set_x(x) end

--- Sets a new y co-ordinate for the vector. This is the height of the position from the water plane.
---@param y number y co-ordinate in metres.
function battle_vector:set_y(y) end

--- Sets a new z co-ordinate for the vector. This is the height of the position from the water plane.
---@param z number z co-ordinate in metres.
function battle_vector:set_z(z) end

--- Returns the distance from a supplied vector to the subject vector in metres.
---@param vector battle_vector vector
function battle_vector:distance(vector) end

--- Returns the distance from a supplied vector to the subject vector in metres, but disregarding any height difference.
---@param vector battle_vector vector
function battle_vector:distance_xz(vector) end
