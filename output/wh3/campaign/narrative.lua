
---@class narrative
local narrative = {}

--- Adds a callback which sets up data for the narrative system. The callback can make calls to functions such as narrative.add_playable_faction and narrative.add_data_for_faction to set up narrative override data.<br />
--- Callbacks added here will be called when narrative.start is called.
---@param callback function callback
function narrative:add_data_setup_callback(callback) end

--- Adds a playable faction, by key, to the narrative data. Calls to this function should be made within setup functions that are passed to narrative.add_data_setup_callback.<br />
--- Factions will need to be added to the narrative data with this function before any data can be added for them with narrative.add_data_for_faction.
---@param faction_key string faction key
function narrative:add_playable_faction(faction_key) end

--- Adds a data override for a faction within the narrative system. Factions must have been added with narrative.add_playable_faction before data overrides can be added for them.<br />
--- If narrative.get is later called and the faction and data keys supplied to it match a data override, then the data associated with that override is returned. This can be used to override data keys for specific factions.<br />
--- Calls to narrative.get should be made within the narrative event declarations.
---@param faction_key string faction key
---@param data_key string data key
---@param data any data
function narrative:add_data_for_faction(faction_key, data_key, data) end

--- Adds a data override for a particular data key to the narrative system. This override is for all playable factions in the campaign, rather than any specific faction.<br />
--- If narrative.get is later called and the data key supplied to it matches the campaign data override, then the data associated with that override is returned by narrative.get. Note that faction data overrides added with narrative.add_data_for_faction are checked before campaign-wide overrides.
function narrative:add_data_for_campaign() end

--- Adds a narrative event loader callback. When the narrative system is started with narrative.start, each loader function is called for each human-controlled faction in the campaign, with the faction key supplied to that function as a single argument. In a multiplayer game, each loader function will be called multiple times.
---@param loader function loader
function narrative:add_loader(loader) end

--- Adds a narrative event loader callback for a specific faction. If the subject faction is controlled by a human when the narrative system is started with narrative.start this loader function will be called with the faction key supplied as a single argument.
---@param faction_key string faction key
---@param loader function loader
function narrative:add_loader_for_faction(faction_key, loader) end

--- Adds a narrative event loader callback for a specific culture. When the narrative system is started with narrative.start, for each human-controlled faction that matches the supplied culture, this loader function will be called with the faction key supplied as a single argument.
---@param culture_key string culture key
---@param loader function loader
function narrative:add_loader_for_culture(culture_key, loader) end

--- Adds a narrative event loader callback for a specific subculture. When the narrative system is started with narrative.start, for each human-controlled faction that matches the supplied subculture, this loader function will be called with the faction key supplied as a single argument.
---@param subculture_key string subculture key
---@param loader function loader
function narrative:add_loader_for_subculture(subculture_key, loader) end

--- Calls all setup and loader functions associated with the narrative system, setting up all data.
function narrative:start() end

--- Gets a data override for the specified faction key and data key, if one exists. Faction data registered with narrative.add_data_for_faction will be checked first, then campaign data registered with narrative.add_data_for_campaign.
---@param faction_key string faction key
---@param data_key string data key
function narrative:get(faction_key, data_key) end

--- Helper function which produces header output for a narrative chain when it's loaded.
---@param chain_name string chain name
---@param faction_key string faction key
function narrative:output_chain_header(chain_name, faction_key) end

--- Helper function which produces footer output for a narrative chain when it's loaded.
function narrative:output_chain_footer() end

--- Helper function which prints output about unimplemented narrative chains.
---@param message string message
function narrative:unimplemented_output(message) end

--- Helper function which prints output about narrative improvements to do.
---@param message string message
function narrative:todo_output(message) end
