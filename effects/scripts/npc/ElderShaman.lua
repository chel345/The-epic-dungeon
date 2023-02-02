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
cell = self:getPos()
cell = math.random(1,level:getLength()-1)
while level.map[cell] ~= RPD.Terrain.EMPTY and cell ~= self:getPos() do
cell = math.random(1,level:getLength()-1)
end
level:drop(RPD.item("Artifacts/ShadowMedal"),cell).type = RPD.Heap.Type.SKELETON
end
end,
interact = function(self, chr)
local level = RPD.Dungeon.level
local W = level:getWidth()
if not storage.get("interact") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("ElderShaman_Phrase1"))
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Artifacts/ShadowMedal") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("ElderShaman_Phrase2"))
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Artifacts/ShadowMedal"):detach(hero:getBelongings().backpack)

local vials = {"AlaramVial","FireVial","GrippingVial","LightingVial","ParalysisVial","PoisonVial","SummonVial","ToxicVial"}
for i = 1,5 do
local item = RPD.item("Vials/"..vials[math.random(1,#vials)])
RPD.Dungeon.hero:collect(item)
RPD.glog(RPD.StringsManager:maybeId("ElderShaman_Phrase5")..item:name())
end

storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("ElderShaman_Phrase3"))
else
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("ElderShaman_Phrase4"))
RPD.zapEffect(self:getPos(), self:getPos()-W*2)
self:destroy()
self:getSprite():killAndErase()
end
end
})

