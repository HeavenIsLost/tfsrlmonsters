local function configureCombat(combat, damage)
	combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_DEATHDAMAGE)
	combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_NONE)
	combat:setParameter(COMBAT_PARAM_DISTANCEEFFECT, CONST_ANI_DEATH)
end

local doCombatFunc = MonsterSpellCreateCursedCombatList(2, 2, 2, 20, 20, 1.2, 4000, configureCombat)

function onCastSpell(creature, variant)
	return doCombatFunc():execute(creature, variant)
end
