local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_MAGIC_RED)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 20000)
condition:setFormula(-0.55, 0, -0.7, 0)
combat:setCondition(condition)

local area = createCombatArea(AREA_CIRCLE2X2)
combat:setArea(area)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
