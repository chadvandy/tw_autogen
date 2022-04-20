
---@class cinematics
local cinematics = {}

--- Preload the assets related to a cindy file, so there is no visible stutter when it is actually played.
---@param path string cindy xml path, from the data/ folder.
function cinematics:cindy_preload(path) end

--- Starts a cindy scene.
---@param path string cindy xml path, from the data/ folder.
---@param blend_in number Blend in duration in seconds.
---@param blend_out number Blend out duration in seconds.
function cinematics:cindy_playback(path, blend_in, blend_out) end

--- Stops any running cindy scene started with cinematics:cindy_playback.
---@param clear_scenes boolean Clear animated scenes.
function cinematics:stop_cindy_playback(clear_scenes) end

--- Starts a cindy scene with no camera track.
---@param path string cindy xml path, from the data/ folder.
---@param clear_scenes_on_completion boolean Clear animated scenes on completion.
---@param save_into_replay boolean Save into replay.
function cinematics:cindy_playback_no_camera(path, clear_scenes_on_completion, save_into_replay) end

--- Stops any running cindy scene started with cinematics:cindy_playback_no_camera.
---@param clear_scenes boolean Clear animated scenes.
function cinematics:stop_cindy_playback_no_camera(clear_scenes) end
