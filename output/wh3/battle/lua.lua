
---@class math
local math = {}

--- Returns the natural logarithm of the supplied value.
---@param value number value
function math:log(value) end

--- 
function math:starts_with() end

--- 
function math:tostring() end

--- 
function math:print() end

--- 
function math:char() end

--- 
function math:gmatch() end

--- 
function math:remove() end

--- Converts the supplied radian value into an angle in degrees. See also math.rad.
---@param radian_value number radian value
function math:deg(radian_value) end

--- 
function math:upper() end

--- 
function math:gsub() end

--- 
function math:format() end

--- Provides an interface to the pseudo-random number generator provided by ANSI C. This function returns a random number between two optionally-supplied limits. If no arguments are supplied, those limits are 0 and 1. If one argument a is supplied, those limits are 1 and a. If two arguments a and b are supplied then those limits are a and b.<br />
--- If no arguments are supplied the returned value is real, whereas if any arguments are supplied the returned value is an integer.<br />
--- Note that use of this function is discouraged, as it will generate different results on different clients in a multiplayer game. Acting upon the result of this function in multiplayer scripts will likely cause desyncs.
---@param first_limit number first limit
---@param second_limit number second limit
function math:random(first_limit, second_limit) end

--- Returns the hyperbolic cosine of the supplied value.
---@param value number value
function math:cosh(value) end

--- Returns the values of m and exp in the expression x = m * 2 ^ exp, where x is the value supplied to the function. exp is an integer and the absolute value of the mantissa m is in the range 0.5 - 1 (or zero when x is zero).
---@param x_value number x value
function math:frexp(x_value) end

--- Returns the hyperbolic tangent of the supplied value.
---@param value number value
function math:tanh(value) end

--- Returns the largest integer that is smaller than or equal to the supplied value.
---@param value number value
function math:floor(value) end

--- 
function math:insert() end

--- Returns the maximum numeric value amongst the arguments given.
---@vararg any
function math:max(values) end

--- Returns the square root of the supplied value.
---@param value number value
function math:sqrt(value) end

--- 
function math:find() end

--- 
function math:tonumber() end

--- 
function math:maxn() end

--- 
function math:len_lua() end

--- 
function math:concat() end

--- 
function math:reverse() end

--- 
function math:byte() end

--- 
function math:indexed_to_lookup() end

--- Sets the supplied value as the seed for the random number system.
---@param seed number seed
function math:randomseed(seed) end

--- 
function math:is_empty() end

--- Converts the supplied angle in degrees into an angle in radians. See also math.deg.
---@param degree_value number degree value
function math:rad(degree_value) end

--- Returns the first supplied number value to the power of the second supplied number value.
---@param x number x
---@param y number y
function math:pow(x, y) end

--- Scales a supplied value to between supplied minimum and maximum values.
---@param value number value
---@param minimum number minimum
---@param maximum number maximum
function math:normalize(value, minimum, maximum) end

--- Returns the arc cosine of the supplied value, in radians. The supplied value should be between -1 and 1.
---@param value number value
function math:acos(value) end

--- Returns the integral part of the supplied value and the fractional part of the supplied value.
---@param input_value number input value
function math:modf(input_value) end

--- Returns the minimum numeric value amongst the arguments given.
---@vararg any
function math:min(values) end

--- Returns m * 2 ^ exp, where the mantissa m and exponent exp are values supplied to the function. exp should be an integer value.
---@param m number m
---@param exp number exp
function math:ldexp(m, exp) end

--- 
function math:match() end

--- 
function math:find_lua() end

--- Returns the numerical constant e to the power of the supplied value. Supply a value of 1 to just return e.
---@param exponent number exponent
function math:exp(exponent) end

--- 
function math:sort() end

--- Returns the tangent of the supplied radian value.
---@param value number value
function math:tan(value) end

--- Returns the cosine of the supplied radian value.
---@param value number value
function math:cos(value) end

--- Returns the smallest integer that is larger than or equal to the supplied value.
---@param value number value
function math:ceil(value) end

--- Returns the arc tangent of the supplied value, in radians.
---@param value number value
function math:atan(value) end

--- 
function math:lower() end

--- 
function math:sub() end

--- 
function math:type() end

--- 
function math:sub_lua() end

--- 
function math:mem_address() end

--- Returns the absolute of the supplied value, converting it to a positive value if negative.
---@param value number value
function math:abs(value) end

--- 
function math:copy() end

--- Returns the hyperbolic sine of the supplied value.
---@param value number value
function math:sinh(value) end

--- Returns the arc sine of the supplied value, in radians. The supplied value should be between -1 and 1.
---@param value number value
function math:asin(value) end

--- 
function math:loadstring() end

--- 
function math:dump() end

--- Returns remainder of the division of the first supplied value by the second supplied value.
---@param dividend number dividend
---@param divisor number divisor
function math:fmod(dividend, divisor) end

--- 
function math:ends_with() end

--- 
function math:len() end

--- 
function math:contains() end

--- Returns the sine of the supplied radian value.
---@param value number value
function math:sin(value) end

--- 
function math:rep() end
