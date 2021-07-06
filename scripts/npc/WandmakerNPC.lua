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
cell = self:getPos()
RPD.Sfx.CellEmitter:get(cell-W*3-2):pour(RPD.Sfx.SnowParticle.FACTORY, 0.08);
RPD.Sfx.CellEmitter:get(cell-W*3-1):pour(RPD.Sfx.PurpleParticle.FACTORY, 0.08);
cell = math.random(1,level:getLength()-1)
while level.map[cell] ~= RPD.Terrain.EMPTY and cell ~= self:getPos() do
cell = math.random(1,level:getLength()-1)
end
level:drop(RPD.item("CorpseDust"),cell).type = RPD.Heap.Type.SKELETON
end,
interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, "Ох, здравствуйте, странник. Небось сами недоумеваете, что согбенный старичок делает в таком неприветливом месте? Я достаточно известный в столице мастер, когда-то работал на производстве палочек, пока не стал слишком стар. И вот... Я открыл свою небольшую лавку здесь, в подземелье. Здесь я продаю всякие магические палочки, черепа и прочий магический хлам. Многие вещи я делаю сам, а некоторое сырьё я закупаю в городе. Кстати, насчёт сырья... У меня есть к тебе небольшая просьба. Мне не хватает одного ингридиента для одного заклинания. Трупной пыли. Где-то на этом этаже есть захоронение, котрому уже лет так пятьдесят. Найди его и принеси мне немного праха. Я бы и сам сходил, но старость не радость, почти всё атакующие заклинания забыл. Буду очень благодарен, если ты поможешь. В награду я могу отдать тебе что-нибудь из товара.")
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("CorpseDust") then
EPD.showQuestWindow(self, "Спасибо тебе большое, путник. Как я и обещал, отдаю тебе вот это.")
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("CorpseDust"):detach(hero:getBelongings().backpack)
Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")
local wand = Treasury:getLevelTreasury():bestOf(Treasury.Category.WAND,4 )
RPD.Dungeon.hero:collect(wand)
RPD.glog("Теперь у тебя есть "..wand:name())
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, "День добрый, путник, чего расскажешь? Прах нашёл? Нет? Ну тогда удачи в поисках!")
else
EPD.showQuestWindow(self, "Как много дел! Как много дел!")
end
end
})

