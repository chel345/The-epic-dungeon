--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

return actor.init({
    activate = function()
if not storage.get("key") then

--подготовка
local level = RPD.Dungeon.level
for i = 0,RPD.Dungeon.level:getLength()-1 do           
level:set(i, RPD.Terrain.WALL )
RPD.GameScene:updateMap(i)
end

--удаление мобов
local level = RPD.Dungeon.level
for i = 0,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
    if maybeMob and maybeMob ~= RPD.Dungeon.hero then 
maybeMob:damage(10000, RPD.Dungeon.hero)
end
end

-- вход
local level = RPD.Dungeon.level
if RPD.Dungeon.hero:getPos() > level:getWidth()*2 and RPD.Dungeon.hero:getPos() < level:getLength()-level:getWidth()*2 then
local level = RPD.Dungeon.level
local x = level:cellX(RPD.Dungeon.hero:getPos())
local y = level:cellY(RPD.Dungeon.hero:getPos())
        for t = x - 1, x + 1 do
         for j = y - 1, y + 1 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end
end

--генерация
local level = RPD.Dungeon.level
for i = 0,level:getLength()+RPD.Dungeon.depth^2*18 do           
Ginerator.BlueWomb.Room1(RPD.Dungeon.level:randomRespawnCell(),30)
end
for i = 1, level:getLength() do
Ginerator.BlueWomb.Water(level:randomRespawnCell(),200)
end

for i = 0, math.random(1,5) do
Ginerator.BlueWomb.Room3(RPD.Dungeon.level:randomRespawnCell(),math.random(2,6))
Ginerator.BlueWomb.Room4(RPD.Dungeon.level:randomRespawnCell(),math.random(2,6))
Ginerator.BlueWomb.Room2(RPD.Dungeon.level:randomRespawnCell(),2)
Ginerator.BlueWomb.Room5(RPD.Dungeon.level:randomRespawnCell(),2)

end



--[[
local a = 0
for i = 1, level:getLength()/13 do
a = a + 13
Ginerator.BlueWomb.Room4(a,1)
end
--]]


-- выход
local p = RPD.Dungeon.level:randomRespawnCell()
RPD.Dungeon.level:setExit(p)
RPD.Dungeon.level:set(p, RPD.Terrain.EXIT )
RPD.GameScene:updateMap(p)

-- ещё раз вход
local level = RPD.Dungeon.level
if RPD.Dungeon.hero:getPos() > level:getWidth()*2 and RPD.Dungeon.hero:getPos() < level:getLength()-level:getWidth()*2 then
local level = RPD.Dungeon.level
local x = level:cellX(RPD.Dungeon.hero:getPos())
local y = level:cellY(RPD.Dungeon.hero:getPos())
        for t = x - 1, x + 1 do
         for j = y - 1, y + 1 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
level:set(RPD.Dungeon.hero:getPos(), RPD.Terrain.ENTRANCE )
RPD.GameScene:updateMap(pos)
end
end
end

-- граница
Ginerator.MakeBorder()

--декор
Ginerator.CreateDeco(100,200)

-- создание мобов
for i=0,5 do
local level = RPD.Dungeon.level
local mob1 = RPD.MobFactory:mobByName("BlueAngel")
local mob2 = RPD.MobFactory:mobByName("BlueBall")
local mob3 = RPD.MobFactory:mobByName("BlueHeart")
local mob4 = RPD.MobFactory:mobByName("BlueZombie")
if math.random(2,20) == 2 then
mob1:setPos(RPD.Dungeon.level:randomRespawnCell())
level:spawnMob(mob1);
elseif math.random(2,15) == 2 then
mob2:setPos(RPD.Dungeon.level:randomRespawnCell())
level:spawnMob(mob2);
elseif math.random(2,30) == 2 then
mob3:setPos(RPD.Dungeon.level:randomRespawnCell())
level:spawnMob(mob3);
else
mob4:setPos(RPD.Dungeon.level:randomRespawnCell())
level:spawnMob(mob4);
end
end

end
storage.put("key",true)
end,
act = function()
local level = RPD.Dungeon.level
local mob1 = RPD.MobFactory:mobByName("BlueAngel")
local mob2 = RPD.MobFactory:mobByName("BlueBall")
local mob3 = RPD.MobFactory:mobByName("BlueHeart")
local mob4 = RPD.MobFactory:mobByName("BlueZombie")
if math.random(2,20) == 2 then
mob1:setPos(RPD.Dungeon.level:randomRespawnCell())
level:spawnMob(mob1);
elseif math.random(2,15) == 2 then
mob2:setPos(RPD.Dungeon.level:randomRespawnCell())
level:spawnMob(mob2);
elseif math.random(2,30) == 2 then
mob3:setPos(RPD.Dungeon.level:randomRespawnCell())
level:spawnMob(mob3);
else
mob4:setPos(RPD.Dungeon.level:randomRespawnCell())
level:spawnMob(mob4);
end
return true
end,
    actionTime = function()
        return 5*math.random(1,10)
    end
})