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
chr = chr
local dialog = function(index)
if index == 0 then
if chr:gold() >= 300 then
chr:spendGold(300)
local key = RPD.ItemFactory:itemByName("GoldenKey")
RPD.Dungeon.level:drop(key, chr:getPos())
self:say(RPD.StringsManager:maybeId("DworfKeeperNPC_Phrase1"))
return
end
end
if index == 1 then
chr:say(RPD.StringsManager:maybeId("DworfKeeperNPC_Phrase2"))
end
end
RPD.chooseOption(
dialog,
RPD.StringsManager:maybeId("DworfKeeperNPC_Phrase3"),
RPD.StringsManager:maybeId("DworfKeeperNPC_Phrase4"),
RPD.StringsManager:maybeId("DworfKeeperNPC_Phrase5"),
RPD.StringsManager:maybeId("DworfKeeperNPC_Phrase6")
)

end
})


