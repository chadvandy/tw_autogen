--- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT MANUALLY.

---@class scriptedvalueregistry
local scriptedvalueregistry = {}

--- Creates and returns a handle to the scripted value registry.
---@return scriptedvalueregistry #svr 
function scriptedvalueregistry:new() end

--- Saves a boolean value with a string name into the scripted value registry.
---@param value_name string #value name
---@param value boolean #value
function scriptedvalueregistry:SaveBool(value_name, value) end

--- Returns a boolean value that was previously stored with ScriptedValueRegistry:SaveBool, by name. If no value with the supplied name is found then false is returned.
---@param value_name string #value name
---@return boolean #value 
function scriptedvalueregistry:LoadBool(value_name) end

--- Saves a string value with a string name into the scripted value registry.
---@param value_name string #value name
---@param value string #value
function scriptedvalueregistry:SaveString(value_name, value) end

--- Returns a string value previously stored with ScriptedValueRegistry:SaveString, by name. If no value with the supplied name is found then an empty string is returned.
---@param value_name string #value name
---@return string #value 
function scriptedvalueregistry:LoadString(value_name) end

--- Saves a boolean value with a string name into the persistent registry.
---@param value_name string #value name
---@param value boolean #value
function scriptedvalueregistry:SavePersistentBool(value_name, value) end

--- Returns a persistent boolean value previously stored with ScriptedValueRegistry:SavePersistentBool, by name. If no persistent value with the supplied name is found then false is returned.
---@param value_name string #value name
---@return boolean #value 
function scriptedvalueregistry:LoadPersistentBool(value_name) end

--- Saves a string value with a string name into the persistent registry.
---@param value_name string #value name
---@param value string #value
function scriptedvalueregistry:SavePersistentString(value_name, value) end

--- Returns a persistent string value previously stored with ScriptedValueRegistry:SavePersistentString, by name. If no persistent value with the supplied name is found then an empty string is returned.
---@param value_name string #value name
---@return string #value 
function scriptedvalueregistry:LoadPersistentString(value_name) end

--- Saves a boolean value with a string name into the operating system registry.
---@param value_name string #value name
---@param value boolean #value
function scriptedvalueregistry:SaveRegistryBool(value_name, value) end

--- Returns a boolean value previously stored with ScriptedValueRegistry:SaveRegistryBool, by name. If no persistent value with the supplied name is found then false is returned.
---@param value_name string #value name
---@return boolean #value 
function scriptedvalueregistry:LoadRegistryBool(value_name) end
