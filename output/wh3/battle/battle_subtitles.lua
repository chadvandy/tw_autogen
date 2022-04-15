
---@class battle_subtitles
local battle_subtitles = {}

--- Instructs the subtitle object to display some subtitle text on-screen, which can subsequently be hidden with subtitles:clear.
---@param subtitle_key string Subtitles key to display, corresponding to a record from the scripted_subtitles table.
function battle_subtitles:set_text(subtitle_key) end

--- Pushes a subtitle entry with timings to be displayed when subtitles:begin is called. The subtitle entries are pushed as plain text, meaning no localisation lookup is performed. Therefore, this function should not be called outside of development.
---@param start_time number Start time in ms after subtitles:begin is called.
---@param end_time number End time in ms after subtitles:begin is called.
---@param text string Unlocalised text to display.
function battle_subtitles:push_back_subtitle_entry(start_time, end_time, text) end

--- Sets the on-screen alignment of displayed subtitles. Valid alignment keys can be found in the Alignments section of this documentation.
---@param alignment_ string alignment 
function battle_subtitles:set_alignment(alignment_) end

--- Loads a csv file containing subtitle information. This is an old method of loading subtitles from a file.
---@param file_path string file path
function battle_subtitles:read_subtitles_file(file_path) end

--- Starts the subtitles object with an alignment - this must be called before any subtitles are set with subtitles:set_text. Alternatively, if a subtitle sequence has been preloaded then that sequence is started.
---@param alignment string Subtitles alignment on-screen. Valid alignment keys can be found in the Alignments section of this documentation.
function battle_subtitles:begin(alignment) end

--- Enables or disables the display of a second thin black border at the top of the screen when subtitles are displayed. This may be useful if subtitles are being displayed at the bottom (which they generally are), without cinematic borders (which is rare, but possible), and it's desired to have a matching black border at the top of the screen. This behaviour is disabled by default - use this function to enable it.
---@param draw_top_border boolean draw top border
function battle_subtitles:change_if_top_border_drawn(draw_top_border) end

--- Pushes a subtitle entry with timings to be displayed when subtitles:begin is called. The subtitle entries pushed should be keys for records in the scripted_subtitles table.
---@param start_time number Start time in ms after subtitles:begin is called.
---@param end_time number End time in ms after subtitles:begin is called.
---@param subtitle_key string Subtitles key to display.
function battle_subtitles:push_back_subtitle(start_time, end_time, subtitle_key) end

--- By default, a thin black horizontal border is drawn behind a subtitle when it is displayed. This function may be called to disable or re-enable this behaviour.
---@param draw_borders boolean draw borders
function battle_subtitles:change_if_borders_drawn(draw_borders) end

--- Stops the currently active sequence. After calling this function no subtitles will be shown until subtitles:begin is called.
function battle_subtitles:end_subtitles() end

--- Clears any subtitles currently being displayed or queued to be displayed. This can be used to remove subtitles displayed with subtitles:set_text, or clearing/halting a subtitle sequence that was preloaded.
function battle_subtitles:clear() end
