--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    zapProc = function(self, enemy, dmg)
local level = RPD.Dungeon.level
local hero = RPD.Dungeon.hero
            local mob = RPD.mob("Skeleton")
   local x = level:cellX(cell)
        local y = level:cellY(cell)
        for i = x - 1, x + 3 do
            for j = y - 1, y + 3 do
            local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero));
  end
  end
end 
end,
    interact = function(self, chr)
        local ownPos  = self:getPos()
        local newPos  = chr:getPos()

        self:move(newPos)
        self:getSprite():move(ownPos, newPos)

        chr:move(ownPos)
        chr:getSprite():move(newPos, ownPos)
    end,
    stats = function(self)
        RPD.permanentBuff(self, RPD.Buffs.Roots)
    end 
}
