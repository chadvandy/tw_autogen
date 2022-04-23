--- TODO move this all over to override_methods/

--- TODO a table of stuff that should be overriden. ie.
--[[
    -- to override the "position" method of "TELEPORTATION_NODE_SCRIPT_INTERFACE", and change the returns, do this
    override("TELEPORTATION_NODE_SCRIPT_INTERFACE", "position", {returns = {"number", "number"}})
]]

--- TODO standardize this

local overrides = {
    ["Events"] = {
        
    },
    ["Interfaces"] = {
        ["TELEPORTATION_NODE_SCRIPT_INTERFACE"] = {
            functions = {
                ["position"] = {
                    returns = {"number", "number"}
                }
            }
        },
        ["TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE"] = {
            functions = {
                ["position"] = {
                    returns = {"number", "number"}
                }
            }
        },
        ["MODEL_SCRIPT_INTERFACE"] = {
            functions = {
                ["display_position_for_logical_position"] = {
                    returns = {"number", "number"}
                },
                ["logical_position_for_display_position"] = {
                    returns = {"number", "number"}
                }
            },
        },
        ["ROUTE_NODE_SCRIPT_INTERFACE"] = {
            functions = {
                logical_position = {
                    returns = {"number", "number"},
                },
                world_position = {
                    returns = {"number", "numbe"},
                }   
            }
        }
    },
    campaign_manager = {
        functions = {
            military_force_contains_unit_class_from_list = {
                returns = {
                    "boolean",
                }
            }
        }
    }
}

return overrides