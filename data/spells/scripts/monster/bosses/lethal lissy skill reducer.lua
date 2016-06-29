local minPercent = 10
local maxPercent = 25

local area = createCombatArea(AREA_BEAM1)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 10000)

local function configureCombat(combat, percent)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SOUND_PURPLE)
	combat:setArea(area)
	
	condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, percent)
	condition:setParameter(CONDITION_PARAM_SKILL_FISTPERCENT, percent)
	condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, percent)
	combat:setCondition(condition)
end

local doCombatFunc = MonsterSpellCreateSkillReducerCombatList(minPercent, maxPercent, configureCombat)

function onCastSpell(creature, var)
	return doCombatFunc():execute(creature, var)
end
