--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local mob = require"scripts/lib/mob"

return mob.init({
spawn = function(self)
if not storage.get("item_was_spwn") then
storage.put("item_was_spwn",true)
local level = RPD.Dungeon.level
cell = math.random(1,level:getLength()-1)
while level.map[cell] ~= RPD.Terrain.EMPTY and cell ~= self:getPos() do
cell = math.random(1,level:getLength()-1)
end
level:drop(RPD.item("Artifacts/SpiderEye"),cell).type = RPD.Heap.Type.SKELETON
end
end,
interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("AlhimicNPC_Phrase1"))
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Artifacts/SpiderEye") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("AlhimicNPC_Phrase2"))
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Artifacts/SpiderEye"):detach(hero:getBelongings().backpack)
RPD.Dungeon.level:drop(RPD.item("Potion/Test8"),self:getPos())
self:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.LIGHT ), 4)
self:destroy()
self:getSprite():killAndErase()
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("AlhimicNPC_Phrase3"))
end
end
})

