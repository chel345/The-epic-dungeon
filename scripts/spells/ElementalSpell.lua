--
-- User: mike
-- Date: 02.06.2018
-- Time: 20:39
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local spell = require "scripts/lib/spell"

return spell.init{
    desc  = function ()
        return {
            image         = 1,
            imageFile     = "spellsIcons/elemental(new).png",
            name          = RPD.textById("ElementalSpell_Name"),
            info          = RPD.textById("ElementalSpell_Info"),
            magicAffinity = "Elemental",
            targetingType = "none",
            level         = 2,
            spellCost     = 4,
            castTime      = 2
        }
    end,
    cast = function(self, spell, chr, cell)
local mobs = {
 "AirElemental",
"WaterElemental",
"EarthElemental",
"Elemental",
"IceElemental",
"LightingElemental"
}

       local level = RPD.Dungeon.level

        local hero = RPD.Dungeon.hero
            local mob = RPD.MobFactory:mobByName(mobs[math.random(1,6)])
            local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero));
return true
    end
   end 
}
