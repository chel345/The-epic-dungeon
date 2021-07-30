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
           image     = 6,
            name      = RPD.textById("WandOfBlast_Name"),
            info      = RPD.textById("WandOfBlast_Info")
        }
end, 

    activate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Poison")

        RPD.permanentBuff(item:getUser(), "Poison")
    end,
 
    deactivate = function(self, item, hero)
            RPD.removeBuff(item:getUser() ,"Poison")
    end,

castOnCell = function(self, thisItem, cell,dst,lvl)
thisItem:getUser():spend(TIME_TO_ZAP)
local enemy = RPD.Actor:findChar(dst)
local lvl = thisItem:level()
RPD.zapEffect(thisItem:getUser():getPos(),dst,"LightZap")
EPD.ZapWand("WandOfPoison",RPD.Dungeon.depth+lvl,thisItem:getUser(),dst)
RPD.placeBlob( RPD.Blobs.ConfusionGas, dst, 60*(lvl+1))
RPD.playSound( "snd_crystal.mp3" )
RPD.Sfx.CellEmitter:get(dst):start(RPD.Sfx.Speck:factory( RPD.Sfx.Speck.LIGHT), 0.1,3);

end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "cell"
end,

getMana = function()
return 10
end,

getManaMes = function()
return RPD.textById("No_Mana")
end
}
