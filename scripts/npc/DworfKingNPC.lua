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
EPD.showQuestWindow(self,RPD.textById("DworfKingNPC_Phrase1"))
end
})


