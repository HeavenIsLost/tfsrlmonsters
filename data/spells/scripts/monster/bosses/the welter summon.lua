local function delayedCastSpell(cid, var)
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

function onCastSpell(creature, var)
	local summonCount = #creature:getSummons()
	if summonCount < 1 then
		local mon = Game.createMonster("Egg", creature:getPosition())
		if mon then
			mon:setMaster(creature)
		end
	end
	
	SpellAddEvent(delayedCastSpell, 10000, creature:getId(), var)
	
	return true
end