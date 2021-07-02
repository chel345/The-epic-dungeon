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
level:drop(RPD.item("Artifacts/MagicEye"),cell).type = RPD.Heap.Type.SKELETON
end,

interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, "Эй, ты, путник! Ты, да, ты! Я тебя видел! Слушай, дружище, у меня к тебе просьба: видишь ли один злой волшебник проклял мой глаз и теперь я медленно теряю зрение- было бы у меня два глаза, да второй я тоже в бою потерял... И вот я пришёл в это место, чтобы отыскать особый артефакт, 'Магический глаз', похищенный разбойниками много лет назад, но как на зло не вижу ничерта... Мы, гноллы, хоть и очень подозрительны и пугливы, но очень ценим помощь собратям, особенно от людей.")
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Artifacts/MagicEye") then
EPD.showQuestWindow(self, "Спасибо, путник, ты меня спас! За это я вручаю тебе вещь, которую ты достоин! Спасибо! *снимает повязку и суёт в глаз в глазницу* Я вижу! Я снова вижу! Прощай, путник, желаю тебе удачи.")
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Artifacts/MagicEye"):detach(hero:getBelongings().backpack)
local wand = RPD.item("Artifacts/GnollHorn")
RPD.Dungeon.hero:collect(wand)
RPD.glog("Теперь у тебя есть "..wand:name())
self:getSprite():killAndErase()
self:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.WOOL ), 4)
self:destroy()
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, "Это кто там?")
end
end
})

