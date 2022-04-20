
---@class battle_sound_effect
local battle_sound_effect = {}

--- Creates a new battle_sound_effect object.
function battle_sound_effect:new() end

--- Associates a specified sound event with this battle_sound_effect object. Sound events are created in the sound system editor - see the audio team for more information.
---@param sound_event_name string sound event name
function battle_sound_effect:load(sound_event_name) end

--- Instructs the sound effect to play as unit voiceover, coming from the position of the unit.
---@param unit battle_unit unit
function battle_sound_effect:playVO(unit) end

--- Stops the sound effect if it's currently playing.
function battle_sound_effect:stop() end

--- Returns whether the sound effect is currently playing or not.
function battle_sound_effect:is_playing() end

--- Returns whether the sound effect is currently valid. An invalid sound effect is one that hasn't had a valid sound event associated with it with battle_sound_effect:load.
function battle_sound_effect:is_valid() end
