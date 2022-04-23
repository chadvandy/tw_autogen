--- Directly applies a diplomatic bonus or penalty between two factions, as if it had come from a dilemma. The bonus should be an integer between -6 and +6, each integer value of which corresponds to a change type (from PENALTY_XXXLARGE (-6) to BONUS_XXXLARGE (+6)) which carries a diplomatic attitude modifier that is actually applied.
---@param faction_a_key string First faction key.
---@param faction_b_key string Second faction key.
---@param bonus_value number Bonus value (-6 to +6).
function episodic_scripting:apply_dilemma_diplomatic_bonus(faction_a_key, faction_b_key, bonus_value) end

--- Adds a composite scene at a specified logical position.
---@param name string Unique name for this composite scene, by which it may later be removed with cm:remove_scripted_composite_scene.
---@param composite_scene string Composite scene key from the campaign_composite_scenes table.
---@param x number Logical x co-ordinate.
---@param y number Logical y co-ordinate.
---@param facing_x number Logical x co-ordinate of a position this composite scene faces.
---@param facing_y number Logical y co-ordinate of a position this composite scene faces.
---@param one_shot boolean One shot - if set to true, this composite scene is not added to the internal list of scenes and can't later be removed with cm:remove_scripted_composite_scene. However, the name of one-shot scenes does not have to be unique.
---@param show_in_seen_shroud boolean Sets whether this composite scene should be drawn when in thin shroud over previously-seen terrain.
---@param show_in_unseen_shroud boolean Sets whether this composite scene should be drawn when in thick shroud over unseen terrain.
---@param faction FACTION_SCRIPT_INTERFACE Faction this composite scene is visible to. Defaults to all factions if not set.
function episodic_scripting:add_scripted_composite_scene_to_logical_position(name, composite_scene, x, y, facing_x, facing_y, one_shot, show_in_seen_shroud, show_in_unseen_shroud, faction) end

--- Register a time trigger, in seconds. This will cause a TimeTrigger event to trigger after the specified interval.
---@param id string ID for this time trigger. This will be supplied with the TimeTrigger event when it is triggered.
---@param interval number Interval after which to trigger the TimeTrigger event, in seconds.
---@param do_repeat boolean Repeats the time trigger if set to true.
function episodic_scripting:add_time_trigger(id, interval, do_repeat) end

---@return PROVINCE_SCRIPT_INTERFACE
function GovernorAssignedCharacterEvent:province() end

---@return REGION_SCRIPT_INTERFACE
function GovernorAssignedCharacterEvent:region() end