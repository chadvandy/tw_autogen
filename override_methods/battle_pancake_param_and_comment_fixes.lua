--- Adds a 3d ping marker model at a specified [x/y/z] position. It is sufficient just to supply the position, but a type can be used to change the model displayed - see the table below for a list of ping types.<br />
--- List of ping types:<br />
--- Type NumberType Name
--- 0MPT_NONE
--- 1MPT_STANDARD
--- 2MPT_MOVE
--- 3MPT_ATTACK
--- 4MPT_DEFEND
--- 5MPT_HELP_MOUNTABLE_ARTILLERY
--- 6MPT_HELP_DISEMBARK
--- 7MPT_NOTIFICATION
--- 8MPT_SCRIPT_LOOK_AT
--- 9MPT_SCRIPT_MOVE_TO
--- 10MPT_SCRIPT_SELECT
--- 11MPT_SCRIPT_POINTER
--- 12MPT_SCRIPT_LOOK_AT_VFX
--- 13MPT_SCRIPT_MOVE_TO_VFX
--- 14MPT_SCRIPT_SELECT_VFX
--- 15MPT_SCRIPT_OBJECTIVE
--- 16MPT_SCRIPT_BATTLE_TRAP
--- The waypoint flag can be used to link models together. The rotation flag can be used to specify a rotation for the model - the default is to just fade the camera.
---@param x number X co-ordinate in metres.
---@param y number Y co-ordinate (altitude) in metres. This parameter specifies the height above the water plane, so if mis-set the marker can appear under the ground.
---@param z number Z co-ordinate in metres.
---@param type number Marker type - see list of valid marker types above.
---@param is_waypoint boolean Is waypoint.
---@param rotation number Rotation.
function battle:add_ping_icon(x, y, z, type, is_waypoint, rotation) end

--- Returns the first commanding battle_unit found in the supplied units collection. Supported collection types are battle_units, battle_army and script_units. If no commanding unit is found then false is returned.
---@param unit_collection battle_units|battle_army|script_units Unit collection object.
---@return battle_unit commanding_unit
function battle_manager:get_general(unit_collection) end

--- Establishes a new watch. A supplied condition function is repeated tested and, when it returns true, a supplied target function is called. A wait period between the condition being met and the target being called must also be specified. A name for the watch may optionally be specified to allow other scripts to cancel it.<br />
--- The condition must be a function that returns a value - when that value is true (or evaluates to true) then the watch condition is met. The watch then waits the supplied time offset, which is specified in ms as the second parameter, before calling the callback supplied in the third parameter.
---@param condition function Condition. Must be a function that returns a value. When the returned value is true, or evaluates to true, then the watch condition is met.
---@param wait_time number Time in ms that the watch waits once the condition is met before triggering the target callback
---@param target_callback function Target callback
---@param watch_name string Name for this watch process. Giving a watch a name allows it to be stopped/cancelled with battle_manager:remove_process.
function battle_manager:watch(condition, wait_time, target_callback, watch_name) end

--- Enqueues a line of advice for delivery to the player. If there is no other advice playing, or nothing is blocking the advisor system, then the advice gets delivered immediately. Otherwise, the supplied advice will be queued and shown at an appropriate time.<br />
--- The function must be supplied an advice key from the advice_levels/advice_threads tables as its first parameter, unless the advisor entry is set to be debug (see below).
---@param advice_key string If the advice entry is set to be debug (see third parameter) the text supplied here will instead be shown directly in the advisor window (debug only)
---@param forced_duration number Forced duration in ms. This is a period that this advice must play for before another item of advice is allowed to start. By default, items of advice will only remain queued while the active advice is actually audibly playing, but by setting a duration the active advice can be held on-screen for longer than the length of its associated soundfile (unless it is closed by the player). This is useful during development to hold advice on-screen when no soundfile yet exists, and also for tutorial scripts which often wish to ensure that an item of advice is shown on-screen for a certain duration.
---@param debug boolean Sets whether the advice line is debug. If set to true, the text supplied as the first parameter is displayed in the advisor window as-is, without using it as a lookup key in the advice_levels table.
---@param start_callback function Start callback. If a function is supplied here it is called when the advice is actually played.
---@param start_callback_wait number Start callback wait period in ms. If a duration is specified it causes a delay between the advice being played and the start callback being called.
---@param condition function Playback condition. If specified, it compels the advisor system to check this condition immediately before playing the advisor entry to decide whether to actually proceed. This must be supplied as a function block that returns a result. If this result evaluates to true, the advice is played.
function battle_manager:queue_advisor(advice_key, forced_duration, debug, start_callback, start_callback_wait, condition) end