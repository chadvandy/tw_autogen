
--- All the global functions!
--- Throws a script error with the supplied message, printing the lua callstack to the Lua console output spool. Useful for debugging.
---@param message string Message to print.
---@param stack_level_modifier number If the stack level modifier is set to a negative number then no traceback is printed as part of the script error. This can be useful if the error message itself contains a traceback.
---@param suppress_assert boolean If set to true then no assert is generated with this script error.
function script_error(message, stack_level_modifier, suppress_assert) end

--- out is a table that provides multiple methods for outputting text to the various available debug console spools. It may be called as a function to output a string to the main Lua console spool, but the following table elements within it may also be called to output to different output spools:<br />
--- grudges<br />
--- ui<br />
--- chaos<br />
--- traits<br />
--- help_pages<br />
--- interventions<br />
--- invasions<br />
--- design<br />
---  <br />
--- out supplies four additional functions that can be used to show tab characters at the start of lines of output:<br />
--- FunctionDescriptionout.inc_tabIncrements the number of tab characters shown at the start of the line by one.out.dec_tabDecrements the number of tab characters shown at the start of the line by one. Decrementing below zero has no effect.out.cache_tabCaches the number of tab characters currently set to be shown at the start of the line.out.restore_tabRestores the number of tab characters shown at the start of the line to that previously cached.
--- Tab levels are managed per output spool. To each of these functions a string argument can be supplied which sets the name of the output spool to apply the modification to. Supply no argument or a blank string to modify the tab level of the main output spool.
---@param output string output
function out(output) end

--- Forceably unloads and requires a file by name.
---@param filename string filename
function force_require(filename) end

--- One-shot function to load the script libraries.
function load_script_libraries() end

--- Returns true if the supplied value is of the supplied custom type. This is not intended to be directly called by client scripts, who should instead call one of the is_ functions listed elsewhere.
---@param object table object
---@param custom_type any custom type
function is_custom_type(object, custom_type) end

--- Returns the custom type value of the supplied value. If it has no custom type then nil is returned.
---@param object table object
function get_custom_type(object) end

--- Sets a supplied class table to the supplied type string by setting its __custom_type value. Once this is set, other object tables that are later set to derive from this class with set_object_class will report this custom type when passed to get_custom_type or is_custom_type.
---@param class_table table class table
---@param custom_type string custom type
function set_class_custom_type(class_table, custom_type) end

--- Sets the tostring value of a supplied class table to the specified value by setting its __tostring value. Once this is set, other object tables that are later set to derive from this class with set_object_class will return this value when passed to tostring().<br />
--- The tostring specifier may be supplied as a string or a function. If supplied as a function, that function will be called when the tostring() function is called with an object derived from the supplied class. The object will be supplied as a single argument to the tostring specifier function, which allows the tostring() value to be assembled at runtime and include elements such as the objects name, co-ordinates or other realtime information. The specifier function should return a string.<br />
--- The default behaviour is for the generated string to be cached in the object table, at the __cached_tostring field. Further calls to tostring() will then return the cached string rather than regenerating it each time. If this is undesirable - for example if the generated string might change as the object changes state - then the do_not_cache flag may be set on this function.<br />
--- The flag to not append the memory address may be set if the memory address of the table is not wanted on the end of the returned tostring value. The default behaviour is to append the memory address.
---@param class_table table class table
---@param custom_type string custom type
function set_class_tostring(class_table, custom_type) end

--- Sets the custom type and tostring value on the supplied class table to the supplied string value. This function calls set_class_custom_type and set_class_tostring to do this.
---@param class_table table class table
---@param custom_type_value string custom type value
function set_class_custom_type_and_tostring(class_table, custom_type_value) end

--- Sets the supplied object to index from the supplied class in a manner that emulates object-orientation. This will set the class to be the metatable of the object and will set the __index field of the metatable also to the supplied class. This means that if functions or values are looked up on the object and are not present they are then looked up on the class. It is through this kind of mechanism that object-orientation may be emulated in lua. Because the class is also the metatable, it means the metatable is shared between objects of the same type. Use set_object_class_unique if this is not desired.<br />
--- set_object_class will also associate the object with any custom type or tostring values that have been previously set up on the class with calls to set_class_custom_type and set_class_tostring.<br />
--- Any number of additional classes and objects may be specified, from which the main supplied object will also derive. If a value (such as a function to be called) is looked up on the object and is not provided on the object or the main class table it derives from, it will be looked up in turn on each additional classes or objects supplied. These additional objects/classes may be table or userdata values.
---@param object_table table Object table.
---@param class_table table Class table.
---@vararg any
function set_object_class(object_table, class_table, additional_interfaces) end

--- Sets the supplied object to index from the supplied class in a manner that emulates object-orientation. This will set up a metatable unique to this object and will set the __index field of this metatable to the supplied class. This means that if functions or values are looked up on the object and are not present they are then looked up on the class. It is through this kind of mechanism that object-orientation may be emulated in lua. In contrast to object-to-class relationships set up with set_object_class the metatable is not shared between objects of the same type, which is less memory-efficient but may be desirable in certain circumstances.<br />
--- set_object_class_unique will also associate the object with any custom type or tostring values that have been previously set up on the class with calls to set_class_custom_type and set_class_tostring.<br />
--- Any number of additional classes and objects may be specified, from which the main supplied object will also derive. If a value (such as a function to be called) is looked up on the object and is not provided on the object or the main class table it derives from, it will be looked up in turn on each additional classes or objects supplied. These additional objects/classes may be table or userdata values.
---@param object_table table Object table.
---@param class_table table Class table.
---@vararg any
function set_object_class_unique(object_table, class_table, additional_interfaces) end

--- Sets the metatable of the specified class table to the supplied table. This also sets the __is_class_definition field in the metatable which set_object_class uses internally to know the difference between a class definition (which has no concept of self) and an object definition (which does) in certain circumstances. This function is for use in specific situations where a class definition requires a metatable and objects derive from it.
---@param class_table table Class table.
---@param metatable table Metatable.
---@param allow_overwrite boolean Allow the overwriting of the metatable if one already exists.
function set_class_metatable(class_table, metatable, allow_overwrite) end

--- Returns true if the supplied value is nil, false otherwise.
---@param value any value
function is_nil(value) end

--- Returns true if the supplied value is a number, false otherwise.
---@param value any value
function is_number(value) end

--- Returns true if the supplied value is a function, false otherwise.
---@param value any value
function is_function(value) end

--- Returns true if the supplied value is a string, false otherwise.
---@param value any value
function is_string(value) end

--- Returns true if the supplied value is a boolean, false otherwise.
---@param value any value
function is_boolean(value) end

--- Returns true if the supplied value is a table, false otherwise.
---@param value any value
function is_table(value) end

--- Returns true if the supplied value is userdata, false otherwise.
---@param value any value
function is_userdata(value) end

--- Returns true if the supplied value is a whole number with no decimal component, or false otherwise.
---@param value any value
function is_integer(value) end

--- Returns true if the supplied value is a number greater than 0, or false otherwise.
---@param value any value
function is_positive_number(value) end

--- Returns true if the supplied value is a number greater than or equal to 0, or false otherwise.
---@param value any value
function is_non_negative_number(value) end

--- Returns true if the supplied value is an empty table, or false otherwise.
---@param value any value
function is_empty_table(value) end

--- Returns true if the supplied value is a table containing one or more values at any keys, or false otherwise. See also is_non_empty_table_indexed which checks if the values are stored at numerical keys.
---@param value any value
function is_non_empty_table(value) end

--- Returns true if the supplied value is a numerically-indexed table containing one or more values, or false otherwise.
---@param value any value
function is_non_empty_table_indexed(value) end

--- Returns true if the supplied value is a numerically-indexed table containing one or more string values, or false otherwise.
---@param value any value
function is_table_of_strings(value) end

--- Returns true if the supplied value is a string, or a numerically-indexed table containing one or more string values. If the supplied value is neither of these types then false is returned.
---@param value any value
function is_string_or_table_of_strings(value) end

--- Returns true if the supplied value is an empty table or a numerically-indexed table containing one or more string values, or false otherwise.
---@param value any value
function is_table_of_strings_allow_empty(value) end

--- Returns true if the supplied value is a function or the boolean value true. Event conditions in the scripting library commonly adhere to this format, where an event is received and the condition must either be a function that returns a result, or be the boolean value true. If the supplied value is not true or a function, then false is returned.
---@param value any value
function is_condition(value) end

--- Returns true if the supplied value is an event context, false otherwise.
---@param value any value
function is_eventcontext(value) end

--- Returns true if the supplied value is a uicomponent, false otherwise.
---@param value any value
function is_uicomponent(value) end

--- Returns true if the supplied value is a component memory address, false otherwise.
---@param value any value
function is_component(value) end

--- Returns true if the supplied value is a campaign null script interface, false otherwise.
---@param value any value
function is_null(value) end

--- Returns true if the supplied value is a campaign model interface, false otherwise.
---@param value any value
function is_model(value) end

--- Returns true if the supplied value is a campaign world interface, false otherwise.
---@param value any value
function is_world(value) end

--- Returns true if the supplied value is a campaign faction interface, false otherwise.
---@param value any value
function is_faction(value) end

--- Returns true if the supplied value is a campaign faction list interface, false otherwise.
---@param value any value
function is_factionlist(value) end

--- Returns true if the supplied value is a campaign character interface, false otherwise.
---@param value any value
function is_character(value) end

--- Returns true if the supplied value is a campaign family member interface, false otherwise.
---@param value any value
function is_family_member(value) end

--- Returns true if the supplied value is a campaign character list interface, false otherwise.
---@param value any value
function is_characterlist(value) end

--- Returns true if the supplied value is a campaign region manager interface, false otherwise.
---@param value any value
function is_regionmanager(value) end

--- Returns true if the supplied value is a campaign region interface, false otherwise.
---@param value any value
function is_region(value) end

--- Returns true if the supplied value is a campaign region data interface, false otherwise.
---@param value any value
function is_regiondata(value) end

--- Returns true if the supplied value is a campaign province interface, false otherwise.
---@param value any value
function is_province(value) end

--- Returns true if the supplied value is a campaign region list interface, false otherwise.
---@param value any value
function is_regionlist(value) end

--- Returns true if the supplied value is a campaign garrison residence interface, false otherwise.
---@param value any value
function is_garrisonresidence(value) end

--- Returns true if the supplied value is a campaign settlement interface, false otherwise.
---@param value any value
function is_settlement(value) end

--- Returns true if the supplied value is a campaign slot interface, false otherwise.
---@param value any value
function is_slot(value) end

--- Returns true if the supplied value is a campaign slot list interface, false otherwise.
---@param value any value
function is_slotlist(value) end

--- Returns true if the supplied value is a campaign military force interface, false otherwise.
---@param value any value
function is_militaryforce(value) end

--- Returns true if the supplied value is a campaign military force list interface, false otherwise.
---@param value any value
function is_militaryforcelist(value) end

--- Returns true if the supplied value is a unit object, false otherwise. This works in both campaign and battle on their respective unit object types.
---@param value any value
function is_unit(value) end

--- Returns true if the supplied value is a campaign unit list interface, false otherwise.
---@param value any value
function is_unitlist(value) end

--- Returns true if the supplied value is a campaign pending battle interface, false otherwise.
---@param value any value
function is_pendingbattle(value) end

--- Returns true if the supplied value is a campaign mission interface, false otherwise.
---@param value any value
function is_campaignmission(value) end

--- Returns true if the supplied value is a campaign ai interface, false otherwise.
---@param value any value
function is_campaignai(value) end

--- Returns true if the supplied value is a building list object, false otherwise.
---@param value any value
function is_buildinglist(value) end

--- Returns true if the supplied value is a building object in campaign or battle, false otherwise.
---@param value any value
function is_building(value) end

--- Returns true if the supplied value is a foreign slot manager interface, false otherwise.
---@param value any value
function is_foreignslotmanager(value) end

--- Returns true if the supplied value is a foreign slot interface, false otherwise.
---@param value any value
function is_foreignslot(value) end

--- Returns true if the supplied value is a battle sound effect, false otherwise.
---@param value any value
function is_battlesoundeffect(value) end

--- Returns true if the supplied value is an empire battle object, false otherwise.
---@param value any value
function is_battle(value) end

--- Returns true if the supplied value is an alliances object, false otherwise.
---@param value any value
function is_alliances(value) end

--- Returns true if the supplied value is an alliance, false otherwise.
---@param value any value
function is_alliance(value) end

--- Returns true if the supplied value is an armies object, false otherwise.
---@param value any value
function is_armies(value) end

--- Returns true if the supplied value is an army object, false otherwise.
---@param value any value
function is_army(value) end

--- Returns true if the supplied value is a units object, false otherwise.
---@param value any value
function is_units(value) end

--- Returns true if the supplied value is a unitcontroller, false otherwise.
---@param value any value
function is_unitcontroller(value) end

--- Returns true if the supplied value is a vector object, false otherwise.
---@param value any value
function is_vector(value) end

--- Returns true if the supplied value is a buildings object, false otherwise.
---@param value any value
function is_buildings(value) end

--- Returns true if the supplied value is a battle subtitles object, false otherwise.
---@param value any value
function is_subtitles(value) end

--- Returns true if the supplied value is a core object, false otherwise.
---@param value any value
function is_core(value) end

--- Returns true if the supplied value is a timer manager, false otherwise.
---@param value any value
function is_timermanager(value) end

--- Returns true if the supplied value is a script messager, false otherwise.
---@param value any value
function is_scriptmessager(value) end

--- Returns true if the supplied value is a custom event context, false otherwise.
---@param value any value
function is_customcontext(value) end

--- Returns true if the supplied value is an <a href="../campaign/objectives_manager.html#class:objectives_manager">objectives_manager, false otherwise.
---@param value any value
function is_objectivesmanager(value) end

--- Returns true if the supplied value is an <a href="../campaign/infotext_manager.html#class:infotext_manager">infotext_manager, false otherwise.
---@param value any value
function is_infotextmanager(value) end

--- Returns true if the supplied value is a link parser, false otherwise.
---@param value any value
function is_linkparser(value) end

--- Returns true if the supplied value is a tooltip listener, false otherwise.
---@param value any value
function is_tooltiplistener(value) end

--- Returns true if the supplied value is a context visibility monitor, false otherwise.
---@param value any value
function is_contextvisibilitymonitor(value) end

--- Returns true if the supplied value is a tooltip patcher, false otherwise.
---@param value any value
function is_tooltippatcher(value) end

--- Returns true if the supplied value is a help page manager, false otherwise.
---@param value any value
function is_helppagemanager(value) end

--- Returns true if the supplied value is a help page, false otherwise.
---@param value any value
function is_helppage(value) end

--- Returns true if the supplied value is a text pointer, false otherwise.
---@param value any value
function is_textpointer(value) end

--- Returns true if the supplied value is an active pointer, false otherwise.
---@param value any value
function is_activepointer(value) end

--- Returns true if the supplied value is a scripted tour, false otherwise.
---@param value any value
function is_scriptedtour(value) end

--- Returns true if the supplied value is a navigable tour, false otherwise.
---@param value any value
function is_navigabletour(value) end

--- Returns true if the supplied value is a navigable tour section, false otherwise.
---@param value any value
function is_navigabletoursection(value) end

--- Returns true if the supplied value is a movie_overlay, false otherwise.
---@param value any value
function is_movieoverlay(value) end

--- Returns true if the supplied value is a windowed_movie_player, false otherwise.
---@param value any value
function is_windowedmovieplayer(value) end

--- Returns true if the supplied value is a topic_leader, false otherwise.
---@param value any value
function is_topicleader(value) end

--- Returns true if the supplied value is a campaign manager, false otherwise.
---@param value any value
function is_campaignmanager(value) end

--- Returns true if the supplied value is a faction start object, false otherwise.
---@param value any value
function is_factionstart(value) end

--- Returns true if the supplied value is a campaign cutscene, false otherwise.
---@param value any value
function is_campaigncutscene(value) end

--- Returns true if the supplied value is a ui override, false otherwise.
---@param value any value
function is_uioverride(value) end

--- Returns true if the supplied value is a campaign ui manager, false otherwise.
---@param value any value
function is_campaignuimanager(value) end

--- Returns true if the supplied value is a mission manager, false otherwise.
---@param value any value
function is_missionmanager(value) end

--- Returns true if the supplied value is a chapter mission, false otherwise.
---@param value any value
function is_chaptermission(value) end

--- Returns true if the supplied value is an intervention, false otherwise.
---@param value any value
function is_intervention(value) end

--- Returns true if the supplied value is an intervention manager, false otherwise.
---@param value any value
function is_interventionmanager(value) end

--- Returns true if the supplied value is an invasion manager, false otherwise.
---@param value any value
function is_invasionmanager(value) end

--- Returns true if the supplied value is a random army manager, false otherwise.
---@param value any value
function is_randomarmy(value) end

--- Returns true if the supplied value is a <a href="../campaign/narrative_event.html#class:narrative_event">narrative_event, false otherwise.
---@param value any value
function is_narrativeevent(value) end

--- Returns true if the supplied value is a <a href="../campaign/narrative_event.html#class:narrative_query">narrative_query, false otherwise.
---@param value any value
function is_narrativequery(value) end

--- Returns true if the supplied value is a <a href="../campaign/narrative_event.html#class:narrative_trigger">narrative_trigger, false otherwise.
---@param value any value
function is_narrativetrigger(value) end

--- Returns true if the supplied value is an <a href="../campaign/intro_campaign_scripts.html#class:intro_campaign_camera_marker">intro_campaign_camera_marker, false otherwise.
---@param value any value
function is_introcampaigncameramarker(value) end

--- Returns true if the supplied value is an <a href="../campaign/intro_campaign_scripts.html#class:intro_campaign_camera_positions_advice">intro_campaign_camera_positions_advice, false otherwise.
---@param value any value
function is_introcampaigncamerapositionsadvice(value) end

--- Returns true if the supplied value is a <a href="../battle/battle_manager.html#class:battle_manager">battle_manager, false otherwise.
---@param value any value
function is_battlemanager(value) end

--- Returns true if the supplied value is a battle cutscene, false otherwise.
---@param value any value
function is_cutscene(value) end

--- Returns true if the supplied value is a <a href="../campaign/convex_area.html#class:convex_area">convex_area, false otherwise.
---@param value any value
function is_convexarea(value) end

--- Returns true if the supplied value is a <a href="../battle/script_unit.html#class:script_unit">script_unit, false otherwise.
---@param value any value
function is_scriptunit(value) end

--- Returns true if the supplied value is a <a href="../battle/script_unit.html#class:script_units">script_units object, false otherwise.
---@param value any value
function is_scriptunits(value) end

--- Returns true if the supplied value is a patrol manager, false otherwise.
---@param value any value
function is_patrolmanager(value) end

--- Returns true if the supplied value is a patrol manager waypoint, false otherwise.
---@param value any value
function is_waypoint(value) end

--- Returns true if the supplied value is a script ai planner, false otherwise.
---@param value any value
function is_scriptaiplanner(value) end

--- Returns true if the supplied value is a generated battle, false otherwise.
---@param value any value
function is_generatedbattle(value) end

--- Returns true if the supplied value is a generated army, false otherwise.
---@param value any value
function is_generatedarmy(value) end

--- Returns true if the supplied value is a generated cutscene, false otherwise.
---@param value any value
function is_generatedcutscene(value) end

--- Returns true if the supplied value is an advice manager, false otherwise.
---@param value any value
function is_advicemanager(value) end

--- Returns true if the supplied value is an advice monitor, false otherwise.
---@param value any value
function is_advicemonitor(value) end

--- Returns true if the supplied value is an attack lane manager, false otherwise.
---@param value any value
function is_attacklanemanager(value) end

--- An iterator for use with model objects in campaign and battle. When used in a for loop with a model list object, the iterator function returns the index and next item provided by the list object each loop pass.<br />
--- In campaign, this iterator supports all model list objects such as region_list, character_list, military_force_list etc. In battle, this iterator supports model list objects such as <a href="../battle/battle_alliances.html#class:battle_alliances">battle_alliances, <a href="../battle/battle_armies.html#class:battle_armies">battle_armies and <a href="../battle/battle_units.html#class:battle_units">battle_units, as well as <a href="../battle/script_unit.html#class:script_units">script_units script collection objects.
---@param parent_list_object any parent list object
function model_pairs(parent_list_object) end

--- An iterator for use with uicomponent objects, which returns each child in succession. When used in a for loop with a uicomponent object, the iterator function returns the index number and the child corresponding to that index each loop pass.
---@param parent_uicomponent_object UIC parent uicomponent object
function uic_pairs(parent_uicomponent_object) end

--- Converts a supplied angle in radians to degrees.
---@param angle number Angle in radians
function r_to_d(angle) end

--- Converts a supplied angle in degrees to radians.
---@param angle number Angle in degrees
function d_to_r(angle) end

--- Returns the file and path of the calling script as a table of strings.
---@param stack_offset integer Supply a positive integer here to return a result for a different file on the callstack e.g. supply '1' to return the file and folder path of the script file calling the the script file calling this function, for example.
function get_file_and_folder_path_as_table(stack_offset) end

--- Returns the folder name of the calling file and the shortform of its filename as separate return parameters. The shortform of the filename is the portion of the filename before the first "_", if one is found. If no shortform is found the function returns only the folder name.<br />
--- A shortform used to be prepended on battle script files to allow them to be easily differentiated from one another in text editors e.g. "TF_battle_main.lua" vs "PY_battle_main.lua" rather than two "battle_main.lua"'s.
---@param stack_offset integer Supply a positive integer here to return a result for a different file on the callstack e.g. supply '1' to return the folder name/shortform of the script file calling the the script file calling this function, for example.
function get_folder_name_and_shortform(stack_offset) end

--- Gets the full filepath and name of the calling file.
---@param stack_offset integer Supply a positive integer here to return a result for a different file on the callstack e.g. supply '1' to return the file path of the script file calling the the script file calling this function, for example.
function get_full_file_path(stack_offset) end

--- Returns the filename and the filepath of the calling file as separate return parameters.
---@param stack_offset integer Supply a positive integer here to return a result for a different file on the callstack e.g. supply '1' to return the file name and path of the script file calling the the script file calling this function, for example.
function get_file_name_and_path(stack_offset) end

--- Takes a uicomponent and a string name. Searches the direct children (and no further - not grandchildren etc) of the supplied uicomponent for another uicomponent with the supplied name. If a uicomponent with the matching name is found then it is returned, otherwise false is returned.
---@param parent_ui_component UIC parent ui component
---@param name string name
function find_child_uicomponent(parent_ui_component, name) end

--- Takes a uicomponent and an index. Searches the direct children (and no further - not grandchildren etc) of the supplied uicomponent. If a uicomponent with the correct index is found then it is returned, otherwise false is returned.
---@param parent_ui_component UIC parent ui component
---@param index number starting at 0
function find_child_uicomponent_by_index(parent_ui_component, index) end

--- Finds and returns a uicomponent based on a set of strings that define its path in the ui hierarchy. This parent uicomponent can be supplied as the first argument - if omitted, the root uicomponent is used. Starting from the parent or root, the function searches through all descendants for a uicomponent with the next supplied uicomponent name in the sequence. If a uicomponent is found, its descendants are then searched for a uicomponent with the next name in the list, and so on until the list is finished or no uicomponent with the supplied name is found. A fragmentary path may be supplied if it still unambiguously specifies the intended uicomponent.
---@param parent_ui_component UIC parent ui component
---@vararg any
function find_uicomponent(parent_ui_component, list_of_string_names) end

--- Takes a start uicomponent and a numerically-indexed table of string uicomponent names. Starting from the supplied start uicomponent, the function searches through all descendants for a uicomponent with the next supplied uicomponent name in the table. If a uicomponent is found, its descendants are then searched for a uicomponent with the next name in the list, and so on until the list is finished or no uicomponent with the supplied name is found. This allows a uicomponent to be searched for by matching its name and part of or all of its path.
---@param parent_ui_component UIC Parent uicomponent.
---@param table_of_string_names table Table of string names, indexed by number.
---@param on_failure assert Fire a script error if the search fails.
function find_uicomponent_from_table(parent_ui_component, table_of_string_names, on_failure) end

--- Takes a uicomponent and a string name. Returns true if any parent ancestor component all the way up to the ui root has the supplied name (i.e. the supplied component is descended from it), false otherwise.
---@param subject_uic UIC subject uic
---@param parent_name string parent name
function uicomponent_descended_from(subject_uic, parent_name) end

--- Converts a uicomponent to a string showing its path, for output purposes.
---@param subject_uic UIC subject uic
function uicomponent_to_str(subject_uic) end

--- Outputs extensive debug information about a supplied uicomponent to the Lua - UI console spool.
---@param subject_uic UIC Subject uicomponent.
---@param omit_children boolean Do not show information about the uicomponent's children.
function output_uicomponent(subject_uic, omit_children) end

--- Starts a listener which outputs debug information to the Lua - UI console spool about every uicomponent that's clicked on.
function output_uicomponent_on_click() end

--- Prints the name and path of the supplied uicomponent and all its descendents. Very verbose, and can take a number of seconds to complete.
---@param subject_uic UIC subject uic
---@param full_output boolean full output
function print_all_uicomponent_children(subject_uic, full_output) end

--- Activates or deactivates a pulsing highlight effect on a particular state of the supplied uicomponent. This is primarily used for scripts which activate when the player moves the mouse cursor over certain words in the help pages, to indicate to the player what UI feature is being talked about on the page.
---@param ui_component UIC Subject ui component.
---@param should_pulse boolean Set to true to activate the pulsing effect, false to deactivate it.
---@param brightness number Pulse brightness. Set a higher number for a more pronounced pulsing effect.
---@param progagate boolean Propagate the effect through the component's children. Use this with care, as the visual effect can stack and often it's better to activate the effect on specific uicomponents instead of activating this.
---@param state_name string Optional state name to affect. If no string state name is supplied here then the current state is used.
function pulse_uicomponent(ui_component, should_pulse, brightness, progagate, state_name) end

--- Returns true if the uicomponent is fully on-screen, false otherwise.
---@param uicomponent UIC uicomponent
function is_fully_onscreen(uicomponent) end

--- Returns true if the uicomponent is partially on-screen, false otherwise.
---@param uicomponent UIC uicomponent
function is_partially_onscreen(uicomponent) end

--- Sets a uicomponent visible or invisible by its path. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param set_visible boolean set visible
---@vararg any
function set_component_visible(set_visible, list_of_string_names) end

--- Sets a uicomponent visible or invisible by its path. The path should be one or more strings which when sequentially searched for from a supplied uicomponent parent lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param set_visible boolean set visible
---@param parent_uicomponent UIC parent uicomponent
---@vararg any
function set_component_visible_with_parent(set_visible, parent_uicomponent, list_of_string_names) end

--- Sets a uicomponent to be active or inactive by its path. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param set_active boolean set active
---@vararg any
function set_component_active(set_active, list_of_string_names) end

--- Sets a uicomponent to be active or inactive by its path. The path should be one or more strings which when sequentially searched for from a supplied uicomponent parent lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param set_active boolean set active
---@param parent_uicomponent UIC parent uicomponent
---@vararg any
function set_component_active_with_parent(set_active, parent_uicomponent, list_of_string_names) end

--- Highlights or unhighlights a uicomponent by its path. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param activate_highlight boolean Set true to activate the highlight, false to deactivate.
---@param is_square boolean Set to true if the target uicomponent is square, false if it's circular.
---@vararg any
function highlight_component(activate_highlight, is_square, list_of_string_names) end

--- Highlights or unhighlights a uicomponent by its path, but only if it's visible. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param activate_highlight boolean Set true to activate the highlight, false to deactivate.
---@param is_square boolean Set to true if the target uicomponent is square, false if it's circular.
---@vararg any
function highlight_visible_component(activate_highlight, is_square, list_of_string_names) end

--- Draws a box highlight around all visible children of the supplied uicomponent. A padding value in pixels may also be supplied to increase the visual space between the highlight and the components being highlighted.
---@param parent UIC parent
---@param visual_padding number visual padding
function highlight_all_visible_children(parent, visual_padding) end

--- Cancels any and all highlights created with highlight_all_visible_children.
function unhighlight_all_visible_children() end

--- Draws a box highlight stretching around the supplied list of components. A padding value in pixels may also be supplied to increase the visual space between the highlight and the components being highlighted.
---@param visual_padding number Visual padding in pixels.
---@vararg any
function highlight_component_table(visual_padding, uicomponents) end

--- Cancels any and all highlights created with highlight_component_table.
function unhighlight_component_table() end

--- Plays a specified component animation on a uicomponent by its path. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param animation_name string animation name
---@vararg any
function play_component_animation(animation_name, list_of_string_names) end

--- Returns true if the supplied uicomponent has a parent or ancestor that matches the supplied filter, or false otherwise. The filter should be a function that accepts a uicomponent as a single argument and returns true or false depending on whether the uicomponent passes the filter. The first matching ancestor is also returned.
---@param uicomponent UIC uicomponent
---@param filter function filter
function uicomponent_has_parent_filter(uicomponent, filter) end

--- Returns the advisor progress/close button uicomponent.
function get_advisor_progress_button() end

--- Shows or hides the advisor progress/close button.
---@param show_button boolean show button
function show_advisor_progress_button(show_button) end

--- Activates or deactivates a highlight on the advisor progress/close button.
---@param show_button boolean show button
function highlight_advisor_progress_button(show_button) end

--- Gets or creates a script_messager object.
function get_messager() end

--- Writes output to the lua_mod_log.txt text file, and also to the game console.
---@param output_text string output text
function ModLog(output_text) end

--- Casts a component memory address, returned by several functions such as uicomponent:Find, into a valid uicomponent script object so that functions in the uicomponent script interface may be called on it.<br />
--- This function is provided by the UI code.
---@param component_address UIC_Address component address
function UIComponent(component_address) end
