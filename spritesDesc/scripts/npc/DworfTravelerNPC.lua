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
interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("DworfTravelerNPC_Phrase1"))
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Ration") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("DworfTravelerNPC_Phrase2"))
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Ration"):detach(hero:getBelongings().backpack)
RPD.Sfx.SpellSprite:show(self, RPD.Sfx.SpellSprite.FOOD)
local wand = RPD.creteItem("GoldenKey", {levelId="TempleOfTears"})
RPD.Dungeon.hero:collect(wand)
RPD.glog(RPD.StringsManager:maybeId("DworfTravelerNPC_Phrase3")..wand:name())
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("DworfTravelerNPC_Phrase4"))
else
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("DworfTravelerNPC_Phrase5"))
end
end
})

