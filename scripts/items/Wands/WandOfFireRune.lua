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
           image     = 4,
            name      = RPD.textById("WandOfFireRune_Name"),
            info      = RPD.textById("WandOfFireRune_Info")
        }
end, 

    activate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), RPD.Buffs.Light)

        RPD.permanentBuff(item:getUser(), RPD.Buffs.Light)

                RPD.removeBuff(item:getUser(), "Fire")

        RPD.permanentBuff(item:getUser(), "Fire")

    end,

    deactivate = function(self, item, hero)
            RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
                RPD.removeBuff(item:getUser(), "Fire")
    end,

castOnCell = function(self, thisItem, cell,dst,lvl)
thisItem:getUser():spend(TIME_TO_ZAP)
RPD.placeBlob( RPD.Blobs.LiquidFlame, dst, 60*(lvl+1))
RPD.zapEffect(thisItem:getUser():getPos(),dst,"Fire")

end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "cell"
end,

getMana = function()
return 15
end,

getManaMes = function()
return RPD.textById("No_Mana")
end
}
