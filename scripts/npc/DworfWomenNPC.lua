--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    interact = function(self, chr)
local EPD = require "scripts/lib/dopClasses"
EPD.showQuestWindow(self,RPD.textById("DworfWomenNPC_Phrase1"))
end
})


