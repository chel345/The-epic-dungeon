--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

return item.init{
    desc  = function ()
        return {
           image     = 2,
            imageFile = "items/RangedMod.png",
            name      = RPD.textById("Guian_Name"),
            info      = RPD.textById("Guian_Info"),
            stackable = true,
            upgradable    = true,
            price     = 10
        }
    end,
                typicalSTR  = function(self, item)

            return 12 - item:level()
        end,

        requiredSTR = function(self, item)
            return 12 - item:level()
        end,

    onThrow = function(self, item, cell,enemy,soul)
local Callback = luajava.bindClass("com.watabou.utils.Callback")
missile = item:getUser():getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( item:getUser():getPos(),cell,Callback.callback)
missile:size(4); 
missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.08)
if RPD.Dungeon.hero:effectiveSTR() >= 12-item:level() then
ver = 12-item:level()
chanse = math.random(12-1,ver)
else
ver = 12-item:level()-item:getUser():effectiveSTR()
chanse = math.random(ver,12-1)
end
local soul =  RPD.Actor:findChar(cell)
                if soul then
if ver == chanse then

        RPD.affectBuff(soul, RPD.Buffs.Roots , 10)
        soul:damage(20*(item:level()+1),RPD.Dungeon.hero)
RPD.playSound( "snd_hit.mp3")
        return dmg
else
soul:getSprite():showStatus(0xCCAA44,RPD.textById("Dodged"))
item:dropTo(cell)
end

    else
           item:dropTo(cell)
end
    end,
    bag = function(self, item)
        return "Quiver"
    end,
isFliesStraight = function()
return true
end
}