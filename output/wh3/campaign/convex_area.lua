
---@class convex_area
local convex_area = {}

--- Returns true if any element of the supplied object or collection is in the convex area, false otherwise.<br />
---The second boolean flag, if set to true, instructs is_in_area to disregard any routing or dead units in the collection.
---@param collection any Object or collection to test. Supported object/collection types are vector, unit, scriptunit, scriptunits, units, army, armies, alliance and table.
---@param standing_only boolean Disregard routing or dead units.
function convex_area:is_in_area(collection, standing_only) end

--- Alias for not_in_area(obj, true). Returns true if any element of the supplied object or collection is NOT in the convex area, false otherwise.
---@param collection any Object or collection to test. Supported object/collection types are vector, unit, scriptunit, scriptunits, units, army, armies, alliance and table. Disregards routing or dead units.
function convex_area:standing_not_in_area(collection) end

--- Alias for is_in_area(obj, true). Returns true if any element of the supplied object or collection is in the convex area, false otherwise. Supported object/collection types are vector, unit, scriptunit, scriptunits, units, army, armies, alliance and table. Disregards routing or dead units.
---@param object_or_collection_to_test any object or collection to test
function convex_area:standing_is_in_area(object_or_collection_to_test) end

--- Retrieves the nth vector in the convex area. Returns false if no vector exists at this index.
---@param index integer index
function convex_area:item(index) end

--- Alias for standing_number_in_area(obj, true). Returns the number of elements in the target collection that fall in the convex area. 
---@param collection any Object or collection to test. Supported object types are unit, units, scriptunit, scriptunits, army, armies, alliance and table. isregards routing or dead units.
function convex_area:standing_number_in_area(collection) end

--- Returns true if any element of the supplied object or collection is NOT in the convex area, false otherwise.<br />
---The second boolean flag, if set to true, instructs not_in_area to disregard any routing or dead units in the collection.
---@param collection any Object or collection to test. Supported object/collection types are vector, unit, scriptunit, scriptunits, units, army, armies, alliance and table.
---@param standing_only boolean Disregard routing or dead units.
function convex_area:not_in_area(collection, standing_only) end

--- Returns the number of elements in the target collection that fall in the convex area.<br />
---The second boolean flag, if set to true, instructs number_in_area to disregard any routing or dead units in the collection.
---@param collection any Object or collection to test. Supported object types are unit, units, scriptunit, scriptunits, army, armies, alliance and table. 
---@param standing_only boolean Disregard routing or dead units.
function convex_area:number_in_area(collection, standing_only) end

--- Returns the number of vector positions that make up this convex area shape
function convex_area:count() end

--- Creates a convex area from a supplied table of vectors. The supplied table must contain a minimum of three vector positions, and these must describe a convex hull shape. The points must declared in a clockwise orientation around the hull shape.
---@param positions table Table of vector positions
function convex_area:new(positions) end
