local function delayedCastSpell(cid, variant)
	local creature = Creature(cid)
	if not creature then
		return
	end

	local summons = creature:getSummons()
	for _, summon in ipairs(summons) do
		if summon:getName() == "Egg" then
			summon:getPosition():sendMagicEffect(CONST_ME_POISONAREA)

			local newmon = Game.createMonster("Spawn Of The Welter", summon:getPosition(), false, true)
			summon:remove()

			if newmon then
				newmon:setMaster(creature)
			end
		end
	end
end

function onCastSpell(creature, variant)
	local summonCount = #creature:getSummons()
	if summonCount < 1 then
		local mon = Game.createMonster("Egg", creature:getPosition())
		if mon then
			mon:setMaster(creature)
		end
	end

	addEvent(delayedCastSpell, 10000, creature:getId(), variant)

	return true
end
