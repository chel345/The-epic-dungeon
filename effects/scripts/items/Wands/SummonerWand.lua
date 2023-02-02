--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local wand = require "scripts/lib/wand"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"
local TIME_TO_ZAP = 1
return wand.init{ 
    desc  = function()  
        return {
           image     = 12,
            name      = RPD.StringsManager:maybeId("SummonerWand_Name"),
            info      = RPD.StringsManager:maybeId("SummonerWand_Info")
        }
end, 

    activate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "SummonersW")

        RPD.permanentBuff(item:getUser(), "SummonersW")
    end,

    deactivate = function(self, item, hero)
            RPD.removeBuff(item:getUser(), "SummonersW")
    end,

cast = function(self,thisItem,lvl)
thisItem:getUser():spend(TIME_TO_ZAP)
RPD.playSound( "snd_meld.mp3" )

        local level = RPD.Dungeon.level

        local hero = RPD.Dungeon.hero

        for i = 1,1+thisItem:level() do
            local mob = RPD.mob("BeeBad")
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
return 5
end,

getManaMes = function()
return RPD.StringsManager:maybeId("No_Mana")
end
}
