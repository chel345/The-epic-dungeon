--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    interact = function(self, chr)
local EPD = require "scripts/lib/dopClasses"
EPD.showQuestWindow(self,RPD.StringsManager:maybeId("DworfNPC_Phrase1"))
end
})


