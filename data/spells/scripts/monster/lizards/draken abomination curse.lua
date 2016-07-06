local function configureCombat(combat, damage)
	combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_SMALLCLOUDS)
	combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)
end

local doCombatFunc = MonsterSpellCreateCursedCombatList(15, 30, 1, 9, 9, 1.2, 4000, configureCombat)

function onCastSpell(creature, variant)
	return doCombatFunc():execute(creature, variant)
end
