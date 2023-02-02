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
           image     = 18,
            name      = RPD.StringsManager:maybeId("WandOfMirror_Name"),
            info      = RPD.StringsManager:maybeId("WandOfMirror_Info")
        }
end, 

    activate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "MirrorW")

        RPD.permanentBuff(item:getUser(), "MirrorW")

    end,

    deactivate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "MirrorW")
    end,

cast = function(self,thisItem,lvl)
local level = RPD.Dungeon.level
thisItem:getUser():spend(TIME_TO_ZAP)
        local hero = RPD.Dungeon.hero
        print(self, cause)

            local mob = RPD.mob("Bee")
            local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
--                mob:setPos(pos)
--level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero));
local image  = thisItem:getUser():makeClone();
RPD.Wands.wandOfBlink:appear( image, pos );
    end
end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "none"
end,

getMana = function()
return 10
end,

getManaMes = function()
return RPD.StringsManager:maybeId("No_Mana")
end
}
