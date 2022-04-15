
---@class custom_context
local custom_context = {}

--- 
function custom_context:progress_on_loading_screen_dismissed() end

--- 
function custom_context:is_advice_level_low() end

--- 
function custom_context:unregister_windowed_movie_player() end

--- 
function custom_context:hide_fullscreen_highlight() end

--- 
function custom_context:cache_and_set_boolean_preference() end

--- 
function custom_context:cache_and_set_advisor_priority() end

--- 
function custom_context:is_ui_created() end

--- 
function custom_context:svr_load_registry_bool() end

--- 
function custom_context:cache_boolean_preference() end

--- 
function custom_context:get_ui_root() end

--- 
function custom_context:declare_lookup_listener() end

--- Called by the receiving script to retrieve the pending battle object placed on the custom context, were one specified by the script that created it.
function custom_context:pending_battle() end

--- 
function custom_context:svr_time_since_timestamp() end

--- 
function custom_context:get_or_create_component() end

--- Called by the receiving script to retrieve the garrison residence object placed on the custom context, were one specified by the script that created it.
function custom_context:garrison_residence() end

--- 
function custom_context:is_loading_screen_visible() end

--- 
function custom_context:add_static_object() end

--- 
function custom_context:is_tweaker_set() end

--- Called by the receiving script to retrieve the military force object placed on the custom context, were one specified by the script that created it.
function custom_context:military_force() end

--- 
function custom_context:is_mod_loaded() end

--- 
function custom_context:progress_on_uicomponent_animation_finished() end

--- 
function custom_context:svr_save_string() end

--- 
function custom_context:get_env() end

--- 
function custom_context:add_lookup_listener_callback() end

--- 
function custom_context:svr_load_bool() end

--- 
function custom_context:restore_integer_preference() end

--- 
function custom_context:add_listener() end

--- 
function custom_context:register_text_pointer_name() end

--- 
function custom_context:register_active_pointer() end

--- 
function custom_context:get_static_object() end

--- 
function custom_context:cache_and_set_integer_preference() end

--- 
function custom_context:get_svr() end

--- 
function custom_context:remove_lookup_listener_callback() end

--- 
function custom_context:execute_mods() end

--- 
function custom_context:register_windowed_movie_player() end

--- 
function custom_context:monitor_performance() end

--- Called by the receiving script to retrieve the building object placed on the custom context, were one specified by the script that created it.
function custom_context:building() end

--- 
function custom_context:call_limited() end

--- Called by the receiving script to retrieve the faction object placed on the custom context, were one specified by the script that created it.
function custom_context:faction() end

--- 
function custom_context:is_frontend() end

--- Called by the receiving script to retrieve the target character object placed on the custom context, were one specified by the script that created it. The target character is the second character added to the context.
function custom_context:target_character() end

--- Called by the receiving script to retrieve the character object placed on the custom context, were one specified by the script that created it.
function custom_context:character() end

--- 
function custom_context:start_custom_event_generator() end

--- 
function custom_context:is_battle() end

--- 
function custom_context:show_fullscreen_highlight_around_components() end

--- 
function custom_context:stop_all_windowed_movie_players() end

--- Adds data to the custom context which will be made accessible at the supplied function name. The function name is supplied by string key.
---@param value any Value to add to custom context. Any value may be supplied.
---@param function_name string Name of function at which the value may be retrieved, if called on the custom context.
function custom_context:add_data_with_key(value, function_name) end

--- 
function custom_context:svr_load_registry_string() end

--- adds data to the custom context object. Supported data types:<br />
--- boolean: will be accessible to the receiving script as context.bool<br />
--- string: will be accessible to the receiving script as context.string<br />
--- region: will be accessible to the receiving script using context:region()<br />
--- character: will be accessible to the receiving script using context:character()<br />
--- faction: will be accessible to the receiving script using context:faction()<br />
--- component: will be accessible to the receiving script using context:component()<br />
--- military_force: will be accessible to the receiving script using context:military_force()<br />
--- pending_battle: will be accessible to the receiving script using context:pending_battle()<br />
--- garrison_residence: will be accessible to the receiving script using context:garrison_residence()<br />
--- building: will be accessible to the receiving script using context:building()<br />
--- A limitation of the implementation is that only one object of each type may be placed on the custom context.
---@param context_data any Data object to add
function custom_context:add_data(context_data) end

--- 
function custom_context:set_boolean_preference() end

--- 
function custom_context:trigger_event() end

--- 
function custom_context:is_advice_level_minimal() end

--- 
function custom_context:svr_save_registry_bool() end

--- 
function custom_context:get_float_preference() end

--- Called by the receiving script to retrieve the region object placed on the custom context, were one specified by the script that created it.
function custom_context:region() end

--- 
function custom_context:trigger_custom_event() end

--- 
function custom_context:check_bit() end

--- 
function custom_context:strip_tags_from_localised_text() end

--- 
function custom_context:set_fullscreen_highlight_interactive() end

--- 
function custom_context:cache_and_set_tooltip_for_component_state() end

--- 
function custom_context:cancel_progress_on_uicomponent_animation() end

--- 
function custom_context:get_boolean_preference() end

--- 
function custom_context:get_unique_counter() end

--- 
function custom_context:progress_on_uicomponent_animation() end

--- 
function custom_context:get_advice_level() end

--- 
function custom_context:set_float_preference() end

--- 
function custom_context:restore_boolean_preference() end

--- 
function custom_context:get_tm() end

--- 
function custom_context:hide_all_text_pointers() end

--- 
function custom_context:set_fullscreen_highlight_window_interactive() end

--- 
function custom_context:set_integer_preference() end

--- 
function custom_context:get_active_pointer() end

--- 
function custom_context:is_text_pointer_name_registered() end

--- 
function custom_context:restore_tooltip_for_component_state() end

--- 
function custom_context:svr_save_bool() end

--- Called by the receiving script to retrieve the component object placed on the custom context, were one specified by the script that created it.
function custom_context:component() end

--- 
function custom_context:stop_custom_event_generator() end

--- 
function custom_context:add_ui_destroyed_callback() end

--- 
function custom_context:remove_listener() end

--- 
function custom_context:svr_load_string() end

--- 
function custom_context:cache_float_preference() end

--- 
function custom_context:is_campaign() end

--- Creates a custom context object.
function custom_context:new() end

--- 
function custom_context:svr_save_timestamp() end

--- 
function custom_context:cache_and_set_float_preference() end

--- 
function custom_context:restore_advisor_priority() end

--- 
function custom_context:is_any_active_pointer_showing() end

--- 
function custom_context:call_once() end

--- 
function custom_context:is_advice_level_high() end

--- 
function custom_context:svr_save_registry_string() end

--- 
function custom_context:get_integer_preference() end

--- 
function custom_context:add_ui_created_callback() end

--- 
function custom_context:set_ui_root() end

--- 
function custom_context:get_loading_screen() end

--- 
function custom_context:is_debug_config() end

--- 
function custom_context:get_screen_resolution() end

--- 
function custom_context:cache_integer_preference() end

--- 
function custom_context:restore_float_preference() end

--- 
function custom_context:load_mods() end
