local condition = Condition(CONDITION_REGENERATION)
condition:setParameter(CONDITION_PARAM_SUBID, 88888)
condition:setParameter(CONDITION_PARAM_TICKS, 20 * 1000)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 0.01)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 20 * 1000)

local area = createCombatArea({
	{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 3, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0},
	{0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0},
	{0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0},
	{0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0},
})

local combat = Combat()
combat:setArea(area)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_FIREAREA)

local minDamage = 1500
local maxDamage = 1700
local percentToAttack = 10

function onTargetTile(creature, pos)
	local tile = pos:getTile()

	local creatures = nil

	if tile then
		creatures = tile:getCreatures()
	end

	if creatures then
		for _, target in ipairs(creatures) do
			if creature ~= target then
				doTargetCombatHealth(creature, target, COMBAT_FIREDAMAGE, -minDamage, -maxDamage, CONST_ME_NONE)
			end
		end
	end

	return true
end

combat:setCallback(CALLBACK_PARAM_TARGETTILE, "onTargetTile")

local function delayedCastSpell(cid, variant)
	local creature = Creature(cid)
	if not creature then
		return
	end

	return combat:execute(creature, Variant(creature:getPosition()))
end

function onCastSpell(creature, variant)
	if (creature:getHealthPercent() <= percentToAttack) and not creature:getCondition(CONDITION_REGENERATION, CONDITIONID_COMBAT, 88888) then
		creature:addCondition(condition)
		addEvent(delayedCastSpell, 5000, creature:getId(), variant)
		creature:say("Better flee now.", TALKTYPE_ORANGE_1)
	end

	return true
end
