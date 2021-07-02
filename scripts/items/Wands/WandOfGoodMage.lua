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
           image     = 2,
            name      = "Жезл друида",
            info      = "При использовании этот жезл вызовет регенерацию травы в указанной области. Цена 5 маны."
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
return "-- не хватает маны"
end
}