local condition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
condition:setParameter(CONDITION_PARAM_SUBID, 88888)
condition:setParameter(CONDITION_PARAM_TICKS, 30 * 1000)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 0.01)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 30 * 1000)

local healPercent = 10
local minHeal = 7500
local maxHeal = 8000

local function heal(cid)
	local creature = Creature(cid)
	if not creature then
		return
	end
	
	creature:addHealth(math.random(minHeal, maxHeal))
	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	
	return true
end

function onCastSpell(creature, var)
	if (creature:getHealthPercent() < healPercent) and not creature:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, 88888) then
		creature:addCondition(condition)
		addEvent(heal, 10 * 1000, creature:getId())
	end
	
	return true
end