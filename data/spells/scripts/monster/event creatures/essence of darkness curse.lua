local function configureCombat(combat, damage)
	combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)
	combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_SUDDENDEATH)
end

local doCombatFunc = MonsterSpellCreateCursedCombatList(2, 2, 2, 4, 4, 1.2, 4000, configureCombat)

function onCastSpell(creature, var)
	return doCombatFunc():execute(creature, var)
end
