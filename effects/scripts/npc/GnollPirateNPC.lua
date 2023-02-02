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
local W = level:getWidth()

cell = math.random(1,level:getLength()-1)
while level.map[cell] ~= RPD.Terrain.EMPTY and cell ~= self:getPos() do
cell = math.random(1,level:getLength()-1)
end
level:drop(RPD.item("Artifacts/MagicEye"),cell).type = RPD.Heap.Type.SKELETON
end
end,

interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("GnollPirateNPC_Phrase1"))
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Artifacts/MagicEye") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("GnollPirateNPC_Phrase2"))
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Artifacts/MagicEye"):detach(hero:getBelongings().backpack)
local wand = RPD.item("Artifacts/GnollHorn")
RPD.Dungeon.hero:collect(wand)
RPD.glog(RPD.StringsManager:maybeId("GnollPirateNPC_Phrase3")..wand:name())
self:getSprite():killAndErase()
self:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.WOOL ), 4)
self:destroy()
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("GnollPirateNPC_Phrase4"))
end
end
})

