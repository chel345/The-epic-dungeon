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
local TIME_TO_ZAP = 1
return wand.init{ 
    desc  = function()  
        return {
           image     = 2,
            name      = RPD.textById("WandOfGoodMage_Name"),
            info      = RPD.textById("WandOfGoodMage_Info")
        }
end, 

    activate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Earth")

        RPD.permanentBuff(item:getUser(), "Earth")

    end,

    deactivate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Earth")
    end,

castOnCell = function(self, thisItem, cell,dst,lvl)
thisItem:getUser():spend(TIME_TO_ZAP)
EPD.ZapWand("WandOfRegrowth",lvl+2,thisItem:getUser(),dst)
if math.random(1,4) == 1 then
EPD.SpawnMob("EarthElemental",dst,true)
end

end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "cell"
end,

getMana = function()
return 5
end,

getManaMes = function()
return RPD.textById("No_Mana")
end
}
