
---@class core
local core = {}

--- Creates a core object. There is no need for client scripts to call this, as a core object is created automatically by the script libraries when they are loaded.
function core:new() end

--- Gets a handle to the ui root object. A script_error is thrown if this is called before the ui has been created.
function core:get_ui_root() end

--- sets the ui root object that the core stores. Not to be called outside of the script libraries.
---@param ui_root UIC ui root
function core:set_ui_root(ui_root) end

--- Returns whether the ui has been created or not. Useful if clients scripts are running so early in the load sequence that the ui may not have been set up yet.<br />
--- Once this function returns true, client scripts should be okay to start asking questions of the game and model.
function core:is_ui_created() end

--- Adds a callback to be called when the UI is created.
---@param callback function callback
function core:add_ui_created_callback(callback) end

--- Adds a callback to be called when the UI is destroyed.
---@param callback function callback
function core:add_ui_destroyed_callback(callback) end

--- Returns true if the game is not running in final release or intel configurations, false if the game is running in debug or profile configuration
function core:is_debug_config() end

--- Returns whether a boolean tweaker with the supplied name is set. If the tweaker is set to true or false then that value is returned, otherwise nil is returned.
---@param tweaker_name string tweaker name
function core:is_tweaker_set(tweaker_name) end

--- Returns the current screen resolution
function core:get_screen_resolution() end

--- Returns whether the game is currently in campaign mode
function core:is_campaign() end

--- Returns whether the game is currently in battle mode
function core:is_battle() end

--- Returns whether the game is currently in the frontend
function core:is_frontend() end

--- Returns the current global lua function environment. This can be used to force other functions to have global scope.
function core:get_env() end

--- Returns a handle to the timer manager created for the current environment.
function core:get_tm() end

--- Loads all mod scripts found on each of the supplied paths, setting the environment of every loaded mod to the global environment.
---@vararg any
function core:load_mods(paths) end

--- Attempts to execute a function of the same name as the filename of each mod that has previously been loaded by core:load_mods. For example, if mods have been loaded from mod_a.lua, mod_b.lua and mod_c.lua, the functions mod_a(), mod_b() and mod_c() will be called, if they exist. This can be used to start the execution of mod scripts at an appropriate time, particularly during campaign script startup.<br />
--- One or more arguments can be passed to execute_mods, which are in-turn passed to the mod functions being executed.
---@vararg any
function core:execute_mods(arguments) end

--- Returns whether a mod with the supplied name is loaded. The path may be omitted.
---@param mod_name string mod name
function core:is_mod_loaded(mod_name) end

--- Returns the current advice level value. A returned value of 0 corresponds to 'minimal', 1 corresponds to 'low', and 2 corresponds to 'high'.
function core:get_advice_level() end

--- Returns whether the advice level is currently set to minimal.
function core:is_advice_level_minimal() end

--- Returns whether the advice level is currently set to low.
function core:is_advice_level_low() end

--- Returns whether the advice level is currently set to high.
function core:is_advice_level_high() end

--- Returns a handle to the scripted value registry object. It shouldn't be necessary to call this, as the core object provides access to all its functionality through its wrapper functions.
function core:get_svr() end

--- Saves a boolean value to the svr. This will persist as the game loads between modes (campaign/battle/frontend) but will be destroyed if the game is restarted.
---@param value_name string value name
---@param value boolean value
function core:svr_save_bool(value_name, value) end

--- Retrieves a boolean value from the svr.
---@param value_name string value name
function core:svr_load_bool(value_name) end

--- Saves a string value to the svr. This will persist as the game loads between modes (campaign/battle/frontend) but will be destroyed if the game is restarted.
---@param value_name string value name
---@param value string value
function core:svr_save_string(value_name, value) end

--- Retrieves a string value from the svr.
---@param value_name string value name
function core:svr_load_string(value_name) end

--- Saves a boolean value to the registry. This will persist, even if the game is reloaded.
---@param value_name string value name
---@param value boolean value
function core:svr_save_registry_bool(value_name, value) end

--- Loads a boolean value from the registry.
---@param value_name string value name
function core:svr_load_registry_bool(value_name) end

--- Saves a string value to the registry. This will persist, even if the game is reloaded.
---@param value_name string value name
---@param value string value
function core:svr_save_registry_string(value_name, value) end

--- Loads a string value from the registry.
---@param value_name string value name
function core:svr_load_registry_string(value_name) end

--- Records a timestamp with the supplied name. This can be compared to a later timestamp with core:svr_time_since_timestamp to see how much time has elapsed between two game events. This value is saved into the registry so will survive between game sessions.<br />
--- This can be used to trigger advice if the player has not performed a certain action in game for a given period (e.g. not loaded a campaign in three months), for example.
---@param timestamp_name string timestamp name
function core:svr_save_timestamp(timestamp_name) end

--- Returns the number of seconds since a timestamp with the supplied name was last recorded with core:svr_save_timestamp. If the timestamp has never been recorded then nil is returned.
---@param timestamp_name string timestamp name
function core:svr_time_since_timestamp(timestamp_name) end

--- Returns a boolean preference value. The value is looked up by a string preference name.
---@param preference_name string preference name
function core:get_boolean_preference(preference_name) end

--- Sets a boolean preference value, by string preference name.
---@param preference_name string preference name
---@param preference_value boolean preference value
function core:set_boolean_preference(preference_name, preference_value) end

--- Looks up a boolean preference value by name, stores it in an internal cache, and returns the value. The cached value may be later restored with core:restore_boolean_preference.
---@param preference_name string preference name
function core:cache_boolean_preference(preference_name) end

--- Caches and then sets a boolean preference value. Equivalent to calling core:cache_boolean_preference and then core:set_boolean_preference. The value cached by core:cache_boolean_preference is returned.
---@param preference_name string preference name
---@param new_value boolean new value
function core:cache_and_set_boolean_preference(preference_name, new_value) end

--- Looks up a boolean preference value by name from the internal cache and sets the preference to the looked-up value. The value retrieved from the cache is also returned by the function. The preference value must have been written to the cache with core:cache_boolean_preference beforehand - if no cached value could be found then the preference is not set and nil is returned.
---@param preference_name string preference name
function core:restore_boolean_preference(preference_name) end

--- Returns an integer preference value. The value is looked up by a string preference name.
---@param preference_name string preference name
function core:get_integer_preference(preference_name) end

--- Sets an integer preference value, by string preference name.
---@param preference_name string preference name
---@param preference_value number preference value
function core:set_integer_preference(preference_name, preference_value) end

--- Looks up an integer preference value by name, stores it in an internal cache, and returns the value. The cached value may be later restored with core:restore_integer_preference.
---@param preference_name string preference name
function core:cache_integer_preference(preference_name) end

--- Caches and then sets an integer preference value. Equivalent to calling core:cache_integer_preference and then core:set_integer_preference. The value cached by core:cache_integer_preference is returned.
---@param preference_name string preference name
---@param new_value number new value
function core:cache_and_set_integer_preference(preference_name, new_value) end

--- Looks up an integer preference value by name from the internal cache and sets the preference to the looked-up value. The value retrieved from the cache is also returned by the function. The preference value must have been written to the cache with core:cache_integer_preference beforehand - if no cached value could be found then the preference is not set and nil is returned.
---@param preference_name string preference name
function core:restore_integer_preference(preference_name) end

--- Returns an float preference value. The value is looked up by a string preference name.
---@param preference_name string preference name
function core:get_float_preference(preference_name) end

--- Sets an float preference value, by string preference name.
---@param preference_name string preference name
---@param preference_value number preference value
function core:set_float_preference(preference_name, preference_value) end

--- Looks up an float preference value by name, stores it in an internal cache, and returns the value. The cached value may be later restored with core:restore_float_preference.
---@param preference_name string preference name
function core:cache_float_preference(preference_name) end

--- Caches and then sets a float preference value. Equivalent to calling core:cache_float_preference and then core:set_float_preference. The value cached by core:cache_float_preference is returned.
---@param preference_name string preference name
---@param new_value number new value
function core:cache_and_set_float_preference(preference_name, new_value) end

--- Looks up an float preference value by name from the internal cache and sets the preference to the looked-up value. The value retrieved from the cache is also returned by the function. The preference value must have been written to the cache with core:cache_float_preference beforehand - if no cached value could be found then the preference is not set and nil is returned.
---@param preference_name string preference name
function core:restore_float_preference(preference_name) end

--- Declares a new lookup listener, which listens for the supplied event and then calls listener records based on the key generated by the supplied test function. The test function will be called when the event is received and will be passed the event context. It should return a value which can be used to look up listeners added with core:add_lookup_listener_callback.<br />
--- See the section documentation Lookup Listeners for an example of usage.
---@param list_name string Unique list name.
---@param event_name string Script event to listen for.
---@param test function Conditional test to perform on the function context. This must return a value.
function core:declare_lookup_listener(list_name, event_name, test) end

--- Adds a listener entry to a lookup listener previously declared with core:declare_lookup_listener. This specifies a lookup value which, should it match the value produced by the test specified when the lookup listener was declared, will cause the supplied callback to be called.<br />
--- See the section documentation Lookup Listeners for an example of usage.
---@param list_name string Lookup listener to add this listener entry to. This should match the name passed to core:declare_lookup_listener.
---@param listener_name string Listener name, by which this listener entry may later be removed with core:remove_lookup_listener_callback if desired. It is valid to have multiple listeners with the same name.
---@param lookup_value any Lookup value. If, when the test function supplied to core:declare_lookup_listener is called it returns this value, then the callback for this listener will be called. The value given here can be any type.
---@param callback function Callback to call if the lookup value is matched.
---@param persistent boolean Is this a persistent listener. If false is specified here the listener will stop the first time the callback is triggered. If true, the listener will continue until cancelled with core:remove_lookup_listener_callback.
function core:add_lookup_listener_callback(list_name, listener_name, lookup_value, callback, persistent) end

--- Removes any listener entries from the specified lookup listener that match the supplied name.
---@param list_name string Lookup listener to remove listener entries from.
---@param listener_name string Name of listener to remove. This corresponds with the listener name specified when core:add_lookup_listener_callback is called.
function core:remove_lookup_listener_callback(list_name, listener_name) end

--- Shows a fullscreen highlight around a supplied component list. Once established, this highlight must later be destroyed with hide_fullscreen_highlight().<br />
--- An integer padding value must be supplied, which specifies how much visual padding to give the components. The higher the supplied value, the more space is given around the supplied components visually.<br />
--- The underlying FullscreenHighlight functionality supports showing text on the fullscreen highlight itself. If you wish to specify some text to be shown, it may be supplied using the second parameter in the common localised text format [table]_[field_of_text]_[key_from_table].
---@param padding number Padding value, must be 0 or greater
---@param highlight_text string Highlight text key, may be nil.
---@param allow_interaction boolean Allows the components in the central window to be interacted with.
---@vararg any
function core:show_fullscreen_highlight_around_components(padding, highlight_text, allow_interaction, uicomponent_list) end

--- Hides/destroys the active fullscreen highlight.
function core:hide_fullscreen_highlight() end

--- Sets the active fullscreen highlight to be interactive. An interactive fullscreen highlight will respond to clicks. By default fullscreen highlights are non-interactive, but the functionality to make them interactive is provided here in case it's needed.
---@param value boolean value
function core:set_fullscreen_highlight_interactive(value) end

--- Sets the active fullscreen highlight to be interactive. An interactive fullscreen highlight will respond to clicks. By default fullscreen highlights are non-interactive, but the functionality to make them interactive is provided here in case it's needed.
---@param value boolean value
function core:set_fullscreen_highlight_window_interactive(value) end

--- Sets the advisor priority to the supplied value, and caches the value previously set. The advisor priority can later be restored with restore_advisor_priority.<br />
--- The register_topmost flag can also be set to force the advisor to topmost.
function core:cache_and_set_advisor_priority() end

--- Restores the advisor priority to a value previously cached with cache_and_set_advisor_priority.
function core:restore_advisor_priority() end

--- Creates a UI component with the supplied name, or retrieves it if it's already been created.
---@param name string Name to give uicomponent.
---@param file_path string File path to uicomponent layout, from the working data folder.
---@param parent UIC Parent uicomponent.
function core:get_or_create_component(name, file_path, parent) end

--- Adds a listener for an event. When the code triggers this event, and should the optional supplied conditional test pass, the core object will call the supplied target callback with the event context as a single argument.<br />
--- A name must be specified for the listener which may be used to cancel it at any time. Names do not have to be unique between listeners.<br />
--- The conditional test should be a function that returns a boolean value. This conditional test callback is called when the event is triggered, and the listener only goes on to trigger the supplied target callback if the conditional test returns true. Alternatively, a boolean true value may be given in place of a conditional callback, in which case the listener will always go on to call the target callback if the event is triggered.<br />
--- Once a listener has called its callback it then shuts down unless the persistent flag is set to true, in which case it may only be stopped by being cancelled by name.
---@param listener_name string listener name
---@param event_name string event name
---@param conditional_test function Conditional test, or true to always pass
---@param target_callback function target callback
---@param listener_persists_after_target_callback_called boolean listener persists after target callback called
function core:add_listener(listener_name, event_name, conditional_test, target_callback, listener_persists_after_target_callback_called) end

--- Removes and stops any event listeners with the specified name.
---@param listener_name string listener name
function core:remove_listener(listener_name) end

--- Triggers an event from script, to which event listeners will respond. An event name must be specified, as well as zero or more items of data to package up in a custom event context. See custom_context documentation for information about what types of data may be supplied with a custom context. A limitation of the implementation means that only one data item of each supported type may be specified.<br />
--- By convention, the names of events triggered from script are prepended with "ScriptEvent" e.g. "ScriptEventPlayerFactionTurnStart".
---@param event_name string event name
---@vararg any
function core:trigger_event(event_name, context_data_items) end

--- Triggers an event from script with a context object constructed from custom data. An event name must be specified, as well as a table containing context data at key/value pairs. For keys that are strings, the value corresponding to the key will be added to the custom_context generated, and will be available to listening scripts through a function with the same name as the key value. An example might be a hypothetical event ScriptEventCharacterInfected, with a key disease and a value which is the name of the disease. This would be accessible to listeners of this event that call context:disease().<br />
--- Should the key not be a string then the data is added to the context as normal, as if supplied to custom_context:add_data.<br />
--- By convention, the names of events triggered from script are prepended with "ScriptEvent" e.g. "ScriptEventPlayerFactionTurnStart".
---@param event_name string event name
---@param data_items table data items
function core:trigger_custom_event(event_name, data_items) end

--- Adds a custom event generator. 
---@param source_event string Source event to listen for.
---@param condition function Conditional test to perform. This test will be passed the context of the source event just triggered as a single argument, and should return a boolean value. If the condition returns true, or a value that evaluates to true, the target event will be triggered.
---@param target_event string Target event to fire if the source event is received and the condition passes. By convention, events triggered from script begin with "ScriptEvent"
---@param context_generator function Function that returns an object to be placed on the context of the target event
function core:start_custom_event_generator(source_event, condition, target_event, context_generator) end

--- Stops a custom event generator, by the name of the target event. If multiple custom generators produce the same target event they will all be stopped.
function core:stop_custom_event_generator() end

--- Immediately calls a supplied function, and monitors how long it takes to complete. If this duration is longer than a supplied time limit a script error is thrown. A string name must also be specified for the function, for output purposes.
---@param function_to_call function function to call
---@param time_limit_in_s number time limit in s
---@param name string name
function core:monitor_performance(function_to_call, time_limit_in_s, name) end

--- Calls the supplied function if the number of previously function calls with the supplied name is less than the supplied limit. Only function calls handled by call_limited (or core:call_once) are counted. If the function is called then the internal counter associated with the name given is incremented.
---@param name string Name of the callback record to check.
---@param callback function Callback to call.
---@param quantity number Maximum number of times a callback with this name can be called. If the internal counter of the number of callbacks related to the supplied name is less than this supplied quantity then the callback will be called.
function core:call_limited(name, callback, quantity) end

--- Calls the supplied function if no function with the supplied name has previously been called by call_once or core:call_limited.
---@param name string Name of the callback record to check.
---@param callback function Callback to call.
function core:call_once(name, callback) end

--- Returns true if a text pointer with the supplied name has already been registered, false otherwise.
---@param text_pointer_name string text pointer name
function core:is_text_pointer_name_registered(text_pointer_name) end

--- Registers a text pointer with the supplied name.
---@param text_pointer_name string text pointer name
function core:register_text_pointer_name(text_pointer_name) end

--- Registers an active pointer. This is called automatically when an active pointer is set to save a record of itself into the advice history. It should not be called externally.
---@param active_pointer active_pointer active pointer
function core:register_active_pointer(active_pointer) end

--- Gets a previously-registered active pointer by name.
---@param name string name
function core:get_active_pointer(name) end

--- Returns whether any active pointer is currently being displayed, as well as the active pointer being displayed if one is found.
function core:is_any_active_pointer_showing() end

--- Hide any text_pointer's current visible.
---@param hide_immediately boolean hide immediately
function core:hide_all_text_pointers(hide_immediately) end

--- Retrieves a unique integer number. Each number is 1 higher than the previous unique number. Useful for scripts that need to generate unique identifiers.
function core:get_unique_counter() end

--- Returns the name and uicomponent of any detected loading screen, or false if one is not currently resident in the ui hierarchy (which would indicate that loading has finished).
function core:get_loading_screen() end

--- Returns the name and uicomponent of any visible loading screen, or false otherwise.
function core:is_loading_screen_visible() end

--- Calls the supplied callback once the loading screen has been dismissed. If no loading screen is currently visible the function throws a script error and calls the callback immediately.
---@param callback function Callback to call.
---@param suppress_wait boolean Suppress wait for loading screen to animate offscreen.
function core:progress_on_loading_screen_dismissed(callback, suppress_wait) end

--- Calls the supplied callback once the supplied component has finished animating. This function polls the animation state every 1/10th of a second, so there may be a slight unavoidable delay between the animation finishing and the supplied callback being called.
---@param uicomponent UIC uicomponent
---@param callback function callback
function core:progress_on_uicomponent_animation_finished(uicomponent, callback) end

--- Calls the supplied callback when the active animation on the supplied uicomponent returns a certain string. By default this string is empty, which means this function would progress when the target uicomponent is not animating. However, an alternative animation name can be supplied, which makes this function progress when that animation plays instead.<br />
--- Note that this script has to repeatedly poll the supplied uicomponent, so because of model tick resolution it's not possible to guarantee that the callback will be called the instant the animation changes to the desired state.
---@param unique_name string Unique name for this monitor (multiple such monitors may be active at once).
---@param uicomponent UIC Target uicomponent.
---@param callback function Callback to call.
---@param callback_delay number Time in seconds to wait after the animation finishes before calling the supplied callback.
---@param animation_name string Animation name which, when seen to be playing on the supplied uicomponent, causes the monitor to fire. The default animation name "" implies no animation playing.
function core:progress_on_uicomponent_animation(unique_name, uicomponent, callback, callback_delay, animation_name) end

--- Cancels a monitor started with core:progress_on_uicomponent_animation by name.
---@param unique_name string Unique name for the monitor to cancel (multiple such monitors may be active at once).
function core:cancel_progress_on_uicomponent_animation(unique_name) end

--- Caches and sets the tooltip for a particular state of a component. Once cached, the tooltip may be restored with restore_tooltip_for_component_state. This is used by tutorial scripts that overwrite the tooltip state of certain UIComponents.<br />
--- The tooltip text key should be supplied in the common localised text format [table]_[field_of_text]_[key_from_table].
---@param subject_uicomponent UIC subject uicomponent
---@param state_name string state name
---@param text_key string text key
function core:cache_and_set_tooltip_for_component_state(subject_uicomponent, state_name, text_key) end

--- Restores a tooltip for a uicomponent state that's been previously modified with cache_and_set_tooltip_for_component_state.
---@param subject_uicomponent UIC subject uicomponent
---@param state_name string state name
function core:restore_tooltip_for_component_state(subject_uicomponent, state_name) end

--- Strips any tags out of a localised text string. Tags stripped are "[[ .. ]]" and "{{ .. }}".
---@param text string text
function core:strip_tags_from_localised_text(text) end

--- Takes a number value and a numeric bit position. Returns true if the bit at the numeric bit position would be a '1' were the number value converted to binary, false otherwise.
---@param subject_value number subject value
---@param bit_position integer bit position
function core:check_bit(subject_value, bit_position) end

--- Registers a static object by a string name, which can be retrieved later with core:get_static_object. This is intended for use as a registry of global static objects (objects of which there should only be one copy) such as <a href="../battle/battle_manager.html#class:battle_manager">battle_manager, <a href="../campaign/campaign_manager.html#class:campaign_manager">campaign_manager, timer_manager, script_messager, <a href="../battle/generated_battle.html#class:generated_battle">generated_battle and so-on. Scripts that intended to create one of these objects can query the static object registry to see if they've been created before and, if not, can register it.<br />
--- An optional classification string may be supplied to specify a grouping for the object. Static objects in different classifications may share the same name. This functionality can be used to register static objects of a particular type, e.g. a particular mission manager, and to ensure that names are unique amongst those objects.<br />
--- If a static object with the supplied name and classification already exists then this function produces a script error unless the overwrite flag is set.<br />
--- The static object registry is not saved into the campaign savegame or saved between game sessions.
---@param object_name string Object name.
---@param object_to_register any Object to register.
---@param classification string Object classification.
---@param overwrite boolean Should overwrite if an object already exists with this name.
---@param silent boolean Do not generate a script error if the object couldn't be added.
function core:add_static_object(object_name, object_to_register, classification, overwrite, silent) end

--- Returns the static object previously registered with the supplied string name and optional classification using core:add_static_object, if any such object has been registered, or nil if no object was found.
---@param object_name string object name
---@param classification string classification
function core:get_static_object(object_name, classification) end

--- Stops any windowed movie players currently playing.
function core:stop_all_windowed_movie_players() end

--- Registers a windowed_movie_player with the core object so that it may be stopped if core:stop_all_windowed_movie_players is called. This is only intended to be called internally by windowed movie players.
---@param player windowed_movie_player player
function core:register_windowed_movie_player(player) end

--- Unregisters a windowed_movie_player with the core object so that won't be stopped if core:stop_all_windowed_movie_players is called. This is only intended to be called internally by windowed movie players.
---@param player windowed_movie_player player
function core:unregister_windowed_movie_player(player) end

---@class custom_context
local custom_context = {}

--- Creates a custom context object.
function custom_context:new() end

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

--- Adds data to the custom context which will be made accessible at the supplied function name. The function name is supplied by string key.
---@param value any Value to add to custom context. Any value may be supplied.
---@param function_name string Name of function at which the value may be retrieved, if called on the custom context.
function custom_context:add_data_with_key(value, function_name) end

--- Called by the receiving script to retrieve the region object placed on the custom context, were one specified by the script that created it.
function custom_context:region() end

--- Called by the receiving script to retrieve the character object placed on the custom context, were one specified by the script that created it.
function custom_context:character() end

--- Called by the receiving script to retrieve the target character object placed on the custom context, were one specified by the script that created it. The target character is the second character added to the context.
function custom_context:target_character() end

--- Called by the receiving script to retrieve the faction object placed on the custom context, were one specified by the script that created it.
function custom_context:faction() end

--- Called by the receiving script to retrieve the component object placed on the custom context, were one specified by the script that created it.
function custom_context:component() end

--- Called by the receiving script to retrieve the military force object placed on the custom context, were one specified by the script that created it.
function custom_context:military_force() end

--- Called by the receiving script to retrieve the pending battle object placed on the custom context, were one specified by the script that created it.
function custom_context:pending_battle() end

--- Called by the receiving script to retrieve the garrison residence object placed on the custom context, were one specified by the script that created it.
function custom_context:garrison_residence() end

--- Called by the receiving script to retrieve the building object placed on the custom context, were one specified by the script that created it.
function custom_context:building() end
