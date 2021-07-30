--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local mob = require"scripts/lib/mob"

return mob.init({
stats = function(self)
end,
    interact = function(self, chr)
self:getSprite():turnTo(self:getPos(),self:getPos()-1)
EPD.showQuestWindow(self,RPD.textById("UpDworfMonkNPC_Phrase1"))
end
})


