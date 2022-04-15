
---@class timer_manager
local timer_manager = {}

--- Adds a real callback to be called after the supplied interval has elapsed.
---@param callback function Callback to call.
---@param interval number Interval after which to call the callback. This should be in milliseconds, regardless of game mode.
---@param name string Callback name, by which it may be later removed with timer_manager:remove_real_callback. If omitted the callback may not be cancelled.
function timer_manager:real_callback(callback, interval, name) end

--- Adds a repeating model callback to be called each time the supplied interval elapses.
---@param callback function Callback to call.
---@param interval number Interval after which to call the callback. This should be in milliseconds in battle and in the frontend, and in seconds in campaign.
---@param name string Callback name, by which it may be later removed with timer_manager:remove_callback. If omitted the repeating callback may not be cancelled.
function timer_manager:repeat_callback(callback, interval, name) end

--- Adds a model callback to be called after the supplied interval has elapsed.
---@param callback function Callback to call.
---@param interval number Interval after which to call the callback. This should be in milliseconds in battle and in the frontend, and in seconds in campaign.
---@param name string Callback name, by which it may be later removed with timer_manager:remove_callback. If omitted the callback may not be cancelled.
function timer_manager:callback(callback, interval, name) end

--- Adds a repeating real callback to be called each time the supplied interval elapses.
---@param callback function Callback to call.
---@param interval number Repeating interval after which to call the callback. This should be in milliseconds, regardless of game mode.
---@param name string Callback name, by which it may be later removed with timer_manager:remove_real_callback. If omitted the repeating callback may not be cancelled.
function timer_manager:repeat_real_callback(callback, interval, name) end

--- Creates and returns a timer manager in frontend.
function timer_manager:new_frontend() end

--- Removes a real callback previously added with timer_manager:real_callback or timer_manager:repeat_real_callback by name. All callbacks with a name matching that supplied will be cancelled and removed.
---@param name string Name of callback to remove.
function timer_manager:remove_real_callback(name) end

--- Removes a real callback previously added with timer_manager:callback or timer_manager:repeat_callback by name. All callbacks with a name matching that supplied will be cancelled and removed.
---@param name string Name of callback to remove.
function timer_manager:remove_callback(name) end

--- Creates and returns a timer manager in campaign. This function should be supplied a game_interface, which requires that it is created when the NewSession script event is received (or later). The timer manager is automatically created by the <a href="../campaign/campaign_manager.html#class:campaign_manager">campaign_manager so there should be no need for game scripts to call this function.
---@param game_interface game_interface game interface
function timer_manager:new_campaign(game_interface) end

--- Creates and returns a timer manager in battle. This function should be supplied a <a href="../battle/battle.html#class:battle">battle game object. The timer manager is automatically created by the <a href="../battle/battle_manager.html#class:battle_manager">battle_manager so there should be no need for game scripts to call this function.
---@param battle_interface <a href="../battle/battle.html#class:battle">battle battle interface
function timer_manager:new_battle(battle_interface) end
