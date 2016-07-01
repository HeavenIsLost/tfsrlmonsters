local minPercent = 20
local maxPercent = 40

local combat = Combat()
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HITAREA)

local area = createCombatArea(AREA_SQUARE1X1)
combat:setArea(area)

local condition = Condition(CONDITION_ATTRIBUTES)
condition:setParameter(CONDITION_PARAM_TICKS, 15000)
	
function onCastSpell(creature, var)
	local percent = math.random(minPercent, maxPercent)
	
	condition:setParameter(CONDITION_PARAM_SKILL_MELEEPERCENT, percent)
	condition:setParameter(CONDITION_PARAM_SKILL_FISTPERCENT, percent)
	condition:setParameter(CONDITION_PARAM_SKILL_DISTANCEPERCENT, percent)
	condition:setParameter(CONDITION_PARAM_SKILL_SHIELDPERCENT, percent)
	
	combat:clearConditions()
	combat:setCondition(condition)

	return combat:execute(creature, var)
end
