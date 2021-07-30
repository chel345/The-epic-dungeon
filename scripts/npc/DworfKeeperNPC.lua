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
chr = chr
local dialog = function(index)
if index == 0 then
if chr:gold() >= 300 then
chr:spendGold(300)
local key = RPD.ItemFactory:itemByName("GoldenKey")
RPD.Dungeon.level:drop(key, chr:getPos())
self:say(RPD.textById("DworfKeeperNPC_Phrase1"))
return
end
end
if index == 1 then
chr:say(RPD.textById("DworfKeeperNPC_Phrase2"))
end
end
RPD.chooseOption(
dialog,
RPD.textById("DworfKeeperNPC_Phrase3"),
RPD.textById("DworfKeeperNPC_Phrase4"),
RPD.textById("DworfKeeperNPC_Phrase5"),
RPD.textById("DworfKeeperNPC_Phrase6")
)

end
})


