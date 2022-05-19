---============================---
	--- [[ Events ]] ---
---============================---
do
	---@class CampaignCoastalAssaultOnGarrison
	local CampaignCoastalAssaultOnGarrison = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CampaignCoastalAssaultOnGarrison:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CampaignCoastalAssaultOnGarrison:character() end
end
---============================---
do
	---@class UnitTrained
	local UnitTrained = {}
	---@return UNIT_SCRIPT_INTERFACE
	function UnitTrained:unit() end
end
---============================---
do
	---@class CharacterRankUpNeedsAncillary
	local CharacterRankUpNeedsAncillary = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterRankUpNeedsAncillary:character() end
end
---============================---
do
	---@class MissionEvent
	local MissionEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function MissionEvent:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function MissionEvent:campaign_model() end
end
---============================---
do
	---@class UnitCreated
	local UnitCreated = {}
	---@return UNIT_SCRIPT_INTERFACE
	function UnitCreated:unit() end
end
---============================---
do
	---@class CharacterCharacterTargetAction
	local CharacterCharacterTargetAction = {}
	function CharacterCharacterTargetAction:mission_result_critial_success() end
	function CharacterCharacterTargetAction:mission_result_success() end
	function CharacterCharacterTargetAction:mission_result_opportune_failure() end
	function CharacterCharacterTargetAction:mission_result_failure() end
	function CharacterCharacterTargetAction:mission_result_critial_failure() end
	function CharacterCharacterTargetAction:ability() end
	function CharacterCharacterTargetAction:attribute() end
	function CharacterCharacterTargetAction:agent_action_key() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterCharacterTargetAction:target_character() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterCharacterTargetAction:character() end
end
---============================---
do
	---@class CharacterSelected
	local CharacterSelected = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterSelected:character() end
end
---============================---
do
	---@class UnitTurnEnd
	local UnitTurnEnd = {}
	---@return UNIT_SCRIPT_INTERFACE
	function UnitTurnEnd:unit() end
end
---============================---
do
	---@class FactionLeaderSignsPeaceTreaty
	local FactionLeaderSignsPeaceTreaty = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function FactionLeaderSignsPeaceTreaty:character() end
end
---============================---
do
	---@class ScriptedCharacterUnhiddenFailed
	local ScriptedCharacterUnhiddenFailed = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function ScriptedCharacterUnhiddenFailed:character() end
end
---============================---
do
	---@class FactionTurnStart
	local FactionTurnStart = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionTurnStart:faction() end
end
---============================---
do
	---@class UnitCompletedBattle
	local UnitCompletedBattle = {}
	---@return UNIT_SCRIPT_INTERFACE
	function UnitCompletedBattle:unit() end
end
---============================---
do
	---@class FactionLeaderDeclaresWar
	local FactionLeaderDeclaresWar = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function FactionLeaderDeclaresWar:character() end
end
---============================---
do
	---@class ForceAdoptsStance
	local ForceAdoptsStance = {}
	function ForceAdoptsStance:stance_adopted() end
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function ForceAdoptsStance:military_force() end
end
---============================---
do
	---@class CampaignBuildingDamaged
	local CampaignBuildingDamaged = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CampaignBuildingDamaged:garrison_residence() end
end
---============================---
do
	---@class CharacterComesOfAge
	local CharacterComesOfAge = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterComesOfAge:character() end
end
---============================---
do
	---@class RegionFactionChangeEvent
	local RegionFactionChangeEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function RegionFactionChangeEvent:previous_faction() end
	function RegionFactionChangeEvent:reason() end
	---@return REGION_SCRIPT_INTERFACE
	function RegionFactionChangeEvent:region() end
end
---============================---
do
	---@class MissionStatusEvent
	local MissionStatusEvent = {}
	---@return CAMPAIGN_MISSION_SCRIPT_INTERFACE
	function MissionStatusEvent:mission() end
	---@return FACTION_SCRIPT_INTERFACE
	function MissionStatusEvent:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function MissionStatusEvent:campaign_model() end
end
---============================---
do
	---@class RegionAbandonedWithBuildingEvent
	local RegionAbandonedWithBuildingEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function RegionAbandonedWithBuildingEvent:abandoning_faction() end
	---@return BUILDING_SCRIPT_INTERFACE
	function RegionAbandonedWithBuildingEvent:building() end
end
---============================---
do
	---@class FactionAboutToEndTurn
	local FactionAboutToEndTurn = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionAboutToEndTurn:faction() end
end
---============================---
do
	---@class MilitaryForceDevelopmentPointChange
	local MilitaryForceDevelopmentPointChange = {}
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function MilitaryForceDevelopmentPointChange:military_force() end
	function MilitaryForceDevelopmentPointChange:point_change() end
end
---============================---
do
	---@class CharacterBecomesFactionLeader
	local CharacterBecomesFactionLeader = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterBecomesFactionLeader:character() end
end
---============================---
do
	---@class CharacterFamilyRelationDied
	local CharacterFamilyRelationDied = {}
	function CharacterFamilyRelationDied:relationship() end
end
---============================---
do
	---@class CampaignArmiesMerge
	local CampaignArmiesMerge = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CampaignArmiesMerge:target_character() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CampaignArmiesMerge:character() end
end
---============================---
do
	---@class MissionNearingExpiry
	local MissionNearingExpiry = {}
	---@return CAMPAIGN_MISSION_SCRIPT_INTERFACE
	function MissionNearingExpiry:mission() end
	---@return FACTION_SCRIPT_INTERFACE
	function MissionNearingExpiry:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function MissionNearingExpiry:campaign_model() end
end
---============================---
do
	---@class CharacterCandidateBecomesMinister
	local CharacterCandidateBecomesMinister = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterCandidateBecomesMinister:character() end
end
---============================---
do
	---@class CampaignEffectsBundleAwarded
	local CampaignEffectsBundleAwarded = {}
	---@return FACTION_SCRIPT_INTERFACE
	function CampaignEffectsBundleAwarded:faction() end
end
---============================---
do
	---@class FirstTickAfterWorldCreated
	local FirstTickAfterWorldCreated = {}
	---@return WORLD_SCRIPT_INTERFACE
	function FirstTickAfterWorldCreated:world() end
end
---============================---
do
	---@class CharacterGarrisonTargetAction
	local CharacterGarrisonTargetAction = {}
	function CharacterGarrisonTargetAction:mission_result_critial_success() end
	function CharacterGarrisonTargetAction:mission_result_success() end
	function CharacterGarrisonTargetAction:mission_result_opportune_failure() end
	function CharacterGarrisonTargetAction:mission_result_failure() end
	function CharacterGarrisonTargetAction:mission_result_critial_failure() end
	function CharacterGarrisonTargetAction:ability() end
	function CharacterGarrisonTargetAction:attribute() end
	function CharacterGarrisonTargetAction:agent_action_key() end
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterGarrisonTargetAction:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterGarrisonTargetAction:character() end
end
---============================---
do
	---@class FactionBeginTurnPhaseNormal
	local FactionBeginTurnPhaseNormal = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionBeginTurnPhaseNormal:faction() end
end
---============================---
do
	---@class CharacterParticipatedAsSecondaryGeneralInBattle
	local CharacterParticipatedAsSecondaryGeneralInBattle = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterParticipatedAsSecondaryGeneralInBattle:character() end
end
---============================---
do
	---@class SlotOpens
	local SlotOpens = {}
	---@return SLOT_SCRIPT_INTERFACE
	function SlotOpens:region_slot() end
end
---============================---
do
	---@class RegionRebels
	local RegionRebels = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionRebels:region() end
end
---============================---
do
	---@class MovementPointsExhausted
	local MovementPointsExhausted = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function MovementPointsExhausted:character() end
end
---============================---
do
	---@class FactionTurnEnd
	local FactionTurnEnd = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionTurnEnd:faction() end
end
---============================---
do
	---@class CharacterBrokePortBlockade
	local CharacterBrokePortBlockade = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterBrokePortBlockade:character() end
end
---============================---
do
	---@class AreaEntered
	local AreaEntered = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function AreaEntered:area_key() end
end
---============================---
do
	---@class ForeignSlotManagerDiscoveredEvent
	local ForeignSlotManagerDiscoveredEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function ForeignSlotManagerDiscoveredEvent:owner() end
	---@return FACTION_SCRIPT_INTERFACE
	function ForeignSlotManagerDiscoveredEvent:discoveree() end
	---@return FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE
	function ForeignSlotManagerDiscoveredEvent:slot_manager() end
end
---============================---
do
	---@class CharacterSkillPointAllocated
	local CharacterSkillPointAllocated = {}
	function CharacterSkillPointAllocated:skill_point_spent_on() end
end
---============================---
do
	---@class CharacterPerformsActionAgainstFriendlyTarget
	local CharacterPerformsActionAgainstFriendlyTarget = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterPerformsActionAgainstFriendlyTarget:character() end
end
---============================---
do
	---@class CharacterBlockadedPort
	local CharacterBlockadedPort = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterBlockadedPort:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterBlockadedPort:character() end
end
---============================---
do
	---@class PendingBankruptcy
	local PendingBankruptcy = {}
	---@return FACTION_SCRIPT_INTERFACE
	function PendingBankruptcy:faction() end
end
---============================---
do
	---@class SharedStateChangedScriptEvent
	local SharedStateChangedScriptEvent = {}
	function SharedStateChangedScriptEvent:get_key() end
	function SharedStateChangedScriptEvent:get_state_as_bool() end
	function SharedStateChangedScriptEvent:get_state_as_float() end
	function SharedStateChangedScriptEvent:is_bool() end
	function SharedStateChangedScriptEvent:is_float() end
end
---============================---
do
	---@class CharacterCapturedSettlementUnopposed
	local CharacterCapturedSettlementUnopposed = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterCapturedSettlementUnopposed:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterCapturedSettlementUnopposed:character() end
end
---============================---
do
	---@class CharacterSackedSettlement
	local CharacterSackedSettlement = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterSackedSettlement:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterSackedSettlement:character() end
end
---============================---
do
	---@class UniqueAgentEvent
	local UniqueAgentEvent = {}
	---@return UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE
	function UniqueAgentEvent:unique_agent_details() end
end
---============================---
do
	---@class IncidentFailedEvent
	local IncidentFailedEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function IncidentFailedEvent:faction() end
	---@return String
	function IncidentFailedEvent:record_key() end
end
---============================---
do
	---@class RegionIssuesDemands
	local RegionIssuesDemands = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionIssuesDemands:region() end
end
---============================---
do
	---@class CharacterRelativeKilled
	local CharacterRelativeKilled = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterRelativeKilled:character() end
end
---============================---
do
	---@class CampaignCoastalAssaultOnCharacter
	local CampaignCoastalAssaultOnCharacter = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CampaignCoastalAssaultOnCharacter:target_character() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CampaignCoastalAssaultOnCharacter:character() end
end
---============================---
do
	---@class CharacterLootedSettlement
	local CharacterLootedSettlement = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterLootedSettlement:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterLootedSettlement:character() end
end
---============================---
do
	---@class PrisonActionTakenEvent
	local PrisonActionTakenEvent = {}
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function PrisonActionTakenEvent:prisoner_family_member() end
	---@return String
	function PrisonActionTakenEvent:action_key() end
	---@return FACTION_SCRIPT_INTERFACE
	function PrisonActionTakenEvent:faction() end
end
---============================---
do
	---@class MultiTurnMove
	local MultiTurnMove = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function MultiTurnMove:character() end
end
---============================---
do
	---@class PooledResourceEffectChangedEvent
	local PooledResourceEffectChangedEvent = {}
	function PooledResourceEffectChangedEvent:old_effect() end
	function PooledResourceEffectChangedEvent:new_effect() end
	function PooledResourceEffectChangedEvent:type() end
	---@return FACTION_SCRIPT_INTERFACE
	function PooledResourceEffectChangedEvent:faction() end
	---@return POOLED_RESOURCE_SCRIPT_INTERFACE
	function PooledResourceEffectChangedEvent:resource() end
end
---============================---
do
	---@class IncidentOccuredEvent
	local IncidentOccuredEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function IncidentOccuredEvent:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function IncidentOccuredEvent:campaign_model() end
	function IncidentOccuredEvent:dilemma() end
end
---============================---
do
	---@class CharacterEvent
	local CharacterEvent = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterEvent:character() end
end
---============================---
do
	---@class DilemmaIssued
	local DilemmaIssued = {}
	---@return FACTION_SCRIPT_INTERFACE
	function DilemmaIssued:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function DilemmaIssued:campaign_model() end
	function DilemmaIssued:dilemma() end
end
---============================---
do
	---@class DebugCharacterEvent
	local DebugCharacterEvent = {}
	function DebugCharacterEvent:id() end
end
---============================---
do
	---@class PooledResourceEvent
	local PooledResourceEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function PooledResourceEvent:faction() end
	---@return POOLED_RESOURCE_SCRIPT_INTERFACE
	function PooledResourceEvent:resource() end
end
---============================---
do
	---@class FactionRoundStart
	local FactionRoundStart = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionRoundStart:faction() end
end
---============================---
do
	---@class FactionGovernmentTypeChanged
	local FactionGovernmentTypeChanged = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionGovernmentTypeChanged:faction() end
end
---============================---
do
	---@class CharacterAttacksAlly
	local CharacterAttacksAlly = {}
	---@return FACTION_SCRIPT_INTERFACE
	function CharacterAttacksAlly:target_faction() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterAttacksAlly:character() end
end
---============================---
do
	---@class RecruitmentItemIssuedByPlayer
	local RecruitmentItemIssuedByPlayer = {}
	function RecruitmentItemIssuedByPlayer:main_unit_record() end
	function RecruitmentItemIssuedByPlayer:time_to_build() end
	---@return FACTION_SCRIPT_INTERFACE
	function RecruitmentItemIssuedByPlayer:faction() end
end
---============================---
do
	---@class ScriptedCharacterUnhidden
	local ScriptedCharacterUnhidden = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function ScriptedCharacterUnhidden:character() end
end
---============================---
do
	---@class CharacterCompletedBattle
	local CharacterCompletedBattle = {}
	---@return PENDING_BATTLE_SCRIPT_INTERFACE
	function CharacterCompletedBattle:pending_battle() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterCompletedBattle:character() end
end
---============================---
do
	---@class SlotSelected
	local SlotSelected = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function SlotSelected:garrison_residence() end
end
---============================---
do
	---@class AreaExited
	local AreaExited = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function AreaExited:area_key() end
end
---============================---
do
	---@class DilemmaChoiceMadeEvent
	local DilemmaChoiceMadeEvent = {}
	function DilemmaChoiceMadeEvent:choice() end
	---@return FACTION_SCRIPT_INTERFACE
	function DilemmaChoiceMadeEvent:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function DilemmaChoiceMadeEvent:campaign_model() end
	function DilemmaChoiceMadeEvent:dilemma() end
end
---============================---
do
	---@class CharacterConvalescedOrKilled
	local CharacterConvalescedOrKilled = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterConvalescedOrKilled:character() end
end
---============================---
do
	---@class RegionRiots
	local RegionRiots = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionRiots:region() end
end
---============================---
do
	---@class RitualsCompletedAndDelayedEvent
	local RitualsCompletedAndDelayedEvent = {}
	---@return ACTIVE_RITUAL_LIST_SCRIPT_INTERFACE
	function RitualsCompletedAndDelayedEvent:rituals() end
end
---============================---
do
	---@class CharacterDisembarksNavy
	local CharacterDisembarksNavy = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterDisembarksNavy:character() end
end
---============================---
do
	---@class RegionTurnStart
	local RegionTurnStart = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionTurnStart:region() end
end
---============================---
do
	---@class MissionGenerationFailed
	local MissionGenerationFailed = {}
	function MissionGenerationFailed:mission() end
end
---============================---
do
	---@class CharacterCreated
	local CharacterCreated = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterCreated:character() end
end
---============================---
do
	---@class CharacterTargetEvent
	local CharacterTargetEvent = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterTargetEvent:target_character() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterTargetEvent:character() end
end
---============================---
do
	---@class FactionCivilWarOccured
	local FactionCivilWarOccured = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionCivilWarOccured:opponent() end
	---@return FACTION_SCRIPT_INTERFACE
	function FactionCivilWarOccured:faction() end
end
---============================---
do
	---@class RitualCompletedEvent
	local RitualCompletedEvent = {}
	function RitualCompletedEvent:succeeded() end
	---@return FACTION_SCRIPT_INTERFACE
	function RitualCompletedEvent:performing_faction() end
	---@return FACTION_SCRIPT_INTERFACE
	function RitualCompletedEvent:ritual_target_faction() end
	---@return ACTIVE_RITUAL_SCRIPT_INTERFACE
	function RitualCompletedEvent:ritual() end
end
---============================---
do
	---@class UnitConverted
	local UnitConverted = {}
	---@return UNIT_SCRIPT_INTERFACE
	function UnitConverted:converted_unit() end
	---@return UNIT_SCRIPT_INTERFACE
	function UnitConverted:unit() end
end
---============================---
do
	---@class UnitEvent
	local UnitEvent = {}
	---@return UNIT_SCRIPT_INTERFACE
	function UnitEvent:unit() end
end
---============================---
do
	---@class UnitSelectedCampaign
	local UnitSelectedCampaign = {}
	---@return UNIT_SCRIPT_INTERFACE
	function UnitSelectedCampaign:unit() end
end
---============================---
do
	---@class GarrisonOccupiedEvent
	local GarrisonOccupiedEvent = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function GarrisonOccupiedEvent:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function GarrisonOccupiedEvent:character() end
end
---============================---
do
	---@class ClimatePhaseChange
	local ClimatePhaseChange = {}
	---@return WORLD_SCRIPT_INTERFACE
	function ClimatePhaseChange:world() end
end
---============================---
do
	---@class RitualEvent
	local RitualEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function RitualEvent:performing_faction() end
	---@return FACTION_SCRIPT_INTERFACE
	function RitualEvent:ritual_target_faction() end
	---@return ACTIVE_RITUAL_SCRIPT_INTERFACE
	function RitualEvent:ritual() end
end
---============================---
do
	---@class UniqueAgentDespawned
	local UniqueAgentDespawned = {}
	---@return UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE
	function UniqueAgentDespawned:unique_agent_details() end
end
---============================---
do
	---@class MissionSucceeded
	local MissionSucceeded = {}
	---@return CAMPAIGN_MISSION_SCRIPT_INTERFACE
	function MissionSucceeded:mission() end
	---@return FACTION_SCRIPT_INTERFACE
	function MissionSucceeded:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function MissionSucceeded:campaign_model() end
end
---============================---
do
	---@class GovernorAssignedCharacterEvent
	local GovernorAssignedCharacterEvent = {}
	---@return PROVINCE_SCRIPT_INTERFACE
	function GovernorAssignedCharacterEvent:province() end
	---@return REGION_SCRIPT_INTERFACE
	function GovernorAssignedCharacterEvent:region() end
end
---============================---
do
	---@class UnitDisbanded
	local UnitDisbanded = {}
	---@return UNIT_SCRIPT_INTERFACE
	function UnitDisbanded:unit() end
end
---============================---
do
	---@class GovernorshipTaxRateChanged
	local GovernorshipTaxRateChanged = {}
	---@return FACTION_SCRIPT_INTERFACE
	function GovernorshipTaxRateChanged:faction() end
end
---============================---
do
	---@class NominalDifficultyLevelChangedEvent
	local NominalDifficultyLevelChangedEvent = {}
	---@return MODEL_SCRIPT_INTERFACE
	function NominalDifficultyLevelChangedEvent:model() end
end
---============================---
do
	---@class CharacterFinishedMovingEvent
	local CharacterFinishedMovingEvent = {}
	function CharacterFinishedMovingEvent:was_flee() end
end
---============================---
do
	---@class UnitEffectPurchased
	local UnitEffectPurchased = {}
	---@return UNIT_PURCHASABLE_EFFECT_SCRIPT_INTERFACE
	function UnitEffectPurchased:effect() end
	---@return UNIT_SCRIPT_INTERFACE
	function UnitEffectPurchased:unit() end
end
---============================---
do
	---@class CharacterTurnEnd
	local CharacterTurnEnd = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterTurnEnd:character() end
end
---============================---
do
	---@class WorldCreated
	local WorldCreated = {}
	---@return WORLD_SCRIPT_INTERFACE
	function WorldCreated:world() end
end
---============================---
do
	---@class CharacterMilitaryForceTraditionPointAvailable
	local CharacterMilitaryForceTraditionPointAvailable = {}
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function CharacterMilitaryForceTraditionPointAvailable:military_force() end
end
---============================---
do
	---@class TradeNodeConnected
	local TradeNodeConnected = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function TradeNodeConnected:character() end
end
---============================---
do
	---@class FactionEvent
	local FactionEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionEvent:faction() end
end
---============================---
do
	---@class NegativeDiplomaticEvent
	local NegativeDiplomaticEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function NegativeDiplomaticEvent:proposer() end
	---@return FACTION_SCRIPT_INTERFACE
	function NegativeDiplomaticEvent:recipient() end
	---@return FACTION_SCRIPT_INTERFACE
	function NegativeDiplomaticEvent:was_alliance() end
	---@return FACTION_SCRIPT_INTERFACE
	function NegativeDiplomaticEvent:was_military_alliance() end
	---@return FACTION_SCRIPT_INTERFACE
	function NegativeDiplomaticEvent:was_defensive_alliance() end
	---@return FACTION_SCRIPT_INTERFACE
	function NegativeDiplomaticEvent:is_war() end
	---@return FACTION_SCRIPT_INTERFACE
	function NegativeDiplomaticEvent:was_military_access() end
	---@return FACTION_SCRIPT_INTERFACE
	function NegativeDiplomaticEvent:was_trade_agreement() end
	---@return FACTION_SCRIPT_INTERFACE
	function NegativeDiplomaticEvent:was_non_aggression_pact() end
	---@return FACTION_SCRIPT_INTERFACE
	function NegativeDiplomaticEvent:was_vassalage() end
	---@return FACTION_SCRIPT_INTERFACE
	function NegativeDiplomaticEvent:proposer_was_vassal() end
end
---============================---
do
	---@class FactionJoinsConfederation
	local FactionJoinsConfederation = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionJoinsConfederation:confederation() end
	---@return FACTION_SCRIPT_INTERFACE
	function FactionJoinsConfederation:faction() end
end
---============================---
do
	---@class PendingBattle
	local PendingBattle = {}
	---@return MODEL_SCRIPT_INTERFACE
	function PendingBattle:model() end
	---@return PENDING_BATTLE_SCRIPT_INTERFACE
	function PendingBattle:pending_battle() end
end
---============================---
do
	---@class NewCharacterEnteredRecruitmentPool
	local NewCharacterEnteredRecruitmentPool = {}
	---@return CHARACTER_DETAILS_SCRIPT_INTERFACE
	function NewCharacterEnteredRecruitmentPool:character_details() end
end
---============================---
do
	---@class SeaTradeRouteRaided
	local SeaTradeRouteRaided = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function SeaTradeRouteRaided:character() end
end
---============================---
do
	---@class DilemmaEvent
	local DilemmaEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function DilemmaEvent:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function DilemmaEvent:campaign_model() end
	function DilemmaEvent:dilemma() end
end
---============================---
do
	---@class IncidentEvent
	local IncidentEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function IncidentEvent:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function IncidentEvent:campaign_model() end
	function IncidentEvent:dilemma() end
end
---============================---
do
	---@class CharacterMilitaryForceTraditionPointAllocated
	local CharacterMilitaryForceTraditionPointAllocated = {}
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function CharacterMilitaryForceTraditionPointAllocated:military_force() end
	function CharacterMilitaryForceTraditionPointAllocated:tradition_point_spent_on() end
end
---============================---
do
	---@class CharacterLeavesGarrison
	local CharacterLeavesGarrison = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterLeavesGarrison:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterLeavesGarrison:character() end
end
---============================---
do
	---@class CharacterEntersGarrison
	local CharacterEntersGarrison = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterEntersGarrison:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterEntersGarrison:character() end
end
---============================---
do
	---@class ImprisonmentEvent
	local ImprisonmentEvent = {}
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function ImprisonmentEvent:prisoner_family_member() end
	---@return FACTION_SCRIPT_INTERFACE
	function ImprisonmentEvent:faction() end
end
---============================---
do
	---@class ResearchStarted
	local ResearchStarted = {}
	---@return FACTION_SCRIPT_INTERFACE
	function ResearchStarted:faction() end
end
---============================---
do
	---@class BuildingCompleted
	local BuildingCompleted = {}
	---@return BUILDING_SCRIPT_INTERFACE
	function BuildingCompleted:building() end
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function BuildingCompleted:garrison_residence() end
end
---============================---
do
	---@class CharacterGarrisonTargetEvent
	local CharacterGarrisonTargetEvent = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterGarrisonTargetEvent:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterGarrisonTargetEvent:character() end
end
---============================---
do
	---@class TriggerPostBattleAncillaries
	local TriggerPostBattleAncillaries = {}
	---@return PENDING_BATTLE_SCRIPT_INTERFACE
	function TriggerPostBattleAncillaries:pending_battle() end
	function TriggerPostBattleAncillaries:has_stolen_ancillary() end
end
---============================---
do
	---@class MissionCancelled
	local MissionCancelled = {}
	---@return CAMPAIGN_MISSION_SCRIPT_INTERFACE
	function MissionCancelled:mission() end
	---@return FACTION_SCRIPT_INTERFACE
	function MissionCancelled:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function MissionCancelled:campaign_model() end
end
---============================---
do
	---@class RitualStartedEvent
	local RitualStartedEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function RitualStartedEvent:performing_faction() end
	---@return FACTION_SCRIPT_INTERFACE
	function RitualStartedEvent:ritual_target_faction() end
	---@return ACTIVE_RITUAL_SCRIPT_INTERFACE
	function RitualStartedEvent:ritual() end
end
---============================---
do
	---@class FactionLeaderIssuesEdict
	local FactionLeaderIssuesEdict = {}
	function FactionLeaderIssuesEdict:province() end
	function FactionLeaderIssuesEdict:initiative_key() end
end
---============================---
do
	---@class FactionSubjugatesOtherFaction
	local FactionSubjugatesOtherFaction = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionSubjugatesOtherFaction:other_faction() end
end
---============================---
do
	---@class MilitaryForceBuildingCompleteEvent
	local MilitaryForceBuildingCompleteEvent = {}
	function MilitaryForceBuildingCompleteEvent:building() end
end
---============================---
do
	---@class CharacterPromoted
	local CharacterPromoted = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterPromoted:character() end
end
---============================---
do
	---@class DebugFactionEvent
	local DebugFactionEvent = {}
	function DebugFactionEvent:id() end
end
---============================---
do
	---@class CharacterEmbarksNavy
	local CharacterEmbarksNavy = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterEmbarksNavy:character() end
end
---============================---
do
	---@class ResearchCompleted
	local ResearchCompleted = {}
	function ResearchCompleted:technology() end
	---@return FACTION_SCRIPT_INTERFACE
	function ResearchCompleted:faction() end
end
---============================---
do
	---@class MissionIssued
	local MissionIssued = {}
	---@return CAMPAIGN_MISSION_SCRIPT_INTERFACE
	function MissionIssued:mission() end
	---@return FACTION_SCRIPT_INTERFACE
	function MissionIssued:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function MissionIssued:campaign_model() end
end
---============================---
do
	---@class UITrigger
	local UITrigger = {}
	function UITrigger:faction_cqi() end
	function UITrigger:trigger() end
end
---============================---
do
	---@class SettlementSelected
	local SettlementSelected = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function SettlementSelected:garrison_residence() end
end
---============================---
do
	---@class RegionPlagueStateChanged
	local RegionPlagueStateChanged = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionPlagueStateChanged:is_infected() end
	---@return REGION_SCRIPT_INTERFACE
	function RegionPlagueStateChanged:region() end
end
---============================---
do
	---@class CharacterRazedSettlement
	local CharacterRazedSettlement = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterRazedSettlement:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterRazedSettlement:character() end
end
---============================---
do
	---@class NewCampaignStarted
	local NewCampaignStarted = {}
	---@return MODEL_SCRIPT_INTERFACE
	function NewCampaignStarted:model() end
end
---============================---
do
	---@class ForeignSlotBuildingDamagedEvent
	local ForeignSlotBuildingDamagedEvent = {}
	function ForeignSlotBuildingDamagedEvent:building() end
end
---============================---
do
	---@class CharacterPerformsSettlementOccupationDecision
	local CharacterPerformsSettlementOccupationDecision = {}
	function CharacterPerformsSettlementOccupationDecision:occupation_decision() end
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterPerformsSettlementOccupationDecision:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterPerformsSettlementOccupationDecision:character() end
end
---============================---
do
	---@class SlotTurnStart
	local SlotTurnStart = {}
	---@return SLOT_SCRIPT_INTERFACE
	function SlotTurnStart:region_slot() end
end
---============================---
do
	---@class ForcePlagueStateChanged
	local ForcePlagueStateChanged = {}
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function ForcePlagueStateChanged:military_force() end
	function ForcePlagueStateChanged:is_infected() end
end
---============================---
do
	---@class RegionEvent
	local RegionEvent = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionEvent:region() end
end
---============================---
do
	---@class CharacterEntersAttritionalArea
	local CharacterEntersAttritionalArea = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterEntersAttritionalArea:character() end
end
---============================---
do
	---@class CharacterTurnStart
	local CharacterTurnStart = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterTurnStart:character() end
end
---============================---
do
	---@class FactionEncountersOtherFaction
	local FactionEncountersOtherFaction = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionEncountersOtherFaction:other_faction() end
end
---============================---
do
	---@class RegionStrikes
	local RegionStrikes = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionStrikes:region() end
end
---============================---
do
	---@class AreaEnteredEvent
	local AreaEnteredEvent = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function AreaEnteredEvent:character() end
end
---============================---
do
	---@class DebugRegionEvent
	local DebugRegionEvent = {}
	function DebugRegionEvent:id() end
end
---============================---
do
	---@class ForeignSlotManagerRemovedEvent
	local ForeignSlotManagerRemovedEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function ForeignSlotManagerRemovedEvent:owner() end
	---@return FACTION_SCRIPT_INTERFACE
	function ForeignSlotManagerRemovedEvent:remover() end
	---@return FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE
	function ForeignSlotManagerRemovedEvent:cause_was_razing() end
end
---============================---
do
	---@class LandTradeRouteRaided
	local LandTradeRouteRaided = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function LandTradeRouteRaided:character() end
end
---============================---
do
	---@class CharacterRankUp
	local CharacterRankUp = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterRankUp:character() end
end
---============================---
do
	---@class FactionLiberated
	local FactionLiberated = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function FactionLiberated:liberating_character() end
end
---============================---
do
	---@class GarrisonResidenceExposedToFaction
	local GarrisonResidenceExposedToFaction = {}
	---@return FACTION_SCRIPT_INTERFACE
	function GarrisonResidenceExposedToFaction:encountering_faction() end
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function GarrisonResidenceExposedToFaction:garrison_residence() end
end
---============================---
do
	---@class RegionSlotEvent
	local RegionSlotEvent = {}
	---@return SLOT_SCRIPT_INTERFACE
	function RegionSlotEvent:region_slot() end
end
---============================---
do
	---@class DiplomaticOfferRejected
	local DiplomaticOfferRejected = {}
	---@return FACTION_SCRIPT_INTERFACE
	function DiplomaticOfferRejected:proposer() end
	---@return FACTION_SCRIPT_INTERFACE
	function DiplomaticOfferRejected:recipient() end
end
---============================---
do
	---@class SharedStateCreatedScriptEvent
	local SharedStateCreatedScriptEvent = {}
	function SharedStateCreatedScriptEvent:get_key() end
	function SharedStateCreatedScriptEvent:get_state_as_bool() end
	function SharedStateCreatedScriptEvent:get_state_as_float() end
	function SharedStateCreatedScriptEvent:is_bool() end
	function SharedStateCreatedScriptEvent:is_float() end
end
---============================---
do
	---@class AreaExitedEvent
	local AreaExitedEvent = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function AreaExitedEvent:character() end
end
---============================---
do
	---@class MilitaryForceCreated
	local MilitaryForceCreated = {}
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function MilitaryForceCreated:military_force_created() end
end
---============================---
do
	---@class CharacterMarriage
	local CharacterMarriage = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterMarriage:character() end
end
---============================---
do
	---@class TradeRouteEstablished
	local TradeRouteEstablished = {}
	---@return FACTION_SCRIPT_INTERFACE
	function TradeRouteEstablished:faction() end
end
---============================---
do
	---@class UnitMergedAndDestroyed
	local UnitMergedAndDestroyed = {}
	---@return UNIT_SCRIPT_INTERFACE
	function UnitMergedAndDestroyed:new_unit() end
	---@return UNIT_SCRIPT_INTERFACE
	function UnitMergedAndDestroyed:unit() end
end
---============================---
do
	---@class DilemmaGenerationFailedEvent
	local DilemmaGenerationFailedEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function DilemmaGenerationFailedEvent:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function DilemmaGenerationFailedEvent:campaign_model() end
	function DilemmaGenerationFailedEvent:dilemma() end
end
---============================---
do
	---@class RitualCancelledEvent
	local RitualCancelledEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function RitualCancelledEvent:performing_faction() end
	---@return FACTION_SCRIPT_INTERFACE
	function RitualCancelledEvent:ritual_target_faction() end
	---@return ACTIVE_RITUAL_SCRIPT_INTERFACE
	function RitualCancelledEvent:ritual() end
end
---============================---
do
	---@class SlotRoundStart
	local SlotRoundStart = {}
	---@return SLOT_SCRIPT_INTERFACE
	function SlotRoundStart:region_slot() end
end
---============================---
do
	---@class CharacterBesiegesSettlement
	local CharacterBesiegesSettlement = {}
	---@return REGION_SCRIPT_INTERFACE
	function CharacterBesiegesSettlement:region() end
end
---============================---
do
	---@class HaveCharacterWithinRangeOfPositionMissionEvaluationResultEvent
	local HaveCharacterWithinRangeOfPositionMissionEvaluationResultEvent = {}
	function HaveCharacterWithinRangeOfPositionMissionEvaluationResultEvent:mission_key() end
	function HaveCharacterWithinRangeOfPositionMissionEvaluationResultEvent:mission_cqi() end
	function HaveCharacterWithinRangeOfPositionMissionEvaluationResultEvent:was_successful() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function HaveCharacterWithinRangeOfPositionMissionEvaluationResultEvent:character() end
end
---============================---
do
	---@class GarrisonResidenceEvent
	local GarrisonResidenceEvent = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function GarrisonResidenceEvent:garrison_residence() end
end
---============================---
do
	---@class CharacterBuildingCompleted
	local CharacterBuildingCompleted = {}
	---@return BUILDING_SCRIPT_INTERFACE
	function CharacterBuildingCompleted:building() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterBuildingCompleted:character() end
end
---============================---
do
	---@class FactionCookedDish
	local FactionCookedDish = {}
	---@return COOKING_DISH_SCRIPT_INTERFACE
	function FactionCookedDish:dish() end
	---@return FACTION_SCRIPT_INTERFACE
	function FactionCookedDish:faction() end
end
---============================---
do
	---@class FactionBecomesLiberationVassal
	local FactionBecomesLiberationVassal = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function FactionBecomesLiberationVassal:liberating_character() end
	---@return FACTION_SCRIPT_INTERFACE
	function FactionBecomesLiberationVassal:faction() end
end
---============================---
do
	---@class RegionSelected
	local RegionSelected = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionSelected:region() end
end
---============================---
do
	---@class UnitEffectUnpurchased
	local UnitEffectUnpurchased = {}
	---@return UNIT_PURCHASABLE_EFFECT_SCRIPT_INTERFACE
	function UnitEffectUnpurchased:effect() end
end
---============================---
do
	---@class CharacterAncillaryGained
	local CharacterAncillaryGained = {}
	function CharacterAncillaryGained:ancillary() end
end
---============================---
do
	---@class CharacterCanLiberate
	local CharacterCanLiberate = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterCanLiberate:character() end
end
---============================---
do
	---@class CharacterInfoPanelOpened
	local CharacterInfoPanelOpened = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterInfoPanelOpened:character() end
end
---============================---
do
	---@class GarrisonAttackedEvent
	local GarrisonAttackedEvent = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function GarrisonAttackedEvent:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function GarrisonAttackedEvent:character() end
end
---============================---
do
	---@class PositiveDiplomaticEvent
	local PositiveDiplomaticEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:proposer() end
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:recipient() end
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:is_alliance() end
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:is_military_alliance() end
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:is_defensive_alliance() end
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:is_peace_treaty() end
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:is_military_access() end
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:is_trade_agreement() end
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:is_non_aggression_pact() end
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:is_vassalage() end
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:proposer_is_vassal() end
end
---============================---
do
	---@class ForeignSlotBuildingCompleteEvent
	local ForeignSlotBuildingCompleteEvent = {}
	function ForeignSlotBuildingCompleteEvent:building() end
	---@return FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE
	function ForeignSlotBuildingCompleteEvent:slot_manager() end
end
---============================---
do
	---@class FirstTickAfterNewCampaignStarted
	local FirstTickAfterNewCampaignStarted = {}
	---@return MODEL_SCRIPT_INTERFACE
	function FirstTickAfterNewCampaignStarted:model() end
end
---============================---
do
	---@class BuildingConstructionIssuedByPlayer
	local BuildingConstructionIssuedByPlayer = {}
	function BuildingConstructionIssuedByPlayer:building() end
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function BuildingConstructionIssuedByPlayer:garrison_residence() end
end
---============================---
do
	---@class ImprisonmenRejectiontEvent
	local ImprisonmenRejectiontEvent = {}
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function ImprisonmenRejectiontEvent:prisoner_family_member() end
	---@return CHARACTER_IMPRISONMENT_REJECTION_REASON_MASK_SCRIPTING_INTERFACE
	function ImprisonmenRejectiontEvent:rejection_reasons() end
	---@return FACTION_SCRIPT_INTERFACE
	function ImprisonmenRejectiontEvent:faction() end
end
---============================---
do
	---@class RegionTurnEnd
	local RegionTurnEnd = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionTurnEnd:region() end
end
---============================---
do
	---@class MissionFailed
	local MissionFailed = {}
	---@return CAMPAIGN_MISSION_SCRIPT_INTERFACE
	function MissionFailed:mission() end
	---@return FACTION_SCRIPT_INTERFACE
	function MissionFailed:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function MissionFailed:campaign_model() end
end
---============================---
do
	---@class UniqueAgentSpawned
	local UniqueAgentSpawned = {}
	---@return UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE
	function UniqueAgentSpawned:unique_agent_details() end
end
---============================---
do
	---@class ClanBecomesVassal
	local ClanBecomesVassal = {}
	---@return FACTION_SCRIPT_INTERFACE
	function ClanBecomesVassal:faction() end
end
---============================---

---============================---
	--- [[ Interfaces ]] ---
---============================---

---@class CHARACTER_LIST_SCRIPT_INTERFACE Description: A list of character interfaces
local CHARACTER_LIST_SCRIPT_INTERFACE = {}
function CHARACTER_LIST_SCRIPT_INTERFACE:num_items() end
function CHARACTER_LIST_SCRIPT_INTERFACE:item_at() end
function CHARACTER_LIST_SCRIPT_INTERFACE:is_empty() end

---@class REGION_MANAGER_SCRIPT_INTERFACE Description: The interface that stores and manages all regions in the game. Useful for looking up region and slot//settlement keys.
local REGION_MANAGER_SCRIPT_INTERFACE = {}
function REGION_MANAGER_SCRIPT_INTERFACE:is_null_interface() end
function REGION_MANAGER_SCRIPT_INTERFACE:model() end
function REGION_MANAGER_SCRIPT_INTERFACE:region_list() end
function REGION_MANAGER_SCRIPT_INTERFACE:faction_region_list() end
function REGION_MANAGER_SCRIPT_INTERFACE:region_by_key() end
function REGION_MANAGER_SCRIPT_INTERFACE:settlement_by_key() end
function REGION_MANAGER_SCRIPT_INTERFACE:slot_by_key() end
function REGION_MANAGER_SCRIPT_INTERFACE:resource_exists_anywhere() end

---@class CHARACTER_SCRIPT_INTERFACE Description: Character interface
local CHARACTER_SCRIPT_INTERFACE = {}
function CHARACTER_SCRIPT_INTERFACE:is_null_interface() end
function CHARACTER_SCRIPT_INTERFACE:command_queue_index() end
function CHARACTER_SCRIPT_INTERFACE:has_garrison_residence() end
function CHARACTER_SCRIPT_INTERFACE:has_region() end
function CHARACTER_SCRIPT_INTERFACE:has_military_force() end
function CHARACTER_SCRIPT_INTERFACE:model() end
function CHARACTER_SCRIPT_INTERFACE:garrison_residence() end
function CHARACTER_SCRIPT_INTERFACE:faction() end
function CHARACTER_SCRIPT_INTERFACE:region() end
function CHARACTER_SCRIPT_INTERFACE:military_force() end
function CHARACTER_SCRIPT_INTERFACE:forename() end
function CHARACTER_SCRIPT_INTERFACE:surname() end
function CHARACTER_SCRIPT_INTERFACE:get_forename() end
function CHARACTER_SCRIPT_INTERFACE:get_surname() end
function CHARACTER_SCRIPT_INTERFACE:flag_path() end
function CHARACTER_SCRIPT_INTERFACE:in_settlement() end
function CHARACTER_SCRIPT_INTERFACE:in_port() end
function CHARACTER_SCRIPT_INTERFACE:is_besieging() end
function CHARACTER_SCRIPT_INTERFACE:is_blockading() end
function CHARACTER_SCRIPT_INTERFACE:is_carrying_troops() end
function CHARACTER_SCRIPT_INTERFACE:character_type() end
function CHARACTER_SCRIPT_INTERFACE:character_type_key() end
function CHARACTER_SCRIPT_INTERFACE:character_subtype() end
function CHARACTER_SCRIPT_INTERFACE:character_subtype_key() end
function CHARACTER_SCRIPT_INTERFACE:has_trait() end
function CHARACTER_SCRIPT_INTERFACE:trait_points() end
function CHARACTER_SCRIPT_INTERFACE:has_ancillary() end
function CHARACTER_SCRIPT_INTERFACE:battles_fought() end
function CHARACTER_SCRIPT_INTERFACE:action_points_remaining_percent() end
function CHARACTER_SCRIPT_INTERFACE:action_points_per_turn() end
function CHARACTER_SCRIPT_INTERFACE:is_male() end
function CHARACTER_SCRIPT_INTERFACE:age() end
function CHARACTER_SCRIPT_INTERFACE:performed_action_this_turn() end
function CHARACTER_SCRIPT_INTERFACE:is_ambushing() end
function CHARACTER_SCRIPT_INTERFACE:turns_at_sea() end
function CHARACTER_SCRIPT_INTERFACE:turns_in_own_regions() end
function CHARACTER_SCRIPT_INTERFACE:turns_in_enemy_regions() end
function CHARACTER_SCRIPT_INTERFACE:is_faction_leader() end
function CHARACTER_SCRIPT_INTERFACE:rank() end
function CHARACTER_SCRIPT_INTERFACE:defensive_sieges_fought() end
function CHARACTER_SCRIPT_INTERFACE:defensive_sieges_won() end
function CHARACTER_SCRIPT_INTERFACE:offensive_sieges_fought() end
function CHARACTER_SCRIPT_INTERFACE:offensive_sieges_won() end
function CHARACTER_SCRIPT_INTERFACE:fought_in_battle() end
function CHARACTER_SCRIPT_INTERFACE:won_battle() end
function CHARACTER_SCRIPT_INTERFACE:percentage_of_own_alliance_killed() end
function CHARACTER_SCRIPT_INTERFACE:ministerial_position() end
function CHARACTER_SCRIPT_INTERFACE:logical_position_x() end
function CHARACTER_SCRIPT_INTERFACE:logical_position_y() end
function CHARACTER_SCRIPT_INTERFACE:display_position_x() end
function CHARACTER_SCRIPT_INTERFACE:display_position_y() end
function CHARACTER_SCRIPT_INTERFACE:battles_won() end
function CHARACTER_SCRIPT_INTERFACE:offensive_battles_won() end
function CHARACTER_SCRIPT_INTERFACE:offensive_battles_fought() end
function CHARACTER_SCRIPT_INTERFACE:defensive_battles_won() end
function CHARACTER_SCRIPT_INTERFACE:defensive_battles_fought() end
function CHARACTER_SCRIPT_INTERFACE:offensive_naval_battles_won() end
function CHARACTER_SCRIPT_INTERFACE:offensive_naval_battles_fought() end
function CHARACTER_SCRIPT_INTERFACE:defensive_naval_battles_won() end
function CHARACTER_SCRIPT_INTERFACE:defensive_naval_battles_fought() end
function CHARACTER_SCRIPT_INTERFACE:offensive_ambush_battles_won() end
function CHARACTER_SCRIPT_INTERFACE:offensive_ambush_battles_fought() end
function CHARACTER_SCRIPT_INTERFACE:defensive_ambush_battles_won() end
function CHARACTER_SCRIPT_INTERFACE:defensive_ambush_battles_fought() end
function CHARACTER_SCRIPT_INTERFACE:cqi() end
function CHARACTER_SCRIPT_INTERFACE:is_embedded_in_military_force() end
function CHARACTER_SCRIPT_INTERFACE:embedded_in_military_force() end
function CHARACTER_SCRIPT_INTERFACE:has_skill() end
function CHARACTER_SCRIPT_INTERFACE:is_hidden() end
function CHARACTER_SCRIPT_INTERFACE:routed_in_battle() end
function CHARACTER_SCRIPT_INTERFACE:body_guard_casulties() end
function CHARACTER_SCRIPT_INTERFACE:is_deployed() end
function CHARACTER_SCRIPT_INTERFACE:is_at_sea() end
function CHARACTER_SCRIPT_INTERFACE:has_recruited_mercenaries() end
function CHARACTER_SCRIPT_INTERFACE:number_of_traits() end
function CHARACTER_SCRIPT_INTERFACE:trait_level() end
function CHARACTER_SCRIPT_INTERFACE:loyalty() end
function CHARACTER_SCRIPT_INTERFACE:personal_loyalty_factor() end
function CHARACTER_SCRIPT_INTERFACE:interfaction_loyalty() end
function CHARACTER_SCRIPT_INTERFACE:gravitas() end
function CHARACTER_SCRIPT_INTERFACE:has_father() end
function CHARACTER_SCRIPT_INTERFACE:has_mother() end
function CHARACTER_SCRIPT_INTERFACE:mother() end
function CHARACTER_SCRIPT_INTERFACE:father() end
function CHARACTER_SCRIPT_INTERFACE:family_member() end
function CHARACTER_SCRIPT_INTERFACE:is_politician() end
function CHARACTER_SCRIPT_INTERFACE:post_battle_ancilary_chance() end
function CHARACTER_SCRIPT_INTERFACE:is_caster() end
function CHARACTER_SCRIPT_INTERFACE:is_visible_to_faction() end
function CHARACTER_SCRIPT_INTERFACE:can_equip_ancillary() end
function CHARACTER_SCRIPT_INTERFACE:is_wounded() end
function CHARACTER_SCRIPT_INTERFACE:character_details() end
function CHARACTER_SCRIPT_INTERFACE:effect_bundles() end
function CHARACTER_SCRIPT_INTERFACE:has_effect_bundle() end

---@class MILITARY_FORCE_SCRIPT_INTERFACE Description: Military force interface. Armies and navies are military forces.
local MILITARY_FORCE_SCRIPT_INTERFACE = {}
function MILITARY_FORCE_SCRIPT_INTERFACE:is_null_interface() end
function MILITARY_FORCE_SCRIPT_INTERFACE:command_queue_index() end
function MILITARY_FORCE_SCRIPT_INTERFACE:has_general() end
function MILITARY_FORCE_SCRIPT_INTERFACE:is_army() end
function MILITARY_FORCE_SCRIPT_INTERFACE:is_navy() end
function MILITARY_FORCE_SCRIPT_INTERFACE:model() end
function MILITARY_FORCE_SCRIPT_INTERFACE:unit_list() end
function MILITARY_FORCE_SCRIPT_INTERFACE:character_list() end
function MILITARY_FORCE_SCRIPT_INTERFACE:general_character() end
function MILITARY_FORCE_SCRIPT_INTERFACE:faction() end
function MILITARY_FORCE_SCRIPT_INTERFACE:has_garrison_residence() end
function MILITARY_FORCE_SCRIPT_INTERFACE:garrison_residence() end
function MILITARY_FORCE_SCRIPT_INTERFACE:contains_mercenaries() end
function MILITARY_FORCE_SCRIPT_INTERFACE:upkeep() end
function MILITARY_FORCE_SCRIPT_INTERFACE:active_stance() end
function MILITARY_FORCE_SCRIPT_INTERFACE:can_activate_stance() end
function MILITARY_FORCE_SCRIPT_INTERFACE:morale() end
function MILITARY_FORCE_SCRIPT_INTERFACE:is_armed_citizenry() end
function MILITARY_FORCE_SCRIPT_INTERFACE:can_recruit_agent_at_force() end
function MILITARY_FORCE_SCRIPT_INTERFACE:can_recruit_unit() end
function MILITARY_FORCE_SCRIPT_INTERFACE:can_recruit_unit_class() end
function MILITARY_FORCE_SCRIPT_INTERFACE:can_recruit_unit_category() end
function MILITARY_FORCE_SCRIPT_INTERFACE:strength() end
function MILITARY_FORCE_SCRIPT_INTERFACE:has_effect_bundle() end
function MILITARY_FORCE_SCRIPT_INTERFACE:effect_bundles() end
function MILITARY_FORCE_SCRIPT_INTERFACE:force_type() end

---@class SETTLEMENT_SCRIPT_INTERFACE Description: Settlement script interface
local SETTLEMENT_SCRIPT_INTERFACE = {}
function SETTLEMENT_SCRIPT_INTERFACE:is_null_interface() end
function SETTLEMENT_SCRIPT_INTERFACE:cqi() end
function SETTLEMENT_SCRIPT_INTERFACE:has_commander() end
function SETTLEMENT_SCRIPT_INTERFACE:logical_position_x() end
function SETTLEMENT_SCRIPT_INTERFACE:logical_position_y() end
function SETTLEMENT_SCRIPT_INTERFACE:display_position_x() end
function SETTLEMENT_SCRIPT_INTERFACE:display_position_y() end
function SETTLEMENT_SCRIPT_INTERFACE:display_primary_building_chain() end
function SETTLEMENT_SCRIPT_INTERFACE:primary_building_chain() end
function SETTLEMENT_SCRIPT_INTERFACE:model() end
function SETTLEMENT_SCRIPT_INTERFACE:commander() end
function SETTLEMENT_SCRIPT_INTERFACE:faction() end
function SETTLEMENT_SCRIPT_INTERFACE:region() end
function SETTLEMENT_SCRIPT_INTERFACE:slot_list() end
function SETTLEMENT_SCRIPT_INTERFACE:is_port() end
function SETTLEMENT_SCRIPT_INTERFACE:get_climate() end
function SETTLEMENT_SCRIPT_INTERFACE:primary_slot() end
function SETTLEMENT_SCRIPT_INTERFACE:port_slot() end
function SETTLEMENT_SCRIPT_INTERFACE:active_secondary_slots() end
function SETTLEMENT_SCRIPT_INTERFACE:first_empty_active_secondary_slot() end

---@class SEA_REGION_LIST_SCRIPT_INTERFACE Description: Sea Region List script interface, a list of sea regions
local SEA_REGION_LIST_SCRIPT_INTERFACE = {}
function SEA_REGION_LIST_SCRIPT_INTERFACE:is_null_interface() end

---@class RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE Description: Ritual Target Region Status Script Interface
local RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE = {}
function RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE:is_null_interface() end
function RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE:valid() end
function RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE:wrong_type() end
function RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE:no_target() end
function RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE:not_own() end
function RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE:is_own() end
function RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE:invalid_subculture() end
function RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE:foreign_slot_subculture_not_present() end
function RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE:foreign_slot_set_not_present() end
function RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE:foreign_slot_set_present() end
function RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE:is_ruin() end
function RITUAL_TARGET_REGION_STATUS_SCRIPT_INTERFACE:is_not_ruin() end

---@class FAMILY_MEMBER_LIST_SCRIPT_INTERFACE Description: A list of family member interfaces
local FAMILY_MEMBER_LIST_SCRIPT_INTERFACE = {}
function FAMILY_MEMBER_LIST_SCRIPT_INTERFACE:num_items() end
function FAMILY_MEMBER_LIST_SCRIPT_INTERFACE:item_at() end
function FAMILY_MEMBER_LIST_SCRIPT_INTERFACE:is_empty() end

---@class RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE Description: Ritual Performing Character Script Interface
local RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE = {}
function RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:is_null_interface() end
function RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:performer_record() end
function RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:performer() end
function RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:status() end
function RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:status_with_performer() end
function RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:required_agent_type() end
function RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:required_agent_subtype() end
function RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:required_level() end
function RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:recovery_time() end

---@class FACTION_SCRIPT_INTERFACE Description: Faction interface
local FACTION_SCRIPT_INTERFACE = {}
function FACTION_SCRIPT_INTERFACE:is_null_interface() end
function FACTION_SCRIPT_INTERFACE:command_queue_index() end
function FACTION_SCRIPT_INTERFACE:region_list() end
function FACTION_SCRIPT_INTERFACE:character_list() end
function FACTION_SCRIPT_INTERFACE:military_force_list() end
function FACTION_SCRIPT_INTERFACE:model() end
function FACTION_SCRIPT_INTERFACE:is_human() end
function FACTION_SCRIPT_INTERFACE:name() end
function FACTION_SCRIPT_INTERFACE:home_region() end
function FACTION_SCRIPT_INTERFACE:faction_leader() end
function FACTION_SCRIPT_INTERFACE:has_faction_leader() end
function FACTION_SCRIPT_INTERFACE:has_home_region() end
function FACTION_SCRIPT_INTERFACE:flag_path() end
function FACTION_SCRIPT_INTERFACE:started_war_this_turn() end
function FACTION_SCRIPT_INTERFACE:ended_war_this_turn() end
function FACTION_SCRIPT_INTERFACE:ancillary_exists() end
function FACTION_SCRIPT_INTERFACE:num_allies() end
function FACTION_SCRIPT_INTERFACE:at_war() end
function FACTION_SCRIPT_INTERFACE:allied_with() end
function FACTION_SCRIPT_INTERFACE:military_allies_with() end
function FACTION_SCRIPT_INTERFACE:defensive_allies_with() end
function FACTION_SCRIPT_INTERFACE:is_vassal_of() end
function FACTION_SCRIPT_INTERFACE:is_ally_vassal_or_client_state_of() end
function FACTION_SCRIPT_INTERFACE:at_war_with() end
function FACTION_SCRIPT_INTERFACE:trade_resource_exists() end
function FACTION_SCRIPT_INTERFACE:trade_value() end
function FACTION_SCRIPT_INTERFACE:trade_value_percent() end
function FACTION_SCRIPT_INTERFACE:unused_international_trade_route() end
function FACTION_SCRIPT_INTERFACE:trade_route_limit_reached() end
function FACTION_SCRIPT_INTERFACE:sea_trade_route_raided() end
function FACTION_SCRIPT_INTERFACE:trade_ship_not_in_trade_node() end
function FACTION_SCRIPT_INTERFACE:treasury() end
function FACTION_SCRIPT_INTERFACE:treasury_percent() end
function FACTION_SCRIPT_INTERFACE:losing_money() end
function FACTION_SCRIPT_INTERFACE:tax_level() end
function FACTION_SCRIPT_INTERFACE:upkeep_expenditure_percent() end
function FACTION_SCRIPT_INTERFACE:research_queue_idle() end
function FACTION_SCRIPT_INTERFACE:has_technology() end
function FACTION_SCRIPT_INTERFACE:state_religion() end
function FACTION_SCRIPT_INTERFACE:num_generals() end
function FACTION_SCRIPT_INTERFACE:culture() end
function FACTION_SCRIPT_INTERFACE:subculture() end
function FACTION_SCRIPT_INTERFACE:has_food_shortages() end
function FACTION_SCRIPT_INTERFACE:imperium_level() end
function FACTION_SCRIPT_INTERFACE:diplomatic_standing_with() end
function FACTION_SCRIPT_INTERFACE:diplomatic_attitude_towards() end
function FACTION_SCRIPT_INTERFACE:factions_non_aggression_pact_with() end
function FACTION_SCRIPT_INTERFACE:factions_trading_with() end
function FACTION_SCRIPT_INTERFACE:factions_at_war_with() end
function FACTION_SCRIPT_INTERFACE:factions_met() end
function FACTION_SCRIPT_INTERFACE:factions_of_same_culture() end
function FACTION_SCRIPT_INTERFACE:factions_of_same_subculture() end
function FACTION_SCRIPT_INTERFACE:is_quest_battle_faction() end
function FACTION_SCRIPT_INTERFACE:holds_entire_province() end
function FACTION_SCRIPT_INTERFACE:is_vassal() end
function FACTION_SCRIPT_INTERFACE:is_dead() end
function FACTION_SCRIPT_INTERFACE:total_food() end
function FACTION_SCRIPT_INTERFACE:food_production() end
function FACTION_SCRIPT_INTERFACE:food_consumption() end
function FACTION_SCRIPT_INTERFACE:get_food_factor_value() end
function FACTION_SCRIPT_INTERFACE:get_food_factor_base_value() end
function FACTION_SCRIPT_INTERFACE:get_food_factor_multiplier() end
function FACTION_SCRIPT_INTERFACE:unique_agents() end
function FACTION_SCRIPT_INTERFACE:has_effect_bundle() end
function FACTION_SCRIPT_INTERFACE:has_rituals() end
function FACTION_SCRIPT_INTERFACE:rituals() end
function FACTION_SCRIPT_INTERFACE:has_faction_slaves() end
function FACTION_SCRIPT_INTERFACE:num_faction_slaves() end
function FACTION_SCRIPT_INTERFACE:max_faction_slaves() end
function FACTION_SCRIPT_INTERFACE:percentage_faction_slaves() end
function FACTION_SCRIPT_INTERFACE:pooled_resources() end
function FACTION_SCRIPT_INTERFACE:pooled_resource() end
function FACTION_SCRIPT_INTERFACE:has_pooled_resource() end
function FACTION_SCRIPT_INTERFACE:has_ritual_chain() end
function FACTION_SCRIPT_INTERFACE:has_access_to_ritual_category() end
function FACTION_SCRIPT_INTERFACE:get_climate_suitability() end
function FACTION_SCRIPT_INTERFACE:foreign_slot_managers() end
function FACTION_SCRIPT_INTERFACE:is_allowed_to_capture_territory() end
function FACTION_SCRIPT_INTERFACE:effect_bundles() end
function FACTION_SCRIPT_INTERFACE:is_rebel() end
function FACTION_SCRIPT_INTERFACE:is_faction() end
function FACTION_SCRIPT_INTERFACE:unit_cap() end
function FACTION_SCRIPT_INTERFACE:unit_cap_remaining() end

---@class SLOT_SCRIPT_INTERFACE Description: Slot script interface
local SLOT_SCRIPT_INTERFACE = {}
function SLOT_SCRIPT_INTERFACE:is_null_interface() end
function SLOT_SCRIPT_INTERFACE:has_building() end
function SLOT_SCRIPT_INTERFACE:model() end
function SLOT_SCRIPT_INTERFACE:region() end
function SLOT_SCRIPT_INTERFACE:building() end
function SLOT_SCRIPT_INTERFACE:faction() end
function SLOT_SCRIPT_INTERFACE:type() end
function SLOT_SCRIPT_INTERFACE:name() end
function SLOT_SCRIPT_INTERFACE:template_key() end
function SLOT_SCRIPT_INTERFACE:resource_key() end
function SLOT_SCRIPT_INTERFACE:active() end

---@class EFFECT_LIST_SCRIPT_INTERFACE Description: A list of effects
local EFFECT_LIST_SCRIPT_INTERFACE = {}
function EFFECT_LIST_SCRIPT_INTERFACE:num_items() end
function EFFECT_LIST_SCRIPT_INTERFACE:item_at() end
function EFFECT_LIST_SCRIPT_INTERFACE:is_empty() end

---@class UNIQUE_AGENT_DETAILS_LIST_SCRIPT_INTERFACE Description: A list of unique agent details
local UNIQUE_AGENT_DETAILS_LIST_SCRIPT_INTERFACE = {}
function UNIQUE_AGENT_DETAILS_LIST_SCRIPT_INTERFACE:num_items() end
function UNIQUE_AGENT_DETAILS_LIST_SCRIPT_INTERFACE:item_at() end
function UNIQUE_AGENT_DETAILS_LIST_SCRIPT_INTERFACE:is_empty() end
function UNIQUE_AGENT_DETAILS_LIST_SCRIPT_INTERFACE:has_unique_agent_details() end

---@class SEA_REGION_MANAGER_SCRIPT_INTERFACE Description: Sea Region Manager script interface, world sea region list, faction sea regions and lookup by key
local SEA_REGION_MANAGER_SCRIPT_INTERFACE = {}
function SEA_REGION_MANAGER_SCRIPT_INTERFACE:is_null_interface() end
function SEA_REGION_MANAGER_SCRIPT_INTERFACE:model() end
function SEA_REGION_MANAGER_SCRIPT_INTERFACE:sea_region_list() end
function SEA_REGION_MANAGER_SCRIPT_INTERFACE:faction_sea_region_list() end
function SEA_REGION_MANAGER_SCRIPT_INTERFACE:sea_region_by_key() end

---@class CHARACTER_IMPRISONMENT_REJECTION_REASON_MASK_SCRIPTING_INTERFACE Description: Character Imprisonment Rejection Reason Mask Scripting Interface
local CHARACTER_IMPRISONMENT_REJECTION_REASON_MASK_SCRIPTING_INTERFACE = {}
function CHARACTER_IMPRISONMENT_REJECTION_REASON_MASK_SCRIPTING_INTERFACE:is_null_interface() end
function CHARACTER_IMPRISONMENT_REJECTION_REASON_MASK_SCRIPTING_INTERFACE:is_member_of_garrison() end
function CHARACTER_IMPRISONMENT_REJECTION_REASON_MASK_SCRIPTING_INTERFACE:is_placeholder_character() end
function CHARACTER_IMPRISONMENT_REJECTION_REASON_MASK_SCRIPTING_INTERFACE:is_from_rebel_faction() end
function CHARACTER_IMPRISONMENT_REJECTION_REASON_MASK_SCRIPTING_INTERFACE:is_from_companion_faction() end
function CHARACTER_IMPRISONMENT_REJECTION_REASON_MASK_SCRIPTING_INTERFACE:is_from_dead_faction() end
function CHARACTER_IMPRISONMENT_REJECTION_REASON_MASK_SCRIPTING_INTERFACE:any() end

---@class UNIT_LIST_SCRIPT_INTERFACE Description: A list of units
local UNIT_LIST_SCRIPT_INTERFACE = {}
function UNIT_LIST_SCRIPT_INTERFACE:num_items() end
function UNIT_LIST_SCRIPT_INTERFACE:item_at() end
function UNIT_LIST_SCRIPT_INTERFACE:is_empty() end
function UNIT_LIST_SCRIPT_INTERFACE:has_unit() end

---@class REGION_DATA_SCRIPT_INTERFACE Description: Region Data Script Interface, a region of the campaign map. May or may not be represented by a region or sea region
local REGION_DATA_SCRIPT_INTERFACE = {}
function REGION_DATA_SCRIPT_INTERFACE:is_null_interface() end
function REGION_DATA_SCRIPT_INTERFACE:key() end
function REGION_DATA_SCRIPT_INTERFACE:is_sea() end
function REGION_DATA_SCRIPT_INTERFACE:get_bounds() end

---@class CAMPAIGN_MISSION_SCRIPT_INTERFACE Description: Mission script interface.
local CAMPAIGN_MISSION_SCRIPT_INTERFACE = {}
function CAMPAIGN_MISSION_SCRIPT_INTERFACE:is_null_interface() end
function CAMPAIGN_MISSION_SCRIPT_INTERFACE:model() end
function CAMPAIGN_MISSION_SCRIPT_INTERFACE:faction() end
function CAMPAIGN_MISSION_SCRIPT_INTERFACE:mission_record_key() end
function CAMPAIGN_MISSION_SCRIPT_INTERFACE:mission_issuer_record_key() end

---@class EFFECT_SCRIPT_INTERFACE Description: An effect that provides bonus values via a scope
local EFFECT_SCRIPT_INTERFACE = {}
function EFFECT_SCRIPT_INTERFACE:is_null_interface() end
function EFFECT_SCRIPT_INTERFACE:key() end
function EFFECT_SCRIPT_INTERFACE:scope() end
function EFFECT_SCRIPT_INTERFACE:value() end

---@class BUILDING_SCRIPT_INTERFACE Description: Building script interface
local BUILDING_SCRIPT_INTERFACE = {}
function BUILDING_SCRIPT_INTERFACE:is_null_interface() end
function BUILDING_SCRIPT_INTERFACE:model() end
function BUILDING_SCRIPT_INTERFACE:faction() end
function BUILDING_SCRIPT_INTERFACE:region() end
function BUILDING_SCRIPT_INTERFACE:slot() end
function BUILDING_SCRIPT_INTERFACE:name() end
function BUILDING_SCRIPT_INTERFACE:chain() end
function BUILDING_SCRIPT_INTERFACE:superchain() end
function BUILDING_SCRIPT_INTERFACE:percent_health() end
function BUILDING_SCRIPT_INTERFACE:building_level() end

---@class RITUAL_TARGET_MILITARY_FORCE_STATUS_SCRIPT_INTERFACE Description: Ritual Target Military Force Status Script Interface
local RITUAL_TARGET_MILITARY_FORCE_STATUS_SCRIPT_INTERFACE = {}
function RITUAL_TARGET_MILITARY_FORCE_STATUS_SCRIPT_INTERFACE:is_null_interface() end
function RITUAL_TARGET_MILITARY_FORCE_STATUS_SCRIPT_INTERFACE:valid() end
function RITUAL_TARGET_MILITARY_FORCE_STATUS_SCRIPT_INTERFACE:wrong_type() end
function RITUAL_TARGET_MILITARY_FORCE_STATUS_SCRIPT_INTERFACE:no_target() end
function RITUAL_TARGET_MILITARY_FORCE_STATUS_SCRIPT_INTERFACE:not_own() end
function RITUAL_TARGET_MILITARY_FORCE_STATUS_SCRIPT_INTERFACE:is_own() end
function RITUAL_TARGET_MILITARY_FORCE_STATUS_SCRIPT_INTERFACE:invalid_subculture() end
function RITUAL_TARGET_MILITARY_FORCE_STATUS_SCRIPT_INTERFACE:invalid_for_any_ritual() end
function RITUAL_TARGET_MILITARY_FORCE_STATUS_SCRIPT_INTERFACE:not_on_sea() end
function RITUAL_TARGET_MILITARY_FORCE_STATUS_SCRIPT_INTERFACE:not_on_land() end

---@class UNIT_PURCHASABLE_EFFECT_LIST_SCRIPT_INTERFACE Description: A list of unit purchasable effects
local UNIT_PURCHASABLE_EFFECT_LIST_SCRIPT_INTERFACE = {}
function UNIT_PURCHASABLE_EFFECT_LIST_SCRIPT_INTERFACE:num_items() end
function UNIT_PURCHASABLE_EFFECT_LIST_SCRIPT_INTERFACE:item_at() end
function UNIT_PURCHASABLE_EFFECT_LIST_SCRIPT_INTERFACE:is_empty() end

---@class RITUAL_TARGET_FACTION_STATUS_SCRIPT_INTERFACE Description: Ritual Target Faction Status Script Interface
local RITUAL_TARGET_FACTION_STATUS_SCRIPT_INTERFACE = {}
function RITUAL_TARGET_FACTION_STATUS_SCRIPT_INTERFACE:is_null_interface() end
function RITUAL_TARGET_FACTION_STATUS_SCRIPT_INTERFACE:valid() end
function RITUAL_TARGET_FACTION_STATUS_SCRIPT_INTERFACE:wrong_type() end
function RITUAL_TARGET_FACTION_STATUS_SCRIPT_INTERFACE:no_target() end
function RITUAL_TARGET_FACTION_STATUS_SCRIPT_INTERFACE:not_own() end
function RITUAL_TARGET_FACTION_STATUS_SCRIPT_INTERFACE:is_own() end
function RITUAL_TARGET_FACTION_STATUS_SCRIPT_INTERFACE:invalid_for_any_ritual() end
function RITUAL_TARGET_FACTION_STATUS_SCRIPT_INTERFACE:human() end
function RITUAL_TARGET_FACTION_STATUS_SCRIPT_INTERFACE:not_human() end
function RITUAL_TARGET_FACTION_STATUS_SCRIPT_INTERFACE:faction_not_permitted() end

---@class PENDING_BATTLE_SCRIPT_INTERFACE Description: Pending battle script interface.
local PENDING_BATTLE_SCRIPT_INTERFACE = {}
function PENDING_BATTLE_SCRIPT_INTERFACE:is_null_interface() end
function PENDING_BATTLE_SCRIPT_INTERFACE:has_attacker() end
function PENDING_BATTLE_SCRIPT_INTERFACE:has_defender() end
function PENDING_BATTLE_SCRIPT_INTERFACE:has_contested_garrison() end
function PENDING_BATTLE_SCRIPT_INTERFACE:model() end
function PENDING_BATTLE_SCRIPT_INTERFACE:attacker() end
function PENDING_BATTLE_SCRIPT_INTERFACE:secondary_attackers() end
function PENDING_BATTLE_SCRIPT_INTERFACE:defender() end
function PENDING_BATTLE_SCRIPT_INTERFACE:secondary_defenders() end
function PENDING_BATTLE_SCRIPT_INTERFACE:contested_garrison() end
function PENDING_BATTLE_SCRIPT_INTERFACE:is_active() end
function PENDING_BATTLE_SCRIPT_INTERFACE:attacker_is_stronger() end
function PENDING_BATTLE_SCRIPT_INTERFACE:percentage_of_attacker_killed() end
function PENDING_BATTLE_SCRIPT_INTERFACE:percentage_of_defender_killed() end
function PENDING_BATTLE_SCRIPT_INTERFACE:percentage_of_attacker_routed() end
function PENDING_BATTLE_SCRIPT_INTERFACE:percentage_of_defender_routed() end
function PENDING_BATTLE_SCRIPT_INTERFACE:attacker_commander_fought_in_battle() end
function PENDING_BATTLE_SCRIPT_INTERFACE:defender_commander_fought_in_battle() end
function PENDING_BATTLE_SCRIPT_INTERFACE:attacker_commander_fought_in_melee() end
function PENDING_BATTLE_SCRIPT_INTERFACE:defender_commander_fought_in_melee() end
function PENDING_BATTLE_SCRIPT_INTERFACE:attacker_battle_result() end
function PENDING_BATTLE_SCRIPT_INTERFACE:defender_battle_result() end
function PENDING_BATTLE_SCRIPT_INTERFACE:naval_battle() end
function PENDING_BATTLE_SCRIPT_INTERFACE:seige_battle() end
function PENDING_BATTLE_SCRIPT_INTERFACE:ambush_battle() end
function PENDING_BATTLE_SCRIPT_INTERFACE:failed_ambush_battle() end
function PENDING_BATTLE_SCRIPT_INTERFACE:night_battle() end
function PENDING_BATTLE_SCRIPT_INTERFACE:battle_type() end
function PENDING_BATTLE_SCRIPT_INTERFACE:attacker_strength() end
function PENDING_BATTLE_SCRIPT_INTERFACE:defender_strength() end
function PENDING_BATTLE_SCRIPT_INTERFACE:has_been_fought() end
function PENDING_BATTLE_SCRIPT_INTERFACE:set_piece_battle_key() end
function PENDING_BATTLE_SCRIPT_INTERFACE:has_scripted_tile_upgrade() end
function PENDING_BATTLE_SCRIPT_INTERFACE:get_how_many_times_ability_has_been_used_in_battle() end
function PENDING_BATTLE_SCRIPT_INTERFACE:is_auto_resolved() end

---@class RITUAL_SETUP_SCRIPT_INTERFACE Description: Ritual Setup Script Interface
local RITUAL_SETUP_SCRIPT_INTERFACE = {}
function RITUAL_SETUP_SCRIPT_INTERFACE:is_null_interface() end
function RITUAL_SETUP_SCRIPT_INTERFACE:performing_faction() end
function RITUAL_SETUP_SCRIPT_INTERFACE:ritual_record() end
function RITUAL_SETUP_SCRIPT_INTERFACE:performing_characters_valid() end
function RITUAL_SETUP_SCRIPT_INTERFACE:performing_characters() end
function RITUAL_SETUP_SCRIPT_INTERFACE:target() end
function RITUAL_SETUP_SCRIPT_INTERFACE:clone_as_modify_interface() end

---@class POOLED_RESOURCE_SCRIPT_INTERFACE Description: Pooled Resource Script Interface
local POOLED_RESOURCE_SCRIPT_INTERFACE = {}
function POOLED_RESOURCE_SCRIPT_INTERFACE:is_null_interface() end
function POOLED_RESOURCE_SCRIPT_INTERFACE:key() end
function POOLED_RESOURCE_SCRIPT_INTERFACE:value() end
function POOLED_RESOURCE_SCRIPT_INTERFACE:percentage_of_capacity() end
function POOLED_RESOURCE_SCRIPT_INTERFACE:minimum_value() end
function POOLED_RESOURCE_SCRIPT_INTERFACE:maximum_value() end
function POOLED_RESOURCE_SCRIPT_INTERFACE:active_effect() end
function POOLED_RESOURCE_SCRIPT_INTERFACE:number_of_effect_types() end
function POOLED_RESOURCE_SCRIPT_INTERFACE:factors() end
function POOLED_RESOURCE_SCRIPT_INTERFACE:factor_by_key() end

---@class FACTION_LIST_SCRIPT_INTERFACE Description: A list of faction interfaces
local FACTION_LIST_SCRIPT_INTERFACE = {}
function FACTION_LIST_SCRIPT_INTERFACE:num_items() end
function FACTION_LIST_SCRIPT_INTERFACE:item_at() end
function FACTION_LIST_SCRIPT_INTERFACE:is_empty() end

---@class COOKING_DISH_SCRIPT_INTERFACE Description: Cook Dish Script Interface
local COOKING_DISH_SCRIPT_INTERFACE = {}
function COOKING_DISH_SCRIPT_INTERFACE:is_null_interface() end
function COOKING_DISH_SCRIPT_INTERFACE:recipe() end
function COOKING_DISH_SCRIPT_INTERFACE:ingredients() end
function COOKING_DISH_SCRIPT_INTERFACE:faction_effects() end
function COOKING_DISH_SCRIPT_INTERFACE:faction_leader_effects() end
function COOKING_DISH_SCRIPT_INTERFACE:remaining_duration() end

---@class REGION_SCRIPT_INTERFACE Description: Region script interface, includes region finance and slot/settlement info
local REGION_SCRIPT_INTERFACE = {}
function REGION_SCRIPT_INTERFACE:is_null_interface() end
function REGION_SCRIPT_INTERFACE:cqi() end
function REGION_SCRIPT_INTERFACE:model() end
function REGION_SCRIPT_INTERFACE:owning_faction() end
function REGION_SCRIPT_INTERFACE:slot_list() end
function REGION_SCRIPT_INTERFACE:settlement() end
function REGION_SCRIPT_INTERFACE:garrison_residence() end
function REGION_SCRIPT_INTERFACE:name() end
function REGION_SCRIPT_INTERFACE:province_name() end
function REGION_SCRIPT_INTERFACE:public_order() end
function REGION_SCRIPT_INTERFACE:num_buildings() end
function REGION_SCRIPT_INTERFACE:slot_type_exists() end
function REGION_SCRIPT_INTERFACE:building_exists() end
function REGION_SCRIPT_INTERFACE:last_building_constructed_key() end
function REGION_SCRIPT_INTERFACE:resource_exists() end
function REGION_SCRIPT_INTERFACE:any_resource_available() end
function REGION_SCRIPT_INTERFACE:town_wealth_growth() end
function REGION_SCRIPT_INTERFACE:adjacent_region_list() end
function REGION_SCRIPT_INTERFACE:majority_religion() end
function REGION_SCRIPT_INTERFACE:region_wealth_change_percent() end
function REGION_SCRIPT_INTERFACE:squalor() end
function REGION_SCRIPT_INTERFACE:sanitation() end
function REGION_SCRIPT_INTERFACE:is_abandoned() end
function REGION_SCRIPT_INTERFACE:religion_proportion() end
function REGION_SCRIPT_INTERFACE:can_recruit_agent_at_settlement() end
function REGION_SCRIPT_INTERFACE:faction_province_growth() end
function REGION_SCRIPT_INTERFACE:faction_province_growth_per_turn() end
function REGION_SCRIPT_INTERFACE:is_province_capital() end
function REGION_SCRIPT_INTERFACE:has_development_points_to_upgrade() end
function REGION_SCRIPT_INTERFACE:has_faction_province_slaves() end
function REGION_SCRIPT_INTERFACE:num_faction_province_slaves() end
function REGION_SCRIPT_INTERFACE:max_faction_province_slaves() end
function REGION_SCRIPT_INTERFACE:percentage_faction_province_slaves() end
function REGION_SCRIPT_INTERFACE:has_active_storm() end
function REGION_SCRIPT_INTERFACE:region_data_interface() end
function REGION_SCRIPT_INTERFACE:get_selected_edict_key() end
function REGION_SCRIPT_INTERFACE:get_active_edict_key() end
function REGION_SCRIPT_INTERFACE:foreign_slot_managers() end
function REGION_SCRIPT_INTERFACE:foreign_slot_manager_for_faction() end
function REGION_SCRIPT_INTERFACE:effect_bundles() end
function REGION_SCRIPT_INTERFACE:faction_province_effect_bundles() end
function REGION_SCRIPT_INTERFACE:has_effect_bundle() end
function REGION_SCRIPT_INTERFACE:faction_province_has_effect_bundle() end

---@class ACTIVE_RITUAL_SCRIPT_INTERFACE Description: Active Ritual Script Interface
local ACTIVE_RITUAL_SCRIPT_INTERFACE = {}
function ACTIVE_RITUAL_SCRIPT_INTERFACE:is_null_interface() end
function ACTIVE_RITUAL_SCRIPT_INTERFACE:ritual_key() end
function ACTIVE_RITUAL_SCRIPT_INTERFACE:ritual_chain_key() end
function ACTIVE_RITUAL_SCRIPT_INTERFACE:is_part_of_chain() end
function ACTIVE_RITUAL_SCRIPT_INTERFACE:target_faction() end
function ACTIVE_RITUAL_SCRIPT_INTERFACE:cast_time() end
function ACTIVE_RITUAL_SCRIPT_INTERFACE:cooldown_time() end
function ACTIVE_RITUAL_SCRIPT_INTERFACE:expended_resources() end
function ACTIVE_RITUAL_SCRIPT_INTERFACE:slave_cost() end
function ACTIVE_RITUAL_SCRIPT_INTERFACE:ritual_sites() end
function ACTIVE_RITUAL_SCRIPT_INTERFACE:ritual_category() end
function ACTIVE_RITUAL_SCRIPT_INTERFACE:ritual_target() end
function ACTIVE_RITUAL_SCRIPT_INTERFACE:characters_who_performed() end

---@class FACTION_RITUALS_SCRIPT_INTERFACE Description: Faction Rituals Script Interface
local FACTION_RITUALS_SCRIPT_INTERFACE = {}
function FACTION_RITUALS_SCRIPT_INTERFACE:is_null_interface() end
function FACTION_RITUALS_SCRIPT_INTERFACE:active_rituals() end
function FACTION_RITUALS_SCRIPT_INTERFACE:ritual_status() end

---@class POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE Description: Pooled Resource Factor Script Interface
local POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE = {}
function POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE:is_null_interface() end
function POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE:key() end
function POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE:value() end
function POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE:percentage_of_capacity() end
function POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE:minimum_value() end
function POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE:maximum_value() end

---@class MODEL_SCRIPT_INTERFACE Description: Model is the central access point of the campaign. Everything should be reachable from this interface
local MODEL_SCRIPT_INTERFACE = {}
function MODEL_SCRIPT_INTERFACE:is_null_interface() end
---@return WORLD_SCRIPT_INTERFACE
function MODEL_SCRIPT_INTERFACE:world() end
function MODEL_SCRIPT_INTERFACE:pending_battle() end
function MODEL_SCRIPT_INTERFACE:date_in_range() end
function MODEL_SCRIPT_INTERFACE:date_and_week_in_range() end
function MODEL_SCRIPT_INTERFACE:turn_number() end
function MODEL_SCRIPT_INTERFACE:campaign_name() end
function MODEL_SCRIPT_INTERFACE:random_percent() end
function MODEL_SCRIPT_INTERFACE:random_int() end
function MODEL_SCRIPT_INTERFACE:is_multiplayer() end
function MODEL_SCRIPT_INTERFACE:is_player_turn() end
function MODEL_SCRIPT_INTERFACE:character_can_reach_character() end
function MODEL_SCRIPT_INTERFACE:character_can_reach_settlement() end
function MODEL_SCRIPT_INTERFACE:difficulty_level() end
function MODEL_SCRIPT_INTERFACE:combined_difficulty_level() end
function MODEL_SCRIPT_INTERFACE:faction_is_local() end
function MODEL_SCRIPT_INTERFACE:player_steam_id_is_even() end
function MODEL_SCRIPT_INTERFACE:campaign_ai() end
function MODEL_SCRIPT_INTERFACE:campaign_type() end
function MODEL_SCRIPT_INTERFACE:prison_system() end
function MODEL_SCRIPT_INTERFACE:character_for_command_queue_index() end
function MODEL_SCRIPT_INTERFACE:military_force_for_command_queue_index() end
function MODEL_SCRIPT_INTERFACE:faction_for_command_queue_index() end
function MODEL_SCRIPT_INTERFACE:has_character_command_queue_index() end
function MODEL_SCRIPT_INTERFACE:has_military_force_command_queue_index() end
function MODEL_SCRIPT_INTERFACE:has_faction_command_queue_index() end
function MODEL_SCRIPT_INTERFACE:shared_states_manager() end

---@class RITUAL_PERFORMING_CHARACTER_LIST_SCRIPT_INTERFACE Description: A list of ritual performing character script interfaces
local RITUAL_PERFORMING_CHARACTER_LIST_SCRIPT_INTERFACE = {}
function RITUAL_PERFORMING_CHARACTER_LIST_SCRIPT_INTERFACE:num_items() end
function RITUAL_PERFORMING_CHARACTER_LIST_SCRIPT_INTERFACE:item_at() end
function RITUAL_PERFORMING_CHARACTER_LIST_SCRIPT_INTERFACE:is_empty() end

---@class WORLD_SCRIPT_INTERFACE Description: Contains entities that exist in the game world. Examples include the region manager and faction list
local WORLD_SCRIPT_INTERFACE = {}
function WORLD_SCRIPT_INTERFACE:is_null_interface() end
function WORLD_SCRIPT_INTERFACE:faction_list() end
function WORLD_SCRIPT_INTERFACE:region_manager() end
function WORLD_SCRIPT_INTERFACE:sea_region_manager() end
function WORLD_SCRIPT_INTERFACE:model() end
function WORLD_SCRIPT_INTERFACE:faction_by_key() end
function WORLD_SCRIPT_INTERFACE:faction_exists() end
function WORLD_SCRIPT_INTERFACE:ancillary_exists() end
function WORLD_SCRIPT_INTERFACE:climate_phase_index() end
function WORLD_SCRIPT_INTERFACE:whose_turn_is_it() end
function WORLD_SCRIPT_INTERFACE:region_data() end
function WORLD_SCRIPT_INTERFACE:land_region_data() end
function WORLD_SCRIPT_INTERFACE:sea_region_data() end
function WORLD_SCRIPT_INTERFACE:cooking_system() end
function WORLD_SCRIPT_INTERFACE:characters_owning_ancillary() end

---@class FACTION_COOKING_INFO_SCRIPT_INTERFACE Description: Faction Cooking Info Script Interface
local FACTION_COOKING_INFO_SCRIPT_INTERFACE = {}
function FACTION_COOKING_INFO_SCRIPT_INTERFACE:is_null_interface() end
function FACTION_COOKING_INFO_SCRIPT_INTERFACE:is_recipe_available() end
function FACTION_COOKING_INFO_SCRIPT_INTERFACE:is_ingredient_available() end
function FACTION_COOKING_INFO_SCRIPT_INTERFACE:is_recipe_unlocked() end
function FACTION_COOKING_INFO_SCRIPT_INTERFACE:is_ingredient_unlocked() end
function FACTION_COOKING_INFO_SCRIPT_INTERFACE:active_dish() end
function FACTION_COOKING_INFO_SCRIPT_INTERFACE:max_primary_ingredients() end
function FACTION_COOKING_INFO_SCRIPT_INTERFACE:max_secondary_ingredients() end

---@class REGION_DATA_LIST_SCRIPT_INTERFACE Description: A list of region datas
local REGION_DATA_LIST_SCRIPT_INTERFACE = {}
function REGION_DATA_LIST_SCRIPT_INTERFACE:num_items() end
function REGION_DATA_LIST_SCRIPT_INTERFACE:item_at() end
function REGION_DATA_LIST_SCRIPT_INTERFACE:is_empty() end

---@class EFFECT_BUNDLE_LIST_SCRIPT_INTERFACE Description: A list of effects
local EFFECT_BUNDLE_LIST_SCRIPT_INTERFACE = {}
function EFFECT_BUNDLE_LIST_SCRIPT_INTERFACE:num_items() end
function EFFECT_BUNDLE_LIST_SCRIPT_INTERFACE:item_at() end
function EFFECT_BUNDLE_LIST_SCRIPT_INTERFACE:is_empty() end

---@class MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE Description: Modify Ritual Target Script Interface
local MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE = {}
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:is_null_interface() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:valid() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:target_faction_status() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:target_region_status() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:target_force_status() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:target_type() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:target_record_key() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:get_target_faction() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:get_target_region() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:get_target_force() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:is_faction_valid_target() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:is_region_valid_target() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:is_force_valid_target() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:can_target_self() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:status_for_faction_target() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:status_for_region_target() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:status_for_force_target() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:get_all_valid_target_forces_in_faction() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:get_all_valid_target_regions_in_faction() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:get_all_valid_target_factions() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:clear() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:set_target_faction() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:set_target_region() end
function MODIFY_RITUAL_TARGET_SCRIPT_INTERFACE:set_target_force() end

---@class RITUAL_PERFORMING_CHARACTER_STATUS_SCRIPT_INTERFACE Description: Ritual Performing Character Status Script Interface
local RITUAL_PERFORMING_CHARACTER_STATUS_SCRIPT_INTERFACE = {}
function RITUAL_PERFORMING_CHARACTER_STATUS_SCRIPT_INTERFACE:is_null_interface() end
function RITUAL_PERFORMING_CHARACTER_STATUS_SCRIPT_INTERFACE:valid() end
function RITUAL_PERFORMING_CHARACTER_STATUS_SCRIPT_INTERFACE:no_performer_provided() end
function RITUAL_PERFORMING_CHARACTER_STATUS_SCRIPT_INTERFACE:dead() end
function RITUAL_PERFORMING_CHARACTER_STATUS_SCRIPT_INTERFACE:wounded() end
function RITUAL_PERFORMING_CHARACTER_STATUS_SCRIPT_INTERFACE:wrong_agent_type() end
function RITUAL_PERFORMING_CHARACTER_STATUS_SCRIPT_INTERFACE:wrong_agent_subtype() end
function RITUAL_PERFORMING_CHARACTER_STATUS_SCRIPT_INTERFACE:level_too_low() end
function RITUAL_PERFORMING_CHARACTER_STATUS_SCRIPT_INTERFACE:duplicate_performer() end

---@class MODIFY_RITUAL_PERFORMING_CHARACTER_LIST_SCRIPT_INTERFACE Description: A list of mutable ritual performing character script interfaces
local MODIFY_RITUAL_PERFORMING_CHARACTER_LIST_SCRIPT_INTERFACE = {}
function MODIFY_RITUAL_PERFORMING_CHARACTER_LIST_SCRIPT_INTERFACE:num_items() end
function MODIFY_RITUAL_PERFORMING_CHARACTER_LIST_SCRIPT_INTERFACE:item_at() end
function MODIFY_RITUAL_PERFORMING_CHARACTER_LIST_SCRIPT_INTERFACE:is_empty() end

---@class FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE Description: Foreign Slot Manager Script Interface
local FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE = {}
function FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE:is_null_interface() end
function FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE:faction() end
function FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE:region() end
function FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE:slots() end
function FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE:num_slots() end
function FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE:has_upgrade_available() end
function FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE:gdp() end
function FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE:has_been_discovered() end
function FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE:current_discoverability() end
function FOREIGN_SLOT_MANAGER_SCRIPT_INTERFACE:discoverability_threshold() end

---@class ACTIVE_RITUAL_LIST_SCRIPT_INTERFACE Description: A list of active ritual script interfaces
local ACTIVE_RITUAL_LIST_SCRIPT_INTERFACE = {}
function ACTIVE_RITUAL_LIST_SCRIPT_INTERFACE:num_items() end
function ACTIVE_RITUAL_LIST_SCRIPT_INTERFACE:item_at() end
function ACTIVE_RITUAL_LIST_SCRIPT_INTERFACE:is_empty() end

---@class SLOT_LIST_SCRIPT_INTERFACE Description: A list of slot interfaces
local SLOT_LIST_SCRIPT_INTERFACE = {}
function SLOT_LIST_SCRIPT_INTERFACE:num_items() end
function SLOT_LIST_SCRIPT_INTERFACE:item_at() end
function SLOT_LIST_SCRIPT_INTERFACE:is_empty() end
function SLOT_LIST_SCRIPT_INTERFACE:slot_type_exists() end
function SLOT_LIST_SCRIPT_INTERFACE:buliding_type_exists() end

---@class COOKING_SYSTEM_SCRIPT_INTERFACE Description: Cook System Script Interface
local COOKING_SYSTEM_SCRIPT_INTERFACE = {}
function COOKING_SYSTEM_SCRIPT_INTERFACE:is_null_interface() end
function COOKING_SYSTEM_SCRIPT_INTERFACE:faction_cooking_info() end

---@class MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE Description: Modify Ritual Performing Character Script Interface
local MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE = {}
function MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:is_null_interface() end
function MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:performer_record() end
function MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:performer() end
function MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:status() end
function MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:status_with_performer() end
function MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:required_agent_type() end
function MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:required_agent_subtype() end
function MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:required_level() end
function MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:recovery_time() end
function MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:set_performer() end
function MODIFY_RITUAL_PERFORMING_CHARACTER_SCRIPT_INTERFACE:clear() end

---@class RITUAL_TARGET_SCRIPT_INTERFACE Description: Ritual Target Script Interface
local RITUAL_TARGET_SCRIPT_INTERFACE = {}
function RITUAL_TARGET_SCRIPT_INTERFACE:is_null_interface() end
function RITUAL_TARGET_SCRIPT_INTERFACE:valid() end
function RITUAL_TARGET_SCRIPT_INTERFACE:target_faction_status() end
function RITUAL_TARGET_SCRIPT_INTERFACE:target_region_status() end
function RITUAL_TARGET_SCRIPT_INTERFACE:target_force_status() end
function RITUAL_TARGET_SCRIPT_INTERFACE:target_type() end
function RITUAL_TARGET_SCRIPT_INTERFACE:target_record_key() end
function RITUAL_TARGET_SCRIPT_INTERFACE:get_target_faction() end
function RITUAL_TARGET_SCRIPT_INTERFACE:get_target_region() end
function RITUAL_TARGET_SCRIPT_INTERFACE:get_target_force() end
function RITUAL_TARGET_SCRIPT_INTERFACE:is_faction_valid_target() end
function RITUAL_TARGET_SCRIPT_INTERFACE:is_region_valid_target() end
function RITUAL_TARGET_SCRIPT_INTERFACE:is_force_valid_target() end
function RITUAL_TARGET_SCRIPT_INTERFACE:can_target_self() end
function RITUAL_TARGET_SCRIPT_INTERFACE:status_for_faction_target() end
function RITUAL_TARGET_SCRIPT_INTERFACE:status_for_region_target() end
function RITUAL_TARGET_SCRIPT_INTERFACE:status_for_force_target() end
function RITUAL_TARGET_SCRIPT_INTERFACE:get_all_valid_target_forces_in_faction() end
function RITUAL_TARGET_SCRIPT_INTERFACE:get_all_valid_target_regions_in_faction() end
function RITUAL_TARGET_SCRIPT_INTERFACE:get_all_valid_target_factions() end

---@class FOREIGN_SLOT_LIST_SCRIPT_INTERFACE Description: A list of foreign slot script interfaces
local FOREIGN_SLOT_LIST_SCRIPT_INTERFACE = {}
function FOREIGN_SLOT_LIST_SCRIPT_INTERFACE:num_items() end
function FOREIGN_SLOT_LIST_SCRIPT_INTERFACE:item_at() end
function FOREIGN_SLOT_LIST_SCRIPT_INTERFACE:is_empty() end

---@class GARRISON_RESIDENCE_SCRIPT_INTERFACE Description: Garrison residence interface, a residence that can act as a garrison for military forces. A Settlement is a garrison residence for example.
local GARRISON_RESIDENCE_SCRIPT_INTERFACE = {}
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:is_null_interface() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:command_queue_index() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:has_army() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:has_navy() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:model() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:faction() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:army() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:navy() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:region() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:unit_count() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:buildings() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:is_under_siege() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:can_assault() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:can_be_occupied_by_faction() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:is_settlement() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:is_slot() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:settlement_interface() end
function GARRISON_RESIDENCE_SCRIPT_INTERFACE:slot_interface() end

---@class UNIT_PURCHASABLE_EFFECT_SCRIPT_INTERFACE Description: Unit purchasable effect script interface.
local UNIT_PURCHASABLE_EFFECT_SCRIPT_INTERFACE = {}
function UNIT_PURCHASABLE_EFFECT_SCRIPT_INTERFACE:is_null_interface() end
function UNIT_PURCHASABLE_EFFECT_SCRIPT_INTERFACE:record_key() end

---@class MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE Description: Modify Ritual Setup Script Interface
local MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE = {}
function MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE:is_null_interface() end
function MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE:performing_faction() end
function MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE:ritual_record() end
function MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE:performing_characters_valid() end
function MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE:performing_characters() end
function MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE:target() end
function MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE:change_ritual() end
function MODIFY_RITUAL_SETUP_SCRIPT_INTERFACE:change_performing_faction() end

---@class REGION_LIST_SCRIPT_INTERFACE Description: A list of region interfaces
local REGION_LIST_SCRIPT_INTERFACE = {}
function REGION_LIST_SCRIPT_INTERFACE:num_items() end
function REGION_LIST_SCRIPT_INTERFACE:item_at() end
function REGION_LIST_SCRIPT_INTERFACE:is_empty() end

---@class SHARED_STATES_MANAGER_SCRIPT_INTERFACE Description: Shared States Manager Script Interfaces
local SHARED_STATES_MANAGER_SCRIPT_INTERFACE = {}
function SHARED_STATES_MANAGER_SCRIPT_INTERFACE:is_null_interface() end
function SHARED_STATES_MANAGER_SCRIPT_INTERFACE:get_state_as_bool_value() end
function SHARED_STATES_MANAGER_SCRIPT_INTERFACE:get_state_as_float_value() end

---@class PRISON_SYSTEM_SCRIPT_INTERFACE Description: Prison System Script Interface
local PRISON_SYSTEM_SCRIPT_INTERFACE = {}
function PRISON_SYSTEM_SCRIPT_INTERFACE:is_null_interface() end
function PRISON_SYSTEM_SCRIPT_INTERFACE:get_faction_prisoners() end

---@class FOREIGN_SLOT_SCRIPT_INTERFACE Description: Foreign Slot Script Interface
local FOREIGN_SLOT_SCRIPT_INTERFACE = {}
function FOREIGN_SLOT_SCRIPT_INTERFACE:is_null_interface() end
function FOREIGN_SLOT_SCRIPT_INTERFACE:cqi() end
function FOREIGN_SLOT_SCRIPT_INTERFACE:slot_manager() end
function FOREIGN_SLOT_SCRIPT_INTERFACE:has_building() end
function FOREIGN_SLOT_SCRIPT_INTERFACE:building() end
function FOREIGN_SLOT_SCRIPT_INTERFACE:type_key() end
function FOREIGN_SLOT_SCRIPT_INTERFACE:template_key() end
function FOREIGN_SLOT_SCRIPT_INTERFACE:active() end

---@class CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE Description: A customisable effect bundle, based off of an existing effect bundle defined in the database
local CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE = {}
function CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE:is_null_interface() end
function CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE:key() end
function CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE:effects() end
function CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE:duration() end
function CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE:set_duration() end
function CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE:add_effect() end
function CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE:set_effect_value() end
function CUSTOM_EFFECT_BUNDLE_SCRIPT_INTERFACE:remove_effect() end

---@class CHARACTER_DETAILS_SCRIPT_INTERFACE Description: Character details interface
local CHARACTER_DETAILS_SCRIPT_INTERFACE = {}
function CHARACTER_DETAILS_SCRIPT_INTERFACE:is_null_interface() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:model() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:faction() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:forename() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:surname() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:get_forename() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:get_surname() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:character_type() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:has_trait() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:trait_points() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:has_ancillary() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:is_male() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:age() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:has_skill() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:number_of_traits() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:trait_level() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:loyalty() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:personal_loyalty_factor() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:gravitas() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:has_father() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:has_mother() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:mother() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:father() end
function CHARACTER_DETAILS_SCRIPT_INTERFACE:family_member() end

---@class RESOURCE_TRANSACTION_SCRIPT_INTERFACE Description: Resource Transaction Script Interface
local RESOURCE_TRANSACTION_SCRIPT_INTERFACE = {}
function RESOURCE_TRANSACTION_SCRIPT_INTERFACE:is_null_interface() end
function RESOURCE_TRANSACTION_SCRIPT_INTERFACE:total_treasury_change() end
function RESOURCE_TRANSACTION_SCRIPT_INTERFACE:total_resource_change() end

---@class POOLED_RESOURCE_LIST_SCRIPT_INTERFACE Description: A list of pooled resource script interfaces
local POOLED_RESOURCE_LIST_SCRIPT_INTERFACE = {}
function POOLED_RESOURCE_LIST_SCRIPT_INTERFACE:num_items() end
function POOLED_RESOURCE_LIST_SCRIPT_INTERFACE:item_at() end
function POOLED_RESOURCE_LIST_SCRIPT_INTERFACE:is_empty() end

---@class SEA_REGION_SCRIPT_INTERFACE Description: Sea Region script interface, only basic information as sea regions do not contain settlements
local SEA_REGION_SCRIPT_INTERFACE = {}
function SEA_REGION_SCRIPT_INTERFACE:is_null_interface() end
function SEA_REGION_SCRIPT_INTERFACE:model() end
function SEA_REGION_SCRIPT_INTERFACE:name() end
function SEA_REGION_SCRIPT_INTERFACE:region_data_interface() end

---@class CHARACTER_DETAILS_LIST_SCRIPT_INTERFACE Description: A list of character details interfaces
local CHARACTER_DETAILS_LIST_SCRIPT_INTERFACE = {}
function CHARACTER_DETAILS_LIST_SCRIPT_INTERFACE:num_items() end
function CHARACTER_DETAILS_LIST_SCRIPT_INTERFACE:item_at() end
function CHARACTER_DETAILS_LIST_SCRIPT_INTERFACE:is_empty() end

---@class EFFECT_BUNDLE_SCRIPT_INTERFACE Description: An effect bundle, which provides multiple effects to a target game object
local EFFECT_BUNDLE_SCRIPT_INTERFACE = {}
function EFFECT_BUNDLE_SCRIPT_INTERFACE:is_null_interface() end
function EFFECT_BUNDLE_SCRIPT_INTERFACE:key() end
function EFFECT_BUNDLE_SCRIPT_INTERFACE:effects() end
function EFFECT_BUNDLE_SCRIPT_INTERFACE:duration() end
function EFFECT_BUNDLE_SCRIPT_INTERFACE:clone_and_create_custom_effect_bundle() end

---@class POOLED_RESOURCE_FACTOR_LIST_SCRIPT_INTERFACE Description: A list of pooled resource factor script interfaces
local POOLED_RESOURCE_FACTOR_LIST_SCRIPT_INTERFACE = {}
function POOLED_RESOURCE_FACTOR_LIST_SCRIPT_INTERFACE:num_items() end
function POOLED_RESOURCE_FACTOR_LIST_SCRIPT_INTERFACE:item_at() end
function POOLED_RESOURCE_FACTOR_LIST_SCRIPT_INTERFACE:is_empty() end

---@class RITUAL_STATUS_SCRIPT_INTERFACE Description: Ritual Status Script Interface
local RITUAL_STATUS_SCRIPT_INTERFACE = {}
function RITUAL_STATUS_SCRIPT_INTERFACE:is_null_interface() end
function RITUAL_STATUS_SCRIPT_INTERFACE:available() end
function RITUAL_STATUS_SCRIPT_INTERFACE:disabled() end
function RITUAL_STATUS_SCRIPT_INTERFACE:cannot_afford_resource_cost() end
function RITUAL_STATUS_SCRIPT_INTERFACE:unlock_mission_not_completed() end
function RITUAL_STATUS_SCRIPT_INTERFACE:chain_locked() end
function RITUAL_STATUS_SCRIPT_INTERFACE:prior_chain_stages_incomplete() end
function RITUAL_STATUS_SCRIPT_INTERFACE:already_completed_in_chain() end
function RITUAL_STATUS_SCRIPT_INTERFACE:on_cooldown() end
function RITUAL_STATUS_SCRIPT_INTERFACE:chain_locked_by_another_faction() end
function RITUAL_STATUS_SCRIPT_INTERFACE:reaction_constraints_not_met() end
function RITUAL_STATUS_SCRIPT_INTERFACE:not_enough_slaves() end
function RITUAL_STATUS_SCRIPT_INTERFACE:no_available_ritual_sites() end
function RITUAL_STATUS_SCRIPT_INTERFACE:script_locked() end
function RITUAL_STATUS_SCRIPT_INTERFACE:war_declaration_required() end
function RITUAL_STATUS_SCRIPT_INTERFACE:invalid_performing_characters() end
function RITUAL_STATUS_SCRIPT_INTERFACE:invalid_target() end

---@class UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE Description: Unique Agent Details Script Interface.
local UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE = {}
function UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE:is_null_interface() end
function UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE:faction() end
function UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE:character() end
function UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE:agent_key() end
function UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE:charges() end
function UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE:charges_expended() end
function UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE:valid() end

---@class CAMPAIGN_AI_SCRIPT_INTERFACE Description: Campaign AI script interface.
local CAMPAIGN_AI_SCRIPT_INTERFACE = {}
function CAMPAIGN_AI_SCRIPT_INTERFACE:is_null_interface() end
function CAMPAIGN_AI_SCRIPT_INTERFACE:strategic_stance_between_factions() end
function CAMPAIGN_AI_SCRIPT_INTERFACE:strategic_stance_between_factions_available() end
function CAMPAIGN_AI_SCRIPT_INTERFACE:strategic_stance_between_factions_promotion_or_blocking_is_set() end
function CAMPAIGN_AI_SCRIPT_INTERFACE:strategic_stance_between_factions_promotion_is_active() end
function CAMPAIGN_AI_SCRIPT_INTERFACE:strategic_stance_between_factions_promotion_current_level() end
function CAMPAIGN_AI_SCRIPT_INTERFACE:strategic_stance_between_factions_promotion_start_round() end
function CAMPAIGN_AI_SCRIPT_INTERFACE:strategic_stance_between_factions_promotion_start_level() end
function CAMPAIGN_AI_SCRIPT_INTERFACE:strategic_stance_between_factions_promotion_end_round() end
function CAMPAIGN_AI_SCRIPT_INTERFACE:strategic_stance_between_factions_promotion_end_level() end
function CAMPAIGN_AI_SCRIPT_INTERFACE:strategic_stance_between_factions_is_being_blocked() end
function CAMPAIGN_AI_SCRIPT_INTERFACE:strategic_stance_between_factions_is_being_blocked_until() end

---@class UNIT_SCRIPT_INTERFACE Description: Unit script interface. Land units and Naval units are derived from Unit.
local UNIT_SCRIPT_INTERFACE = {}
function UNIT_SCRIPT_INTERFACE:is_null_interface() end
function UNIT_SCRIPT_INTERFACE:command_queue_index() end
function UNIT_SCRIPT_INTERFACE:has_force_commander() end
function UNIT_SCRIPT_INTERFACE:has_unit_commander() end
function UNIT_SCRIPT_INTERFACE:is_land_unit() end
function UNIT_SCRIPT_INTERFACE:is_naval_unit() end
function UNIT_SCRIPT_INTERFACE:model() end
function UNIT_SCRIPT_INTERFACE:force_commander() end
function UNIT_SCRIPT_INTERFACE:unit_commander() end
function UNIT_SCRIPT_INTERFACE:military_force() end
function UNIT_SCRIPT_INTERFACE:faction() end
function UNIT_SCRIPT_INTERFACE:unit_key() end
function UNIT_SCRIPT_INTERFACE:unit_category() end
function UNIT_SCRIPT_INTERFACE:unit_class() end
function UNIT_SCRIPT_INTERFACE:percentage_proportion_of_full_strength() end
function UNIT_SCRIPT_INTERFACE:has_banner_ancillary() end
function UNIT_SCRIPT_INTERFACE:banner_ancillary() end
function UNIT_SCRIPT_INTERFACE:can_upgrade_unit_equipment() end
function UNIT_SCRIPT_INTERFACE:can_upgrade_unit() end
function UNIT_SCRIPT_INTERFACE:get_unit_custom_battle_cost() end
function UNIT_SCRIPT_INTERFACE:can_purchase_effect() end
function UNIT_SCRIPT_INTERFACE:can_unpurchase_effect() end
function UNIT_SCRIPT_INTERFACE:get_unit_purchasable_effects() end
function UNIT_SCRIPT_INTERFACE:get_unit_purchased_effects() end

---@class MILITARY_FORCE_TYPE_SCRIPT_INTERFACE Description: A military force type record
local MILITARY_FORCE_TYPE_SCRIPT_INTERFACE = {}
function MILITARY_FORCE_TYPE_SCRIPT_INTERFACE:is_null_interface() end
function MILITARY_FORCE_TYPE_SCRIPT_INTERFACE:key() end
function MILITARY_FORCE_TYPE_SCRIPT_INTERFACE:has_feature() end
function MILITARY_FORCE_TYPE_SCRIPT_INTERFACE:can_convert_to() end
function MILITARY_FORCE_TYPE_SCRIPT_INTERFACE:can_automatically_convert_to() end

---@class BUILDING_LIST_SCRIPT_INTERFACE Description: A list of building interfaces
local BUILDING_LIST_SCRIPT_INTERFACE = {}
function BUILDING_LIST_SCRIPT_INTERFACE:num_items() end
function BUILDING_LIST_SCRIPT_INTERFACE:item_at() end
function BUILDING_LIST_SCRIPT_INTERFACE:is_empty() end

---@class MILITARY_FORCE_LIST_SCRIPT_INTERFACE Description: A list of military forces
local MILITARY_FORCE_LIST_SCRIPT_INTERFACE = {}
function MILITARY_FORCE_LIST_SCRIPT_INTERFACE:num_items() end
function MILITARY_FORCE_LIST_SCRIPT_INTERFACE:item_at() end
function MILITARY_FORCE_LIST_SCRIPT_INTERFACE:is_empty() end

---@class FOREIGN_SLOT_MANAGER_LIST_SCRIPT_INTERFACE Description: A list of foreign slot manager script interfaces
local FOREIGN_SLOT_MANAGER_LIST_SCRIPT_INTERFACE = {}
function FOREIGN_SLOT_MANAGER_LIST_SCRIPT_INTERFACE:num_items() end
function FOREIGN_SLOT_MANAGER_LIST_SCRIPT_INTERFACE:item_at() end
function FOREIGN_SLOT_MANAGER_LIST_SCRIPT_INTERFACE:is_empty() end

---@class FAMILY_MEMBER_SCRIPT_INTERFACE Description: Family interface
local FAMILY_MEMBER_SCRIPT_INTERFACE = {}
function FAMILY_MEMBER_SCRIPT_INTERFACE:is_null_interface() end
function FAMILY_MEMBER_SCRIPT_INTERFACE:has_father() end
function FAMILY_MEMBER_SCRIPT_INTERFACE:has_mother() end
function FAMILY_MEMBER_SCRIPT_INTERFACE:father() end
function FAMILY_MEMBER_SCRIPT_INTERFACE:mother() end
function FAMILY_MEMBER_SCRIPT_INTERFACE:has_trait() end
function FAMILY_MEMBER_SCRIPT_INTERFACE:come_of_age() end
function FAMILY_MEMBER_SCRIPT_INTERFACE:command_queue_index() end
function FAMILY_MEMBER_SCRIPT_INTERFACE:character_details() end
function FAMILY_MEMBER_SCRIPT_INTERFACE:character() end

---@class NULL_SCRIPT_INTERFACE Description: An empty interface, returned if a requested interface doesn't exist. If function calls are made with this interface, the LUA script will fail
local NULL_SCRIPT_INTERFACE = {}
function NULL_SCRIPT_INTERFACE:is_null_interface() end