local minPercent = 50
local maxPercent = 90

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 15000)

local area = createCombatArea(AREA_CROSS1X1)

local function configureCombat(combat, percent)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
	
	combat:setArea(area)

	condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, percent)
	condition:setParameter(CONDITION_PARAM_SKILL_FISTPERCENT, percent)
	combat:setCondition(condition)
end

local doCombatFunc = MonsterSpellCreateSkillReducerCombatList(minPercent, maxPercent, configureCombat)

function onCastSpell(creature, var)
	return doCombatFunc():execute(creature, var)
end
