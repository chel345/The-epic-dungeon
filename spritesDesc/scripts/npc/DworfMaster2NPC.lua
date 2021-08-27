--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local mob = require"scripts/lib/mob"

return mob.init({
stats = function(self)
end,
    interact = function(self, chr)
self:getSprite():turnTo(self:getPos(),self:getPos()+1)
EPD.showQuestWindow(self,RPD.StringsManager:maybeId("DworfMaster2NPC_Phrase1"))
end
})


