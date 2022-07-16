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
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,"Недоделанная локация. Ближайшие 5 уровней будут бредом.")
       RPD.GameScene:show(wnd)

local level = RPD.Dungeon.level
local l = level:getLength()

for i = 3, l do
if level.map[i] == RPD.Terrain.WALL_DECO then
local effect = RPD.mob("effects/LightMagic")
effect:setPos(i-1)
RPD.Dungeon.level:spawnMob(effect)
effect:move(0) 
RPD.Sfx.CellEmitter:center(i-1):pour(RPD.Sfx.ElmoParticle.FACTORY, 0.08);
end
end
if not storage.get("key") then

--подготовка
local level = RPD.Dungeon.level
for i = 0,RPD.Dungeon.level:getLength()-1 do           
level:set(i, RPD.Terrain.CHASM )
RPD.GameScene:updateMap(i)
end


local level = RPD.Dungeon.level
local W = level:getWidth()
for i = 0,RPD.Dungeon.level:getLength()-1 do           
if i <= W*2 then
level:set(i, RPD.Terrain.EMPTY_SP )
RPD.GameScene:updateMap(i)
end
if level:cellX(i) == 2 and i ~= 2 then
level:set(i-1, RPD.Terrain.EMPTY_SP )
RPD.GameScene:updateMap(i-1)
level:set(i-4, RPD.Terrain.EMPTY_SP )
RPD.GameScene:updateMap(i-2)
end
--if level:cellX(i) == W then
--level:set(i-2, RPD.Terrain.WALL )
--RPD.GameScene:updateMap(i-2)
--end
if level:cellY(i) == level:getHeight() -2 then
level:set(i, RPD.Terrain.EMPTY_SP )
RPD.GameScene:updateMap(i)
end
end

-- вход
local level = RPD.Dungeon.level
if RPD.Dungeon.hero:getPos() > level:getWidth()*2 and RPD.Dungeon.hero:getPos() < level:getLength()-level:getWidth()*2 then
local level = RPD.Dungeon.level
local x = level:cellX(RPD.Dungeon.hero:getPos())
local y = level:cellY(RPD.Dungeon.hero:getPos())
local lx = level:cellX(RPD.Dungeon.hero:getPos()+level:getWidth())
local ly = level:cellY(RPD.Dungeon.hero:getPos()+level:getWidth())

        for t = lx - 3, lx + 3 do
         for j = ly - 2, ly + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY_SP )
RPD.GameScene:updateMap(pos)
end
end

        for t = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.WALL )
RPD.GameScene:updateMap(pos)
end
end

        for t = x - 0, x + 0 do
         for j = y - 0, y + 2 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.DOOR )
RPD.GameScene:updateMap(pos)
end
end

        for t = x - 1, x + 1 do
         for j = y - 1, y + 1 do
local pos = level:cell(t,j)
level:set(pos, RPD.Terrain.EMPTY )
RPD.GameScene:updateMap(pos)
end
end
level:set(RPD.Dungeon.hero:getPos(), RPD.Terrain.ENTRANCE )
RPD.GameScene:updateMap(RPD.Dungeon.hero:getPos())

end

--генерация
local level = RPD.Dungeon.level
local l = level:getLength()
local w = level:getWidth()

while (true) do
v = math.random(w*3, l-w*3)
if level.map[v] == RPD.Terrain.CHASM then
if Ginerator.DworfSewer.CanSpawnAt(v) then
st = v
Ginerator.DworfSewer.Exit(v-1)
RPD.Dungeon.level:setExit(v-1)
Ginerator.DworfSewer.Tunel(RPD.Dungeon.hero:getPos(),v-1)
break
end
end
end

for i = 1, l do
if math.random(1,20) == 1 then
if Ginerator.DworfSewer.CanSpawnAt(i) then
Ginerator.DworfSewer.Room(i-1)
Ginerator.DworfSewer.Tunel(st, i-1)
st = i-1
end
end
end

Ginerator.MakeBorder()
for i = 1, l do
if level.map[i] == RPD.Terrain.DOOR then
local level = RPD.Dungeon.level
local W = level:getWidth()
local x = level:cellX(i)
local y = level:cellY(i)
        for t = x - 2, x + 2 do
         for j = y - 2, y + 2 do
local pos = level:cell(t,j)
if level.map[pos] == RPD.Terrain.CHASM and level.map[pos] ~= RPD.Terrain.EMPTY_SP then
level:set(pos-1,RPD.Terrain.EMPTY_SP)
end
end
end
end
end

for i = 1, l do
if level.map[i] == RPD.Terrain.DOOR then
--if level.map[i+w*2] == RPD.Terrain.WALL or level.map[i-w*2] == RPD.Terrain.WALL or level.map[i+2] == RPD.Terrain.WALL or level.map[i-2] == RPD.Terrain.WALL then
if 
level.map[i-1] == RPD.Terrain.DOOR then
level:set(i-2,RPD.Terrain.WALL)

elseif level.map[i+1] == RPD.Terrain.DOOR then
level:set(i,RPD.Terrain.WALL)

elseif level.map[i+w] == RPD.Terrain.DOOR then
level:set(i+w-1,RPD.Terrain.WALL)

elseif level.map[i-w] == RPD.Terrain.DOOR
then
level:set(i-w-1,RPD.Terrain.WALL)
end
end
end


for i = 1, l do
if level.map[i] == RPD.Terrain.DOOR then
if (
level.map[i+w] == RPD.Terrain.WALL and
level.map[i-1] == RPD.Terrain.WALL or
level.map[i+w] == RPD.Terrain.WALL and
level.map[i+1] == RPD.Terrain.WALL or
level.map[i-w] == RPD.Terrain.WALL and
level.map[i-1] == RPD.Terrain.WALL or
level.map[i-w] == RPD.Terrain.WALL and
level.map[i+1] == RPD.Terrain.WALL
)
then
level:set(i-1,RPD.Terrain.WALL)
end
end
end




--декор
Ginerator.CreateDeco(50,100)


-- создание мобов
for i=0,10 do
local level = RPD.Dungeon.level
local mob1 = RPD.mob("SewerGuard")

if math.random(2,20) == 2 then
mob1:setPos(RPD.Dungeon.level:randomRespawnCell())
level:spawnMob(mob1);
end
end
storage.put("key",true)
for i = 1, 32*32-1 do
if level.map[i] == RPD.Terrain.CHASM and math.random(1,40) == 1 then
local mob = RPD.mob("Rat")
mob:setPos(i-1)
level:spawnMob(mob)
end
end
end
storage.put("key",true)

end,
act = function()
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob:getEntityKind() == "Rat" then
maybeMob:move(0)
end
end
local level = RPD.Dungeon.level
local mob1 = RPD.mob("Rat")

mob1:setPos(RPD.Dungeon.level:randomRespawnCell())
level:spawnMob(mob1);
return true
end,
    actionTime = function()
        return 5*math.random(1,10)
    end
})
