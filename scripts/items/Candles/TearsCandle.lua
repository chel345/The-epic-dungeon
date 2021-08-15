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

local data_tearscandle

return wand.init{ 
    desc  = function(self, item)
tearscandle = item
        return {
        imageFile = "items/Candles.png",
        name      = RPD.StringsManager:maybeId("TearsCandle_Name"),
        info      = RPD.StringsManager:maybeId("TearsCandle_Info")
        }
end, 

actions = function()
return {}
end,

image = function()
if tearscandle:level() >= 5 then
return 0
end
if tearscandle:level() == 4 then
return 1
end
if tearscandle:level() == 3 then
return 2
end
if tearscandle:level() == 2 then
return 3
end
if tearscandle:level() == 1 then
return 3
end
if tearscandle:level() == 0 then
return 4
end
end,

activate = function(self, item, hero)
if item:level() <= 0 then
RPD.glog(RPD.StringsManager:maybeId("ExtinguishedCandle"))
item:getUser():collect(RPD.item("Candles/TearsCandle"))
item:removeItemFrom(item:getUser())
return
end
RPD.removeBuff(item:getUser(), RPD.Buffs.MindVision)
RPD.permanentBuff(item:getUser(), RPD.Buffs.MindVision)
end,

deactivate = function(self, item, hero)
RPD.removeBuff(item:getUser(), RPD.Buffs.MindVision)
end,

CharAct = function()
if tearscandle:isEquipped(RPD.Dungeon.hero) then
if EPD.time % 50 == 0 and tearscandle:level() > 0 then
tearscandle:level(tearscandle:level()-1)
end
if tearscandle:level() <= 0 then
tearscandle:deactivate()

RPD.glog(RPD.StringsManager:maybeId("ExtinguishedCandle"))
tearscandle:removeItemFrom(tearscandle:getUser())
RPD.Dungeon.hero:collect(RPD.item("Candles/TearsCandle"))

data_tearscandle = nil
elseif data_tearscandle == nil then
tearscandle:activate(RPD.Dungeon.hero)
data_tearscandle = true
end
end
end
}