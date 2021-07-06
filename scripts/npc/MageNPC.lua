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
local mob = RPD.MobFactory:mobByName("Spirit")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end,
interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, "Здраствуй, путник. Я бы хотел попросить тебя об просьбе. На этом уровне где-то затаился дух. Мне нужно, чтобы ты убил его и принёс мне его сердце. С его помощью я приготовлю лечебное зелье своему больному внуку. Будь акуратен, духи обычно очень пугливы. В награду я дам тебе особый амулет, который недавно сконструировал сам.")
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Artifacts/SpiritSoul") then
EPD.showQuestWindow(self, "Благодарю тебя, путник. Как и обещал, я отдаю тебе эту занятную побрекушку. Если верить теории, она должна позволить тебе вызывать мощьные всплески энергии, которые будут атаковать врагов.")
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Artifacts/SpiritSoul"):detach(hero:getBelongings().backpack)
Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")
local wand = RPD.item("Artifacts/AmuletOfEnergy")
RPD.Dungeon.hero:collect(wand)
RPD.glog("Теперь у тебя есть "..wand:name())
self:getSprite():killAndErase()
RPD.Sfx.CellEmitter:get(self:getPos()):start(RPD.Sfx.ElmoParticle.FACTORY, 0.08,2)
self:destroy()
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, "Ну и как там дела с поиском? На тебя вся надежда.")
end
end
})

