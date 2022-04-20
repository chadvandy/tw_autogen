
---@class battle_assault_equipment
local battle_assault_equipment = {}

--- Returns the number of vehicles in the collection.
function battle_assault_equipment:vehicle_count() end

--- Returns the vehicles at the specified index value in the collection.
---@param index number index
function battle_assault_equipment:vehicle_item(index) end

---@class battle_vehicle
local battle_vehicle = {}

--- Returns the key of the vehicle type, from the battlefield_siege_vehicles table.
function battle_vehicle:vehicle_key() end

--- Returns the position of the vehicle.
function battle_vehicle:position() end
