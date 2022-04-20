
---@class chapter_mission
local chapter_mission = {}

--- Creates a chapter mission object. This should happen in the root of the script somewhere, so that the object is declared and set up by the time the first tick happens so that it can be properly restarted from a savegame.
---@param chapter_number number Chapter number. All numbers from 1 to n should be accounted for, where n is the last chapter in the sequence. When a chapter mission completes it automatically starts the next chapter mission in the sequence. 
---@param faction_key string Faction key of the faction receiving the mission.
---@param mission_key string Mission key of the chapter mission.
---@param advice_key string Key of advice to deliver alongside the mission.
---@param infotext table table of string infotext keys to deliver alongside advice.
function chapter_mission:new(chapter_number, faction_key, mission_key, advice_key, infotext) end

--- returns whether the chapter mission has been issued.
function chapter_mission:has_been_issued() end

--- returns whether the chapter mission has been completed.
function chapter_mission:has_been_completed() end

--- Manually starts the chapter mission. It should only be necessary to manually start the first chapter mission in the sequence - the second will start automatically when the first is completed, and so on.
function chapter_mission:manual_start() end
