# Overrides Files
You may create a new overrides file - either using your_username.txt, or something specific, like "fix_episodic_scripting.txt" - to basically fix anything incorrect in the existing CA docs.

These overrides files should be .txt files, contain **nothing** in them but the edits, and contain a series of the EmmyLua style documentation blocks for whatever you're overriding, with AT LEAST a full empty line between each override. As an example:

Say I see the following block in CA's docs (the actual example that made me write this feature):
```
--- Directly applies a diplomatic bonus or penalty between two factions, as if it had come from a dilemma. The bonus should be an integer between -6 and +6, each integer value of which corresponds to a change type (from PENALTY_XXXLARGE (-6) to BONUS_XXXLARGE (+6)) which carries a diplomatic attitude modifier that is actually applied.
---@param faction_a_key string First faction key.
---@param faction_a_key string Second faction key.
---@param bonus_value number Bonus value (-6 to +6).
function episodic_scripting:apply_dilemma_diplomatic_bonus(faction_a_key, faction_a_key, bonus_value) end
```

Obviously, the above lists "faction_a_key" twice, in both the ---@param lines and the function definition line. I just want to change it to "faction_b_key" the second time for each. I would create a new .txt file - vandy.txt in my case! - in the overrides/ folder, and override the things I want to change.

```
--- Directly applies a diplomatic bonus or penalty between two factions, as if it had come from a dilemma. The bonus should be an integer between -6 and +6, each integer value of which corresponds to a change type (from PENALTY_XXXLARGE (-6) to BONUS_XXXLARGE (+6)) which carries a diplomatic attitude modifier that is actually applied.
---@param faction_a_key string First faction key.
---@param faction_b_key string Second faction key.
---@param bonus_value number Bonus value (-6 to +6).
function episodic_scripting:apply_dilemma_diplomatic_bonus(faction_a_key, faction_b_key, bonus_value) end
```