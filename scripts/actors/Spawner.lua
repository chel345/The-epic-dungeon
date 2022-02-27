--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

local Best = luajava.bindClass("com.watabou.pixeldungeon.actors.mobs.Bestiary")

local max

local now = 0

local function getCell()
local level = RPD.Dungeon.level
local cell = math.random(1,level:getLength())
if level.solid[cell] or level.nearWalls[cell] or level.pit[cell] or level.fieldOfView[cell] or (not level.passable[cell]) or level.map[cell] == RPD.Terrain.WALL or level.map[cell] == RPD.Terrain.WALL_DECO or RPD.Actor:findChar(cell) or cell == 0 or level.map[cell] == RPD.Terrain.BOOKSHELF or level.map[cell] == RPD.Terrain.CHASM or level.map[cell] == RPD.Terrain.BARRICADE or level:getTopLevelObject(cell) or level.map[cell] == 48 or level.map[cell] == 63 then
return getCell()
end
return cell
end

return actor.init({
getCell = function()
return getCell()
end,
activate = function()
if not storage.get("level_spawner") then
local level = RPD.Dungeon.level
if level:getLength() > 64*64 then
max = math.floor(level:getLength()/200)
else
max = math.floor(level:getLength()/100)
end
for i = 1,max  do
local mob = Best:mob(level)
mob:setPos(getCell())
level:spawnMob(mob)
end
storage.put("level_spawner",true)
end
end,
act = function()
local level = RPD.Dungeon.level
if level:getLength() > 64*64 then
max = math.floor(level:getLength()/200)
else
max = math.floor(level:getLength()/100)
end
now = 0
local level = RPD.Dungeon.level
for i = 0, level:getLength()-1 do
if RPD.Actor:findChar(i) then
now = now + 1
end
end
if now > max then
now = 0
return true
end
local mob = Best:mob(level)
mob:setPos(getCell())
level:spawnMob(mob)
RPD.setAi(mob,"Wandering")
return true
end,
actionTime = function()
if RPD.Dungeon.level:getLength() > 64*64 then
return 60
end
return 30
end
})
