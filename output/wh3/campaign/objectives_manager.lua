
---@class objectives_manager
local objectives_manager = {}

--- Creates an objective manager. It should never be necessary for client scripts to call this directly, for an objective manager is automatically set up whenever a <a href="../battle/battle_manager.html#class:battle_manager">battle_manager or campaign_manager is created.
function objectives_manager:new() end

--- Sets the objectives manager into debug mode for more verbose output
---@param debug_mode boolean debug mode
function objectives_manager:set_debug(debug_mode) end

--- Gets a uicomponent handle to the scripted objectives panel
function objectives_manager:get_uicomponent() end

--- Sets up a scripted objective for the player, which appears in the scripted objectives panel. This objective can then be updated, removed, or marked as completed or failed by the script at a later time.<br />
--- A key to the scripted_objectives table must be supplied with set_objective, and optionally one or two numeric parameters to show some running count related to the objective. To update these parameter values later, set_objective may be re-called with the same objective key and updated values.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param param_a number First numeric objective parameter. If set, the objective will be presented to the player in the form [objective text]: [param a]. Useful for showing a running count of something related to the objective.
---@param param_b number Second numeric objective parameter. A value for the first must be set if this is used. If set, the objective will be presented to the player in the form [objective text]: [param a] / [param b]. Useful for showing a running count of something related to the objective.
function objectives_manager:set_objective(objective_key, param_a, param_b) end

--- Sets up a scripted objective for the player which appears in the scripted objectives panel, with a topic_leader. This objective can then be updated, removed, or marked as completed or failed by the script at a later time.<br />
--- A key to the scripted_objectives table must be supplied with set_objective, and optionally one or two numeric parameters to show some running count related to the objective. To update these parameter values later, set_objective may be re-called with the same objective key and updated values.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param param_a number First numeric objective parameter. If set, the objective will be presented to the player in the form [objective text]: [param a]. Useful for showing a running count of something related to the objective.
---@param param_b number Second numeric objective parameter. A value for the first must be set if this is used. If set, the objective will be presented to the player in the form [objective text]: [param a] / [param b]. Useful for showing a running count of something related to the objective.
---@param callback function Optional callback to call when the objective is shown.
function objectives_manager:set_objective_with_leader(objective_key, param_a, param_b, callback) end

--- Marks a scripted objective as completed for the player to see. Note that it will remain on the scripted objectives panel until removed with objectives_manager:remove_objective.<br />
--- Note also that is possible to mark an objective as complete before it has been registered with objectives_manager:set_objective - in this case, it is marked as complete as soon as objectives_manager:set_objective is called.
---@param objective_key string Objective key, from the scripted_objectives table.
function objectives_manager:complete_objective(objective_key) end

--- Marks a scripted objective as failed for the player to see. Note that it will remain on the scripted objectives panel until removed with objectives_manager:remove_objective.
---@param objective_key string Objective key, from the scripted_objectives table.
function objectives_manager:fail_objective(objective_key) end

--- Removes a scripted objective from the scripted objectives panel.
---@param objective_key string Objective key, from the scripted_objectives table.
function objectives_manager:remove_objective(objective_key) end

--- Starts a new objective chain. Each objective chain must be given a unique string name, by which the objectives chain is later updated or ended.
---@param chain_name string Name for the objective chain. Must not be shared with other objective chain names.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param number_param_a number First numeric objective parameter. See documentation for objectives_manager:set_objective.
---@param number_param_b number Second numeric objective parameter. See documentation for objectives_manager:set_objective.
function objectives_manager:activate_objective_chain(chain_name, objective_key, number_param_a, number_param_b) end

--- Starts a new objective chain, with a topic leader. Each objective chain must be given a unique string name, by which the objectives chain is later updated or ended.
---@param chain_name string Name for the objective chain. Must not be shared with other objective chain names.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param number_param_a number First numeric objective parameter. See documentation for objectives_manager:set_objective.
---@param number_param_b number Second numeric objective parameter. See documentation for objectives_manager:set_objective.
function objectives_manager:activate_objective_chain_with_leader(chain_name, objective_key, number_param_a, number_param_b) end

--- Updates an objective chain, either with new parameters for the existing objective or a new objective (in which case the existing objective will be removed).
---@param chain_name string Name for the objective chain.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param number_param_a number First numeric objective parameter. See documentation for objectives_manager:set_objective.
---@param number_param_b number Second numeric objective parameter. See documentation for objectives_manager:set_objective.
function objectives_manager:update_objective_chain(chain_name, objective_key, number_param_a, number_param_b) end

--- Ends an objective chain. 
---@param chain_name string Name for the objective chain.
---@param objective_key string Objective key, from the scripted_objectives table.
---@param number_param_a number First numeric objective parameter. See documentation for objectives_manager:set_objective.
---@param number_param_b number Second numeric objective parameter. See documentation for objectives_manager:set_objective.
function objectives_manager:end_objective_chain(chain_name, objective_key, number_param_a, number_param_b) end

--- Removes this objective chain from the previous objective chains list, which allows it to be triggered again.
---@param chain_name string chain name
function objectives_manager:reset_objective_chain(chain_name) end
