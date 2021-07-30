--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

local EPD = require "scripts/lib/dopClasses"

return mob.init({
    interact = function(self, chr)
EPD.showQuestWindow(self,RPD.textById("UpWarlokNPC_Phrase1"))
end
})


