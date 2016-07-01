--TO BE FIXED
local condition = Condition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
condition:setParameter(CONDITION_PARAM_SUBID, 88888)
condition:setParameter(CONDITION_PARAM_TICKS, 10 * 1000)
condition:setParameter(CONDITION_PARAM_HEALTHGAIN, 0.01)
condition:setParameter(CONDITION_PARAM_HEALTHTICKS, 10 * 1000)

local function changeSpeeds(cid, var)
	local creature = Creature(cid)
	if not creature then
		return
	end
	creature:changeSpeed(creature:getBaseSpeed())
end
	
function onCastSpell(creature, var)
    local creaturePosition = creature:getPosition()
	local speed = creature:getSpeed()
	
	local nextPosition = Position(creaturePosition.x, creaturePosition.y - 1, creaturePosition.z)
	local tile = Tile(nextPosition)
	
	local topCreature = tile:getTopCreature() 
	
	if not creature:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT, 88888) then
		creature:addCondition(condition)
		creature:teleportTo(nextPosition, true)
		creature:changeSpeed(-speed)
		SpellAddEvent(changeSpeeds, 11 * 1000, creature:getId(), var)
		
		if topCreature and topCreature:isPlayer() then
			topCreature:teleportTo(Position(creaturePosition.x, creaturePosition.y - 3, creaturePosition.z), true)
		end
	end
	
    return true
end