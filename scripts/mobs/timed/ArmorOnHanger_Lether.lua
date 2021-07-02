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
item = "LeatherArmor"
RPD.Dungeon.level:drop(RPD.item(item),chr:getPos())
local Hanger = RPD.MobFactory:mobByName("effects/ArmorOnHanger")
Hanger:setPos(self:getPos())
RPD.Dungeon.level:spawnMob(Hanger)
self:destroy()
self:getSprite():killAndErase()
chr:getSprite():operate()
end
})

