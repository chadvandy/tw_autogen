
---@class movie_overlay
local movie_overlay = {}

--- Creates and returns a new movie overlay player object. 
---@param name string Unique name for this movie overlay object
---@param movie_path string Path to movie file, starting from the Movies folder in working data. The file extension should be omitted.
function movie_overlay:new(name, movie_path) end

--- Sets the position of the uicomponent by calling uicomponent:MoveTo, setting the uicomponent to be unmoveable afterwards. The uicomponent is created at this point if it doesn't already exist.<br />
--- If a movie_overlay is not configured before playback is started then the default style is applied using movie_overlay:set_style, setting the movie to be fullscreen.
---@param x number X screen co-ordinate in pixels.
---@param y number Y screen co-ordinate in pixels.
function movie_overlay:move_to(x, y) end

--- Resizes the uicomponent, by calling uicomponent:Resize. The uicomponent is created at this point if it doesn't already exist.<br />
--- If a movie_overlay is not configured before playback is started then the default style is applied using movie_overlay:set_style, setting the movie to be fullscreen.
---@param width number Width in pixels.
---@param height number Height in pixels.
function movie_overlay:resize(width, height) end

--- Sets whether this movie should be skippable with the ESC key. Movies are skippable by default - use this function to disable this behaviour.
---@param skippable boolean skippable
function movie_overlay:set_skippable(skippable) end

--- Sets a callback to be called when the movie ends or is skipped. If a hide animation is set, this callback gets called as the hide animation starts. To set a callback when the hide animation completes, use movie_overlay:set_destroy_callback.
---@param callback function callback
function movie_overlay:set_end_callback(callback) end

--- Sets a callback to be called when the movie is skipped. If a hide animation is set, this callback gets called as the hide animation starts, before the end callback if one has been set with movie_overlay:set_end_callback.
---@param callback function callback
function movie_overlay:set_skip_callback(callback) end

--- Sets a callback to call when the player uicomponent is destroyed. This will only get called if this movie overlay player destroys itself, not if something else destroys it.
---@param callback function callback
function movie_overlay:set_destroy_callback(callback) end

--- Sets whether the overlay should try and hide or destroy itself when it ends. Set this to false if some other process will destroy it.
---@param destroy_on_end boolean destroy on end
function movie_overlay:set_hide_on_end(destroy_on_end) end

--- Sets the movie to loop. By default, the movie plays only once.
---@param loop boolean loop
function movie_overlay:set_should_loop(loop) end

--- Sets whether the movie audio should play or not. Movie audio plays by default - use this function to disable it.
---@param play_audio boolean play audio
function movie_overlay:set_play_movie_audio(play_audio) end

--- Sets whether the game should continue to render while the movie is being played. Game rendering stops during movie playback by default - use this function to enable it.
---@param should_freeze boolean should freeze
function movie_overlay:set_freeze_game_rendering(should_freeze) end

--- Sets whether user input should be stolen by script while the movie is being played. The script establishes an ESC key listener to handle movie skipping if this is set.
---@param should_steal boolean should steal
function movie_overlay:set_steal_user_input(should_steal) end

--- Sets whether the game audio should stop playing while the movie is being played. By default game audio is stopped/disabled during movie playback - use this function to enable it.
---@param stop_audio boolean stop audio
function movie_overlay:set_stop_game_audio(stop_audio) end

--- Sets whether the uicomponent should resize itself to match the dimensions of the movie. This behaviour is disabled by default - use this function to enable it.
---@param should_freeze boolean should freeze
function movie_overlay:set_resize_uicomponent_to_fit(should_freeze) end

--- Forces the movie overlay to use a particular track. If this track is already occupied the previous video will be stopped. Supported track values are 0-3. If no movie track is forced, the system will pick track 2 or 3, depending on which is currently free.
---@param movie_track number movie track
function movie_overlay:force_movie_track(movie_track) end

--- Adds a callback to be called when the movie reaches a specified frame. The frame can be specified as a positive number or as a negative number, in which case that number of frames from the end of the movie is considered the trigger frame.
---@param callback function callback
---@param frame_number number frame number
function movie_overlay:add_frame_callback(callback, frame_number) end

--- Adds a callback to be called when the movie reaches a specified timestamp, in seconds. The time can be specified as a positive number or as a negative number, in which case the timestamp is counted backwards from the end of the movie.
---@param callback function callback
---@param timestamp number timestamp
function movie_overlay:add_timestamp_callback(callback, timestamp) end

--- Sets the uicomponent animation that should be triggered when the movie starts playing. By default an animation called "show" is triggered - use this function to set a different animation. A blank string may be supplied to play no animation as the movie starts.<br />
--- An optional animation duration in seconds may also be supplied. If set, this causes the player to set the frame time of the last frame of the animation to the supplied duration.
---@param animation_name string animation name
---@param duration_override number duration override
function movie_overlay:set_show_animation(animation_name, duration_override) end

--- Sets the uicomponent animation that should be triggered when the movie ends. This animation is played when the movie ends naturally, either because playback has finished or the specified movie duration has elapsed. It is also played if the movie is skipped and no skip animation has been set. By default this animation is called "hide" - use this function to set a different animation. A blank string may be supplied to play no animation.<br />
--- An optional animation duration in seconds may also be supplied. If set, this causes the player to set the frame time of the last frame of the animation to the supplied duration.<br />
--- Any new hide animation should also be set to destroy the overlay uicomponent on completion.
---@param animation_name string animation name
---@param duration_override number duration override
function movie_overlay:set_hide_animation(animation_name, duration_override) end

--- Sets the uicomponent that should be triggered when the movie is skipped. By default this animation is called "hide" - use this function to set a different animation. A blank string may be supplied to play no animation.<br />
--- An optional animation duration in seconds may also be supplied. If set, this causes the player to set the frame time of the last frame of the animation to the supplied duration.
---@param animation_name string animation name
---@param duration_override number duration override
function movie_overlay:set_skip_animation(animation_name, duration_override) end

--- Sets a path to a mask image for the movie overlay. This image should be in png format. The path is specified from the working data folder.<br />
--- Calling this function creates the movie player uicomponent if it has not already been created.
---@param mask_image_path string mask image path
function movie_overlay:set_mask_image(mask_image_path) end

--- Sets a mask image of ui/skins/default/mask_movie_unmasked.png. This mask image is fully opaque.
function movie_overlay:set_opaque_mask_image() end

--- Sets a mask image of ui/skins/default/mask_movie_top_left.png. This mask image is intended to be used on movies shown in the top-left corner of the screen, blending to transparent to the bottom and right.
function movie_overlay:set_top_left_mask_image() end

--- Sets a mask image of ui/skins/default/mask_movie_top_right.png. This mask image is intended to be used on movies shown in the top-right corner of the screen, blending to transparent to the bottom and left.
function movie_overlay:set_top_right_mask_image() end

--- Sets a mask image of ui/skins/default/mask_movie_bottom_left.png. This mask image is intended to be used on movies shown in the bottom-left corner of the screen, blending to transparent to the top and right.
function movie_overlay:set_bottom_left_mask_image() end

--- Sets a mask image of ui/skins/default/mask_movie_bottom_right.png. This mask image is intended to be used on movies shown in the bottom-right corner of the screen, blending to transparent to the top and left.
function movie_overlay:set_bottom_right_mask_image() end

--- Sets a mask image of ui/skins/default/mask_movie_centre.png. This mask image is intended to be used in a central position on the screen, blending to transparent along all four edges.
function movie_overlay:set_centre_mask_image() end

--- Sets a style. Currently recognised styles:Style NameDescription<br />
--- fullscreenSets the movie to be fullscreen and to block rendering update.
--- defaultThe default style sets the movie to be fullscreen.
--- 
---@param style_name string style name
function movie_overlay:set_style(style_name) end

--- Starts playback of the movie
function movie_overlay:start() end

--- Returns whether this movie is currently playing.
function movie_overlay:is_playing() end

--- Causes this movie to skip during playback. This is mainly for internal use but can be called externally.
function movie_overlay:skip() end

---@class windowed_movie_player
local windowed_movie_player = {}

--- Creates and returns a new windowed movie player object. If creating a windowed movie player docked underneath the advisor, the constructor windowed_movie_player:new_from_advisor should be used instead.
---@param name string Unique name for this windowed movie object
---@param movie_path string Path to movie file, starting from the Movies folder in working data. The file extension should be omitted.
---@param aspect_ratio number Movie aspect ratio. This should be the width divided by the height.
---@param ui_root UIC Parent uicomponent, to which the windowed movie player should be attached.
function windowed_movie_player:new(name, movie_path, aspect_ratio, ui_root) end

--- Creates and returns a new windowed movie player object, set up to play underneath the advisor. This sets the advisor_movie_docker uicomponent to be the panel parent, and also calls windowed_movie_player:set_hide_animation_slides_off_screen_left to set custom hide animation behaviour that is appropriate for this display mode.
---@param name string Unique name for this windowed movie object.
---@param movie_path string Path to movie file, starting from the Movies folder in working data. The file extension should be omitted.
---@param aspect_ratio number Movie aspect ratio. This should be the width divided by the height.
function windowed_movie_player:new_from_advisor(name, movie_path, aspect_ratio) end

--- Creates and returns a new windowed movie player object, set up to play in the centre of the screen.
---@param name string Unique name for this windowed movie object.
---@param movie_path string Path to movie file, starting from the Movies folder in working data. The file extension should be omitted.
---@param aspect_ratio number Movie aspect ratio. This should be the width divided by the height.
function windowed_movie_player:new_centred(name, movie_path, aspect_ratio) end

--- Sets the intended panel width. By default, the panel will use the panel width set in the ui layout. The height will also be scaled, based on the aspect ratio supplied to windowed_movie_player:new.
---@param panel_width_in_pixels number panel width in pixels
function windowed_movie_player:set_width(panel_width_in_pixels) end

--- Sets the panel docking point, which determines how the panel is docked to its parent uicomponent. Docking points are specified as integer values - a list is available in the Docking section of this documentation.
---@param docking_point number docking point
function windowed_movie_player:set_docking_point(docking_point) end

--- Sets an animation to play on the panel when it is showed. By default no animation is triggered. The animation must be present on the panel uicomponent.
---@param animation_name string animation name
function windowed_movie_player:set_show_animation(animation_name) end

--- Sets an animation to play on the panel when it is hidden. By default, an animation called "hide" is triggered. The animation must be present on the panel uicomponent.
---@param animation_name string animation name
function windowed_movie_player:set_hide_animation(animation_name) end

--- Sets a special flag which adjusts the horizontal movement of the hide animation to match the panel width, so the animation moves the panel fully off-screen regardless of width.
---@param hide_animation_slides_left boolean hide animation slides left
function windowed_movie_player:set_hide_animation_slides_off_screen_left(hide_animation_slides_left) end

--- Sets a callback to call if this windowed movie player is closed. The callback is triggered at the point of closure, when the panel has yet to animate off-screen.
---@param callback function callback
function windowed_movie_player:set_close_callback(callback) end

--- Sets whether the close button is shown on the windowed movie player. By default the close button is displayed, use this function to not show it if needs be.
---@param show_close_button boolean show close button
function windowed_movie_player:set_show_close_button(show_close_button) end

--- Sets a callback to call when the windowed movie player is fully hidden after being closed. The supplied callback is triggered immediately prior to the panel being destroyed.
---@param callback function callback
function windowed_movie_player:set_panel_hidden_callback(callback) end

--- Sets whether the panel should steal escape key focus and therefore close itself when the ESC key is pressed. By default the panel does respond to ESC key presses, use this function to disable this behaviour.
---@param steal_esc_key_focus boolean steal esc key focus
function windowed_movie_player:set_should_steal_esc_key_focus(steal_esc_key_focus) end

--- Creates and shows the panel and starts movie playback.
function windowed_movie_player:show() end

--- Hides and then destroys the windowed movie player if it is showing, playing an animation to do so if one has been set. This is called internally if the close button is clicked, or if the ESC key is pressed when stolen.
function windowed_movie_player:hide() end
