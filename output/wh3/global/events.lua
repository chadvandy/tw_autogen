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
	---@class CharacterPerformsSettlementOccupationDecision
	local CharacterPerformsSettlementOccupationDecision = {}
	function CharacterPerformsSettlementOccupationDecision:occupation_decision() end
	function CharacterPerformsSettlementOccupationDecision:settlement_option() end
	function CharacterPerformsSettlementOccupationDecision:occupation_decision_type() end
	function CharacterPerformsSettlementOccupationDecision:previous_owner() end
	function CharacterPerformsSettlementOccupationDecision:previous_owner_subculture() end
	function CharacterPerformsSettlementOccupationDecision:previous_owner_culture() end
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterPerformsSettlementOccupationDecision:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterPerformsSettlementOccupationDecision:character() end
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
	---@class BattleCompleted
	local BattleCompleted = {}
	---@return MODEL_SCRIPT_INTERFACE
	function BattleCompleted:model() end
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
	---@class FactionBecomesIdleHuman
	local FactionBecomesIdleHuman = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionBecomesIdleHuman:faction() end
end
---============================---
do
	---@class AreaExited
	local AreaExited = {}
	function AreaExited:area_key() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function AreaExited:family_member() end
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
	---@class CharacterInitiativeEvent
	local CharacterInitiativeEvent = {}
	---@return CHARACTER_INITIATIVE_SCRIPT_INTERFACE
	function CharacterInitiativeEvent:initiative() end
	---@return CHARACTER_INITIATIVE_SET_SCRIPT_INTERFACE
	function CharacterInitiativeEvent:initiative_set() end
end
---============================---
do
	---@class CharacterInitiativeActivationChangedEvent
	local CharacterInitiativeActivationChangedEvent = {}
	function CharacterInitiativeActivationChangedEvent:active() end
	---@return CHARACTER_INITIATIVE_SCRIPT_INTERFACE
	function CharacterInitiativeActivationChangedEvent:initiative() end
	---@return CHARACTER_INITIATIVE_SET_SCRIPT_INTERFACE
	function CharacterInitiativeActivationChangedEvent:initiative_set() end
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
	---@class CharacterArmoryItemEvent
	local CharacterArmoryItemEvent = {}
	function CharacterArmoryItemEvent:item_variant_key() end
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
	---@class CaravanEvent
	local CaravanEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function CaravanEvent:faction() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function CaravanEvent:caravan_master() end
	---@return CARAVAN_SCRIPT_INTERFACE
	function CaravanEvent:caravan() end
end
---============================---
do
	---@class CharacterPostBattleRelease
	local CharacterPostBattleRelease = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterPostBattleRelease:character() end
end
---============================---
do
	---@class CharacterFamilyRelationDied
	local CharacterFamilyRelationDied = {}
	function CharacterFamilyRelationDied:relationship() end
end
---============================---
do
	---@class StreakEffectLevelsEntered
	local StreakEffectLevelsEntered = {}
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function StreakEffectLevelsEntered:military_force() end
	function StreakEffectLevelsEntered:streak_effect_record() end
end
---============================---
do
	---@class CharacterRecruited
	local CharacterRecruited = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterRecruited:character() end
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
	---@class FactionCivilWarOccured
	local FactionCivilWarOccured = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionCivilWarOccured:opponent() end
	---@return FACTION_SCRIPT_INTERFACE
	function FactionCivilWarOccured:faction() end
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
	---@class CharacterFactionCompletesResearch
	local CharacterFactionCompletesResearch = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterFactionCompletesResearch:character() end
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
	---@class FactionCharacterTagRemovedEvent
	local FactionCharacterTagRemovedEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionCharacterTagRemovedEvent:tagging_faction() end
	---@return FACTION_CHARACTER_TAG_ENTRY_SCRIPT_INTERFACE
	function FactionCharacterTagRemovedEvent:tag_entry() end
end
---============================---
do
	---@class DiplomacyManipulationExecutedEvent
	local DiplomacyManipulationExecutedEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function DiplomacyManipulationExecutedEvent:performing_faction() end
	---@return FACTION_SCRIPT_INTERFACE
	function DiplomacyManipulationExecutedEvent:diplomacy_target_faction() end
	function DiplomacyManipulationExecutedEvent:diplomacy_manipulation_category() end
end
---============================---
do
	---@class CharacterDestroyed
	local CharacterDestroyed = {}
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function CharacterDestroyed:family_member() end
end
---============================---
do
	---@class WorldStartRound
	local WorldStartRound = {}
	---@return WORLD_SCRIPT_INTERFACE
	function WorldStartRound:world() end
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
	---@class CharacterFinishedMovingEvent
	local CharacterFinishedMovingEvent = {}
	function CharacterFinishedMovingEvent:was_flee() end
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
	---@class WoMCompassUserDirectionSelectedEvent
	local WoMCompassUserDirectionSelectedEvent = {}
	function WoMCompassUserDirectionSelectedEvent:direction() end
	---@return FACTION_SCRIPT_INTERFACE
	function WoMCompassUserDirectionSelectedEvent:faction() end
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
	---@class WoMCompassUserActionTriggeredEvent
	local WoMCompassUserActionTriggeredEvent = {}
	function WoMCompassUserActionTriggeredEvent:direction() end
	function WoMCompassUserActionTriggeredEvent:action() end
	---@return FACTION_SCRIPT_INTERFACE
	function WoMCompassUserActionTriggeredEvent:faction() end
end
---============================---
do
	---@class WarCoordinationRequestIssued
	local WarCoordinationRequestIssued = {}
	function WarCoordinationRequestIssued:has_recipient_faction() end
	---@return FACTION_SCRIPT_INTERFACE
	function WarCoordinationRequestIssued:recipient_faction() end
	function WarCoordinationRequestIssued:has_recipient_military_force() end
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function WarCoordinationRequestIssued:recipient_military_force() end
	function WarCoordinationRequestIssued:has_target_region() end
	---@return REGION_SCRIPT_INTERFACE
	function WarCoordinationRequestIssued:target_region() end
	function WarCoordinationRequestIssued:has_target_military_force() end
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function WarCoordinationRequestIssued:target_military_force() end
	function WarCoordinationRequestIssued:is_offensive() end
	function WarCoordinationRequestIssued:favour_cost() end
	---@return FACTION_SCRIPT_INTERFACE
	function WarCoordinationRequestIssued:faction() end
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
	---@class UnitTurnEnd
	local UnitTurnEnd = {}
	---@return UNIT_SCRIPT_INTERFACE
	function UnitTurnEnd:unit() end
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
	---@class UnitSelectedCampaign
	local UnitSelectedCampaign = {}
	---@return UNIT_SCRIPT_INTERFACE
	function UnitSelectedCampaign:unit() end
end
---============================---
do
	---@class FactionGainedAncillary
	local FactionGainedAncillary = {}
	function FactionGainedAncillary:ancillary() end
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
	---@class UnitEffectUnpurchased
	local UnitEffectUnpurchased = {}
	---@return UNIT_PURCHASABLE_EFFECT_SCRIPT_INTERFACE
	function UnitEffectUnpurchased:effect() end
end
---============================---
do
	---@class BattleCompletedCameraMove
	local BattleCompletedCameraMove = {}
	---@return MODEL_SCRIPT_INTERFACE
	function BattleCompletedCameraMove:model() end
end
---============================---
do
	---@class CharacterSkillPointAvailable
	local CharacterSkillPointAvailable = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterSkillPointAvailable:character() end
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
	---@class CharacterCapturedSettlementUnopposed
	local CharacterCapturedSettlementUnopposed = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterCapturedSettlementUnopposed:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterCapturedSettlementUnopposed:character() end
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
	---@class CharacterSackedSettlement
	local CharacterSackedSettlement = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterSackedSettlement:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterSackedSettlement:character() end
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
	---@class PooledResourceChanged
	local PooledResourceChanged = {}
	---@return POOLED_RESOURCE_FACTOR_SCRIPT_INTERFACE
	function PooledResourceChanged:factor() end
	function PooledResourceChanged:amount() end
	---@return FACTION_SCRIPT_INTERFACE
	function PooledResourceChanged:faction() end
	---@return FACTION_SCRIPT_INTERFACE
	function PooledResourceChanged:has_faction() end
	---@return POOLED_RESOURCE_SCRIPT_INTERFACE
	function PooledResourceChanged:resource() end
end
---============================---
do
	---@class CharacterLoanedEvent
	local CharacterLoanedEvent = {}
	function CharacterLoanedEvent:original_faction() end
end
---============================---
do
	---@class CorruptionCounterIntervalEvent
	local CorruptionCounterIntervalEvent = {}
	function CorruptionCounterIntervalEvent:counter() end
	function CorruptionCounterIntervalEvent:interval() end
	function CorruptionCounterIntervalEvent:is_entrance() end
	function CorruptionCounterIntervalEvent:is_lower_bound() end
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
	---@class RegionIssuesDemands
	local RegionIssuesDemands = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionIssuesDemands:region() end
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
	---@class ProvinceGovernorMoved
	local ProvinceGovernorMoved = {}
	---@return PROVINCE_SCRIPT_INTERFACE
	function ProvinceGovernorMoved:from_province() end
	---@return PROVINCE_SCRIPT_INTERFACE
	function ProvinceGovernorMoved:to_province() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function ProvinceGovernorMoved:family_member() end
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
	---@class UniqueAgentEvent
	local UniqueAgentEvent = {}
	---@return UNIQUE_AGENT_DETAILS_SCRIPT_INTERFACE
	function UniqueAgentEvent:unique_agent_details() end
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
	---@class UITrigger
	local UITrigger = {}
	function UITrigger:faction_cqi() end
	function UITrigger:trigger() end
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
	---@class FactionJoinsConfederation
	local FactionJoinsConfederation = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionJoinsConfederation:confederation() end
	---@return FACTION_SCRIPT_INTERFACE
	function FactionJoinsConfederation:faction() end
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
	---@class TradeNodeConnected
	local TradeNodeConnected = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function TradeNodeConnected:character() end
end
---============================---
do
	---@class TeleportationNetworkNodeOpened
	local TeleportationNetworkNodeOpened = {}
	function TeleportationNetworkNodeOpened:node_key() end
	function TeleportationNetworkNodeOpened:template_key() end
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function TeleportationNetworkNodeOpened:node_record() end
end
---============================---
do
	---@class CaravanMoved
	local CaravanMoved = {}
	---@return ROUTE_POSITION_SCRIPT_INTERFACE
	function CaravanMoved:from() end
	---@return ROUTE_POSITION_SCRIPT_INTERFACE
	function CaravanMoved:to() end
	---@return FACTION_SCRIPT_INTERFACE
	function CaravanMoved:faction() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function CaravanMoved:caravan_master() end
	---@return CARAVAN_SCRIPT_INTERFACE
	function CaravanMoved:caravan() end
end
---============================---
do
	---@class TeleportationNetworkNodeEvent
	local TeleportationNetworkNodeEvent = {}
	function TeleportationNetworkNodeEvent:node_key() end
	function TeleportationNetworkNodeEvent:template_key() end
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function TeleportationNetworkNodeEvent:node_record() end
end
---============================---
do
	---@class CaravanSpawned
	local CaravanSpawned = {}
	function CaravanSpawned:cargo() end
	---@return FACTION_SCRIPT_INTERFACE
	function CaravanSpawned:faction() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function CaravanSpawned:caravan_master() end
	---@return CARAVAN_SCRIPT_INTERFACE
	function CaravanSpawned:caravan() end
end
---============================---
do
	---@class TeleportationNetworkNodeClosed
	local TeleportationNetworkNodeClosed = {}
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function TeleportationNetworkNodeClosed:closing_character() end
	function TeleportationNetworkNodeClosed:node_key() end
	function TeleportationNetworkNodeClosed:template_key() end
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function TeleportationNetworkNodeClosed:node_record() end
end
---============================---
do
	---@class TeleportationNetworkMoveStart
	local TeleportationNetworkMoveStart = {}
	function TeleportationNetworkMoveStart:from_key() end
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function TeleportationNetworkMoveStart:from_record() end
	function TeleportationNetworkMoveStart:to_key() end
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function TeleportationNetworkMoveStart:to_record() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function TeleportationNetworkMoveStart:character() end
	function TeleportationNetworkMoveStart:node_key() end
	function TeleportationNetworkMoveStart:template_key() end
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function TeleportationNetworkMoveStart:node_record() end
end
---============================---
do
	---@class TeleportationNetworkMoveCompleted
	local TeleportationNetworkMoveCompleted = {}
	function TeleportationNetworkMoveCompleted:from_key() end
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function TeleportationNetworkMoveCompleted:from_record() end
	function TeleportationNetworkMoveCompleted:to_key() end
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function TeleportationNetworkMoveCompleted:to_record() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function TeleportationNetworkMoveCompleted:character() end
	function TeleportationNetworkMoveCompleted:success() end
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
	---@class RitualsCompletedAndDelayedEvent
	local RitualsCompletedAndDelayedEvent = {}
	---@return ACTIVE_RITUAL_LIST_SCRIPT_INTERFACE
	function RitualsCompletedAndDelayedEvent:rituals() end
end
---============================---
do
	---@class TeleportationNetworkCharacterInteractionStarted
	local TeleportationNetworkCharacterInteractionStarted = {}
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function TeleportationNetworkCharacterInteractionStarted:interacting_character() end
	function TeleportationNetworkCharacterInteractionStarted:node_key() end
	function TeleportationNetworkCharacterInteractionStarted:template_key() end
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function TeleportationNetworkCharacterInteractionStarted:node_record() end
end
---============================---
do
	---@class CharacterDiscovered
	local CharacterDiscovered = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterDiscovered:character() end
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
	---@class SlotTurnStart
	local SlotTurnStart = {}
	---@return SLOT_SCRIPT_INTERFACE
	function SlotTurnStart:region_slot() end
end
---============================---
do
	---@class RegionPlagueStateChanged
	local RegionPlagueStateChanged = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionPlagueStateChanged:region() end
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
	---@class ForeignBuildingCancelled
	local ForeignBuildingCancelled = {}
	---@return FOREIGN_SLOT_SCRIPT_INTERFACE
	function ForeignBuildingCancelled:slot() end
	function ForeignBuildingCancelled:key() end
	function ForeignBuildingCancelled:chain() end
	function ForeignBuildingCancelled:superchain() end
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
	---@return FACTION_SCRIPT_INTERFACE
	function PooledResourceEffectChangedEvent:has_faction() end
	---@return POOLED_RESOURCE_SCRIPT_INTERFACE
	function PooledResourceEffectChangedEvent:resource() end
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
	---@class SharedStateRemoved
	local SharedStateRemoved = {}
	function SharedStateRemoved:key() end
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function SharedStateRemoved:entity() end
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
	---@class SharedStateChanged
	local SharedStateChanged = {}
	function SharedStateChanged:key() end
	function SharedStateChanged:value() end
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function SharedStateChanged:entity() end
end
---============================---
do
	---@class CharacterArmoryItemUnlocked
	local CharacterArmoryItemUnlocked = {}
	function CharacterArmoryItemUnlocked:armory_item() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterArmoryItemUnlocked:character() end
end
---============================---
do
	---@class CaravanReturned
	local CaravanReturned = {}
	---@return FACTION_SCRIPT_INTERFACE
	function CaravanReturned:faction() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function CaravanReturned:caravan_master() end
	---@return CARAVAN_SCRIPT_INTERFACE
	function CaravanReturned:caravan() end
end
---============================---
do
	---@class DebugCharacterEvent
	local DebugCharacterEvent = {}
	function DebugCharacterEvent:id() end
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
	---@class SeaTradeRouteRaided
	local SeaTradeRouteRaided = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function SeaTradeRouteRaided:character() end
end
---============================---
do
	---@class PooledResourceEvent
	local PooledResourceEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function PooledResourceEvent:faction() end
	---@return FACTION_SCRIPT_INTERFACE
	function PooledResourceEvent:has_faction() end
	---@return POOLED_RESOURCE_SCRIPT_INTERFACE
	function PooledResourceEvent:resource() end
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
	---@class TeleportationNetworkCharacterNodeClosureHandedOver
	local TeleportationNetworkCharacterNodeClosureHandedOver = {}
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function TeleportationNetworkCharacterNodeClosureHandedOver:character_family_member() end
	function TeleportationNetworkCharacterNodeClosureHandedOver:node_key() end
	function TeleportationNetworkCharacterNodeClosureHandedOver:template_key() end
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function TeleportationNetworkCharacterNodeClosureHandedOver:node_record() end
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
	---@class CharacterWithdrewFromBattle
	local CharacterWithdrewFromBattle = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterWithdrewFromBattle:character() end
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
	---@class DebugFactionEvent
	local DebugFactionEvent = {}
	function DebugFactionEvent:id() end
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
	---@class ResearchStarted
	local ResearchStarted = {}
	function ResearchStarted:technology() end
	---@return FACTION_SCRIPT_INTERFACE
	function ResearchStarted:faction() end
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
	---@class FactionGovernmentTypeChanged
	local FactionGovernmentTypeChanged = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionGovernmentTypeChanged:faction() end
end
---============================---
do
	---@class CharacterPostBattleEnslave
	local CharacterPostBattleEnslave = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterPostBattleEnslave:character() end
end
---============================---
do
	---@class SpawnableForceCreatedEvent
	local SpawnableForceCreatedEvent = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function SpawnableForceCreatedEvent:parent_character() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function SpawnableForceCreatedEvent:character() end
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
	---@class RegionTurnEnd
	local RegionTurnEnd = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionTurnEnd:region() end
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
	---@class RecruitmentItemIssuedByPlayer
	local RecruitmentItemIssuedByPlayer = {}
	function RecruitmentItemIssuedByPlayer:main_unit_record() end
	function RecruitmentItemIssuedByPlayer:time_to_build() end
	---@return FACTION_SCRIPT_INTERFACE
	function RecruitmentItemIssuedByPlayer:faction() end
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
	---@class CaravanRecruited
	local CaravanRecruited = {}
	---@return FACTION_SCRIPT_INTERFACE
	function CaravanRecruited:faction() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function CaravanRecruited:caravan_master() end
	---@return CARAVAN_SCRIPT_INTERFACE
	function CaravanRecruited:caravan() end
end
---============================---
do
	---@class CaravanWaylaid
	local CaravanWaylaid = {}
	function CaravanWaylaid:context() end
	---@return ROUTE_POSITION_SCRIPT_INTERFACE
	function CaravanWaylaid:from() end
	---@return ROUTE_POSITION_SCRIPT_INTERFACE
	function CaravanWaylaid:to() end
	---@return FACTION_SCRIPT_INTERFACE
	function CaravanWaylaid:faction() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function CaravanWaylaid:caravan_master() end
	---@return CARAVAN_SCRIPT_INTERFACE
	function CaravanWaylaid:caravan() end
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
	---@class RegionRiots
	local RegionRiots = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionRiots:region() end
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
	---@class EventFeedEventRecordedEvent
	local EventFeedEventRecordedEvent = {}
	function EventFeedEventRecordedEvent:event_key() end
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
	---@class RegionEvent
	local RegionEvent = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionEvent:region() end
end
---============================---
do
	---@class DilemmaChoiceMadeEvent
	local DilemmaChoiceMadeEvent = {}
	function DilemmaChoiceMadeEvent:choice_key() end
	function DilemmaChoiceMadeEvent:choice() end
	---@return FACTION_SCRIPT_INTERFACE
	function DilemmaChoiceMadeEvent:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function DilemmaChoiceMadeEvent:campaign_model() end
	function DilemmaChoiceMadeEvent:dilemma() end
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
	---@class QueryShouldWaylayCaravan
	local QueryShouldWaylayCaravan = {}
	function QueryShouldWaylayCaravan:flag_for_waylay() end
	---@return ROUTE_POSITION_SCRIPT_INTERFACE
	function QueryShouldWaylayCaravan:from() end
	---@return ROUTE_POSITION_SCRIPT_INTERFACE
	function QueryShouldWaylayCaravan:to() end
	---@return FACTION_SCRIPT_INTERFACE
	function QueryShouldWaylayCaravan:faction() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function QueryShouldWaylayCaravan:caravan_master() end
	---@return CARAVAN_SCRIPT_INTERFACE
	function QueryShouldWaylayCaravan:caravan() end
end
---============================---
do
	---@class RecruitmentItemCancelledByPlayer
	local RecruitmentItemCancelledByPlayer = {}
	function RecruitmentItemCancelledByPlayer:main_unit_record() end
end
---============================---
do
	---@class QueryTeleportationNetworkShouldHandoverCharacterNodeClosure
	local QueryTeleportationNetworkShouldHandoverCharacterNodeClosure = {}
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function QueryTeleportationNetworkShouldHandoverCharacterNodeClosure:character_family_member() end
	function QueryTeleportationNetworkShouldHandoverCharacterNodeClosure:flag_for_script_handover() end
end
---============================---
do
	---@class QueryTeleportationNetworkHandoverNodeClosure
	local QueryTeleportationNetworkHandoverNodeClosure = {}
	function QueryTeleportationNetworkHandoverNodeClosure:node_key() end
	function QueryTeleportationNetworkHandoverNodeClosure:template_key() end
	---@return TELEPORTATION_NODE_RECORD_SCRIPT_INTERFACE
	function QueryTeleportationNetworkHandoverNodeClosure:node_record() end
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
	---@class ProvinceGovernorAppointed
	local ProvinceGovernorAppointed = {}
	---@return PROVINCE_SCRIPT_INTERFACE
	function ProvinceGovernorAppointed:province() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function ProvinceGovernorAppointed:family_member() end
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
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:is_state_gift() end
	---@return FACTION_SCRIPT_INTERFACE
	function PositiveDiplomaticEvent:state_gift_amount() end
end
---============================---
do
	---@class PooledResourceThresholdOperationReached
	local PooledResourceThresholdOperationReached = {}
	function PooledResourceThresholdOperationReached:pooled_threshold_operation_record() end
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
	---@class PendingBankruptcy
	local PendingBankruptcy = {}
	---@return FACTION_SCRIPT_INTERFACE
	function PendingBankruptcy:faction() end
end
---============================---
do
	---@class RegionBuildingCancelled
	local RegionBuildingCancelled = {}
	---@return SLOT_SCRIPT_INTERFACE
	function RegionBuildingCancelled:slot() end
	function RegionBuildingCancelled:key() end
	function RegionBuildingCancelled:chain() end
	function RegionBuildingCancelled:superchain() end
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
	---@class CharacterPostBattleSlaughter
	local CharacterPostBattleSlaughter = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterPostBattleSlaughter:character() end
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
	---@class MissionEvent
	local MissionEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function MissionEvent:faction() end
	---@return MODEL_SCRIPT_INTERFACE
	function MissionEvent:campaign_model() end
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
	---@class MovementPointsExhausted
	local MovementPointsExhausted = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function MovementPointsExhausted:character() end
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
	---@class GarrisonOccupiedEvent
	local GarrisonOccupiedEvent = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function GarrisonOccupiedEvent:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function GarrisonOccupiedEvent:character() end
end
---============================---
do
	---@class MissionGenerationFailed
	local MissionGenerationFailed = {}
	function MissionGenerationFailed:mission() end
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
	---@return FACTION_SCRIPT_INTERFACE
	function NegativeDiplomaticEvent:result_of_confederation() end
end
---============================---
do
	---@class FactionCharacterTagAddedEvent
	local FactionCharacterTagAddedEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionCharacterTagAddedEvent:tagging_faction() end
	---@return FACTION_CHARACTER_TAG_ENTRY_SCRIPT_INTERFACE
	function FactionCharacterTagAddedEvent:tag_entry() end
end
---============================---
do
	---@class FactionBecomesActiveHuman
	local FactionBecomesActiveHuman = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionBecomesActiveHuman:faction() end
end
---============================---
do
	---@class IncidentFailedEvent
	local IncidentFailedEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function IncidentFailedEvent:faction() end
	function IncidentFailedEvent:record_key() end
end
---============================---
do
	---@class MilitaryForceInfectionEvent
	local MilitaryForceInfectionEvent = {}
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function MilitaryForceInfectionEvent:target_force() end
	function MilitaryForceInfectionEvent:is_creation() end
	---@return PLAGUE_SCRIPT_INTERFACE
	function MilitaryForceInfectionEvent:plague() end
	---@return FACTION_SCRIPT_INTERFACE
	function MilitaryForceInfectionEvent:faction() end
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
	---@class MilitaryForceDevelopmentPointChange
	local MilitaryForceDevelopmentPointChange = {}
	---@return MILITARY_FORCE_SCRIPT_INTERFACE
	function MilitaryForceDevelopmentPointChange:military_force() end
	function MilitaryForceDevelopmentPointChange:point_change() end
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
	---@class MilitaryForceBuildingCancelled
	local MilitaryForceBuildingCancelled = {}
	---@return MILITARY_FORCE_SLOT_SCRIPT_INTERFACE
	function MilitaryForceBuildingCancelled:slot() end
	function MilitaryForceBuildingCancelled:key() end
	function MilitaryForceBuildingCancelled:chain() end
	function MilitaryForceBuildingCancelled:superchain() end
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
	---@class FactionRoundStart
	local FactionRoundStart = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionRoundStart:faction() end
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
	---@class ImprisonmentRejectionEvent
	local ImprisonmentRejectionEvent = {}
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function ImprisonmentRejectionEvent:prisoner_family_member() end
	---@return CHARACTER_IMPRISONMENT_REJECTION_REASON_MASK_SCRIPTING_INTERFACE
	function ImprisonmentRejectionEvent:rejection_reasons() end
	---@return FACTION_SCRIPT_INTERFACE
	function ImprisonmentRejectionEvent:faction() end
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
	---@class ImprisonmentEvent
	local ImprisonmentEvent = {}
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function ImprisonmentEvent:prisoner_family_member() end
	---@return FACTION_SCRIPT_INTERFACE
	function ImprisonmentEvent:faction() end
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
	---@class GarrisonResidenceExposedToFaction
	local GarrisonResidenceExposedToFaction = {}
	---@return FACTION_SCRIPT_INTERFACE
	function GarrisonResidenceExposedToFaction:encountering_faction() end
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function GarrisonResidenceExposedToFaction:garrison_residence() end
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
	---@class CharacterArmoryItemEquipped
	local CharacterArmoryItemEquipped = {}
	function CharacterArmoryItemEquipped:item_variant_key() end
end
---============================---
do
	---@class ProvinceGovernorshipNewDecisionAvailable
	local ProvinceGovernorshipNewDecisionAvailable = {}
	---@return PROVINCE_SCRIPT_INTERFACE
	function ProvinceGovernorshipNewDecisionAvailable:province() end
	function ProvinceGovernorshipNewDecisionAvailable:campaign_decision_record() end
end
---============================---
do
	---@class ForeignSlotManagerCreatedEvent
	local ForeignSlotManagerCreatedEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function ForeignSlotManagerCreatedEvent:requesting_faction() end
	---@return FACTION_SCRIPT_INTERFACE
	function ForeignSlotManagerCreatedEvent:slot_owner() end
	function ForeignSlotManagerCreatedEvent:is_allied() end
end
---============================---
do
	---@class BattleBeingFought
	local BattleBeingFought = {}
	function BattleBeingFought:is_autoresolved() end
end
---============================---
do
	---@class BuildingLifecycleDevelops
	local BuildingLifecycleDevelops = {}
	function BuildingLifecycleDevelops:previous() end
	---@return BUILDING_SCRIPT_INTERFACE
	function BuildingLifecycleDevelops:current() end
	function BuildingLifecycleDevelops:has_restarted() end
	function BuildingLifecycleDevelops:has_ended() end
	---@return REGION_SCRIPT_INTERFACE
	function BuildingLifecycleDevelops:region() end
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
	---@class ForeignSlotBuildingDamagedEvent
	local ForeignSlotBuildingDamagedEvent = {}
	function ForeignSlotBuildingDamagedEvent:building() end
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
	---@class FactionLeaderSignsPeaceTreaty
	local FactionLeaderSignsPeaceTreaty = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function FactionLeaderSignsPeaceTreaty:character() end
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
	---@class CampaignBuildingDamaged
	local CampaignBuildingDamaged = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CampaignBuildingDamaged:garrison_residence() end
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
	---@class FactionCharacterTagEntryEvent
	local FactionCharacterTagEntryEvent = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionCharacterTagEntryEvent:tagging_faction() end
	---@return FACTION_CHARACTER_TAG_ENTRY_SCRIPT_INTERFACE
	function FactionCharacterTagEntryEvent:tag_entry() end
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
	---@class FactionSubjugatesOtherFaction
	local FactionSubjugatesOtherFaction = {}
	---@return FACTION_SCRIPT_INTERFACE
	function FactionSubjugatesOtherFaction:other_faction() end
	---@return FACTION_SCRIPT_INTERFACE
	function FactionSubjugatesOtherFaction:faction() end
end
---============================---
do
	---@class CharacterPostBattleCaptureOption
	local CharacterPostBattleCaptureOption = {}
	function CharacterPostBattleCaptureOption:get_record_key() end
	function CharacterPostBattleCaptureOption:get_outcome_key() end
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
	---@class CharacterBecomesFactionLeader
	local CharacterBecomesFactionLeader = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterBecomesFactionLeader:character() end
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
	---@class CharacterRelativeKilled
	local CharacterRelativeKilled = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterRelativeKilled:character() end
end
---============================---
do
	---@class RegionInfectionEvent
	local RegionInfectionEvent = {}
	---@return REGION_SCRIPT_INTERFACE
	function RegionInfectionEvent:target_region() end
	function RegionInfectionEvent:is_creation() end
	---@return PLAGUE_SCRIPT_INTERFACE
	function RegionInfectionEvent:plague() end
	---@return FACTION_SCRIPT_INTERFACE
	function RegionInfectionEvent:faction() end
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
	---@class CharacterCandidateBecomesMinister
	local CharacterCandidateBecomesMinister = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterCandidateBecomesMinister:character() end
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
	---@class CharacterRazedSettlement
	local CharacterRazedSettlement = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function CharacterRazedSettlement:garrison_residence() end
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterRazedSettlement:character() end
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
	---@class CharacterArmoryItemUnequipped
	local CharacterArmoryItemUnequipped = {}
	function CharacterArmoryItemUnequipped:item_variant_key() end
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
	---@class CharacterBesiegesSettlement
	local CharacterBesiegesSettlement = {}
	---@return REGION_SCRIPT_INTERFACE
	function CharacterBesiegesSettlement:region() end
end
---============================---
do
	---@class CaravanCompleted
	local CaravanCompleted = {}
	function CaravanCompleted:cargo() end
	function CaravanCompleted:cargo_value() end
	function CaravanCompleted:complete_position() end
	---@return FACTION_SCRIPT_INTERFACE
	function CaravanCompleted:faction() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function CaravanCompleted:caravan_master() end
	---@return CARAVAN_SCRIPT_INTERFACE
	function CaravanCompleted:caravan() end
end
---============================---
do
	---@class AreaEntered
	local AreaEntered = {}
	function AreaEntered:area_key() end
	---@return FAMILY_MEMBER_SCRIPT_INTERFACE
	function AreaEntered:family_member() end
end
---============================---
do
	---@class FactionBribesUnit
	local FactionBribesUnit = {}
	function FactionBribesUnit:ancillary() end
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
	---@class CharacterTurnStart
	local CharacterTurnStart = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterTurnStart:character() end
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
	---@class CharacterRankUp
	local CharacterRankUp = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterRankUp:character() end
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
	---@class CharacterWaaaghOccurred
	local CharacterWaaaghOccurred = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterWaaaghOccurred:character() end
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
	---@class CharacterTurnEnd
	local CharacterTurnEnd = {}
	---@return CHARACTER_SCRIPT_INTERFACE
	function CharacterTurnEnd:character() end
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
	---@class BuildingCancelled
	local BuildingCancelled = {}
	---@return GARRISON_RESIDENCE_SCRIPT_INTERFACE
	function BuildingCancelled:garrison_residence() end
end
---============================---
do
	---@class ClanBecomesVassal
	local ClanBecomesVassal = {}
	---@return FACTION_SCRIPT_INTERFACE
	function ClanBecomesVassal:faction() end
end
---============================---
