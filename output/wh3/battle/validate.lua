--- THIS FILE IS AUTOMATICALLY GENERATED. DO NOT EDIT MANUALLY.

---@class validate
local validate = {}

--- Throws a script_error and returns false if the supplied value is not nil. If the supplied value is nil then true is returned.
---@param value any #value
---@return boolean #value is nil 
function validate.is_nil(value) end

--- Throws a script_error and returns false if the supplied value is not a number. If the supplied value is a number then true is returned.
---@param value any #value
---@return boolean #value is a number 
function validate.is_number(value) end

--- Throws a script_error and returns false if the supplied value is not a function. If the supplied value is a function then true is returned.
---@param value any #value
---@return boolean #value is a function 
function validate.is_function(value) end

--- Throws a script_error and returns false if the supplied value is not a string. If the supplied value is a string then true is returned.
---@param value any #value
---@return boolean #value is a string 
function validate.is_string(value) end

--- Throws a script_error and returns false if the supplied value is not a boolean. If the supplied value is a boolean then true is returned.
---@param value any #value
---@return boolean #value is a boolean 
function validate.is_boolean(value) end

--- Throws a script_error and returns false if the supplied value is not a boolean or nil. If the supplied value is a boolean or nil then true is returned.
---@param value any #value
---@return boolean #value is a boolean 
function validate.is_boolean_or_nil(value) end

--- Throws a script_error and returns false if the supplied value is not a table. If the supplied value is a table then true is returned.
---@param value any #value
---@return boolean #value is a table 
function validate.is_table(value) end

--- Throws a script_error and returns false if the supplied value is not userdata. If the supplied value is userdata then true is returned.
---@param value any #value
---@return boolean #value is userdata 
function validate.is_userdata(value) end

--- Throws a script_error and returns false if the supplied value is not an integer value. If the supplied value is an integer then true is returned.
---@param value any #value
---@return boolean #value is an integer 
function validate.is_integer(value) end

--- Throws a script_error and returns false if the supplied value is not a number greater than zero. If the supplied value is a positive number then true is returned.
---@param value any #value
---@return boolean #value is a positive number 
function validate.is_positive_number(value) end

--- Throws a script_error and returns false if the supplied value is not a number greater than or equal to zero. If the supplied value is a non-negative number then true is returned.
---@param value any #value
---@return boolean
function validate.is_non_negative_number(value) end

--- Throws a script_error and returns false if the supplied value is not a non-empty table. If the supplied value is considered to be a non-empty indexed table then true is returned. See also validate.is_non_empty_table_indexed which should be used for numerically-indexed tables in place of this function.
---@param value any #value
---@return boolean
function validate.is_non_empty_table(value) end

--- Throws a script_error and returns false if the supplied value is not a non-empty indexed table. An indexed table contains values stored in elements with keys which are ascending integer numbers, starting at 1. Values stored at keys that are not ascending integers are not queried by this test, so a table that contains only values stored in elements with string keys will not count as a "non empty table indexed". If the supplied value is considered to be a non-empty indexed table then true is returned.
---@param value any #value
---@return boolean
function validate.is_non_empty_table_indexed(value) end

--- Throws a script_error and returns false if the supplied value is not a numerically-indexed table of strings. If the supplied value is a table of strings then true is returned.
---@param value any #value
---@return boolean #value is a table of strings 
function validate.is_table_of_strings(value) end

--- Throws a script_error and returns false if the supplied value is not a string, or a numerically-indexed table of strings. If the supplied value is either of these value types then true is returned.
---@param value any #value
---@return boolean
function validate.is_string_or_table_of_strings(value) end

--- Throws a script_error and returns false if the supplied value is not an empty table or a numerically-indexed table of strings. If the supplied value is either of these value types then true is returned.
---@param value any #value
---@return boolean
function validate.is_table_of_strings_allow_empty(value) end

--- Throws a script_error and returns false if the supplied value is not a function or the boolean value true. Event conditions in the scripting library commonly adhere to this format, where an event is received and the condition must either be a function that returns a result, or be the boolean value true. If the supplied value is a condition then true is returned.
---@param value any #value
---@return boolean #value is a function or true 
function validate.is_condition(value) end

--- Throws a script_error and returns false if the supplied value is not an event context. If the supplied value is an event context then true is returned.
---@param value any #value
---@return boolean #value is an event context 
function validate.is_eventcontext(value) end

--- Throws a script_error and returns false if the supplied value is not a uicomponent. If the supplied value is a uicomponent then true is returned.
---@param value any #value
---@return boolean #value is an event context 
function validate.is_uicomponent(value) end

--- Throws a script_error and returns false if the supplied value is not a component memory address. If the supplied value is a component memory address then true is returned.
---@param value any #value
---@return boolean #value is a component memory address 
function validate.is_component(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign null script interface. If the supplied value is a null script interface then true is returned.
---@param value any #value
---@return boolean #value is a null script interface 
function validate.is_null(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign model interface. If the supplied value is a model interface then true is returned.
---@param value any #value
---@return boolean #value is a model interface 
function validate.is_model(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign world interface. If the supplied value is a world interface then true is returned.
---@param value any #value
---@return boolean #value is a world interface 
function validate.is_world(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign faction interface. If the supplied value is a faction interface then true is returned.
---@param value any #value
---@return boolean #value is a faction interface 
function validate.is_faction(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign faction list interface. If the supplied value is a faction list interface then true is returned.
---@param value any #value
---@return boolean #value is a faction list interface 
function validate.is_factionlist(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign character interface. If the supplied value is a character interface then true is returned.
---@param value any #value
---@return boolean #value is a character interface 
function validate.is_character(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign family member interface. If the supplied value is a family member interface then true is returned.
---@param value any #value
---@return boolean #value is a family member interface 
function validate.is_familymember(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign character list interface. If the supplied value is a character list interface then true is returned.
---@param value any #value
---@return boolean #value is a character list interface 
function validate.is_characterlist(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign region manager interface. If the supplied value is a region manager interface then true is returned.
---@param value any #value
---@return boolean #value is a region manager interface 
function validate.is_regionmanager(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign region interface. If the supplied value is a region interface then true is returned.
---@param value any #value
---@return boolean #value is a region interface 
function validate.is_region(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign region data interface. If the supplied value is a region data interface then true is returned.
---@param value any #value
---@return boolean #value is a region data interface 
function validate.is_regiondata(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign province interface. If the supplied value is a province interface then true is returned.
---@param value any #value
---@return boolean #value is a province interface 
function validate.is_province(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign faction province interface. If the supplied value is a faction province interface then true is returned.
---@param value any #value
---@return boolean #value is a faction province interface 
function validate.is_factionprovince(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign region list interface. If the supplied value is a region list interface then true is returned.
---@param value any #value
---@return boolean #value is a region list interface 
function validate.is_regionlist(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign garrison residence interface. If the supplied value is a garrison residence interface then true is returned.
---@param value any #value
---@return boolean #value is a garrison residence interface 
function validate.is_garrisonresidence(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign settlement interface. If the supplied value is a settlement interface then true is returned.
---@param value any #value
---@return boolean #value is a settlement interface 
function validate.is_settlement(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign slot interface. If the supplied value is a slot interface then true is returned.
---@param value any #value
---@return boolean #value is a slot interface 
function validate.is_slot(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign slot list interface. If the supplied value is a slot list interface then true is returned.
---@param value any #value
---@return boolean #value is a slot list interface 
function validate.is_slotlist(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign military force interface. If the supplied value is a military force interface then true is returned.
---@param value any #value
---@return boolean #value is a military force interface 
function validate.is_militaryforce(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign military force list interface. If the supplied value is a military force list interface then true is returned.
---@param value any #value
---@return boolean #value is a military force list interface 
function validate.is_militaryforcelist(value) end

--- Throws a script_error and returns false if the supplied value is not a unit interface. If the supplied value is a unit interface then true is returned. This works in both campaign and battle on their respective unit object types.
---@param value any #value
---@return boolean #value is a unit interface 
function validate.is_unit(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign unit list interface. If the supplied value is a unit list interface then true is returned.
---@param value any #value
---@return boolean #value is a unit list interface 
function validate.is_unitlist(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign pending battle interface. If the supplied value is a pending battle interface then true is returned.
---@param value any #value
---@return boolean #value is a pending battle interface 
function validate.is_pendingbattle(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign mission interface. If the supplied value is a mission interface then true is returned.
---@param value any #value
---@return boolean #value is a mission interface 
function validate.is_campaignmission(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign ai interface. If the supplied value is a campaign ai interface then true is returned.
---@param value any #value
---@return boolean #value is a campaign ai interface 
function validate.is_campaignai(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign building list interface. If the supplied value is a building list interface then true is returned.
---@param value any #value
---@return boolean #value is a building list interface 
function validate.is_buildinglist(value) end

--- Throws a script_error and returns false if the supplied value is not a building interface. If the supplied value is a building interface then true is returned. This works in both campaign and battle on their respective object types.
---@param value any #value
---@return boolean #value is a building interface 
function validate.is_building(value) end

--- Throws a script_error and returns false if the supplied value is not a foreign slot manager interface. If the supplied value is a foreign slot manager interface then true is returned.
---@param value any #value
---@return boolean #value is a foreign slot manager interface 
function validate.is_foreignslotmanager(value) end

--- Throws a script_error and returns false if the supplied value is not a foreign slot interface. If the supplied value is a foreign slot interface then true is returned.
---@param value any #value
---@return boolean #value is a foreign slot interface 
function validate.is_foreignslot(value) end

--- Throws a script_error and returns false if the supplied value is not a battle sound effect. If the supplied value is a battle sound effect then true is returned.
---@param value any #value
---@return boolean #value is a battle sound effect 
function validate.is_battlesoundeffect(value) end

--- Throws a script_error and returns false if the supplied value is not a battle object. If the supplied value is a battle object then true is returned.
---@param value any #value
---@return boolean #value is a battle object 
function validate.is_battle(value) end

--- Throws a script_error and returns false if the supplied value is not an alliances collection object. If the supplied value is an alliances object then true is returned.
---@param value any #value
---@return boolean #value is an alliances object 
function validate.is_alliances(value) end

--- Throws a script_error and returns false if the supplied value is not an alliance object. If the supplied value is an alliance object then true is returned.
---@param value any #value
---@return boolean #value is an alliance object 
function validate.is_alliance(value) end

--- Throws a script_error and returns false if the supplied value is not an armies collection object. If the supplied value is an armies object then true is returned.
---@param value any #value
---@return boolean #value is an armies object 
function validate.is_armies(value) end

--- Throws a script_error and returns false if the supplied value is not an army object. If the supplied value is an army object then true is returned.
---@param value any #value
---@return boolean #value is an army object 
function validate.is_army(value) end

--- Throws a script_error and returns false if the supplied value is not a units collection object. If the supplied value is a units object then true is returned.
---@param value any #value
---@return boolean #value is a units object 
function validate.is_units(value) end

--- Throws a script_error and returns false if the supplied value is not a unitcontroller object. If the supplied value is a unitcontroller object then true is returned.
---@param value any #value
---@return boolean #value is a unitcontroller object 
function validate.is_unitcontroller(value) end

--- Throws a script_error and returns false if the supplied value is not a battle vector object. If the supplied value is a vector object then true is returned.
---@param value any #value
---@return boolean #value is a battle vector object 
function validate.is_vector(value) end

--- Throws a script_error and returns false if the supplied value is not a buildings collection object. If the supplied value is a buildings collection object then true is returned.
---@param value any #value
---@return boolean #value is a buildings collection object 
function validate.is_buildings(value) end

--- Throws a script_error and returns false if the supplied value is not a subtitles object. If the supplied value is a subtitles object then true is returned.
---@param value any #value
---@return boolean #value is a subtitles object 
function validate.is_subtitles(value) end

--- Throws a script_error and returns false if the supplied value is not a core script object. If the supplied value is a core object then true is returned.
---@param value any #value
---@return boolean #value is a core object 
function validate.is_core(value) end

--- Throws a script_error and returns false if the supplied value is not a timer manager script object. If the supplied value is a timer manager then true is returned.
---@param value any #value
---@return boolean #value is a timer manager object 
function validate.is_timermanager(value) end

--- Throws a script_error and returns false if the supplied value is not a script messager object. If the supplied value is a script messager then true is returned.
---@param value any #value
---@return boolean #value is a script messager object 
function validate.is_scriptmessager(value) end

--- Throws a script_error and returns false if the supplied value is not a custom event context object. If the supplied value is a custom context then true is returned.
---@param value any #value
---@return boolean #value is a script messager object 
function validate.is_customcontext(value) end

--- Throws a script_error and returns false if the supplied value is not an objectives manager script object. If the supplied value is an objectives manager then true is returned.
---@param value any #value
---@return boolean #value is an objectives manager object 
function validate.is_objectivesmanager(value) end

--- Throws a script_error and returns false if the supplied value is not an infotext manager script object. If the supplied value is an infotext manager then true is returned.
---@param value any #value
---@return boolean #value is an infotext manager object 
function validate.is_infotextmanager(value) end

--- Throws a script_error and returns false if the supplied value is not a link parser script object. If the supplied value is a link parser then true is returned.
---@param value any #value
---@return boolean #value is a link parser object 
function validate.is_linkparser(value) end

--- Throws a script_error and returns false if the supplied value is not a tooltip listener script object. If the supplied value is a tooltip listener then true is returned.
---@param value any #value
---@return boolean #value is a tooltip listener object 
function validate.is_tooltiplistener(value) end

--- Throws a script_error and returns false if the supplied value is not a tooltip patcher script object. If the supplied value is a tooltip patcher then true is returned.
---@param value any #value
---@return boolean #value is a tooltip patcher object 
function validate.is_tooltippatcher(value) end

--- Throws a script_error and returns false if the supplied value is not a help page manager script object. If the supplied value is a help page manager then true is returned.
---@param value any #value
---@return boolean #value is a help page manager object 
function validate.is_helppagemanager(value) end

--- Throws a script_error and returns false if the supplied value is not a help page script object. If the supplied value is a help page then true is returned.
---@param value any #value
---@return boolean #value is a help page object 
function validate.is_helppage(value) end

--- Throws a script_error and returns false if the supplied value is not a text pointer script object. If the supplied value is a text pointer then true is returned.
---@param value any #value
---@return boolean #value is a help page object 
function validate.is_textpointer(value) end

--- Throws a script_error and returns false if the supplied value is not an active pointer script object. If the supplied value is an active pointer then true is returned.
---@param value any #value
---@return boolean #value is an active pointer object 
function validate.is_activepointer(value) end

--- Throws a script_error and returns false if the supplied value is not a scripted tour object. If the supplied value is a scripted tour then true is returned.
---@param value any #value
---@return boolean #value is a scripted tour object 
function validate.is_scriptedtour(value) end

--- Throws a script_error and returns false if the supplied value is not a navigable tour object. If the supplied value is a navigable tour then true is returned.
---@param value any #value
---@return boolean #value is a navigable tour object 
function validate.is_navigabletour(value) end

--- Throws a script_error and returns false if the supplied value is not a navigable tour section object. If the supplied value is a navigable tour section then true is returned.
---@param value any #value
---@return boolean #value is a navigable tour section object 
function validate.is_navigabletoursection(value) end

--- Throws a script_error and returns false if the supplied value is not a movie overlay script object. If the supplied value is a movie overlay then true is returned.
---@param value any #value
---@return boolean #value is a movie overlay object 
function validate.is_movieoverlay(value) end

--- Throws a script_error and returns false if the supplied value is not a windowed movie player script object. If the supplied value is a windowed movie player then true is returned.
---@param value any #value
---@return boolean #value is a windowed movie player object 
function validate.is_windowedmovieplayer(value) end

--- Throws a script_error and returns false if the supplied value is not a topic leader script object. If the supplied value is a topic leader then true is returned.
---@param value any #value
---@return boolean #value is a topic leader object 
function validate.is_topicleader(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign manager script object. If the supplied value is a campaign manager then true is returned.
---@param value any #value
---@return boolean #value is a campaign manager script object 
function validate.is_campaignmanager(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign cutscene script object. If the supplied value is a campaign cutscene then true is returned.
---@param value any #value
---@return boolean #value is a campaign cutscene script object 
function validate.is_campaigncutscene(value) end

--- Throws a script_error and returns false if the supplied value is not a ui override script object. If the supplied value is a ui override then true is returned.
---@param value any #value
---@return boolean #value is a ui override script object 
function validate.is_uioverride(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign ui manager script object. If the supplied value is a campaign ui manager then true is returned.
---@param value any #value
---@return boolean #value is a campaign ui manager script object 
function validate.is_campaignuimanager(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign mission manager script object. If the supplied value is a campaign mission manager then true is returned.
---@param value any #value
---@return boolean #value is a campaign mission manager script object 
function validate.is_missionmanager(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign chapter mission script object. If the supplied value is a chapter mission then true is returned.
---@param value any #value
---@return boolean #value is a campaign chapter mission script object 
function validate.is_chaptermission(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign intervention script object. If the supplied value is an intervention then true is returned.
---@param value any #value
---@return boolean #value is a campaign intervention script object 
function validate.is_intervention(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign intervention manager script object. If the supplied value is an intervention manager then true is returned.
---@param value any #value
---@return boolean #value is a campaign intervention manager script object 
function validate.is_interventionmanager(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign invasion manager script object. If the supplied value is an invasion manager then true is returned.
---@param value any #value
---@return boolean #value is a campaign intervention manager script object 
function validate.is_invasionmanager(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign random army manager script object. If the supplied value is a random army manager then true is returned.
---@param value any #value
---@return boolean #value is a campaign random army manager script object 
function validate.is_randomarmy(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign narrative event script object. If the supplied value is a narrative event then true is returned.
---@param value any #value
---@return boolean #value is a campaign narrative event script object 
function validate.is_narrativeevent(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign narrative query script object. If the supplied value is a narrative query then true is returned.
---@param value any #value
---@return boolean #value is a campaign narrative query script object 
function validate.is_narrativequery(value) end

--- Throws a script_error and returns false if the supplied value is not a campaign narrative trigger script object. If the supplied value is a narrative trigger then true is returned.
---@param value any #value
---@return boolean #value is a campaign narrative trigger script object 
function validate.is_narrativetrigger(value) end

--- Throws a script_error and returns false if the supplied value is not a battle manager script object. If the supplied value is a battle manager then true is returned.
---@param value any #value
---@return boolean #value is a battle manager script object 
function validate.is_battlemanager(value) end

--- Throws a script_error and returns false if the supplied value is not a battle cutscene script object. If the supplied value is a battle cutscene then true is returned.
---@param value any #value
---@return boolean #value is a battle cutscene script object 
function validate.is_cutscene(value) end

--- Throws a script_error and returns false if the supplied value is not a battle convex area script object. If the supplied value is a battle convex area then true is returned.
---@param value any #value
---@return boolean #value is a battle convex area script object 
function validate.is_convexarea(value) end

--- Throws a script_error and returns false if the supplied value is not a battle scriptunit object. If the supplied value is a scriptunit object then true is returned.
---@param value any #value
---@return boolean #value is a battle scriptunit object 
function validate.is_scriptunit(value) end

--- Throws a script_error and returns false if the supplied value is not a battle scriptunits collection object. If the supplied value is a scriptunits collection object then true is returned.
---@param value any #value
---@return boolean #value is a battle scriptunits collection object 
function validate.is_scriptunits(value) end

--- Throws a script_error and returns false if the supplied value is not a battle patrol manager object. If the supplied value is a patrol manager collection object then true is returned.
---@param value any #value
---@return boolean #value is a battle scriptunits collection object 
function validate.is_patrolmanager(value) end

--- Throws a script_error and returns false if the supplied value is not a battle waypoint script object. If the supplied value is a waypoint object then true is returned.
---@param value any #value
---@return boolean #value is a battle scriptunits collection object 
function validate.is_waypoint(value) end

--- Throws a script_error and returns false if the supplied value is not a battle script ai planner object. If the supplied value is a script ai planner then true is returned.
---@param value any #value
---@return boolean #value is a battle script ai planner object 
function validate.is_scriptaiplanner(value) end

--- Throws a script_error and returns false if the supplied value is not a generated battle script object. If the supplied value is a generated battle object then true is returned.
---@param value any #value
---@return boolean #value is a generated battle object 
function validate.is_generatedbattle(value) end

--- Throws a script_error and returns false if the supplied value is not a generated army script object. If the supplied value is a generated army object then true is returned.
---@param value any #value
---@return boolean #value is a generated army object 
function validate.is_generatedarmy(value) end

--- Throws a script_error and returns false if the supplied value is not a generated cutscene script object. If the supplied value is a generated cutscene object then true is returned.
---@param value any #value
---@return boolean #value is a generated cutscene object 
function validate.is_generatedcutscene(value) end

--- Throws a script_error and returns false if the supplied value is not an advice manager script object. If the supplied value is an advice manager object then true is returned.
---@param value any #value
---@return boolean #value is an advice manager script object 
function validate.is_advicemanager(value) end

--- Throws a script_error and returns false if the supplied value is not an advice monitor script object. If the supplied value is an advice monitor object then true is returned.
---@param value any #value
---@return boolean #value is an advice monitor script object 
function validate.is_advicemonitor(value) end

--- Throws a script_error and returns false if the supplied value is not an attack lane manager script object. If the supplied value is an attack lane manager object then true is returned.
---@param value any #value
---@return boolean #value is an attack lane manager script object 
function validate.is_attacklanemanager(value) end
