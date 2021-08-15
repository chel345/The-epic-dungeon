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
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("CagetShadowSpiderNPC_Phrase1"))
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("IronKey") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("CagetShadowSpiderNPC_Phrase2"))
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("IronKey"):detach(hero:getBelongings().backpack)


local mob = RPD.MobFactory:mobByName("ShadowSpider")
mob:setPos(self:getPos())
RPD.Dungeon.level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))

self:getSprite():killAndErase()
self:destroy()

storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("CagetShadowSpiderNPC_Phrase3"))
end
end
})

