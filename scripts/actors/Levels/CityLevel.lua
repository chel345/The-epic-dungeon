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

return actor.init({
    activate = function()
if RPD.Dungeon.depth ~= 20 and RPD.Dungeon.depth ~= 19 then
Ginerator.CreateLevel("CityLevel",true)

if not storage.get("deco") then
storage.put("deco",true)
local level = RPD.Dungeon.level
for i = 1,RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
--RPD.GameScene:particleEffect("Torch", i-1)
RPD.GameScene:updateMap(i-1)
end
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.EMPTY_DECO)
end
if level.map[i] == RPD.Terrain.STATUE and math.random(1, 10) == 1 then
level:set(i-1,1)
local mob = RPD.mob("DworfStatueNPC")
local level = RPD.Dungeon.level
mob:setPos(i-1)
level:spawnMob(mob)
elseif level.map[i] == RPD.Terrain.STATUE_SP and math.random(1,10) == 1 then
level:set(i-1,RPD.Terrain.EMPTY_SP)
local mob = RPD.mob("DworfStatueNPC")
local level = RPD.Dungeon.level
mob:setPos(i-1)
level:spawnMob(mob)
end
end
end

for i = 1,RPD.Dungeon.level:getLength()-1 do       
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"CityKeeper")
maybeMob:getSprite():killAndErase()
end
end

end

if RPD.Dungeon.depth == 19 then
Ginerator.CreateLevel("CityLibraryLevel")
end
return true
end,
    actionTime = function()
        return 1
    end,
act = function()
--[[
if RPD.Dungeon.depth == 19 then
for i = 0,RPD.Dungeon.level:getLength()-1 do            
    if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL or RPD.Dungeon.level[i] == RPD.Terrain.WALL_DECO then
RPD.Dungeon.level:set(i-1, RPD.Terrain.BOOKSHELF )
RPD.GameScene:updateMap(i-1)
    end
end
end
--]]
return true
end
})
