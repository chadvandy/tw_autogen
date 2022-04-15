
---@class frontend
local frontend = {}

--- Registers a startup movie to be played prior to the main menu being displayed. Any movie/movies registered using this command will be shown after the corporate movies.
---@param movie_key string Path/key of movie to play. This should be the path to the movie file from data/movies, minus the .ca_vp8 file extension, and an entry for the specified movie should exist in the videos table.
function frontend:register_scripted_startup_movie(movie_key) end

--- Loads the most recently saved campaign game.
---@param from_cloud boolean from cloud
function frontend:continue_campaign(from_cloud) end

--- Returns whether any singleplayer campaign save files exists.
function frontend:campaign_saves_exist() end

--- Starts a named battle specified by key from the battles table.
---@param key string key
function frontend:start_named_battle(key) end

--- Starts the specified campaign, by string key from the campaigns table. A faction key from the factions table and a political party key from political_parties table.
---@param campaign_key string campaign key
---@param faction_key string faction key
---@param political_party_key string political party key
function frontend:start_campaign(campaign_key, faction_key, political_party_key) end

--- Loads a campaign save file by name.
---@param file_path string file path
---@param from_cloud boolean from cloud
function frontend:load_campaign(file_path, from_cloud) end

--- Returns whether any multiplayer campaign save files exists.
function frontend:campaign_saves_exist_mp() end
