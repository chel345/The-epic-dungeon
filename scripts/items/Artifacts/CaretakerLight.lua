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
            image     = 17,
            imageFile = "items/ArtifactsMod.png",
            name      = RPD.textById("CaretakerLight_Name"),
            info      = RPD.textById("CaretakerLight_Info")
        }
end, 

activate = function(self, item, hero)
RPD.removeBuff(hero, RPD.Buffs.Light)
RPD.permanentBuff(hero, RPD.Buffs.Light)
end,

deactivate = function(self, item, hero)
RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
end,

castOnCell = function(self, thisItem, on,dst,lvl)

RPD.placeBlob( RPD.Blobs.Fire, dst, 60*(lvl+1))
RPD.zapEffect(thisItem:getUser():getPos(),dst,"Fire")

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