--- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT MANUALLY.

---@class cinematics
local cinematics = {}

--- Preload the assets related to a cindy file, so there is no visible stutter when it is actually played.
---@param path string #cindy xml path, from the data/ folder.
function cinematics:cindy_preload(path) end

--- Starts playback of a cindy scene.
---@param filepath string #File path to cindy scene, from the working data folder.
---@param blend_in_duration number? #optional, default value=nil Time in seconds over which the camera will blend into the cindy scene when started.
---@param blend_out_duration number? #optional, default value=nil Time in seconds over which the camera will blend out of the cindy scene when it ends.
function cinematics:cindy_playback(filepath, blend_in_duration, blend_out_duration) end

--- Stops any running cindy scene started with cinematics:cindy_playback.
---@param clear_scenes boolean? #optional, default value=false Clear animated scenes.
function cinematics:stop_cindy_playback(clear_scenes) end

--- Starts a cindy scene with no camera track.
---@param path string #cindy xml path, from the data/ folder.
---@param clear_scenes_on_completion boolean #Clear animated scenes on completion.
---@param save_into_replay boolean? #optional, default value=true Save into replay.
function cinematics:cindy_playback_no_camera(path, clear_scenes_on_completion, save_into_replay) end

--- Stops any running cindy scene started with cinematics:cindy_playback_no_camera.
---@param clear_scenes boolean? #optional, default value=false Clear animated scenes.
function cinematics:stop_cindy_playback_no_camera(clear_scenes) end
