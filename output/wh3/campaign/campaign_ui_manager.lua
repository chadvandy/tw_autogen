
---@class campaign_ui_manager
local campaign_ui_manager = {}

--- Creates and returns a new campaign ui manager object, or returns an existing one if one was previously created. This function can be used interchangeably with campaign_manager:get_campaign_ui_manager.
function campaign_ui_manager:new() end

--- Returns whether a ui panel with the supplied name is currently open.
---@param panel_name string panel name
function campaign_ui_manager:is_panel_open(panel_name) end

--- Returns whether a ui panel with the supplied name that should block interventions is currently open.
---@param panel_name string panel name
function campaign_ui_manager:is_blocking_panel_open(panel_name) end

--- Returns whether an event panel is currently open.
function campaign_ui_manager:is_event_panel_open() end

--- Returns the name of a ui panel that's open, or false if no panels are open. If more than one ui panel is open then the name of one is returned at random.
function campaign_ui_manager:get_open_panel() end

--- Returns the name of a blocking panel that's open, or false if no panels are open. If more than one blocking panel is open then the name of one is returned at random.<br />
--- Blocking panels are panels that block the progress of intervention (unless they are configured to disregard this).
function campaign_ui_manager:get_open_blocking_panel() end

--- Returns the name of the first blocking panel that's open, including the events panel, or false if no panels are open. Usually only one blocking panel is open at a time but in certain circumstances (such as diplomacy) more than one may be open at a time.
function campaign_ui_manager:get_open_blocking_or_event_panel() end

--- Returns whether the supplied character is selected.
---@param character CHARACTER_SCRIPT_INTERFACE character
function campaign_ui_manager:is_char_selected(character) end

--- Returns the cqi of the selected character.
function campaign_ui_manager:get_char_selected_cqi() end

--- Returns whether a character from the supplied faction is selected.
---@param faction_name string faction name
function campaign_ui_manager:is_char_selected_from_faction(faction_name) end

--- Returns the cqi of the currently selected military force. If no military force is currently selected then false is returned.
function campaign_ui_manager:get_mf_selected_cqi() end

--- Returns the force type key of the currently selected military force. If no military force is currently selected then false is returned.
function campaign_ui_manager:get_mf_selected_type() end

--- Returns whether a settlement with the supplied key is selected.
---@param settlement_name string settlement name
function campaign_ui_manager:is_settlement_selected(settlement_name) end

--- Returns the string name of the selected settlement. If no settlement is selected a blank string is returned.
function campaign_ui_manager:get_selected_settlement() end

--- Returns the string name of the region containing the selected settlement. If no settlement is selected a blank string is returned.
function campaign_ui_manager:get_selected_settlement_region() end

--- This is a mechanism by which client scripts can notify the ui manager that a scripted sequence has started, which registers "scripted_sequence" in the panel open list. This has the effect of making the ui manager think that a fullscreen panel is open, stalling any pending interventions. Avoid using this unless you really have to, probably the only case where it's valid is in the case of script that must work in singleplayer and also multiplayer.
function campaign_ui_manager:start_scripted_sequence() end

--- Removes "scripted_sequence" from the panel open list. This must be called after campaign_ui_manager:start_scripted_sequence.
function campaign_ui_manager:stop_scripted_sequence() end

--- Activates or deactivates a suppression on a specified end-turn warning. If an end-turn warning is suppressed it is prevented from appearing. End-turn warnings are specified by a numeric enumerator. Enumerators to use may be looked up in the table below:<br />
--- warning iddescription<br />
--- 0None
--- 1Low funds
--- 2Research available
--- 4Commandment available
--- 8Character upgrade available
--- 16Settlement upgrade available
--- 32Vortex ritual available
--- 64Siege construction available
--- 128Low fightiness
--- 256Damaged building
--- 512Building available
--- 1024Office slot available
--- 2048Army ap available
--- 4096Hero ap available
--- 8192Imminent rebellion
--- 16384Garrison army ap available
---@param warning number Warning to suppress - should be a number from the table above.
---@param suppress boolean Activate suppression.
function campaign_ui_manager:suppress_end_turn_warning(warning, suppress) end

--- Returns an incremental number which can be used for matching output between tabs.
function campaign_ui_manager:get_next_output_stamp() end

--- Partially locks the ui, preventing the player from ending turn or moving armies and suppressing the events rollout. Subsequent calls to the function will increase the lock level on the ui, with calls to campaign_ui_manager:unlock_ui reducing the lock level on the ui. The ui will only unlock when the lock level is reduced back to zero.
function campaign_ui_manager:lock_ui() end

--- Attempts to unlock the ui after it has been locked with campaign_ui_manager:lock_ui. Each call to campaign_ui_manager:lock_ui increases the lock level on the ui while each call to this function reduces the lock level. The ui is only unlocked when the lock level returns to zero.
function campaign_ui_manager:unlock_ui() end

--- Enables or disables the event panel from auto-opening. Each call to disable the event panel auto-opening made with this function increases the lock level by one, and each call to enable it decreases the lock level by one. Auto-opening is only re-enabled when the lock level drops to zero. This allows multiple client scripts to suppress event panels at the same time, and only when all have relinquished their lock will event panels be allowed to auto-open again.
---@param should_enable boolean should enable
function campaign_ui_manager:enable_event_panel_auto_open(should_enable) end

--- Sets the campaign ui manager to save and restore the state of all ui overrides when the game is saved and reloaded. By default the state of these is saved - use this function to disable this.
---@param should_save boolean should save
function campaign_ui_manager:set_should_save_override_state(should_save) end

--- Enables the character selection whitelist so that it starts being enforced. After this function is called the player will be unable to select any characters that have not been added to the whitelist until the character whitelist system is disabled with campaign_ui_manager:disable_character_selection_whitelist.
function campaign_ui_manager:enable_character_selection_whitelist() end

--- Disables the character selection whitelist so that it is no longer enforced. Calling this does not clear characters from the whitelist - use campaign_ui_manager:clear_character_selection_whitelist to do this.
function campaign_ui_manager:disable_character_selection_whitelist() end

--- Adds a character to the character whitelist by cqi. The character whitelist system must be enabled with campaign_ui_manager:enable_character_selection_whitelist for this to have an effect.
---@param character_cqi number character cqi
function campaign_ui_manager:add_character_selection_whitelist(character_cqi) end

--- Removes a character from the character whitelist by cqi.
---@param character_cqi number character cqi
function campaign_ui_manager:remove_character_selection_whitelist(character_cqi) end

--- Clears all characters from the character whitelist.
function campaign_ui_manager:clear_character_selection_whitelist() end

--- Adds all characters from the specified faction to the character selection whitelist.
---@param faction_name string faction name
function campaign_ui_manager:add_all_characters_for_faction_selection_whitelist(faction_name) end

--- Enables the settlement selection whitelist so that it starts being enforced. After this function is called the player will be unable to select any settlements that have not been added to the whitelist until the settlement whitelist system is disabled with campaign_ui_manager:disable_settlement_selection_whitelist.
function campaign_ui_manager:enable_settlement_selection_whitelist() end

--- Diables the settlement selection whitelist so that it is no longer enforced. Calling this does not clear settlements from the whitelist - use campaign_ui_manager:clear_settlement_selection_whitelist to do this.
function campaign_ui_manager:disable_settlement_selection_whitelist() end

--- Adds the specified settlement to the settlement selection whitelist. The settlement name will be in the form settlement:[region_name]. The settlement whitelist system must be enabled with campaign_ui_manager:enable_settlement_selection_whitelist for this to have an effect.
---@param settlement_name string settlement name
function campaign_ui_manager:add_settlement_selection_whitelist(settlement_name) end

--- Removes the specified settlement from the settlement selection whitelist. The settlement name will be in the form settlement:[region_name].
---@param settlement_name string settlement name
function campaign_ui_manager:remove_settlement_selection_whitelist(settlement_name) end

--- Clears the settlement selection whitelist.
function campaign_ui_manager:clear_settlement_selection_whitelist() end

--- Adds all settlements belonging to the specified faction to the settlement whitelist.
---@param faction_name string faction name
function campaign_ui_manager:add_all_settlements_for_faction_selection_whitelist(faction_name) end

--- Returns the panel pulse strength constant (currently 5).
function campaign_ui_manager:get_panel_pulse_strength() end

--- Returns the button pulse strength constant (currently 10).
function campaign_ui_manager:get_button_pulse_strength() end

--- Places a highlight effect at the position of the supplied settlement. An offset position may optionally be set - sometimes it's better not to highlight a settlement's central position if a character is stood there as it's unclear what's being highlighted.<br />
--- A marker type can be supplied - recognised marker types are currently move_to, select, pointer, move_to_vfx, select_vfx (default), look_at_vfx, objective. If one of these is specified then the marker is added with the underlying add_marker command provided by the game interface. If no marker type is specified then a vfx is added with the add_vfx command instead, of type advice_settlement_marker.<br />
--- Any highlight added with this function can be removed later with campaign_ui_manager:unhighlight_settlement.
---@param settlement_name string Full settlement name. This is generally "settlement:" concatenated with the region key.
---@param marker_type string Marker type.
---@param x_offset number X offset.
---@param y_offset number Y offset.
---@param height_offset number Height offset.
function campaign_ui_manager:highlight_settlement(settlement_name, marker_type, x_offset, y_offset, height_offset) end

--- Removes a highlight effect at the position of the supplied settlement that was previously added with campaign_ui_manager:highlight_settlement.
---@param settlement_name string Full settlement name. This is generally "settlement:" concatenated with the region key.
---@param is_marker boolean Is marker. If set to true this removes a marker at the settlement - set this if a marker type was specified to campaign_ui_manager:highlight_settlement. If set to false then a vfx is removed - set this if no marker type was specified to campaign_ui_manager:highlight_settlement.
function campaign_ui_manager:unhighlight_settlement(settlement_name, is_marker) end

--- A shorthand method for highlighting or unhighlighting all settlements belonging to a specified faction. This function uses campaign_ui_manager:highlight_settlement and campaign_ui_manager:unhighlight_settlement to perform the actual highlighting and unhighlighting.
---@param faction_key string Faction key.
---@param show_highlight boolean Show highlight.
---@param marker_type string Marker type to be supplied to campaign_ui_manager:highlight_settlement or campaign_ui_manager:unhighlight_settlement - see the documentation for those functions for more information.
function campaign_ui_manager:highlight_all_settlements_for_faction(faction_key, show_highlight, marker_type) end

--- A shorthand method for highlighting or unhighlighting all settlements currently near the position of the camera. An optional condition may be supplied to filter the settlements to highlight.<br />
--- Note that the highlighting won't update if the camera is moved.
---@param show_highlight boolean Show highlight.
---@param radius number Radius in display units.
---@param condition function Filter condition. If supplied, this should be a function which accepts a settlement object as a single argument and returns a boolean result. If the boolean result evaluates to true then the settlement is highlighted. The filter is only considered when highlighting - when unhighlighting, all settlements within the radius are unhighlighted regardless of any filter.
function campaign_ui_manager:highlight_all_settlements_near_camera(show_highlight, radius, condition) end

--- Highlights a settlement, and then calls a supplied callback when that character is selected. This function uses campaign_ui_manager:highlight_settlement to perform the actual highlighting.
---@param settlement_name string Full settlement name. This is generally "settlement:" concatenated with the region key.
---@param province_name string Province name to which the settlement belongs.
---@param callback function callback
---@param x_offset number X offset.
---@param y_offset number Y offset.
function campaign_ui_manager:highlight_settlement_for_selection(settlement_name, province_name, callback, x_offset, y_offset) end

--- Unhighlights a settlement after it has been highlighted with campaign_ui_manager:highlight_settlement_for_selection. Note that client scripts do not need to call this themselves to clean up after campaign_ui_manager:highlight_settlement_for_selection has triggered - it is for cancelling a running selection listener.
---@param character_object CHARACTER_SCRIPT_INTERFACE character object
function campaign_ui_manager:unhighlight_settlement_for_selection(character_object) end

--- Places a highlight effect at the position of the supplied character. A marker type can be supplied - recognised marker types are currently move_to, select, pointer, move_to_vfx, select_vfx (default), look_at_vfx, objective. If one of these is specified then the marker is added with the underlying add_marker command provided by the game interface. If no marker type is specified then a vfx is added with the add_vfx command instead, of type advice_settlement_marker.<br />
--- Any highlight added with this function can be removed later with campaign_ui_manager:unhighlight_character.
---@param character_object CHARACTER_SCRIPT_INTERFACE character object
---@param marker_type string marker type
---@param height_offset number height offset
function campaign_ui_manager:highlight_character(character_object, marker_type, height_offset) end

--- Removes a highlight effect at the position of the supplied character that was previously added with campaign_ui_manager:highlight_character.
---@param character_object CHARACTER_SCRIPT_INTERFACE Character object.
---@param is_marker boolean Is marker. If set to true this removes a marker at the character - set this if a marker type was specified to campaign_ui_manager:highlight_character. If set to false then a vfx is removed - set this if no marker type was specified to campaign_ui_manager:highlight_character.
function campaign_ui_manager:unhighlight_character(character_object, is_marker) end

--- A shorthand method for highlighting/unhighlight all armies for a faction.
---@param faction_key string faction key
---@param should_highlight boolean should highlight
function campaign_ui_manager:highlight_all_general_characters_for_faction(faction_key, should_highlight) end

--- A shorthand method for highlighting or unhighlighting all characters currently near the position of the camera. An optional condition may be supplied to filter the characters to highlight.<br />
--- Note that the highlighting won't update if the camera is moved.
---@param show_highlight boolean Show highlight.
---@param radius number Radius in display units.
---@param condition function Filter condition. If supplied, this should be a function which accepts a character object as a single argument and returns a boolean result. If the boolean result evaluates to true then the character is highlighted. The filter is only considered when highlighting - when unhighlighting, all characters within the radius are unhighlighted regardless of any filter.
function campaign_ui_manager:highlight_all_characters_near_camera(show_highlight, radius, condition) end

--- A shorthand method for highlighting or unhighlighting all general/lord characters currently near the position of the camera. Uses campaign_ui_manager:highlight_all_characters_near_camera.
---@param show_highlight boolean Show highlight.
---@param radius number Radius in display units.
---@param condition function Filter condition. If supplied, this should be a function which accepts a character object as a single argument and returns a boolean result. If the boolean result evaluates to true then the character is highlighted. The filter is only considered when highlighting - when unhighlighting, all characters within the radius are unhighlighted regardless of any filter.
function campaign_ui_manager:highlight_all_generals_near_camera(show_highlight, radius, condition) end

--- A shorthand method for highlighting or unhighlighting all hero characters currently near the position of the camera. Uses campaign_ui_manager:highlight_all_characters_near_camera.
---@param show_highlight boolean Show highlight.
---@param radius number Radius in display units.
---@param condition function Filter condition. If supplied, this should be a function which accepts a character object as a single argument and returns a boolean result. If the boolean result evaluates to true then the character is highlighted. The filter is only considered when highlighting - when unhighlighting, all characters within the radius are unhighlighted regardless of any filter.
function campaign_ui_manager:highlight_all_heroes_near_camera(show_highlight, radius, condition) end

--- Highlights a character, and then calls a supplied callback when that character is selected. This function uses campaign_ui_manager:highlight_character to perform the actual highlighting.
---@param character_object CHARACTER_SCRIPT_INTERFACE character object
---@param callback function callback
---@param height_offset number height offset
function campaign_ui_manager:highlight_character_for_selection(character_object, callback, height_offset) end

--- Unhighlights a character after it has been highlighted with campaign_ui_manager:highlight_character_for_selection. Note that client scripts do not need to call this themselves to clean up after campaign_ui_manager:highlight_character_for_selection has triggered - it is for cancelling a running selection listener.
---@param character_object CHARACTER_SCRIPT_INTERFACE character object
function campaign_ui_manager:unhighlight_character_for_selection(character_object) end

--- Hides or shows a large amount of the campaign UI.
---@param show_ui boolean show ui
function campaign_ui_manager:display_first_turn_ui(show_ui) end

--- Hides or shows the faction buttons docker on the campaign UI, which is the panel on which the end-turn button is displayed.
---@param should_show boolean should show
function campaign_ui_manager:display_faction_buttons(should_show) end

--- Hides or shows the resources bar at the top of the campaign UI.
---@param should_show boolean should show
function campaign_ui_manager:display_resources_bar(should_show) end

--- Returns the number of unit cards currently queued for recruitment on the army panel.
function campaign_ui_manager:num_queued_unit_cards_visible() end

--- Sets up an interaction monitor. If the supplied key is not already present in the advice history then a listener is established for the supplied event and condition. Should the event be triggered and the condition met, then the key is set in the advice history.
---@param key string Interaction monitor key.
---@param event_name string Event name to listen for.
---@param condition function Conditional test. This can either be a function that takes the event context as a single arguments and returns a boolean result, or just the value true to always match when the event is triggered (which is the default value).
function campaign_ui_manager:add_interaction_monitor(key, event_name, condition) end

--- Sets up an on-click interaction monitor. This sets up an interaction monitor with campaign_ui_manager:add_interaction_monitor for the ComponentLClickUp event.
---@param key string Interaction monitor key.
---@param condition function Conditional test. This can either be a function that takes the event context as a single arguments and returns a boolean result, or just the value true to always match when the event is triggered (which is the default value).
function campaign_ui_manager:add_click_interaction_monitor(key, condition) end

--- Sets up a panel-closing interaction monitor. This sets up an interaction monitor with campaign_ui_manager:add_interaction_monitor for the PanelClosedCampaign event.
---@param key string Interaction monitor key.
---@param condition function Conditional test. This can either be a function that takes the event context as a single arguments and returns a boolean result, or just the value true to always match when the event is triggered (which is the default value).
function campaign_ui_manager:add_campaign_panel_closed_interaction_monitor(key, condition) end

--- Gets the state of a supplied interaction monitor. If the monitor has ever been triggered then true is returned, otherwise false is returned instead.
---@param key string Interaction monitor key.
function campaign_ui_manager:get_interaction_monitor_state(key) end

--- Increases the lock level on the diplomacy_audio ui override, locking it if the level is moving from 0 to 1.
function campaign_ui_manager:lock_diplomacy_audio() end

--- Decreases the lock level on the diplomacy_audio ui override, unlocking it if the level is moving from 1 to 0.
function campaign_ui_manager:unlock_diplomacy_audio() end

--- Unhighlights any component that's been highlighted by the tooltip system using one of the other functions in this section.
---@param force_unhighlight boolean Force unhighlight, even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:unhighlight_all_for_tooltips(force_unhighlight) end

--- Pulse a uicomponent, caching shader values at the same time. An entry to unhighlight the uicomponent and restore its shader values is automatically added to the unhighlight action list. This function can be used to set up a highlight on a uicomponent when the standard highlight/unhlight behaviour inadvertently clears active shaders on the uicomponent being highlighted. It is not generally necessary to call this function.
---@param uicomponent UIC uicomponent
---@param pulse_strength number pulse strength
function campaign_ui_manager:pulse_and_unpulse_uicomponent(uicomponent, pulse_strength) end

--- Highlights the advice history buttons. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_advice_history_buttons(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the advisor button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_advisor_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the advisor. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_advisor(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the ancillaries on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_ancillaries(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights armies near the camera, optionally for a target faction. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param faction_key string Target faction key. Can be omitted to highlight armies for all factions.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_armies(show_highlight, faction_key, pulse_strength_override, force_highlight) end

--- Highlights armies at sea near the camera, optionally for a target faction. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param faction_key string Target faction key. Can be omitted to highlight armies for all factions.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_armies_at_sea(show_highlight, faction_key, pulse_strength_override, force_highlight) end

--- Highlights the army panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_army_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the unit cards on the army panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_army_panel_unit_cards(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the autoresolve button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_autoresolve_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the balance of power bar. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_balance_of_power_bar(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights banners and marks. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_banners_and_marks(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the blessed spawnings button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_blessed_spawnings_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights blood kiss indicator. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_blood_kiss(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the bloodletting bar. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_bloodletting(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the bloodlines button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_bloodlines_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the bloodlines panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_bloodlines_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the book of grudges bar. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_book_of_grudges_bar(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights book of nagash. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_books_of_nagash(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the books of nagash button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_books_of_nagash_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the books of nagash panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_books_of_nagash_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the building browser button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_building_browser_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the building browser. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_building_browser(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights building browser buildings. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_building_browser_buildings(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the building panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_building_panel(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the building panel tab on the army panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_building_panel_tab(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights buildings on the army panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param first_settlement_only boolean Only highlight buildings for the first settlement on the army panel.
---@param all_but_first_settlement boolean Highlight buildings for all but the first settlement on the army panel.
function campaign_ui_manager:highlight_buildings(show_highlight, pulse_strength_override, force_highlight, first_settlement_only, all_but_first_settlement) end

--- Highlights canopic jars. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_canopic_jars(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the available skill points indicator on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_character_available_skill_points(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the character details subpanel on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_character_details(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the character details button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_character_details_button(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_character_details_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the abilities details on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_character_details_panel_abilities(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the details tab button on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_character_details_panel_details_button(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the character stats on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_character_details_panel_character_stats(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the traits and effects for a character on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_character_details_panel_details_traits_and_effects(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the quests tab button on the character details panel. Best practice is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_character_details_panel_quests_button(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the character rank indicator on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_character_details_panel_rank_indicator(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the skills tab button on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_character_details_panel_skills_button(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the character info panel that appears when a character is selected. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_character_info_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights magic items on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_character_magic_items(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the character skills subpanel on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_character_skills(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the character skills button on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_character_skills_button(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the character traits on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_character_traits(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the chivalry bar. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_chivalry(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights commandments. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_commandments(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights corruption. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_corruption(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights diplomacy attitude icons on the diplomacy screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_diplomacy_attitude_icons(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the diplomacy button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_diplomacy_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the centre panel on the diplomacy screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_diplomacy_centre_panel(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the left panel on the diplomacy screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_diplomacy_left_panel(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the right panel on the diplomacy screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_diplomacy_right_panel(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights just the diplomacy screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_diplomacy_screen(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the drop-down list buttons. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_drop_down_list_buttons(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights dynasties. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_dynasties(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the dynasties panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_dynasties_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the end-turn button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_end_turn_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the events drop-down list. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_events_list(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the factions drop-down list. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_factions_list(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the factions summary button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_faction_summary_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the records tab on the faction screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_faction_summary_records_tab(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the faction summary screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_faction_summary_screen(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the summary tab on the faction screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_faction_summary_summary_tab(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the statistics tab on the faction screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_faction_summary_statistics_tab(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the fightiness bar. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_fightiness_bar(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the fleet office button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_fleet_office_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the fleet office panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_fleet_office_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the food indicator on the top bar of the campaign interface. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_food(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the food bar. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_food_bar(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the forces drop-down list. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_forces_list(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the forging magic items button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_forging_magic_items_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the forging magic items panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_forging_magic_items_panel(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights garrison army unit cards on the army panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_garrison_armies(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the garrison details button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_garrison_details_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the geomantic web button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_geomantic_web_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the global recruitment pool on the recruitment panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_global_recruitment_pool(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the gods bar. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_gods_bar(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the growth section of the province info panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_growth(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the grudges bar. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_grudges_bar(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the grudges button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_grudges_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the help pages button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_help_pages_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights any visible heroes on the campaign map. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param faction_key string Target faction key. Can be omitted to highlight armies for all factions.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_heroes(show_highlight, faction_key, pulse_strength_override, force_highlight) end

--- Highlights the hero deployment button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_hero_deployment_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the hero recruitment panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_hero_recruitment_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the hero recruitment panel tab buttons. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_hero_recruitment_panel_tab_buttons(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights horde growth. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_horde_growth(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights horde buildings. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_horde_buildings(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the infamy indicator. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_infamy(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the influence indicator on the top bar of the campaign interface. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_influence(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the interventions button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_interventions(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the intrigue at the court button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_intrigue_at_the_court_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the intrigue at the court panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_intrigue_at_the_court_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Legendary Knight button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_legendary_knight_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the events list button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_list_button_events(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the factions list button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_list_button_factions(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the forces list button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_list_button_forces(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the missions list button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_list_button_missions(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the provinces list button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_list_button_provinces(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the local recruitment pool on the recruitment panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_local_recruitment_pool(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights lords on the pre-battle screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_lords(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights lords on the pre-battle screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param reinforcements_only boolean Only highlights reinforcement lords.
function campaign_ui_manager:highlight_lords_pre_battle_screen(show_highlight, pulse_strength_override, force_highlight, reinforcements_only) end

--- Highlights the missions list. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_missions_list(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the monstrous arcanum button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_monstrous_arcanum_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the mortuary cult button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_mortuary_cult_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the mortuary cult panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_mortuary_cult_panel(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the movement range indicator on the character info panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_movement_range(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights oathgold indicator. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_oathgold(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the objectives button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_objectives_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the objectives panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_objectives_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the chapter missions tab on the objectives panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_objectives_panel_chapter_missions(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the victory conditions tab on the objectives panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_objectives_panel_victory_conditions(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the offices panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_offices(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the offices button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_offices_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights peasants. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_peasants(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the per-turn income indicator. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_per_turn_income(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Pieces of Eight button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_pieces_of_eight_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the pieces of eight panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_pieces_of_eight_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights any visible port settlements with pirate coves. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param faction_key string Target faction key. Can be omitted to highlight armies for all factions.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_pirate_coves(show_highlight, faction_key, pulse_strength_override, force_highlight) end

--- Highlights any visible port settlements. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param faction_key string Target faction key. Can be omitted to highlight ports for all factions.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_ports(show_highlight, faction_key, pulse_strength_override, force_highlight) end

--- Highlights post battle option buttons. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_post_battle_options(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights post battle option buttons for clicking. This function works differently to other functions in this section as it highlights the post-battle options with a square highlight indicating that they should be clicked on. It also waits until the post_battle_panel is in position before activating the highlight.<br />
--- Unlike other functions in this section this highlight should be disabled by calling this function again with false as a single argument.
---@param show_highlight boolean show highlight
function campaign_ui_manager:highlight_post_battle_options_for_click(show_highlight) end

--- Highlights the post battle panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_post_battle_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights unit cards on the post battle panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param unit_types_only boolean Only highlights the unit type indicator on each card instead of the whole card.
---@param unit_experience_only boolean Only highlights the unit experience indicator on each card instead of the whole card.
---@param unit_banners_only boolean Only highlights unit banners on each card instead of the whole card.
function campaign_ui_manager:highlight_post_battle_panel_unit_cards(show_highlight, pulse_strength_override, force_highlight, unit_types_only, unit_experience_only, unit_banners_only) end

--- Highlights unit cards on the pre-battle panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_pre_battle_options(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the pre-battle panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_pre_battle_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights unit cards on the pre-battle panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param unit_types_only boolean sets whether this is actually the post-battle panel we are highlighting (campaign_ui_manager:highlight_post_battle_panel_unit_cards sets this flag).
---@param unit_experience_only boolean Only highlights the unit type indicator on each card instead of the whole card.
---@param unit_banners_only boolean Only highlights the unit experience indicator on each card instead of the whole card.
function campaign_ui_manager:highlight_pre_battle_panel_unit_cards(show_highlight, pulse_strength_override, force_highlight, unit_types_only, unit_experience_only, unit_banners_only) end

--- Highlights the province info panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_province_info_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the provinces drop-down list. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_provinces_list(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the province overview panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_province_overview_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights just the settlement headers on the province overview panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param first_settlement_only boolean Only highlight headers for the first settlement on the army panel.
---@param all_but_first_settlement boolean Highlight headers for all but the first settlement on the army panel.
function campaign_ui_manager:highlight_province_overview_panel_settlement_headers(show_highlight, pulse_strength_override, force_highlight, first_settlement_only, all_but_first_settlement) end

--- Highlights public order on the province info panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_public_order(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the public order bar on the province info panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_public_order_bar(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the public order icon on the province info panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_public_order_icon(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the raise dead button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_raise_dead_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the raise dead panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_raise_dead_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights unit cards on the raise dead panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param unit_types_only boolean Only highlights the unit type indicator on each card instead of the whole card.
---@param unit_experience_only boolean Only highlights the unit experience indicator on each card instead of the whole card.
function campaign_ui_manager:highlight_raise_dead_panel_unit_cards(show_highlight, pulse_strength_override, force_highlight, unit_types_only, unit_experience_only) end

--- Highlights the raise forces button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_raise_forces_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the raise forces panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_raise_forces_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the recruit black ark button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_recruit_black_ark_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the recruit hero button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_recruit_hero_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the recruitment button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_recruitment_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the recruitment capacity indicators on the recruitment panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_recruitment_capacity(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights unit cards on the recruitment panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param unit_types_only boolean Only highlights the unit type indicator on each card instead of the whole card.
---@param unit_experience_only boolean Only highlights the unit experience indicator on each card instead of the whole card.
function campaign_ui_manager:highlight_recruitment_panel_unit_cards(show_highlight, pulse_strength_override, force_highlight, unit_types_only, unit_experience_only) end

--- Highlights the regiments of renown panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_regiments_of_renown_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the regiments of renown button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_regiments_of_renown_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights reinforcements on the pre-battle screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_reinforcements(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the rites button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_rites_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the rites panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_rites_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights ritual buttons. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_ritual_buttons(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights ritual rival icons. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_ritual_rival_icons(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the rituals bar. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_rituals_bar(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Seduction button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_seduce_units_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Seduction button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_seductive_influence(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights any visible settlements. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param faction_key string Target faction key. Can be omitted to highlight settlements for all factions.
function campaign_ui_manager:highlight_settlements(show_highlight, pulse_strength_override, force_highlight, faction_key) end

--- Highlights the shipbuilding tab on the army panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_ship_building_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the shipbuilding panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_ship_building_panel(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the siege panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_siege_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights siege weapons on the siege panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_siege_weapons(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the slaves button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_slaves_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the slaves buttons that appear on the province info panel when playing as Dark Elves. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_slaves_buttons(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the stances rollout. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_stances(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the layer buttons on the strategic map. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_strategic_map_layer_buttons(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the strategy map button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_strat_map_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the tax indicator on the province info panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_tax(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights technologies. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_technologies(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the technologies button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_technology_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the technologies panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_technology_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Treasure map button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_treasure_map_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the treasure maps panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_treasure_map_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the treasury value. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_treasury(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the treasury button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_treasury_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the treasury panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_treasury_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the details tab on the treasury panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_treasury_panel_details_tab(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the summary tab on the treasury panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_treasury_panel_summary_tab(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights the trade tab on the treasury panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
function campaign_ui_manager:highlight_treasury_panel_trade_tab(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream) end

--- Highlights unit cards across the campaign UI. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
---@param dont_highlight_upstream boolean Suppress highlighting of any upstream components if this one is not currently visible.
---@param unit_types_only boolean Only highlights the unit type indicator on each card instead of the whole card.
---@param unit_experience_only boolean Only highlights the unit experience indicator on each card instead of the whole card.
function campaign_ui_manager:highlight_unit_cards(show_highlight, pulse_strength_override, force_highlight, dont_highlight_upstream, unit_types_only, unit_experience_only) end

--- Highlights the unit exchange panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_unit_exchange_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights experience indicators on visible unit cards. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_unit_experience(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the unit information panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_unit_information_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the unit recruitment panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_unit_recruitment_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights unit type indicators on visible unit cards. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_unit_types(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the winds of magic indicators on the army panel and the pre-battle panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_winds_of_magic(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the ataman button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_ataman_button(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Atamans button and panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_atamans(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Devotion income. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_devotion(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Ice Court button and panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_ice_court(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Ice Court button and panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_motherland(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the war co-ordination button and panel or diplomacy button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_war_coordination(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the war co-ordination_ally_missions tab. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_war_coordination_ally_missions(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the war co-ordination_outpost tab. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_war_coordination_outpost(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the war co-ordination_outpost tab. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_war_coordination_request_army(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the war co-ordination_outpost tab. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_war_coordination_set_target(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the allied recruitment panel and button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_allied_recruitment(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights diplomacy attitude icons on the diplomacy screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_can_trade_icons(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights region trading button on the diplomacy screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_initiate_diplomacy(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights region trading button on the diplomacy screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_region_trading(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights confederation button on the diplomacy screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_confederation(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights region non-aggression pact on the diplomacy screen. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_non_aggression(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the character details subpanel on the character details panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_global_item_pool(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Skull Throne button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_skull_throne(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the skulls counter. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_skulls_count(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the devotees counter. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_devotees(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the pleasurable acts indicator on the province info panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_pleasurable_acts(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the summon disciple army button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_summon_disciple_army(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Skull Throne button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_proliferate_cults(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the glory counters counter. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_daemonic_glory_counters(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Daemonic Glory button and panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_daemonic_glory_panel(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Daemonic Dedication button and panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_daemonic_dedication(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Cathay Compass button and panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_cathay_compass(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Ivory Road button and panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_ivory_road(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Harmony lotus. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_harmony(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Harmony lotus. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_great_bastion(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Supporters Track. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_kislev_supporters(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Plagues of Nurgle button and panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_plagues_of_nurgle(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the infections counter. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_infections(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights Nurgle symptoms. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_symptoms(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights Nurgle plague recipes. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_plague_recipes(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Unholy Manifestations button and panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_unholy_manifestations(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Changing of the Ways button and panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_changing_of_the_ways(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the grimoires counter. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_grimoires(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Winds of Magic Manipulation button and panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_winds_of_magic_manipulation(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the offings to the great maw button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_offer_to_the_great_maw(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the deploy ogre camp button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_orge_camp(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the grimoires counter. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_ogre_meat(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the Winds of Magic Manipulation button and panel. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_ogre_contracts(show_highlight, pulse_strength_override, force_highlight) end

--- Highlights the deploy ogre camp button. Best practise is to use campaign_ui_manager:unhighlight_all_for_tooltips to cancel the highlight later.
---@param show_highlight boolean Show highlight.
---@param pulse_strength_override number Pulse Strength Override. Default is 10 for smaller components such as buttons, and 5 for larger components such as panels. Set a higher number for a more pronounced pulsing.
---@param force_highlight boolean Forces the highlight to show even if the help_page_link_highlighting ui override is set.
function campaign_ui_manager:highlight_big_names(show_highlight, pulse_strength_override, force_highlight) end
