---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 21.03.19 22:57
---
---

local RPD = require "scripts/lib/commonClasses"

local spell = require "scripts/lib/spell"

return spell.init{
    desc  = function ()
        return {
            image         = 6,
            imageFile     = "spellsIcons/necromancy.png",
            name          = "Призвать осквернённую душу",
            info          = "Призывает осквернённую душу.",
            magicAffinity = "Combat",
            targetingType = "self",          level         = 1,
            spellCost     = 9,
            cooldown      = 5,
            castTime      = 2
        }
    end,
    cast = function(self, spell, chr,caster,cell)
        local level = RPD.Dungeon.level

        local hero = RPD.Dungeon.hero
            local mob = RPD.MobFactory:mobByName("SkvernSoul")
            local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
level:spawnMob(RPD.Mob:makePet(mob,hero));
        mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )

    end
return true
end
}
