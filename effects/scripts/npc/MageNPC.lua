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
local mob = RPD.mob("Spirit")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)
end
end,
interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("MageNPC_Phrase1"))
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Artifacts/SpiritSoul") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("MageNPC_Phrase2"))
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Artifacts/SpiritSoul"):detach(hero:getBelongings().backpack)
Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")
local wand = RPD.item("Artifacts/AmuletOfEnergy")
RPD.Dungeon.hero:collect(wand)
RPD.glog(RPD.StringsManager:maybeId("MageNPC_Phrase3")..wand:name())
self:getSprite():killAndErase()
RPD.Sfx.CellEmitter:get(self:getPos()):start(RPD.Sfx.ElmoParticle.FACTORY, 0.08,2)
self:destroy()
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("MageNPC_Phrase4"))
end
end
})

