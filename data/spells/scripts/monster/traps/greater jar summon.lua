local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_NONE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_POFF)

local area = createCombatArea(AREA_CIRCLE3X3)
combat:setArea(area)

function onCastSpell(creature, var)
	local summonCount = #creature:getSummons()
	if summonCount < 1 then
		local summon = Game.createMonster("Elder Mummy", creature:getPosition())
		if summon then
			summon:setMaster(creature)
			return combat:execute(creature, var)
		end
	end
	
	return false
end