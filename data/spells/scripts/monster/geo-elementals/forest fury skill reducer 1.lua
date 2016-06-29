local minPercent = 40
local maxPercent = 50

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 7000)

local area = createCombatArea(AREA_CIRCLE2X2)
	
local function configureCombat(combat, percent)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_BLUE)
	combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_LARGEROCK)
	combat:setArea(area)

	condition:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, percent)
	combat:setCondition(condition)
end

local doCombatFunc = MonsterSpellCreateSkillReducerCombatList(minPercent, maxPercent, configureCombat)

function onCastSpell(creature, var)
	return doCombatFunc():execute(creature, var)
end
