--250 level = 50
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local wand = require "scripts/lib/wand"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local candle
return wand.init{ 
    desc  = function(self, item)
		candle = item
    return {
        imageFile = "items/Candles.png",
        name      = RPD.StringsManager:maybeId("Candle_Name"),
        info      = RPD.StringsManager:maybeId("Candle_Info")
        }
end, 

actions = function()
return {}
end,

image = function()
if candle:level() >= 5 then
return 20
end
if candle:level() == 4 then
return 21
end
if candle:level() == 3 then
return 22
end
if candle:level() == 2 then
return 23
end
if candle:level() == 1 then
return 23
end
if candle:level() == 0 then
return 24
end
end,

activate = function(self, item, hero)
if item:level() <= 0 then
RPD.glog(RPD.StringsManager:maybeId("ExtinguishedCandle"))
item:doUnequip(item:getUser(),true)
return
end
RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
RPD.permanentBuff(item:getUser(), RPD.Buffs.Light)
end,

deactivate = function(self, item, hero)
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