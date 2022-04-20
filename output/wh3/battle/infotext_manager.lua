
---@class infotext_manager
local infotext_manager = {}

--- Creates an infotext manager. It should never be necessary for client scripts to call this directly, for an infotext manager is automatically set up whenever a battle_manager or <a href="../campaign/campaign_manager.html#class:campaign_manager">campaign_manager is created.
function infotext_manager:new() end

--- Gets a uicomponent handle to the advisor interface panel.
function infotext_manager:get_uicomponent() end

--- Gets a uicomponent handle to the infotext panel.
function infotext_manager:get_infotext_panel() end

--- Attaches or detaches the infotext panel from the advisor panel. When detached, infotext may be triggered independently of advice, and the infotext panel will not close when the advisor panel is closed.
---@param should_attach boolean should attach
function infotext_manager:attach_to_advisor(should_attach) end

--- Returns whether the infotext panel is attached to the advisor.
function infotext_manager:is_attached_to_advisor() end

--- After the infotext panel is undocked, sets the priority to the supplied value, and caches the value previously set. The infotext priority can later be restored with restore_detatched_infotext_priority.<br />
--- The register_topmost flag can also be set to force the infotext to topmost.
function infotext_manager:cache_and_set_detached_infotext_priority() end

--- Restores the advisor priority to a value previously cached with cache_and_set_detached_infotext_priority.
function infotext_manager:restore_detatched_infotext_priority() end

--- Maps a state override to a infotext key. When an infotext entry with this key is shown, the state of the infotext line component is overriden to that supplied here. This is generally called somewhere at the start of the calling script, with the actual infotext line being shown later.
---@param infotext_key string Infotext key
---@param component_state_override string Component state override. This much match the name of a state on the infotext line component (editable in UIEd)
function infotext_manager:set_state_override(infotext_key, component_state_override) end

--- Marks a advice infotext key with an override that causes a button to be shown if or when it's later displayed. After a particular infotext key is marked with this function, should that infotext be later displayed with infotext_manager:add_infotext then that infotext line will display a button instead of normal text. When the player clicks that button the supplied on-click callback is called.<br />
--- Should an on-display callback be supplied to this function, that callback is called each time the infotext entry is added i.e. when the button is shown. It is passed the button uicomponent as a single argument. This callback can do processing to determine if it wants to change the state of the button e.g. make it inactive.<br />
--- Should an event be supplied to this function, the button will disable when the event is received.
---@param infotext_key string infotext key
---@param event_name_to_disable_button_on function on-click callback
function infotext_manager:set_button_state_override(infotext_key, event_name_to_disable_button_on) end

--- Adds one or more lines of infotext to the infotext panel. The infotext box will expand to the final required size and then individual infotext lines are faded on sequentially with an interval between each. The first argument may optionally be an initial delay - this is useful when triggering infotext at the same time as advice, as it gives the advisor an amount of time to animate on-screen before infotext begins to display, which looks more refined.
---@param first_param any Can be a string key from the advice_info_texts table, or a number specifying an initial delay (ms in battle, s in campaign) after the panel animates onscreen and the first infotext item is shown.
---@vararg any
function infotext_manager:add_infotext(first_param, additional_infotext_strings) end

--- Adds one or more lines of infotext to the infotext panel, with a topic_leader. The infotext box will expand to the final required size and then individual infotext lines are faded on sequentially with an interval between each. The first argument may optionally be an initial delay - this is useful when triggering infotext at the same time as advice, as it gives the advisor an amount of time to animate on-screen before infotext begins to display, which looks more refined.
---@param first_param any Can be a string key from the advice_info_texts table, or a number specifying an initial delay (ms in battle, s in campaign) after the panel animates onscreen and the first infotext item is shown.
---@vararg any
function infotext_manager:add_infotext_with_leader(first_param, additional_infotext_strings) end

--- Adds one or more lines of infotext to the infotext panel, simultaneously. The infotext box will expand to the final required size and then all infotext lines are faded on at the same time. The first argument may optionally be an initial delay - this is useful when triggering infotext at the same time as advice, as it gives the advisor an amount of time to animate on-screen before infotext begins to display, which looks more refined.
---@param first_param any Can be a string key from the advice_info_texts table, or a number specifying an initial delay (ms in battle, s in campaign) after the panel animates onscreen and the first infotext item is shown.
---@vararg any
function infotext_manager:add_infotext_simultaneously(first_param, additional_infotext_strings) end

--- Adds one or more lines of infotext to the infotext panel, simultaneously, and with a topic_leader. The infotext box will expand to the final required size and then all infotext lines are faded on simultaneously. The first argument may optionally be an initial delay - this is useful when triggering infotext at the same time as advice, as it gives the advisor an amount of time to animate on-screen before infotext begins to display, which looks more refined.
---@param first_param any Can be a string key from the advice_info_texts table, or a number specifying an initial delay (ms in battle, s in campaign) after the panel animates onscreen and the first infotext item is shown.
---@vararg any
function infotext_manager:add_infotext_simultaneously_with_leader(first_param, additional_infotext_strings) end

--- Removes a line of infotext from the infotext panel, by key.
---@param infotext_key string infotext key
function infotext_manager:remove_infotext(infotext_key) end

--- Clears all infotext from the infotext panel.
function infotext_manager:clear_infotext() end

--- Hides all infotext from the infotext panel with an animation.
function infotext_manager:hide_infotext() end
