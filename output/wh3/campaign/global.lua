
---@class global
local global = {}

--- Throws a script error with the supplied message, printing the lua callstack to the Lua console output spool. Useful for debugging.
---@param message string Message to print.
---@param stack_level_modifier number If the stack level modifier is set to a negative number then no traceback is printed as part of the script error. This can be useful if the error message itself contains a traceback.
---@param suppress_assert boolean If set to true then no assert is generated with this script error.
function global:script_error(message, stack_level_modifier, suppress_assert) end

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
function global:out(output) end

--- Forceably unloads and requires a file by name.
---@param filename string filename
function global:force_require(filename) end

--- One-shot function to load the script libraries.
function global:load_script_libraries() end

--- 
function global:v() end

--- 
function global:v_from_context_str() end

--- Converts a vector to a string, for debug output
---@param vector <a href="../battle/battle_vector.html#class:battle_vector">battle_vector vector
function global:v_to_s(vector) end

--- Takes a source vector and some x/y/z offset values. Returns a target vector which is offset from the source by the supplied values.
---@param source_vector <a href="../battle/battle_vector.html#class:battle_vector">battle_vector source vector
---@param x_offset number X offset in metres (east-west).
---@param y_offset number Y offset in metres (height).
---@param z_offset number Z offset in metres (north-south).
function global:v_offset(source_vector, x_offset, y_offset, z_offset) end

--- Returns a copy of a vector.
function global:v_copy() end

--- Takes a source vector, a bearing, a distance, and an optional vertical bearing, and returns a vector at the computed position from the source vector. The horizontal bearing rotates in a horizontal plane (i.e. looking top-down), the vertical bearing rotates in a vertical plane (i.e. looking from side).
---@param source_vector <a href="../battle/battle_vector.html#class:battle_vector">battle_vector source vector
---@param bearing number horizontal bearing in radians.
---@param dist number distance in metres.
---@param v_bearing number Vertical bearing in radians.
function global:v_offset_by_bearing(source_vector, bearing, dist, v_bearing) end

--- Takes two vectors, and returns a third which is the sum of both.
---@param vector_a <a href="../battle/battle_vector.html#class:battle_vector">battle_vector vector a
---@param vector_b <a href="../battle/battle_vector.html#class:battle_vector">battle_vector vector b
function global:v_add(vector_a, vector_b) end

--- Takes two vectors, and returns a third which is the second subtracted from the first.
---@param vector_a <a href="../battle/battle_vector.html#class:battle_vector">battle_vector vector a
---@param vector_b <a href="../battle/battle_vector.html#class:battle_vector">battle_vector vector b
function global:v_subtract(vector_a, vector_b) end

--- Returns a <a href="../battle/battle_vector.html#class:battle_vector">battle_vector at a supplied 2D position at a specified height above or below the ground, making use of <a href="../battle/battle.html#function:battle:get_terrain_height">battle:get_terrain_height.
---@param source_position <a href="../battle/battle_vector.html#class:battle_vector">battle_vector Source position. A vertical line will be drawn at this position. Where this line intersects the terrain will be considered height 0.
---@param height_offset number Height offset from ground in metres. This can be negative.
function global:v_to_ground(source_position, height_offset) end

--- Returns a <a href="../battle/battle_vector.html#class:battle_vector">battle_vector at the supplied position at an altitude of at-least the supplied minimum height. If the supplied position is above the minimum height over the terrain then it is returned unaltered.
---@param input_position <a href="../battle/battle_vector.html#class:battle_vector">battle_vector input position
---@param minimum_altitude number minimum altitude
function global:v_min_height(input_position, minimum_altitude) end

--- Takes a table of vectors, buildings, units or scriptunits, and returns a vector which is the mean centre of the positions described by those objects.
---@param position_collection table Table of vectors/buildings/units/scriptunits.
function global:centre_point_table(position_collection) end

--- Returns a vector at a random position near to a supplied vector. Additional parameters allow a min/max distance and a min/max angle in degrees from the source vector to be specified.
---@param source_position vector source position
---@param min_distance number Minimum distance of target position in m.
---@param max_distance number Maximum distance of target position in m.
---@param min_bearing number Minimum bearing of target position in degrees.
---@param max_bearing number Maximum bearing of target position in degrees.
function global:get_position_near_target(source_position, min_distance, max_distance, min_bearing, max_bearing) end

--- Takes a subject vector and a table of vectors/units/sunits/buildings (or a scriptunits collection). Returns the index of the vector in the table/collection which is furthest from the subject vector.
---@param source_position vector source position
---@param position_collection table Table of vector/unit/sunit/building objects, or a scriptunits collection
function global:get_furthest(source_position, position_collection) end

--- Takes a subject vector and a table of vectors/units/sunits/buildings (or a scriptunits collection). Returns the index of the vector in the table/collection which is closest to the subject vector.
---@param source_position vector source position
---@param position_collection table Table of vector/unit/sunit/building objects, or a scriptunits collection
function global:get_nearest(source_position, position_collection) end

--- Takes two vector positions as parameters and a distance in metres, and returns a position which is that distance from the first vector in the direction of the second vector.
---@param first_position <a href="../battle/battle_vector.html#class:battle_vector">battle_vector First position.
---@param second_position <a href="../battle/battle_vector.html#class:battle_vector">battle_vector Second position.
---@param distance number Distance in metres.
function global:position_along_line(first_position, second_position, distance) end

--- Takes two vector positions as parameters and a unary (0-1) proportion, and returns a position which is that proportional distance from the first vector in the direction of the second vector. Unary values outside the range of 0-1 are supported.
---@param first_position <a href="../battle/battle_vector.html#class:battle_vector">battle_vector First position.
---@param second_position <a href="../battle/battle_vector.html#class:battle_vector">battle_vector Second position.
---@param unary_distance number Unary distance.
function global:position_along_line_unary(first_position, second_position, unary_distance) end

--- Returns the dot product of two supplied vectors.
---@param first_position <a href="../battle/battle_vector.html#class:battle_vector">battle_vector first position
---@param second_position <a href="../battle/battle_vector.html#class:battle_vector">battle_vector second position
function global:dot(first_position, second_position) end

--- Returns the normal vector of two supplied vectors.
---@param first_position <a href="../battle/battle_vector.html#class:battle_vector">battle_vector first position
---@param second_position <a href="../battle/battle_vector.html#class:battle_vector">battle_vector second position
function global:normal(first_position, second_position) end

--- Takes two vector positions that describe a 2D line of infinite length, and a target vector position. Returns the distance from the line to the target vector. This distance will be negative if the target is on the left side of the line, and positive if on the right side of the line.
---@param line_position_a <a href="../battle/battle_vector.html#class:battle_vector">battle_vector line position a
---@param line_position_b <a href="../battle/battle_vector.html#class:battle_vector">battle_vector line position b
---@param target_position <a href="../battle/battle_vector.html#class:battle_vector">battle_vector target position
function global:distance_to_line(line_position_a, line_position_b, target_position) end

--- Takes a vector, unit, scriptunit or collection of objects and returns true if any element within it has crossed a line demarked by two supplied vector positions.<br />
--- An optional fourth parameter instructs has_crossed_line to only consider the positions of non-routing units, if set to true.<br />
--- An object is deemed to have 'crossed' the line if it's on the right-hand side of the line.
---@param position_collection any Collection of position objects to test. Supported collection object types are scriptunits, units, army, armies, alliance or a numerically-indexed table of any supported objects.
---@param line_position_a <a href="../battle/battle_vector.html#class:battle_vector">battle_vector line position a
---@param line_position_b <a href="../battle/battle_vector.html#class:battle_vector">battle_vector line position b
---@param standing_only boolean Do not count positions of any routing or dead units
function global:has_crossed_line(position_collection, line_position_a, line_position_b, standing_only) end

--- Returns the bearing in radians from one vector to another. If the vertical bearing flag is supplied then the vertical bearing is returned (i.e. looking from the side), otherwise the horizontal bearing (i.e. looking from above) is returned.
---@param source_vector <a href="../battle/battle_vector.html#class:battle_vector">battle_vector source vector
---@param target_vector <a href="../battle/battle_vector.html#class:battle_vector">battle_vector target vector
---@param vertical_bearing number vertical bearing
function global:get_bearing(source_vector, target_vector, vertical_bearing) end

--- Returns a vector that is offset from a supplied source vector, in a particular horizontal 2d bearing (top-down), at a particular distance and vertical bearing. The function is primarily intended to compute camera position offsets from a supplied target but can be used for any purpose.
---@param source <a href="../battle/battle_vector.html#class:battle_vector">battle_vector source
---@param distance number Distance in m.
---@param h_bearing number Horizontal (top-down) bearing in radians.
---@param v_bearing number Vertical (from-side) bearing in radians.
function global:get_vector_offset_by_bearing(source, distance, h_bearing, v_bearing) end

--- Returns true if the supplied value is of the supplied custom type. This is not intended to be directly called by client scripts, who should instead call one of the is_ functions listed elsewhere.
---@param object table object
---@param custom_type any custom type
function global:is_custom_type(object, custom_type) end

--- Returns the custom type value of the supplied value. If it has no custom type then nil is returned.
---@param object table object
function global:get_custom_type(object) end

--- Sets a supplied class table to the supplied type string by setting its __custom_type value. Once this is set, other object tables that are later set to derive from this class with set_object_class will report this custom type when passed to get_custom_type or is_custom_type.
---@param class_table table class table
---@param custom_type string custom type
function global:set_class_custom_type(class_table, custom_type) end

--- Sets the tostring value of a supplied class table to the specified value by setting its __tostring value. Once this is set, other object tables that are later set to derive from this class with set_object_class will return this value when passed to tostring().<br />
--- The tostring specifier may be supplied as a string or a function. If supplied as a function, that function will be called when the tostring() function is called with an object derived from the supplied class. The object will be supplied as a single argument to the tostring specifier function, which allows the tostring() value to be assembled at runtime and include elements such as the objects name, co-ordinates or other realtime information. The specifier function should return a string.<br />
--- The default behaviour is for the generated string to be cached in the object table, at the __cached_tostring field. Further calls to tostring() will then return the cached string rather than regenerating it each time. If this is undesirable - for example if the generated string might change as the object changes state - then the do_not_cache flag may be set on this function.<br />
--- The flag to not append the memory address may be set if the memory address of the table is not wanted on the end of the returned tostring value. The default behaviour is to append the memory address.
---@param class_table table class table
---@param custom_type string custom type
function global:set_class_tostring(class_table, custom_type) end

--- Sets the custom type and tostring value on the supplied class table to the supplied string value. This function calls set_class_custom_type and set_class_tostring to do this.
---@param class_table table class table
---@param custom_type_value string custom type value
function global:set_class_custom_type_and_tostring(class_table, custom_type_value) end

--- Sets the supplied object to index from the supplied class in a manner that emulates object-orientation. This will set the class to be the metatable of the object and will set the __index field of the metatable also to the supplied class. This means that if functions or values are looked up on the object and are not present they are then looked up on the class. It is through this kind of mechanism that object-orientation may be emulated in lua. Because the class is also the metatable, it means the metatable is shared between objects of the same type. Use set_object_class_unique if this is not desired.<br />
--- set_object_class will also associate the object with any custom type or tostring values that have been previously set up on the class with calls to set_class_custom_type and set_class_tostring.<br />
--- Any number of additional classes and objects may be specified, from which the main supplied object will also derive. If a value (such as a function to be called) is looked up on the object and is not provided on the object or the main class table it derives from, it will be looked up in turn on each additional classes or objects supplied. These additional objects/classes may be table or userdata values.
---@param object_table table Object table.
---@param class_table table Class table.
---@vararg any
function global:set_object_class(object_table, class_table, additional_interfaces) end

--- Sets the supplied object to index from the supplied class in a manner that emulates object-orientation. This will set up a metatable unique to this object and will set the __index field of this metatable to the supplied class. This means that if functions or values are looked up on the object and are not present they are then looked up on the class. It is through this kind of mechanism that object-orientation may be emulated in lua. In contrast to object-to-class relationships set up with set_object_class the metatable is not shared between objects of the same type, which is less memory-efficient but may be desirable in certain circumstances.<br />
--- set_object_class_unique will also associate the object with any custom type or tostring values that have been previously set up on the class with calls to set_class_custom_type and set_class_tostring.<br />
--- Any number of additional classes and objects may be specified, from which the main supplied object will also derive. If a value (such as a function to be called) is looked up on the object and is not provided on the object or the main class table it derives from, it will be looked up in turn on each additional classes or objects supplied. These additional objects/classes may be table or userdata values.
---@param object_table table Object table.
---@param class_table table Class table.
---@vararg any
function global:set_object_class_unique(object_table, class_table, additional_interfaces) end

--- Sets the metatable of the specified class table to the supplied table. This also sets the __is_class_definition field in the metatable which set_object_class uses internally to know the difference between a class definition (which has no concept of self) and an object definition (which does) in certain circumstances. This function is for use in specific situations where a class definition requires a metatable and objects derive from it.
---@param class_table table Class table.
---@param metatable table Metatable.
---@param allow_overwrite boolean Allow the overwriting of the metatable if one already exists.
function global:set_class_metatable(class_table, metatable, allow_overwrite) end

--- Returns true if the supplied value is nil, false otherwise.
---@param value any value
function global:is_nil(value) end

--- Returns true if the supplied value is a number, false otherwise.
---@param value any value
function global:is_number(value) end

--- Returns true if the supplied value is a function, false otherwise.
---@param value any value
function global:is_function(value) end

--- Returns true if the supplied value is a string, false otherwise.
---@param value any value
function global:is_string(value) end

--- Returns true if the supplied value is a boolean, false otherwise.
---@param value any value
function global:is_boolean(value) end

--- Returns true if the supplied value is a table, false otherwise.
---@param value any value
function global:is_table(value) end

--- Returns true if the supplied value is userdata, false otherwise.
---@param value any value
function global:is_userdata(value) end

--- Returns true if the supplied value is a whole number with no decimal component, or false otherwise.
---@param value any value
function global:is_integer(value) end

--- Returns true if the supplied value is a number greater than 0, or false otherwise.
---@param value any value
function global:is_positive_number(value) end

--- Returns true if the supplied value is a number greater than or equal to 0, or false otherwise.
---@param value any value
function global:is_non_negative_number(value) end

--- Returns true if the supplied value is an empty table, or false otherwise.
---@param value any value
function global:is_empty_table(value) end

--- Returns true if the supplied value is a table containing one or more values at any keys, or false otherwise. See also is_non_empty_table_indexed which checks if the values are stored at numerical keys.
---@param value any value
function global:is_non_empty_table(value) end

--- Returns true if the supplied value is a numerically-indexed table containing one or more values, or false otherwise.
---@param value any value
function global:is_non_empty_table_indexed(value) end

--- Returns true if the supplied value is a numerically-indexed table containing one or more string values, or false otherwise.
---@param value any value
function global:is_table_of_strings(value) end

--- Returns true if the supplied value is a string, or a numerically-indexed table containing one or more string values. If the supplied value is neither of these types then false is returned.
---@param value any value
function global:is_string_or_table_of_strings(value) end

--- Returns true if the supplied value is an empty table or a numerically-indexed table containing one or more string values, or false otherwise.
---@param value any value
function global:is_table_of_strings_allow_empty(value) end

--- Returns true if the supplied value is a function or the boolean value true. Event conditions in the scripting library commonly adhere to this format, where an event is received and the condition must either be a function that returns a result, or be the boolean value true. If the supplied value is not true or a function, then false is returned.
---@param value any value
function global:is_condition(value) end

--- Returns true if the supplied value is an event context, false otherwise.
---@param value any value
function global:is_eventcontext(value) end

--- Returns true if the supplied value is a uicomponent, false otherwise.
---@param value any value
function global:is_uicomponent(value) end

--- Returns true if the supplied value is a component memory address, false otherwise.
---@param value any value
function global:is_component(value) end

--- Returns true if the supplied value is a campaign null script interface, false otherwise.
---@param value any value
function global:is_null(value) end

--- Returns true if the supplied value is a campaign model interface, false otherwise.
---@param value any value
function global:is_model(value) end

--- Returns true if the supplied value is a campaign world interface, false otherwise.
---@param value any value
function global:is_world(value) end

--- Returns true if the supplied value is a campaign faction interface, false otherwise.
---@param value any value
function global:is_faction(value) end

--- Returns true if the supplied value is a campaign faction list interface, false otherwise.
---@param value any value
function global:is_factionlist(value) end

--- Returns true if the supplied value is a campaign character interface, false otherwise.
---@param value any value
function global:is_character(value) end

--- Returns true if the supplied value is a campaign family member interface, false otherwise.
---@param value any value
function global:is_family_member(value) end

--- Returns true if the supplied value is a campaign character list interface, false otherwise.
---@param value any value
function global:is_characterlist(value) end

--- Returns true if the supplied value is a campaign region manager interface, false otherwise.
---@param value any value
function global:is_regionmanager(value) end

--- Returns true if the supplied value is a campaign region interface, false otherwise.
---@param value any value
function global:is_region(value) end

--- Returns true if the supplied value is a campaign region data interface, false otherwise.
---@param value any value
function global:is_regiondata(value) end

--- Returns true if the supplied value is a campaign province interface, false otherwise.
---@param value any value
function global:is_province(value) end

--- Returns true if the supplied value is a campaign region list interface, false otherwise.
---@param value any value
function global:is_regionlist(value) end

--- Returns true if the supplied value is a campaign garrison residence interface, false otherwise.
---@param value any value
function global:is_garrisonresidence(value) end

--- Returns true if the supplied value is a campaign settlement interface, false otherwise.
---@param value any value
function global:is_settlement(value) end

--- Returns true if the supplied value is a campaign slot interface, false otherwise.
---@param value any value
function global:is_slot(value) end

--- Returns true if the supplied value is a campaign slot list interface, false otherwise.
---@param value any value
function global:is_slotlist(value) end

--- Returns true if the supplied value is a campaign military force interface, false otherwise.
---@param value any value
function global:is_militaryforce(value) end

--- Returns true if the supplied value is a campaign military force list interface, false otherwise.
---@param value any value
function global:is_militaryforcelist(value) end

--- Returns true if the supplied value is a unit object, false otherwise. This works in both campaign and battle on their respective unit object types.
---@param value any value
function global:is_unit(value) end

--- Returns true if the supplied value is a campaign unit list interface, false otherwise.
---@param value any value
function global:is_unitlist(value) end

--- Returns true if the supplied value is a campaign pending battle interface, false otherwise.
---@param value any value
function global:is_pendingbattle(value) end

--- Returns true if the supplied value is a campaign mission interface, false otherwise.
---@param value any value
function global:is_campaignmission(value) end

--- Returns true if the supplied value is a campaign ai interface, false otherwise.
---@param value any value
function global:is_campaignai(value) end

--- Returns true if the supplied value is a building list object, false otherwise.
---@param value any value
function global:is_buildinglist(value) end

--- Returns true if the supplied value is a building object in campaign or battle, false otherwise.
---@param value any value
function global:is_building(value) end

--- Returns true if the supplied value is a foreign slot manager interface, false otherwise.
---@param value any value
function global:is_foreignslotmanager(value) end

--- Returns true if the supplied value is a foreign slot interface, false otherwise.
---@param value any value
function global:is_foreignslot(value) end

--- Returns true if the supplied value is a battle sound effect, false otherwise.
---@param value any value
function global:is_battlesoundeffect(value) end

--- Returns true if the supplied value is an empire battle object, false otherwise.
---@param value any value
function global:is_battle(value) end

--- Returns true if the supplied value is an alliances object, false otherwise.
---@param value any value
function global:is_alliances(value) end

--- Returns true if the supplied value is an alliance, false otherwise.
---@param value any value
function global:is_alliance(value) end

--- Returns true if the supplied value is an armies object, false otherwise.
---@param value any value
function global:is_armies(value) end

--- Returns true if the supplied value is an army object, false otherwise.
---@param value any value
function global:is_army(value) end

--- Returns true if the supplied value is a units object, false otherwise.
---@param value any value
function global:is_units(value) end

--- Returns true if the supplied value is a unitcontroller, false otherwise.
---@param value any value
function global:is_unitcontroller(value) end

--- Returns true if the supplied value is a vector object, false otherwise.
---@param value any value
function global:is_vector(value) end

--- Returns true if the supplied value is a buildings object, false otherwise.
---@param value any value
function global:is_buildings(value) end

--- Returns true if the supplied value is a battle subtitles object, false otherwise.
---@param value any value
function global:is_subtitles(value) end

--- Returns true if the supplied value is a core object, false otherwise.
---@param value any value
function global:is_core(value) end

--- Returns true if the supplied value is a timer manager, false otherwise.
---@param value any value
function global:is_timermanager(value) end

--- Returns true if the supplied value is a script messager, false otherwise.
---@param value any value
function global:is_scriptmessager(value) end

--- Returns true if the supplied value is a custom event context, false otherwise.
---@param value any value
function global:is_customcontext(value) end

--- Returns true if the supplied value is an objectives_manager, false otherwise.
---@param value any value
function global:is_objectivesmanager(value) end

--- Returns true if the supplied value is an infotext_manager, false otherwise.
---@param value any value
function global:is_infotextmanager(value) end

--- Returns true if the supplied value is a link parser, false otherwise.
---@param value any value
function global:is_linkparser(value) end

--- Returns true if the supplied value is a tooltip listener, false otherwise.
---@param value any value
function global:is_tooltiplistener(value) end

--- Returns true if the supplied value is a context visibility monitor, false otherwise.
---@param value any value
function global:is_contextvisibilitymonitor(value) end

--- Returns true if the supplied value is a tooltip patcher, false otherwise.
---@param value any value
function global:is_tooltippatcher(value) end

--- Returns true if the supplied value is a help page manager, false otherwise.
---@param value any value
function global:is_helppagemanager(value) end

--- Returns true if the supplied value is a help page, false otherwise.
---@param value any value
function global:is_helppage(value) end

--- Returns true if the supplied value is a text pointer, false otherwise.
---@param value any value
function global:is_textpointer(value) end

--- Returns true if the supplied value is an active pointer, false otherwise.
---@param value any value
function global:is_activepointer(value) end

--- Returns true if the supplied value is a scripted tour, false otherwise.
---@param value any value
function global:is_scriptedtour(value) end

--- Returns true if the supplied value is a navigable tour, false otherwise.
---@param value any value
function global:is_navigabletour(value) end

--- Returns true if the supplied value is a navigable tour section, false otherwise.
---@param value any value
function global:is_navigabletoursection(value) end

--- Returns true if the supplied value is a movie_overlay, false otherwise.
---@param value any value
function global:is_movieoverlay(value) end

--- Returns true if the supplied value is a windowed_movie_player, false otherwise.
---@param value any value
function global:is_windowedmovieplayer(value) end

--- Returns true if the supplied value is a topic_leader, false otherwise.
---@param value any value
function global:is_topicleader(value) end

--- Returns true if the supplied value is a campaign manager, false otherwise.
---@param value any value
function global:is_campaignmanager(value) end

--- Returns true if the supplied value is a faction start object, false otherwise.
---@param value any value
function global:is_factionstart(value) end

--- Returns true if the supplied value is a campaign cutscene, false otherwise.
---@param value any value
function global:is_campaigncutscene(value) end

--- Returns true if the supplied value is a ui override, false otherwise.
---@param value any value
function global:is_uioverride(value) end

--- Returns true if the supplied value is a campaign ui manager, false otherwise.
---@param value any value
function global:is_campaignuimanager(value) end

--- Returns true if the supplied value is a mission manager, false otherwise.
---@param value any value
function global:is_missionmanager(value) end

--- Returns true if the supplied value is a chapter mission, false otherwise.
---@param value any value
function global:is_chaptermission(value) end

--- Returns true if the supplied value is an intervention, false otherwise.
---@param value any value
function global:is_intervention(value) end

--- Returns true if the supplied value is an intervention manager, false otherwise.
---@param value any value
function global:is_interventionmanager(value) end

--- Returns true if the supplied value is an invasion manager, false otherwise.
---@param value any value
function global:is_invasionmanager(value) end

--- Returns true if the supplied value is a random army manager, false otherwise.
---@param value any value
function global:is_randomarmy(value) end

--- Returns true if the supplied value is a narrative_event, false otherwise.
---@param value any value
function global:is_narrativeevent(value) end

--- Returns true if the supplied value is a narrative_query, false otherwise.
---@param value any value
function global:is_narrativequery(value) end

--- Returns true if the supplied value is a narrative_trigger, false otherwise.
---@param value any value
function global:is_narrativetrigger(value) end

--- Returns true if the supplied value is an intro_campaign_camera_marker, false otherwise.
---@param value any value
function global:is_introcampaigncameramarker(value) end

--- Returns true if the supplied value is an intro_campaign_camera_positions_advice, false otherwise.
---@param value any value
function global:is_introcampaigncamerapositionsadvice(value) end

--- Returns true if the supplied value is a <a href="../battle/battle_manager.html#class:battle_manager">battle_manager, false otherwise.
---@param value any value
function global:is_battlemanager(value) end

--- Returns true if the supplied value is a battle cutscene, false otherwise.
---@param value any value
function global:is_cutscene(value) end

--- Returns true if the supplied value is a convex_area, false otherwise.
---@param value any value
function global:is_convexarea(value) end

--- Returns true if the supplied value is a <a href="../battle/script_unit.html#class:script_unit">script_unit, false otherwise.
---@param value any value
function global:is_scriptunit(value) end

--- Returns true if the supplied value is a <a href="../battle/script_unit.html#class:script_units">script_units object, false otherwise.
---@param value any value
function global:is_scriptunits(value) end

--- Returns true if the supplied value is a patrol manager, false otherwise.
---@param value any value
function global:is_patrolmanager(value) end

--- Returns true if the supplied value is a patrol manager waypoint, false otherwise.
---@param value any value
function global:is_waypoint(value) end

--- Returns true if the supplied value is a script ai planner, false otherwise.
---@param value any value
function global:is_scriptaiplanner(value) end

--- Returns true if the supplied value is a generated battle, false otherwise.
---@param value any value
function global:is_generatedbattle(value) end

--- Returns true if the supplied value is a generated army, false otherwise.
---@param value any value
function global:is_generatedarmy(value) end

--- Returns true if the supplied value is a generated cutscene, false otherwise.
---@param value any value
function global:is_generatedcutscene(value) end

--- Returns true if the supplied value is an advice manager, false otherwise.
---@param value any value
function global:is_advicemanager(value) end

--- Returns true if the supplied value is an advice monitor, false otherwise.
---@param value any value
function global:is_advicemonitor(value) end

--- Returns true if the supplied value is an attack lane manager, false otherwise.
---@param value any value
function global:is_attacklanemanager(value) end

--- An iterator for use with model objects in campaign and battle. When used in a for loop with a model list object, the iterator function returns the index and next item provided by the list object each loop pass.<br />
--- In campaign, this iterator supports all model list objects such as region_list, character_list, military_force_list etc. In battle, this iterator supports model list objects such as <a href="../battle/battle_alliances.html#class:battle_alliances">battle_alliances, <a href="../battle/battle_armies.html#class:battle_armies">battle_armies and <a href="../battle/battle_units.html#class:battle_units">battle_units, as well as <a href="../battle/script_unit.html#class:script_units">script_units script collection objects.
---@param parent_list_object any parent list object
function global:model_pairs(parent_list_object) end

--- An iterator for use with uicomponent objects, which returns each child in succession. When used in a for loop with a uicomponent object, the iterator function returns the index number and the child corresponding to that index each loop pass.
---@param parent_uicomponent_object UIC parent uicomponent object
function global:uic_pairs(parent_uicomponent_object) end

--- Converts a supplied angle in radians to degrees.
---@param angle number Angle in radians
function global:r_to_d(angle) end

--- Converts a supplied angle in degrees to radians.
---@param angle number Angle in degrees
function global:d_to_r(angle) end

--- Returns the file and path of the calling script as a table of strings.
---@param stack_offset integer Supply a positive integer here to return a result for a different file on the callstack e.g. supply '1' to return the file and folder path of the script file calling the the script file calling this function, for example.
function global:get_file_and_folder_path_as_table(stack_offset) end

--- Returns the folder name of the calling file and the shortform of its filename as separate return parameters. The shortform of the filename is the portion of the filename before the first "_", if one is found. If no shortform is found the function returns only the folder name.<br />
--- A shortform used to be prepended on battle script files to allow them to be easily differentiated from one another in text editors e.g. "TF_battle_main.lua" vs "PY_battle_main.lua" rather than two "battle_main.lua"'s.
---@param stack_offset integer Supply a positive integer here to return a result for a different file on the callstack e.g. supply '1' to return the folder name/shortform of the script file calling the the script file calling this function, for example.
function global:get_folder_name_and_shortform(stack_offset) end

--- Gets the full filepath and name of the calling file.
---@param stack_offset integer Supply a positive integer here to return a result for a different file on the callstack e.g. supply '1' to return the file path of the script file calling the the script file calling this function, for example.
function global:get_full_file_path(stack_offset) end

--- Returns the filename and the filepath of the calling file as separate return parameters.
---@param stack_offset integer Supply a positive integer here to return a result for a different file on the callstack e.g. supply '1' to return the file name and path of the script file calling the the script file calling this function, for example.
function global:get_file_name_and_path(stack_offset) end

--- Takes a uicomponent and a string name. Searches the direct children (and no further - not grandchildren etc) of the supplied uicomponent for another uicomponent with the supplied name. If a uicomponent with the matching name is found then it is returned, otherwise false is returned.
---@param parent_ui_component UIC parent ui component
---@param name string name
function global:find_child_uicomponent(parent_ui_component, name) end

--- Takes a uicomponent and an index. Searches the direct children (and no further - not grandchildren etc) of the supplied uicomponent. If a uicomponent with the correct index is found then it is returned, otherwise false is returned.
---@param parent_ui_component UIC parent ui component
---@param index number starting at 0
function global:find_child_uicomponent_by_index(parent_ui_component, index) end

--- Finds and returns a uicomponent based on a set of strings that define its path in the ui hierarchy. This parent uicomponent can be supplied as the first argument - if omitted, the root uicomponent is used. Starting from the parent or root, the function searches through all descendants for a uicomponent with the next supplied uicomponent name in the sequence. If a uicomponent is found, its descendants are then searched for a uicomponent with the next name in the list, and so on until the list is finished or no uicomponent with the supplied name is found. A fragmentary path may be supplied if it still unambiguously specifies the intended uicomponent.
---@param parent_ui_component UIC parent ui component
---@vararg any
function global:find_uicomponent(parent_ui_component, list_of_string_names) end

--- Takes a start uicomponent and a numerically-indexed table of string uicomponent names. Starting from the supplied start uicomponent, the function searches through all descendants for a uicomponent with the next supplied uicomponent name in the table. If a uicomponent is found, its descendants are then searched for a uicomponent with the next name in the list, and so on until the list is finished or no uicomponent with the supplied name is found. This allows a uicomponent to be searched for by matching its name and part of or all of its path.
---@param parent_ui_component UIC Parent uicomponent.
---@param table_of_string_names table Table of string names, indexed by number.
---@param on_failure assert Fire a script error if the search fails.
function global:find_uicomponent_from_table(parent_ui_component, table_of_string_names, on_failure) end

--- Takes a uicomponent and a string name. Returns true if any parent ancestor component all the way up to the ui root has the supplied name (i.e. the supplied component is descended from it), false otherwise.
---@param subject_uic UIC subject uic
---@param parent_name string parent name
function global:uicomponent_descended_from(subject_uic, parent_name) end

--- Converts a uicomponent to a string showing its path, for output purposes.
---@param subject_uic UIC subject uic
function global:uicomponent_to_str(subject_uic) end

--- Outputs extensive debug information about a supplied uicomponent to the Lua - UI console spool.
---@param subject_uic UIC Subject uicomponent.
---@param omit_children boolean Do not show information about the uicomponent's children.
function global:output_uicomponent(subject_uic, omit_children) end

--- Starts a listener which outputs debug information to the Lua - UI console spool about every uicomponent that's clicked on.
function global:output_uicomponent_on_click() end

--- Prints the name and path of the supplied uicomponent and all its descendents. Very verbose, and can take a number of seconds to complete.
---@param subject_uic UIC subject uic
---@param full_output boolean full output
function global:print_all_uicomponent_children(subject_uic, full_output) end

--- Activates or deactivates a pulsing highlight effect on a particular state of the supplied uicomponent. This is primarily used for scripts which activate when the player moves the mouse cursor over certain words in the help pages, to indicate to the player what UI feature is being talked about on the page.
---@param ui_component UIC Subject ui component.
---@param should_pulse boolean Set to true to activate the pulsing effect, false to deactivate it.
---@param brightness number Pulse brightness. Set a higher number for a more pronounced pulsing effect.
---@param progagate boolean Propagate the effect through the component's children. Use this with care, as the visual effect can stack and often it's better to activate the effect on specific uicomponents instead of activating this.
---@param state_name string Optional state name to affect. If no string state name is supplied here then the current state is used.
function global:pulse_uicomponent(ui_component, should_pulse, brightness, progagate, state_name) end

--- Returns true if the uicomponent is fully on-screen, false otherwise.
---@param uicomponent UIC uicomponent
function global:is_fully_onscreen(uicomponent) end

--- Returns true if the uicomponent is partially on-screen, false otherwise.
---@param uicomponent UIC uicomponent
function global:is_partially_onscreen(uicomponent) end

--- Sets a uicomponent visible or invisible by its path. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param set_visible boolean set visible
---@vararg any
function global:set_component_visible(set_visible, list_of_string_names) end

--- Sets a uicomponent visible or invisible by its path. The path should be one or more strings which when sequentially searched for from a supplied uicomponent parent lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param set_visible boolean set visible
---@param parent_uicomponent UIC parent uicomponent
---@vararg any
function global:set_component_visible_with_parent(set_visible, parent_uicomponent, list_of_string_names) end

--- Sets a uicomponent to be active or inactive by its path. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param set_active boolean set active
---@vararg any
function global:set_component_active(set_active, list_of_string_names) end

--- Sets a uicomponent to be active or inactive by its path. The path should be one or more strings which when sequentially searched for from a supplied uicomponent parent lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param set_active boolean set active
---@param parent_uicomponent UIC parent uicomponent
---@vararg any
function global:set_component_active_with_parent(set_active, parent_uicomponent, list_of_string_names) end

--- Highlights or unhighlights a uicomponent by its path. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param activate_highlight boolean Set true to activate the highlight, false to deactivate.
---@param is_square boolean Set to true if the target uicomponent is square, false if it's circular.
---@vararg any
function global:highlight_component(activate_highlight, is_square, list_of_string_names) end

--- Highlights or unhighlights a uicomponent by its path, but only if it's visible. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param activate_highlight boolean Set true to activate the highlight, false to deactivate.
---@param is_square boolean Set to true if the target uicomponent is square, false if it's circular.
---@vararg any
function global:highlight_visible_component(activate_highlight, is_square, list_of_string_names) end

--- Draws a box highlight around all visible children of the supplied uicomponent. A padding value in pixels may also be supplied to increase the visual space between the highlight and the components being highlighted.
---@param parent UIC parent
---@param visual_padding number visual padding
function global:highlight_all_visible_children(parent, visual_padding) end

--- Cancels any and all highlights created with highlight_all_visible_children.
function global:unhighlight_all_visible_children() end

--- Draws a box highlight stretching around the supplied list of components. A padding value in pixels may also be supplied to increase the visual space between the highlight and the components being highlighted.
---@param visual_padding number Visual padding in pixels.
---@vararg any
function global:highlight_component_table(visual_padding, uicomponents) end

--- Cancels any and all highlights created with highlight_component_table.
function global:unhighlight_component_table() end

--- Plays a specified component animation on a uicomponent by its path. The path should be one or more strings which when sequentially searched for from the ui root lead to the target uicomponent (see documentation for find_uicomponent_from_table, which performs the search).
---@param animation_name string animation name
---@vararg any
function global:play_component_animation(animation_name, list_of_string_names) end

--- Returns true if the supplied uicomponent has a parent or ancestor that matches the supplied filter, or false otherwise. The filter should be a function that accepts a uicomponent as a single argument and returns true or false depending on whether the uicomponent passes the filter. The first matching ancestor is also returned.
---@param uicomponent UIC uicomponent
---@param filter function filter
function global:uicomponent_has_parent_filter(uicomponent, filter) end

--- Returns the advisor progress/close button uicomponent.
function global:get_advisor_progress_button() end

--- Shows or hides the advisor progress/close button.
---@param show_button boolean show button
function global:show_advisor_progress_button(show_button) end

--- Activates or deactivates a highlight on the advisor progress/close button.
---@param show_button boolean show button
function global:highlight_advisor_progress_button(show_button) end

--- Gets an infotext manager, or creates one if one doesn't already exist.
function global:get_infotext_manager() end

--- Gets an objectives manager, or creates one if one doesn't already exist.
function global:get_objectives_manager() end

--- Gets or creates a script_messager object.
function global:get_messager() end

--- Writes output to the lua_mod_log.txt text file, and also to the game console.
---@param output_text string output text
function global:ModLog(output_text) end

--- Casts a component memory address, returned by several functions such as uicomponent:Find, into a valid uicomponent script object so that functions in the uicomponent script interface may be called on it.<br />
--- This function is provided by the UI code.
---@param component_address UIC_Address component address
function global:UIComponent(component_address) end
