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

--- Forces war between two factions. This wraps the cm:force_declare_war function of the same name on the underlying episodic scripting interface, but adds validation and output. This output will be shown in the Lua - Design console spool.
---@param faction_a_key string Faction A key
---@param faction_b_key string Faction B key
---@param invite_faction_a_allies boolean Invite faction A's allies to the war
---@param invite_faction_b_allies boolean Invite faction B's allies to the war
function campaign_manager:force_declare_war(faction_a_key, faction_b_key, invite_faction_a_allies, invite_faction_b_allies) end

--- Restricts or unrestricts certain types of diplomacy between factions or groups of factions. Groups of factions may be specified with the strings "all", "faction:faction_key", "subculture:subculture_key" or "culture:culture_key". A source and target faction/group of factions must be specified.<br />
--- Note that this wraps the function cm:force_diplomacy_new on the underlying episodic scripting interface.
---@param source string Source faction/factions identifier.
---@param target string Target faction/factions identifier.
---@param type string Type of diplomacy to restrict. See the documentation for the Diplomacy section for available diplomacy types.
---@param can_offer boolean Can offer - set to false to prevent the source faction(s) from being able to offer this diplomacy type to the target faction(s).
---@param can_accept boolean Can accept - set to false to prevent the target faction(s) from being able to accept this diplomacy type from the source faction(s).
---@param both_directions boolean Causes this function to apply the same restriction from target to source as from source to target.
---@param do_not_enable_payments boolean The AI code assumes that the "payments" diplomatic option is always available, and by default this function keeps payments available, even if told to restrict it. Set this flag to true to forceably restrict payments, but this may cause crashes.
function campaign_manager:force_diplomacy(source, target, type, can_offer, can_accept, both_directions, do_not_enable_payments) end

--- Spawns a specified force if a character (the subject) exists within a faction with an army. It is intended for use at the start of a campaign in a game-created callback (see campaign_manager:add_pre_first_tick_callback), in very specific circumstances.
---@param subject_faction_key string Faction key of the subject character.
---@param subject_forename_key string Forename key of the subject character from the names table using the full localisation format i.e. names_name_[key].
---@param faction_key string Faction key of the force to create.
---@param units string list of units to create force with (see documentation for campaign_manager:create_force for more information).
---@param region_key string Home region key for the created force.
---@param x number x logical target co-ordinate.
---@param y number y logical target co-ordinate.
---@param make_immortal boolean Set to true to make the created character immortal.
function campaign_manager:spawn_army_starting_character_for_faction(subject_faction_key, subject_forename_key, faction_key, units, region_key, x, y, make_immortal) end

--- Repositions a specified character (the target) for a faction at start of a campaign, but only if another character (the subject) exists in that faction and is in command of an army. Like campaign_manager:teleport_to which underpins this function it is for use at the start of a campaign in a game-created callback (see campaign_manager:add_pre_first_tick_callback). It is intended for use in very specific circumstances.<br />
--- The characters involved are specified by forename key.
---@param faction_key string Faction key of the subject and target characters.
---@param subject_forename_key string Forename key of the subject character from the names table using the full localisation format i.e. names_name_[key].
---@param forename_key string Forename key of the target character from the names table using the full localisation format i.e. names_name_[key].
---@param x number x logical target co-ordinate.
---@param y number y logical target co-ordinate.
---@return boolean  
function campaign_manager:reposition_starting_character_for_faction(faction_key, subject_forename_key, forename_key, x, y) end

--- Sets the opacity of the uicomponent. This should be specified as a number between 0 (transparent) and 255 (fully opaque). An optional flag also applies the opacity setting to all states of the uicomponent, as opposed to just the current state.
---@param opacity_value number opacity value
---@param apply_to_all_states boolean to all states
function UIC:SetOpacity(opacity_value, apply_to_all_states) end

--- Sets the opacity of this uicomponent and propagates the change to all its children. The opacity value should be specified as a number between 0 (transparent) and 255 (fully opaque). An optional flag also applies the opacity setting to all states of each uicomponent, as opposed to just the current state.
---@param opacity_value number opacity value
---@param apply_to_all_states boolean to all states
function UIC:PropagateOpacity(opacity_value, apply_to_all_states) end

--- Creates and returns a timer manager in battle. This function should be supplied a battle game object. The timer manager is automatically created by the battle_manager so there should be no need for game scripts to call this function.
---@param battle_interface battle battle interface
---@return timer_manager #timer manager 
function timer_manager:new_battle(battle_interface) end

--- Returns an indexed table of all regions or region keys adjacent to those regions held by the supplied faction. The faction may be specified by string faction key or as a FACTION_SCRIPT_INTERFACE object.<br />
--- If an optional condition function is supplied then it is called for each region with the region supplied as a single argument. In this case, the condition function must return true for the region to be included in the results.
---@param faction_specifier FACTION_SCRIPT_INTERFACE Faction specifier - this can be a faction script interface object, or a string faction key from the factions database table.
---@param regions_as_keys boolean Populate the returned table with region keys, rather than REGION_SCRIPT_INTERFACE objects.
---@return table #table of all adjacent regions 
function campaign_manager:get_regions_adjacent_to_faction(faction_specifier, regions_as_keys) end

--- Returns whether the supplied region object is adjacent to regions owned by the supplied faction. If the region is owned by the faction then false is returned.
---@param region REGION_SCRIPT_INTERFACE region
---@param faction FACTION_SCRIPT_INTERFACE region
---@return boolean #region adjacent to faction 
function campaign_manager:region_adjacent_to_faction(region, faction) end

--- Returns the unary proportion (0-1) of units in the supplied military force which are of the supplied unit class.
---@param military_force MILITARY_FORCE_SCRIPT_INTERFACE military force
---@param unit_class string unit class
---@return number #units of unit class 
function campaign_manager:proportion_of_unit_class_in_military_force(military_force, unit_class) end

--- Returns a scripted-generated object that emulates a campaign null interface.
---@return any   
function campaign_manager:null_interface() end

---@return PROVINCE_SCRIPT_INTERFACE
function GovernorAssignedCharacterEvent:province() end

---@return REGION_SCRIPT_INTERFACE
function GovernorAssignedCharacterEvent:region() end

--- Finds and returns a child of this uicomponent by string name or by numeric index. If a numeric index is supplied, the immediate child uicomponent corresponding to this number is returned. If a string name is supplied, a recursive search is made through all children/descendants of this uicomponent. The first that is found with a matching name is returned.<br />
--- If the search target was not found then nil is returned. If it was found then it is returned as a component address, which must be cast to a uicomponent script object using the UIComponent function. The find_uicomponent function provided by the script libraries does this automatically, so it's recommended to use that function in place of this function.
---@param identifier any #Search target, identified by index number or string name.
---@param assert_on_fail boolean? #optional, default value=true Assert if no matching uicomponent could be found.
---@return UIC_Address
function UIC:Find(identifier, assert_on_fail) end

--- Returns the cqi of the selected character.
---@return number #the CQI of selected character.
function campaign_ui_manager:get_char_selected_cqi() end

--- Gets the context object id for the supplied type that is stored on the component, to allow you to perform queries/commands on the context with (get_context_value/call_context_command).
---@param context_type_id string #context type id
---@return string #The Context ID.
function UIC:GetContextObjectId(context_type_id) end

--- Sets the state of the uicomponent to the specified state name.
---@param state_name string|number #state name
---@return boolean #State was successfully set 
function UIC:SetState(state_name) end

--- Adds a listener for an event. When the code triggers this event, and should the optional supplied conditional test pass, the core object will call the supplied target callback with the event context as a single argument.<br />
--- A name must be specified for the listener which may be used to cancel it at any time. Names do not have to be unique between listeners.<br />
--- The conditional test should be a function that returns a boolean value. This conditional test callback is called when the event is triggered, and the listener only goes on to trigger the supplied target callback if the conditional test returns true. Alternatively, a boolean true value may be given in place of a conditional callback, in which case the listener will always go on to call the target callback if the event is triggered.<br />
--- Once a listener has called its callback it then shuts down unless the persistent flag is set to true, in which case it may only be stopped by being cancelled by name.
---@param listener_name string #listener name
---@param event_name string #event name
---@param conditional_test function|true #Conditional test, or true to always pass
---@param target_callback function #target callback
---@param listener_persists_after_target_callback_called boolean #listener persists after target callback called
function core:add_listener(listener_name, event_name, conditional_test, target_callback, listener_persists_after_target_callback_called) end