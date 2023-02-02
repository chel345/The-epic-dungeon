--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local cell

local function getCell()
local self = RPD.Dungeon.hero
local w = RPD.Dungeon.level:getWidth()
local s = self:getPos()+math.random(-2,2)+w*math.random(-2,2)
while RPD.Dungeon.level:distance(RPD.Dungeon.hero:getPos(),s) > 2 do
s = self:getPos()+math.random(-2,2)+w*math.random(-2,2)
end
return s
end

return mob.init{
    spawn = function (self)
    cell = self:getPos()
    local paint = {
    kind="Deco",
    object_desc="RatTile1"
    }
    RPD.createLevelObject(paint,self:getPos())
    end,
    die = function (self)
    local level = RPD.Dungeon.level
    for i = 1, level:getLength() do
    if level.map[i] == RPD.Terrain.LOCKED_DOOR then
    level:set(i-1,RPD.Terrain.DOOR)
    RPD.GameScene:updateMap(i-1)
    end
    end
    self:getSprite():move(self:getPos(),RPD.Dungeon.level:cellX(self:getPos()))
    end,
    act = function(self)
    if self:getPos() == cell then
        cell = getCell()
        self:beckon(cell)
     end
     if RPD.Dungeon.level:distance(self:getPos(),RPD.Dungeon.hero:getPos()) < 2 then
     RPD.Dungeon.hero:damage(10,self)
     end
     end,
     damage = function(self,dmg,enemy)
     if enemy == RPD.Dungeon.hero then
          enemy:damage(dmg,self)
     end
     end
}
