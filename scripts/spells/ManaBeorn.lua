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
            image         = 52,
            imageFile     = "spellsIcons/elemental(new).png",
            name          = RPD.textById("ManaBeorn_Name"),
            info          = RPD.textById("ManaBeorn_Info"),
            magicAffinity = "Necromancy",
            targetingType = "cell",
            level         = 4,
            spellCost     = -10,
            castTime      = 3
        }
    end,
    castOnCell = function(self, spell, chr, cell)
local sacrifice = RPD.Actor:findChar(cell)
if sacrifice then
if sacrifice:isPet() then
sacrifice:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
RPD.playSound( "snd_cursed.mp3" )
local hero = RPD.Dungeon.hero sacrifice:damage(sacrifice:hp(),chr)
return true
end
return false
end
RPD.glog(RPD.textById("EmptyHereSpells"))
return false
    end
}
