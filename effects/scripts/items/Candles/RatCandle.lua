--250 level = 50
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local wand = require "scripts/lib/item"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local ratcandle

return wand.init{ 
    desc  = function(self, item)
ratcandle = item
        return {
        imageFile = "items/Candles.png",
        name      = RPD.StringsManager:maybeId("RatCandle_Name"),
        info      = RPD.StringsManager:maybeId("RatCandle_Info"),
        equipable     = "left_hand",
        upgradable    = true
        }
end, 

actions = function()
return {}
end,

image = function()
if ratcandle:level() >= 5 then
return 5
end
if ratcandle:level() == 4 then
return 6
end
if ratcandle:level() == 3 then
return 7
end
if ratcandle:level() == 2 then
return 8
end
if ratcandle:level() == 1 then
return 8
end
if ratcandle:level() == 0 then
return 9
end
end,

activate = function(self, item, hero)
if item:level() <= 0 then
RPD.glog(RPD.StringsManager:maybeId("ExtinguishedCandle"))
item:doUnequip(item:getUser(),true)
return
end
RPD.removeBuff(item:getUser(), "RatCandle")
RPD.permanentBuff(item:getUser(), "RatCandle" )
RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
RPD.permanentBuff(item:getUser(), RPD.Buffs.Light)
end,

deactivate = function(self, item, hero)
RPD.removeBuff(item:getUser(), "RatCandle" )
RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
end,

act = function(self,item)
item:spend(1)
if item:isEquipped(RPD.Dungeon.hero) then
if EPD.time % 50 == 0 and item:level() > 0 then
item:level(item:level()-1)
end
if item:level() <= 0 then
item:activate(RPD.Dungeon.hero)
end
end
end
}