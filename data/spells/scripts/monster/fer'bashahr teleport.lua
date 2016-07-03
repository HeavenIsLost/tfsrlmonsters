local condition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
condition:setParameter(CONDITION_PARAM_SUBID, 88888)
condition:setParameter(CONDITION_PARAM_TICKS, 10*60*1000)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 0.01)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 10*60*1000)

local percentToHeal = 50
local hidePosition = Position(1227, 775, 9)

local function backTeleport(cid, previousPos)
	local creature = Creature(cid)
	if not creature then
		return
	end

	creature:teleportTo(previousPos)
	creature:say("I'M BACK!!", TALKTYPE_MONSTER_SAY)
	creaturePos:sendMagicEffect(CONST_ME_TELEPORT)
end

local function hideTeleport(cid)
	local creature = Creature(cid)
	if not creature then
		return
	end

	creature:say("Fer'bashahr shouted, and disappeared in a flash of light, instantly teleporting down into the depths of the earth.", TALKTYPE_MONSTER_SAY)

	local creaturePos = creature:getPosition()

	for i = 1, 5 do
		Game.createMonster("Demon", Position(creaturePos.x + math.random(-2, 2), creaturePos.y + math.random(-2, 2), creaturePos.z), true, true)
	end

	creaturePos:sendMagicEffect(CONST_ME_TELEPORT)
	creature:teleportTo(hidePosition)

	addEvent(backTeleport, 20 * 1000, creature:getId(), creaturePos)
end

local function firstTeleport(cid)
	local creature = Creature(cid)
	if not creature then
		return
	end

	creature:say("*TELEPORTING IN PROGRESS*", TALKTYPE_MONSTER_SAY)
end

local function sendTeleport(cid)
	local creature = Creature(cid)
	if not creature then
		return
	end

	creature:getPosition():sendMagicEffect(CONST_ME_TELEPORT)
end

function onCastSpell(creature, variant)
	if (creature:getHealthPercent() < percentToHeal) and not creature:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, 88888) then
		local creaturePos = creature:getPosition()

		creature:addCondition(condition)

		addEvent(firstTeleport, 1, creature:getId())

		for t = 8, 9.5, 0.5 do
			addEvent(sendTeleport, t * 1000, creature:getId())
		end

		addEvent(hideTeleport, 10 * 1000, creature:getId())
	end

	return false
end
