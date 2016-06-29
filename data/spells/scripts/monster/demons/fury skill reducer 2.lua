local minPercent = 45
local maxPercent = 60

local area = createCombatArea(AREA_CIRCLE3X3)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 5000)

local function configureCombat(combat, percent)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SOUND_YELLOW)
	combat:setArea(area)

	condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, percent)
	condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, percent)
	condition:setParameter(CONDITION_PARAM_SKILL_FISTPERCENT, percent)
	combat:setCondition(condition)
end

local doCombatFunc = MonsterSpellCreateSkillReducerCombatList(minPercent, maxPercent, configureCombat)

function onCastSpell(creature, var)
	return doCombatFunc():execute(creature, var)
end
