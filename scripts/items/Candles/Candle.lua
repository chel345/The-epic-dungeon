--250 level = 50
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local wand = require "scripts/lib/wand"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local data_candle

return wand.init{ 
    desc  = function(self, item)
candle = item
        return {
        imageFile = "items/Candles.png",
        name      = "Свеча",
        info      = "Большая свеча."
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
RPD.glog("** Свеча потухала и пытаться зажечь её бессмысленно")
item:getUser():collect(RPD.item("Candles/Candle"))
item:removeItemFrom(item:getUser())
return
end
RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
RPD.permanentBuff(item:getUser(), RPD.Buffs.Light)
end,

deactivate = function(self, item, hero)
RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
end,

CharAct = function()
if candle:isEquipped(RPD.Dungeon.hero) then
if EPD.time % 50 == 0 and candle:level() > 0 then
candle:level(candle:level()-1)
end
if candle:level() <= 0 then
candle:deactivate()

RPD.glog("** Свеча потухала и пытаться зажечь её бессмысленно")
candle:removeItemFrom(candle:getUser())
RPD.Dungeon.hero:collect(RPD.item("Candles/Candle"))

data_candle = nil
elseif data_candle == nil then
candle:activate(RPD.Dungeon.hero)
data_candle = true
end
end
end
}