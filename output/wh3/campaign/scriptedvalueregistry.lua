
---@class scriptedvalueregistry
local scriptedvalueregistry = {}

--- Saves a timestamp with the supplied string name into the registry. This can later be looked up with ScriptedValueRegistry:CompareRegistryTimestamp which returns the elapsed time in seconds from when the value was saved to when it was later compared.
---@param timestamp_name string timestamp name
function scriptedvalueregistry:SaveRegistryTimestamp(timestamp_name) end

--- Saves a string value with a string name into the scripted value registry.
---@param value_name string value name
---@param value string value
function scriptedvalueregistry:SaveString(value_name, value) end

--- Saves a string value with a string name into the operating system registry.
---@param value_name string value name
---@param value string value
function scriptedvalueregistry:SaveRegistryString(value_name, value) end

--- Returns a persistent boolean value corresponding to a supplied string name from the scripted value registry. If no persistent value with the supplied name is found then false is returned.
---@param value_name string value name
function scriptedvalueregistry:LoadPersistentBool(value_name) end

--- Looks up a timestamp saved into the registry with the supplied name, and returns the elapsed time in seconds since that timestamp was last made. This includes time when the game was not running. If no timestamp with the supplied name has previously been saved then -1 is returned.<br />
--- Timestamps can be saved by calling ScriptedValueRegistry:SaveRegistryTimestamp.
---@param timestamp_name string timestamp name
function scriptedvalueregistry:CompareRegistryTimestamp(timestamp_name) end

--- Returns a string value corresponding to a supplied string name from the scripted value registry. If no value with the supplied name is found then an empty string is returned.
---@param value_name string value name
function scriptedvalueregistry:LoadString(value_name) end

--- Returns a persistent string value corresponding to a supplied string name from the scripted value registry. If no persistent value with the supplied name is found then an empty string is returned.
---@param value_name string value name
function scriptedvalueregistry:LoadPersistentString(value_name) end

--- Saves a persistent boolean value with a string name into the scripted value registry. Persistent values are not cleared between game environments.
---@param value_name string value name
---@param value boolean value
function scriptedvalueregistry:SavePersistentBool(value_name, value) end

--- Returns a string value corresponding to a supplied string name from the operating system registry. If no value with the supplied name is found then a blank string is returned.
---@param value_name string value name
function scriptedvalueregistry:LoadRegistryString(value_name) end

--- Returns a boolean value corresponding to a supplied string name from the operating system registry. If no value with the supplied name is found then false is returned.
---@param value_name string value name
function scriptedvalueregistry:LoadRegistryBool(value_name) end

--- Saves a persistent string value with a string name into the scripted value registry. Persistent values are not cleared between game environments.
---@param value_name string value name
---@param value string value
function scriptedvalueregistry:SavePersistentString(value_name, value) end

--- Saves a boolean value with a string name into the operating system registry.
---@param value_name string value name
---@param value boolean value
function scriptedvalueregistry:SaveRegistryBool(value_name, value) end

--- Returns a boolean value corresponding to a supplied string name from the scripted value registry. If no value with the supplied name is found then false is returned.
---@param value_name string value name
function scriptedvalueregistry:LoadBool(value_name) end

--- Saves a boolean value with a string name into the scripted value registry.
---@param value_name string value name
---@param value boolean value
function scriptedvalueregistry:SaveBool(value_name, value) end

--- Creates and returns a handle to the scripted value registry.
function scriptedvalueregistry:new() end
