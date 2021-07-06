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
           image     = 0,
            imageFile = "items/RangedMod.png",
            name      = "Молот",
            info      = "Этот огромный молот способен парализовать своим ударом любого врага.",
            stackable = true,
            upgradable    = true,
            price     = 100
        }
    end,

actions = function()
return {} 
end,
            typicalSTR  = function(self, item)

            return 16 - item:level()
        end,

        requiredSTR = function(self, item)
            return 16 - item:level()
        end,

    onThrow = function(self, item, cell,enemy,soul,thisItem)
if RPD.Dungeon.hero:effectiveSTR() >= 16-item:level() then
ver = 16-item:level()
chanse = math.random(16-1,ver)
else
ver = 16-item:level()-item:getUser():effectiveSTR()
chanse = math.random(ver,16-1)
end
local soul =  RPD.Actor:findChar(cell)
local Callback = luajava.bindClass("com.watabou.utils.Callback")
missile = item:getUser():getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( item:getUser():getPos(),cell,Callback.callback)
missile:size(1); 
missile:pour(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.DUST), 0.08)
                if soul then
if ver == chanse then
        RPD.affectBuff(soul, RPD.Buffs.Paralysis , 5+item:level())
        soul:damage(math.random(4,5)*(item:level()+1),RPD.Dungeon.hero)
RPD.playSound( "snd_hit.mp3")
        return dmg
else
soul:getSprite():showStatus(0xCCAA44,"Уклонился")
item:dropTo(cell)
end
    else
           item:dropTo(cell)
end
    end ,
    bag = function(self, item)
        return "Quiver"
    end,

}