--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local mob = require"scripts/lib/mob"

return mob.init({
spawn = function(self)
local level = RPD.Dungeon.level
local W = level:getWidth()
cell = math.random(1,level:getLength()-1)
while level.map[cell] ~= RPD.Terrain.EMPTY and cell ~= self:getPos() do
cell = math.random(1,level:getLength()-1)
end
level:drop(RPD.item("Artifacts/DeskOfRuns"),cell).type = RPD.Heap.Type.SKELETON
end,
interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, "Эх где же второй кусок? Может ты знаешь, а?")
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Artifacts/DeskOfRuns") then
EPD.showQuestWindow(self, "О вот она! Спасибо, вам за неё. В награду я отдам вам одну очень интересную вещь...")
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Artifacts/DeskOfRuns"):detach(hero:getBelongings().backpack)

local wand = RPD.item("Artifacts/AmuletOfDomination")
RPD.Dungeon.hero:collect(wand)
RPD.glog("Теперь у тебя есть "..wand:name())
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, "Где же где же...")
else
EPD.showQuestWindow(self, "Не мешай! Я пытаюсь её прочитать...")
end
end
})

