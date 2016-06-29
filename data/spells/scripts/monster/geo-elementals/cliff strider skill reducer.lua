local minPercent = 15
local maxPercent = 45

local area = createCombatArea(AREA_CIRCLE2X2)
local condition = Condition(CONDITION_ATTRIBUTES)

condition:setParameter(CONDITION_PARAM_TICKS, 4000)

local function configureCombat(combat, percent)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
	combat:setArea(area)
	
	condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, percent)
	combat:setCondition(condition)
end

local doCombatFunc = MonsterSpellCreateSkillReducerCombatList(minPercent, maxPercent, configureCombat)

function onCastSpell(creature, var)
	return doCombatFunc():execute(creature, var)
end
