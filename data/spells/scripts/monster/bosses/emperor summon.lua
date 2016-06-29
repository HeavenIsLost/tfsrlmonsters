local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SOUND_PURPLE)

local area = createCombatArea(AREA_CIRCLE2X2)
combat:setArea(area)

local maxSummons = 2

function onCastSpell(creature, var)
	local summonCount = #creature:getSummons()
	if summonCount < 2 then
		for i = 1, maxSummons - summonCount do
			local mid = Game.createMonster("Draken Warmaster", creature:getPosition())
			if mid then
				mid:setMaster(creature)
			end
		end
		
		return combat:execute(creature, var)
	end
	
	return true
end