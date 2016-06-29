local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_HEARTS)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

local maxSummons = 3

function onCastSpell(creature, var)
	local summonCount = #creature:getSummons()
	if summonCount < 3 then
		for i = 1, maxSummons - summonCount do
			local mid = Game.createMonster("Evil Sheep", creature:getPosition())
			if mid then
				mid:setMaster(creature)
			end
		end
		
		return combat:execute(creature, var)
	end
	
	return true
end