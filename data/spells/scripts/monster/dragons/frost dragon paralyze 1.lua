local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POFF)

local condition = Condition(CONDITION_PARALYZE)
condition:setParameter(CONDITION_PARAM_TICKS, 20000)
condition:setFormula(-0.35, 0, -0.45, 0)
combat:setCondition(condition)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)
combat:setCondition(condition)

function onCastSpell(creature, variant)
	return combat:execute(creature, variant)
end
