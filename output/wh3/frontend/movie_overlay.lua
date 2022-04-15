
---@class windowed_movie_player
local windowed_movie_player = {}

--- 
function windowed_movie_player:set_skip_animation() end

--- Sets a callback to call when the windowed movie player is fully hidden after being closed. The supplied callback is triggered immediately prior to the panel being destroyed.
---@param callback function callback
function windowed_movie_player:set_panel_hidden_callback(callback) end

--- 
function windowed_movie_player:set_top_left_mask_image() end

--- Sets an animation to play on the panel when it is showed. By default no animation is triggered. The animation must be present on the panel uicomponent.
---@param animation_name string animation name
function windowed_movie_player:set_show_animation(animation_name) end

--- 
function windowed_movie_player:set_end_callback() end

--- 
function windowed_movie_player:set_centre_mask_image() end

--- 
function windowed_movie_player:set_freeze_game_rendering() end

--- 
function windowed_movie_player:set_steal_user_input() end

--- 
function windowed_movie_player:force_movie_track() end

--- Sets an animation to play on the panel when it is hidden. By default, an animation called "hide" is triggered. The animation must be present on the panel uicomponent.
---@param animation_name string animation name
function windowed_movie_player:set_hide_animation(animation_name) end

--- Sets a special flag which adjusts the horizontal movement of the hide animation to match the panel width, so the animation moves the panel fully off-screen regardless of width.
---@param hide_animation_slides_left boolean hide animation slides left
function windowed_movie_player:set_hide_animation_slides_off_screen_left(hide_animation_slides_left) end

--- Creates and returns a new windowed movie player object, set up to play underneath the advisor. This sets the advisor_movie_docker uicomponent to be the panel parent, and also calls windowed_movie_player:set_hide_animation_slides_off_screen_left to set custom hide animation behaviour that is appropriate for this display mode.
---@param name string Unique name for this windowed movie object.
---@param movie_path string Path to movie file, starting from the Movies folder in working data. The file extension should be omitted.
---@param aspect_ratio number Movie aspect ratio. This should be the width divided by the height.
function windowed_movie_player:new_from_advisor(name, movie_path, aspect_ratio) end

--- 
function windowed_movie_player:is_playing() end

--- 
function windowed_movie_player:set_play_movie_audio() end

--- 
function windowed_movie_player:add_timestamp_callback() end

--- 
function windowed_movie_player:set_mask_image() end

--- Hides and then destroys the windowed movie player if it is showing, playing an animation to do so if one has been set. This is called internally if the close button is clicked, or if the ESC key is pressed when stolen.
function windowed_movie_player:hide() end

--- Creates and shows the panel and starts movie playback.
function windowed_movie_player:show() end

--- Sets whether the panel should steal escape key focus and therefore close itself when the ESC key is pressed. By default the panel does respond to ESC key presses, use this function to disable this behaviour.
---@param steal_esc_key_focus boolean steal esc key focus
function windowed_movie_player:set_should_steal_esc_key_focus(steal_esc_key_focus) end

--- 
function windowed_movie_player:set_skippable() end

--- Sets whether the close button is shown on the windowed movie player. By default the close button is displayed, use this function to not show it if needs be.
---@param show_close_button boolean show close button
function windowed_movie_player:set_show_close_button(show_close_button) end

--- 
function windowed_movie_player:start() end

--- Sets the panel docking point, which determines how the panel is docked to its parent uicomponent. Docking points are specified as integer values - a list is available in the Docking section of this documentation.
---@param docking_point number docking point
function windowed_movie_player:set_docking_point(docking_point) end

--- 
function windowed_movie_player:set_destroy_callback() end

--- 
function windowed_movie_player:resize() end

--- Creates and returns a new windowed movie player object. If creating a windowed movie player docked underneath the advisor, the constructor windowed_movie_player:new_from_advisor should be used instead.
---@param name string Unique name for this windowed movie object
---@param movie_path string Path to movie file, starting from the Movies folder in working data. The file extension should be omitted.
---@param aspect_ratio number Movie aspect ratio. This should be the width divided by the height.
---@param ui_root UIC Parent uicomponent, to which the windowed movie player should be attached.
function windowed_movie_player:new(name, movie_path, aspect_ratio, ui_root) end

--- 
function windowed_movie_player:set_bottom_right_mask_image() end

--- 
function windowed_movie_player:set_skip_callback() end

--- Sets the intended panel width. By default, the panel will use the panel width set in the ui layout. The height will also be scaled, based on the aspect ratio supplied to windowed_movie_player:new.
---@param panel_width_in_pixels number panel width in pixels
function windowed_movie_player:set_width(panel_width_in_pixels) end

--- 
function windowed_movie_player:set_resize_uicomponent_to_fit() end

--- 
function windowed_movie_player:move_to() end

--- Creates and returns a new windowed movie player object, set up to play in the centre of the screen.
---@param name string Unique name for this windowed movie object.
---@param movie_path string Path to movie file, starting from the Movies folder in working data. The file extension should be omitted.
---@param aspect_ratio number Movie aspect ratio. This should be the width divided by the height.
function windowed_movie_player:new_centred(name, movie_path, aspect_ratio) end

--- 
function windowed_movie_player:skip() end

--- 
function windowed_movie_player:set_style() end

--- 
function windowed_movie_player:set_bottom_left_mask_image() end

--- 
function windowed_movie_player:set_hide_on_end() end

--- Sets a callback to call if this windowed movie player is closed. The callback is triggered at the point of closure, when the panel has yet to animate off-screen.
---@param callback function callback
function windowed_movie_player:set_close_callback(callback) end

--- 
function windowed_movie_player:add_frame_callback() end

--- 
function windowed_movie_player:set_stop_game_audio() end

--- 
function windowed_movie_player:set_top_right_mask_image() end

--- 
function windowed_movie_player:set_opaque_mask_image() end

--- 
function windowed_movie_player:set_should_loop() end
