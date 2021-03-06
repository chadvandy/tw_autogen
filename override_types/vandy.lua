return {
    ["address"] = "UIC_Address",
    ["uicomponent"] = "UIC",
    ["component"] = "UIC",
    variable = "any",
    value = "any",
    object = "any",
    card = "number",
    float32 = "number",
    numbe = "number",
    data = "string|number|boolean",
    ["vararg"] = "...",

    bool = "boolean",

    vector = "battle_vector",
    
    ["nil"] = "NONE",
    void = "NONE",
    none = "NONE",

    core_object = "core",
    cco = "ComponentContextObject",
    game_interface = "episodic_scripting",
    
    --- Interfaces
    null_interface = "NULL_SCRIPT_INTERFACE",
    character = "CHARACTER_SCRIPT_INTERFACE",
    family_member = "FAMILY_MEMBER_SCRIPT_INTERFACE",
    faction = "FACTION_SCRIPT_INTERFACE",
    region = "REGION_SCRIPT_INTERFACE",
    region_data = "REGION_DATA_SCRIPT_INTERFACE",
    unit = "UNIT_SCRIPT_INTERFACE",
    province = "PROVINCE_SCRIPT_INTERFACE",
    garrison_residence = "GARRISON_RESIDENCE_SCRIPT_INTERFACE",
    military_force = "MILITARY_FORCE_SCRIPT_INTERFACE",
    military = "MILITARY_FORCE_SCRIPT_INTERFACE",
    force = "MILITARY_FORCE_SCRIPT_INTERFACE",
    force_interface = "MILITARY_FORCE_SCRIPT_INTERFACE",
    military_force_list = "MILITARY_FORCE_LIST_SCRIPT_INTERFACE",
    settlement = "SETTLEMENT_SCRIPT_INTERFACE",
    ["[MODIFY]RITUAL_SETUP_SCRIPT_INTERFACE"] = "MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE|RITUAL_SETUP_SCRIPT_INTERFACE",
    character_details = "CHARACTER_DETAILS_SCRIPT_INTERFACE",
    pending_battle = "PENDING_BATTLE_SCRIPT_INTERFACE",
    building = "BUILDING_SCRIPT_INTERFACE",

    ["GOVERNOR_ASSIGNED_CHARACTER_EVENT"] = "GovernorAssignedCharacterEvent",

    ["scripted_value_registry"] = "scriptedvalueregistry",

    ["alliance"] = "battle_alliance",
    ["army"] = "battle_army",
    ["unitcontroller"] = "battle_unitcontroller",
}