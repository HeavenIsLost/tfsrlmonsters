local condition = Condition(CONDITION_EXHAUST_COMBAT)
condition:setParameter(CONDITION_PARAM_SUBID, 88888)
condition:setParameter(CONDITION_PARAM_TICKS, 6 * 1000)

local percentToHeal = 7
local minHealValue = 18000
local maxHealValue = 23000

local function healLisa(cid)
	local creature = Creature(cid)
	if not creature then
		return true
	end
	
	creature:addHealth(math.random(minHealValue, maxHealValue))
	creature:say("Lisa healed up!", TALKTYPE_ORANGE_1)
	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	return true
end

function onCastSpell(creature, var)
	if (creature:getHealthPercent() <= percentToHeal) and not creature:getCondition(CONDITION_EXHAUST_COMBAT, CONDITIONID_COMBAT, 88888) then
		creature:say("Lisa takes a final breath before she's healing up!", TALKTYPE_ORANGE_1)
		creature:addCondition(condition)
		SpellAddEvent(healLisa, 6 * 1000, creature:getId())
	end
	
	return true
end