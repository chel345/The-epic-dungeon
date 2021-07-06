--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 

    zapProc = function(self, enemy, cell, dmg, chr)
        local ownPos  = self:getPos()
        local newPos  = enemy:getPos()

        self:move(newPos)
        self:getSprite():move(ownPos, newPos)

        enemy:move(ownPos)
        enemy:getSprite():move(newPos, ownPos)
        RPD.playSound( "teleport.ogg")
return dmg
    end,
    attackProc = function(self, enemy, cell, dmg, chr)
        local ownPos  = self:getPos()
        local newPos  = enemy:getPos()

        self:move(newPos)
        self:getSprite():move(ownPos, newPos)

        enemy:move(ownPos)
        enemy:getSprite():move(newPos, ownPos)
        RPD.playSound( "teleport.ogg")
return dmg
    end
})


