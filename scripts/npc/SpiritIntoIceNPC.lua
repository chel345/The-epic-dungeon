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
--[[
spawn = function(self)
local level = RPD.Dungeon.level
local W = level:getWidth()
cell = self:getPos()
RPD.Sfx.CellEmitter:get(cell-W*3-2):pour(RPD.Sfx.SnowParticle.FACTORY, 0.08);
RPD.Sfx.CellEmitter:get(cell-W*3-1):pour(RPD.Sfx.PurpleParticle.FACTORY, 0.08);
cell = math.random(1,level:getLength()-1)
while level.map[cell] ~= RPD.Terrain.EMPTY and cell ~= self:getPos() do
cell = math.random(1,level:getLength()-1)
end
level:drop(RPD.item("CorpseDust"),cell).type = RPD.Heap.Type.SKELETON
end,
--]]
interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, "Путник... Путник...Прошу тебя помочь мне. Вот уже 1000 лет я заперт во льдах. Принеси мне ледяное сердце, прошу тебя...")
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Artifacts/IceHeart") then
EPD.showQuestWindow(self, "Да! Это оно! Положи мне его в руку. В награду можешь взять магическое кольцо на моей правой руке...")
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Artifacts/IceHeart"):detach(hero:getBelongings().backpack)
Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")
local wand = RPD.item("RingOfFrost")
RPD.Dungeon.hero:collect(wand)
RPD.glog("Теперь у тебя есть "..wand:name())
self:destroy()
self:getSprite():die()
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, "Прошу... Прошу...")
end
end
})

