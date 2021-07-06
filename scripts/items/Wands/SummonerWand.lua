--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local wand = require "scripts/lib/wand"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

return wand.init{ 
    desc  = function()  
        return {
           image     = 12,
            name      = "Жезл призывателя",
            info      = "При использовании этот жезл призовёт вредин. Цена 15 маны."
        }
end, 

    activate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Summoners")

        RPD.permanentBuff(item:getUser(), "Summoners")
    end,

    deactivate = function(self, item, hero)
            RPD.removeBuff(item:getUser(), "Summoners")
    end,

cast = function(self,thisItem,lvl)
RPD.playSound( "snd_meld.mp3" )

        local level = RPD.Dungeon.level

        local hero = RPD.Dungeon.hero

        for i = 1,1+thisItem:level() do
            local mob = RPD.MobFactory:mobByName("Bee")
            local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero));
RPD.Sfx.Wound:hit(mob)
RPD.Sfx.SpellSprite:show(thisItem:getUser(), RPD.Sfx.SpellSprite.SUMMON)
        end
    end
end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "none"
end,

getMana = function()
return 15
end,

getManaMes = function()
return "-- не хватает маны"
end
}