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

local function dialog(idx)
if idx == 0 then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("SnailKing_Phrase4"))
storage.put("snailking",true)
end
if idx == 1 then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("SnailKing_Phrase5"))
local mob = RPD.mob("SnailKing")
mob:setPos(self:getPos())
RPD.Dungeon.level:spawnMob(mob)
self:getSprite():killAndErase()
self:destroy()
end
end
if not storage.get("snailking") then
RPD.chooseOption( dialog,
RPD.StringsManager:maybeId("SnailKing_Name"),
RPD.StringsManager:maybeId("SnailKing_Phrase1"),
RPD.StringsManager:maybeId("SnailKing_Phrase2"),
RPD.StringsManager:maybeId("SnailKing_Phrase3")
)
end
end
})

