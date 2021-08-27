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

local data_firecandle

return wand.init{ 
    desc  = function(self, item)
firecandle = item
        return {
        imageFile = "items/Candles.png",
        name      = RPD.StringsManager:maybeId("FireCandle_Name"),
        info      = RPD.StringsManager:maybeId("FireCandle_Info")
        }
end, 

actions = function()
return {}
end,

image = function()
if firecandle:level() >= 5 then
return 15
end
if firecandle:level() == 4 then
return 16
end
if firecandle:level() == 3 then
return 17
end
if firecandle:level() == 2 then
return 18
end
if firecandle:level() == 1 then
return 18
end
if firecandle:level() == 0 then
return 19
end
end,

activate = function(self, item, hero)
if item:level() <= 0 then
RPD.glog(RPD.StringsManager:maybeId("ExtinguishedCandle"))
item:getUser():collect(RPD.item("Candles/firecandle"))
item:removeItemFrom(item:getUser())
return
end
RPD.removeBuff(item:getUser(), "FireCandle")
RPD.permanentBuff(item:getUser(), "FireCandle")
end,

deactivate = function(self, item, hero)
RPD.removeBuff(item:getUser(), "FireCandle")
end,

CharAct = function()
if firecandle:isEquipped(RPD.Dungeon.hero) then
if EPD.time % 50 == 0 and firecandle:level() > 0 then
firecandle:level(firecandle:level()-1)
end
if firecandle:level() <= 0 then
firecandle:deactivate()

RPD.glog(RPD.StringsManager:maybeId("ExtinguishedCandle"))
firecandle:removeItemFrom(firecandle:getUser())
RPD.Dungeon.hero:collect(RPD.item("Candles/FireCandle"))

data_firecandle = nil
elseif data_firecandle == nil then
firecandle:activate(RPD.Dungeon.hero)
data_firecandle = true
end
end
end
}