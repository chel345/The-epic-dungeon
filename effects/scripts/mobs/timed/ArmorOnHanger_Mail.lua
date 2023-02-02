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
item = "MailArmor"
RPD.Dungeon.level:drop(RPD.item(item),chr:getPos())
local Hanger = RPD.mob("effects/ArmorOnHanger")
Hanger:setPos(self:getPos())
RPD.Dungeon.level:spawnMob(Hanger)
self:destroy()
self:getSprite():killAndErase()
chr:getSprite():operate()
end
})

