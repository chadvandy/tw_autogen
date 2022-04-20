
---@class battle_camera
local battle_camera = {}

--- Returns whether an ambush controller is currently executing. This will return true in an ambush battle, prior to the ambushing army launching their attack.
function battle_camera:is_ambush_controller_executing() end

--- Sets whether the player can skip the ambush intro with the ESC key. By default this is disabled, but it may be desirable to enable this in certain scripted circumstances.
---@param user_can_skip boolean user can skip
function battle_camera:allow_user_to_skip_ambush_intro(user_can_skip) end

--- Sets whether the ambush defender is teleported to the end of their movement path when the ambush intro is skipped. By default this is disabled, but it may be desirable to enable this in certain scripted circumstances.
---@param teleport_defender boolean teleport defender
function battle_camera:teleport_defender_when_ambush_intro_skipped(teleport_defender) end

--- Plays a specified camera file. These are files that specify camera positions in a specific format. Only for use in specific circumstances.
---@param file_path string file path
---@param loop boolean loop
function battle_camera:play(file_path, loop) end

--- Stops a playing camera file that was started with camera:play.
---@param stop_instantly boolean stop instantly
function battle_camera:stop(stop_instantly) end

--- Returns whether a scripted camera started with camera:play is currently playing.
function battle_camera:is_playing() end

--- Turns the camera to face a specified battle_vector position over a specified time. A starting camera bearing, a transition mode and a target field of view may optionally be specified.
---@param target battle_vector Look-at target position.
---@param transition_time number Transition time in seconds. Supply a negative number to have the function determine an appropriate transition time.
---@param starting_angle number Starting angle. If no angle is specified the camera's current facing is used instead (this is recommended).
---@param linear_movement boolean Linear movement style. If enabled the camera will turn with a constantly velocity. If disabled the rate of camera rotation will accelerate and then decelerate.
---@param target_fov number Field of view at the end of the transition. If set to 0 the default field of view will be used, and if set to negative the current field of view will be kept.
function battle_camera:look_at(target, transition_time, starting_angle, linear_movement, target_fov) end

--- Moves the camera to a specified position, facing a specified target, over a specified time. Both positions are supplied as battle_vector objects. A starting camera bearing, a transition mode and a target field of view may optionally be specified.
---@param position battle_vector end position of camera after transition.
---@param target battle_vector Look-at target of camera after transition.
---@param transition_time number Transition time in seconds. Supply a negative number to have the function determine an appropriate transition time.
---@param linear_movement boolean Linear movement style. If enabled the camera will move with a constantly velocity. If disabled the camera will accelerate and then decelerate.
---@param target_fov number Field of view at the end of the transition. If set to 0 the default field of view will be used, and if set to negative the current field of view will be kept.
---@param use_command_queue boolean Setting this to false allows the camera to start moving when the game is paused, but the camera movement will not appear in replays. 
function battle_camera:move_to(position, target, transition_time, linear_movement, target_fov, use_command_queue) end

--- Returns the current position of the camera.
function battle_camera:position() end

--- Returns the current look-at target of the camera.
function battle_camera:target() end

--- Enables or disables some functionality of the camera.
---@param functionality string Functionality to enable - see the list of valid functionality strings given above.
---@param enable boolean Enables the functionality. Supply false to disable the the functionality instead.
---@param bypass_command_queue boolean Bypasses the command queue. If this is set to true the command is processed immediately, including when paused, but the command will not be reproduced in multiplayer or in a battle replay.
function battle_camera:enable_functionality(functionality, enable, bypass_command_queue) end

--- Changes the depth of field of the camera.
---@param transition_duration number Transition duration in seconds.
---@param focal_depth number Focus distance.
---@param focal_width number Focal length.
---@param blur_size number Blur size.
function battle_camera:change_depth_of_field(transition_duration, focal_depth, focal_width, blur_size) end

--- Fades the camera over a supplied duration from picture to black, or from black to picture.
---@param to_black boolean Fade to black. The screen will fade from picture to black if this is set to true, and from black to picture if it's set to false.
---@param transition_duration number Transition duration in seconds.
---@param bypass_command_queue boolean Bypass the command queue, initiating the fade immediately.
function battle_camera:fade(to_black, transition_duration, bypass_command_queue) end

--- Changes the minimum/maximum permitted altitude of the camera above the ground. If negative values are supplied the game default values are used.
---@param min_height number Minimum altitude in metres.
---@param max_height number Maximum altitude in metres.
function battle_camera:change_height_range(min_height, max_height) end

--- Enables camera shaking.
function battle_camera:enable_shake() end

--- Disables camera shaking.
function battle_camera:disable_shake() end

--- Enables the anchor which prevents the camera from being moved too far away from the players forces.
function battle_camera:enable_anchor_to_army() end

--- Disables the anchor which prevents the camera from being moved too far away from the players forces.
function battle_camera:disable_anchor_to_army() end
