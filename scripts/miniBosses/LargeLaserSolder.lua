--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local SolderLaser = require"scripts/effects/LargeSolderLaser"

local function makeMob()
  return {
    zapProc = function(self, enemy, dmg)
        SolderLaser.ray(self:getPos(),enemy:getPos())
        return dmg
    end,
    attackProc = function(me,enemy,dmg)
        local pos = enemy:getPos()
        if pos == me:getPos() -1 then
            enemy:move(enemy:getPos()-1)
            enemy:getSprite():move(pos,enemy:getPos()-1)
        elseif pos == me:getPos() + 1 then
            enemy:move(enemy:getPos()+1)
            enemy:getSprite():move(pos,enemy:getPos()+1)
        elseif pos == me:getPos() + RPD.Dungeon.level:getWidth() then
            enemy:move(enemy:getPos()+RPD.Dungeon.level:getWidth() )
            enemy:getSprite():move(pos,enemy:getPos()+RPD.Dungeon.level:getWidth() )
        elseif pos == me:getPos() - RPD.Dungeon.level:getWidth() then
            enemy:move(enemy:getPos()- RPD.Dungeon.level:getWidth() )
            enemy:getSprite():move(pos,enemy:getPos()- RPD.Dungeon.level:getWidth() )
        end
    end
  }
end
return mob.init(makeMob())
