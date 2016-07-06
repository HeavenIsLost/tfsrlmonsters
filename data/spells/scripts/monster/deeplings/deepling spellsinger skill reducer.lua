local minPercent = 35
local maxPercent = 65

local area = createCombatArea(AREA_BEAM1)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 8000)

local function configureCombat(combat, percent)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_STUN)
	combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
	combat:setArea(area)

	condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, percent)
	condition:setParameter(CONDITION_PARAM_SKILL_FISTPERCENT, percent)
	condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, percent)
	combat:setCondition(condition)
end

local doCombatFunc = MonsterSpellCreateSkillReducerCombatList(minPercent, maxPercent, configureCombat)

function onCastSpell(creature, variant)
	return doCombatFunc():execute(creature, variant)
end
