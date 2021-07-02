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
cell = math.random(1,level:getLength()-1)
while level.map[cell] ~= RPD.Terrain.EMPTY and cell ~= self:getPos() do
cell = math.random(1,level:getLength()-1)
end
level:drop(RPD.item("Artifacts/SpiderEye"),cell).type = RPD.Heap.Type.SKELETON
end,
interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, "Здравствуйте, не могли бы вы помочь мне с одним делом. В награду я отдам вам пару тройку золотых. Я пришёл в это место, чтобы найти кое-какие ингредиенты для зелья. Мне нужен паучий глаз.")
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Artifacts/SpiderEye") then
EPD.showQuestWindow(self, "Спасибо, как и обещал я... *быстро читает свиток телепортации*.")
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Artifacts/SpiderEye"):detach(hero:getBelongings().backpack)
RPD.Dungeon.level:drop(RPD.item("Potion/Test8"),self:getPos())
self:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.LIGHT ), 4)
self:destroy()
self:getSprite():killAndErase()
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, "Ну и мерзкое это место... Как дела с поиском?")
end
end
})

