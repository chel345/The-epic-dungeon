--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
stats = function(self)
RPD.permanentBuff(self, RPD.Buffs.Roots)
end,
zapProc = function(self, enemy, dmg)
f = 2
effect = {
"Wands/WandOfLightbolt",
"Wands/WandOfMagicbolt",
"Wands/WandOfGoodMage",
"Wands/WandOfCrystalion"
}
effect = effect[math.random(1,#effect)]
RPD.zapEffect(self:getPos(),enemy:getPos(),effect)
drop = function(cell)
if RPD.Dungeon.level.map[cell] == RPD.Terrain.CHASM and f ~= 1 then
RPD.Dungeon.level:drop(RPD.item(effect),cell)
f = 1
return
end
end
-- RPD.forCellsAround(enemy:getPos(),drop)
return dmg
end
}
