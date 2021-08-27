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
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("WandmakerNPC_Phrase1"))
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("CorpseDust") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("WandmakerNPC_Phrase2"))
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("CorpseDust"):detach(hero:getBelongings().backpack)
Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")
local wand = Treasury:getLevelTreasury():bestOf(Treasury.Category.WAND,4 )
RPD.Dungeon.hero:collect(wand)
RPD.glog(RPD.StringsManager:maybeId("WandmakerNPC_Phrase3")..wand:name())
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("WandmakerNPC_Phrase4"))
else
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("WandmakerNPC_Phrase5"))
end
end
})

