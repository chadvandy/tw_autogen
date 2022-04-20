
---@class battle_ui_manager
local battle_ui_manager = {}

--- Creates a battle_ui_manager. It should never be necessary for a client script to need to call this directly, as the battle_manager creates this object and stores it internally. Instead retrieve the battle_ui_manager from the battle_manager with battle_manager:get_battle_ui_manager. By convention, the battle ui manager is also found at the global variable buim.
---@param battle_manager battle_manager battle manager
function battle_ui_manager:new(battle_manager) end

--- Returns whether a ui panel with the supplied name is currently open.
---@param panel_name string panel name
function battle_ui_manager:is_panel_open(panel_name) end

--- Returns the name of a fullscreen panel that's open, or false if no panels are open. If more than one fullscreen panel is open then the name of one is returned at random.
function battle_ui_manager:get_open_fullscreen_panel() end

--- Returns the panel pulse strength constant the battle_ui_manager stores internally. This value determines the strength of the pulse highlighting effect on large UI elements like panels.
function battle_ui_manager:get_panel_pulse_strength() end

--- Returns the button pulse strength constant the battle_ui_manager stores internally. This value determines the strength of the pulse highlighting effect on small UI elements like buttons.
function battle_ui_manager:get_button_pulse_strength() end

--- Allows registration of a function to be called when battle_ui_manager:unhighlight_all_for_tooltips is called.
---@param callback_to_call function callback to call
function battle_ui_manager:register_unhighlight_callback(callback_to_call) end

--- Calls all functions currently registered with battle_ui_manager:register_unhighlight_callback. This is intended to be used to unhighlight all currently-highlighted UI elements, when the mouse cursor is moved off of a help page link.
function battle_ui_manager:unhighlight_all_for_tooltips() end

--- Enables/disables the scripted behaviour which pulses a highlight over various elements of the UI when the mouse cursor is placed over related words on Help Pages.
---@param enable_highlighting boolean enable highlighting
function battle_ui_manager:set_help_page_link_highlighting_permitted(enable_highlighting) end

--- Returns whether help page link highlighting is permitted. This is true by default, unless it's been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted
function battle_ui_manager:get_help_page_link_highlighting_permitted() end

--- Pulse-highlights the advice history buttons.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_advice_history_buttons(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the advice button.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_advisor_button(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the advisor.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_advisor(enable_highlight, pulse_strength, force) end

--- Pulse-highlights any army abilities buttons.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_army_abilities(enable_highlight, pulse_strength, force) end

--- Pulse-highlights any army abilities buttons.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_army_abilities_meter(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the army panel.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_army_panel(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the balance of power bar.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_balance_of_power(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the drop equipment button.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_drop_equipment_button(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the fire-at-will button.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_fire_at_will_button(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the formations button.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_formations_button(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the game guide button.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_game_guide_button(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the group button.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_group_button(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the guard button.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_guard_button(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the lore panel.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_lore_panel(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the melee mode button.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_melee_mode_button(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the power reserve bar.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_power_reserve_bar(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the radar map.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_radar_map(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the realm of souls bar.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_realm_of_souls(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the skirmish button.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_skirmish_button(enable_highlight, pulse_strength, force) end

--- Pulse-highlights any spells buttons.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_spells(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the supplies.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_supplies(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the tactical map button.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_tactical_map_button(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the time controls buttons.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_time_controls(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the time limit.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_time_limit(enable_highlight, pulse_strength, force) end

--- Pulse-highlights any unit abilities buttons.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_unit_abilities(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the unit cards.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
---@param highlight_health boolean Only highlight/unhighlight the health bar of unit cards.
---@param highlight_ammo boolean Only highlight/unhighlight the ammunition bar of unit cards.
---@param highlight_xp boolean Only highlight/unhighlight the experience icon of unit cards.
---@param highlight_status boolean Only highlight/unhighlight the status tab of unit cards.
function battle_ui_manager:highlight_unit_cards(enable_highlight, pulse_strength, force, highlight_health, highlight_ammo, highlight_xp, highlight_status) end

--- Pulse-highlights the unit details button.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_unit_details_button(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the unit details panel.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_unit_details_panel(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the unit portrait panel.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_unit_portrait_panel(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the victory locations.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_victory_locations(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the victory tickets.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_victory_tickets(enable_highlight, pulse_strength, force) end

--- Pulse-highlights the winds of magic panel.
---@param enable_highlight boolean Set to true to enable the highlight, false to disable
---@param pulse_strength number Override pulse strength
---@param force boolean Enable the highlight even if highlighting has been disabled with battle_ui_manager:set_help_page_link_highlighting_permitted.
function battle_ui_manager:highlight_winds_of_magic_panel(enable_highlight, pulse_strength, force) end
