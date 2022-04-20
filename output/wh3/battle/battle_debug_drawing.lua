
---@class battle_debug_drawing
local battle_debug_drawing = {}

--- Draws a white circle on the terrain.
---@param position battle_vector Centre position.
---@param radius number Radius of circle in m.
---@param duration number Duration for which to display the circle, in seconds.
function battle_debug_drawing:draw_white_circle_on_terrain(position, radius, duration) end

--- Draws a white line on the terrain.
---@param position battle_vector Start position.
---@param position battle_vector End position.
---@param duration number Duration for which to display the line, in seconds.
function battle_debug_drawing:draw_white_line_on_terrain(position, position, duration) end

--- Draws a vertical white line on the terrain.
---@param position battle_vector Position.
---@param duration number Duration for which to display the peg, in seconds.
function battle_debug_drawing:draw_white_peg_on_terrain(position, duration) end

--- Draws a circle on the terrain in a supplied colour.
---@param position battle_vector Centre position.
---@param radius number Radius of circle in m.
---@param duration number Duration for which to display the circle, in seconds.
---@param colour battle_colour Line colour.
function battle_debug_drawing:draw_circle_on_terrain(position, radius, duration, colour) end

--- Draws a line on the terrain in a supplied colour.
---@param position battle_vector Start position.
---@param position battle_vector End position.
---@param duration number Duration for which to display the line, in seconds.
---@param colour battle_colour Line colour.
function battle_debug_drawing:draw_line_on_terrain(position, position, duration, colour) end

--- Draws a vertical line on the terrain in a supplied colour.
---@param position battle_vector Position.
---@param duration number Duration for which to display the peg, in seconds.
---@param colour battle_colour Line colour.
function battle_debug_drawing:draw_peg_on_terrain(position, duration, colour) end

--- Draws a debug rectangle shape on the terrain in a supplied colour.
---@param position battle_vector Position.
---@param width number Width in metres.
---@param height number Height in metres.
---@param orientation number Orientation in radians.
---@param duration number Duration for which to display the shape, in seconds.
---@param colour battle_colour Line colour.
function battle_debug_drawing:draw_obb_on_terrain(position, width, height, orientation, duration, colour) end

---@class battle_colour
local battle_colour = {}

--- Creates and returns a new battle_colour object.
---@param red number Red colour value (0 - 255).
---@param green number Green colour value (0 - 255).
---@param blue number Blue colour value (0 - 255).
function battle_colour:new(red, green, blue) end
