local function summon(cid)
	local creature = Creature(cid)
	if not creature then
		return
	end

	Game.createMonster("Energy Pulse", creature:getPosition(), true, true)
	creature:say("The fully charged generator explodes in a blast!", TALKTYPE_ORANGE_2)
	creature:remove()

	return true
end

function onCastSpell(creature, variant)
	addEvent(summon, 14000, creature:getId())
	return true
end
