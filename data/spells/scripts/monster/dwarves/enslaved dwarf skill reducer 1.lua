local minPercent = 20
local maxPercent = 65

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 6000)

local area = createCombatArea(AREA_CIRCLE2X2)

local function configureCombat(combat, percent)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)
	combat:setArea(area)

	condition:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, percent)
	combat:setCondition(condition)
end

local doCombatFunc = MonsterSpellCreateSkillReducerCombatList(minPercent, maxPercent, configureCombat)

function onCastSpell(creature, variant)
	return doCombatFunc():execute(creature, variant)
end
