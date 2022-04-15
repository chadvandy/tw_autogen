
---@class unique_table
local unique_table = {}

--- Adds a new item into the unique table, but only if that item does not already exist
---@param item any The item to add to the table
function unique_table:insert(item) end

--- Returns the index of the given item in the table, or 0 if it doesn't exist
---@param item any The item to check
function unique_table:index_of(item) end

--- Returns the unique table object as a normal table
function unique_table:to_table() end

--- Removes the given item from the table
---@param item any The item to remove from the table
function unique_table:remove(item) end

--- Returns a new unique table containing the items from the given region list
---@param region_list any The region list to use
function unique_table:region_list_to_unique_table(region_list) end

--- Returns a new unique table containing the items from the given character list
---@param character_list any The character list to use
function unique_table:character_list_to_unique_table(character_list) end

--- Returns a new unique table containing the items from the given faction list
---@param faction_list any The faction list to use
---@param cqi_list boolean Pass true to make the table use cqi's instead of faction objects
function unique_table:faction_list_to_unique_table(faction_list, cqi_list) end

--- Returns true if the given item exists in the table
---@param item any The item to check
function unique_table:contains(item) end

--- Returns the table as a new unique table object
function unique_table:table_to_unique_table() end

--- Creates a new unique table object
---@param o table Pass an object to the new function to use that instance of the object as this new one
function unique_table:new(o) end
