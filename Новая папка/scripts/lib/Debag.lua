local RPD = require "scripts/lib/commonClasses"

local Server = require "scripts/lib/Server"

local User = require "scripts/User"

local Process = require "scripts/lib/Process"

--[[
User.host = User.User.host
User.player = User.User.player
User.status = User.status
--]]
if User.status == User.host then
Cstats = User.player --User.player
else
Cstats = User.host
end
local item = {
giveItem = function(item)
if client == nil then
Server:connect()
end
item = tostring(item)
v = table.concat({User.status,item}," ")
client:sendMessage(v)
end,
receiveItem = function()
item = Server:receiveData()
sep = "%s"
t={} 
i=1
for str in string.gmatch(item, "([^"..sep.."]+)") do
t[i] = str
i = i + 1
end
if t[1] == Cstats then
RPD.Dungeon.hero:collect(RPD.ItemFactory:itemByName(t[2]))
end
end
}
local sprite ={
-- я атаковал
sendAttack = function()
if client == nil then
Server:connect()
end
v = table.concat({User.status,"attack"}," ")
client:sendMessage(v)
end,
-- приём
receiveAttack = function()
attack = Server:receiveData()
sep = "%s"
t={} 
i=1
for str in string.gmatch(attack, "([^"..sep.."]+)") do
t[i] = str
i = i + 1
end
if t[1] == Cstats then
if t[2] == "attack" then
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() == "Heroes/Player" then
maybeMob:getSprite():attack(maybeMob:getPos()+1)
end
end
end
end
end

}
local hero = {
--отправка информации о герое
sendHero = function()
pos = tostring(RPD.Dungeon.hero:getPos())
hero = tostring(RPD.Dungeon.hero)
level = tostring(RPD.Dungeon.depth)
if client == nil then
Server:connect()
end
--отправка
v = table.concat({User.status,"hero",pos,hero,level}," ")
RPD.glog(v)
client:sendMessage(v)
end,
--получение
receiveHero = function()
msg = Server:receiveData()
--RPD.glog(msg)
--расшифровка в массив
sep = "%s"
t={} 
i=1
for str in string.gmatch(msg, "([^"..sep.."]+)") do
t[i] = str
i = i + 1
end
-- проверка мне ли оно
if t[1] == Cstats and t[2] == "hero" then
-- спавн если нет, передвижение если нет и открытие следующего уровня для User.player
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() == "Heroes/Player" then
if t[5] ~= tostring(RPD.Dungeon.depth) then
if t[5] > tostring(RPD.Dungeon.depth) then
for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.EXIT or RPD.Dungeon.level[i] == 25 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.EXIT)
end
end
end
maybeMob:destroy()
maybeMob:getSprite():killAndErase()
end
--maybeMob:getSprite():move(maybeMob:getPos(),tonumber(t[3]),true)
--maybeMob:move(tonumber(t[3]))
--maybeMob:beckon(tonumber(t[3]))
if t[3] ~= nil then
Process.beckon_player = tonumber(t[3])
break
end
end
if i == RPD.Dungeon.level:getLength()-1 then
if t[5] == tostring(RPD.Dungeon.depth) then
local mob = RPD.MobFactory:mobByName("Heroes/Player")
mob:setPos(t[3])
RPD.Dungeon.level:spawnMob(mob);
end
end
end
--[[
RPD.glog(t[5])
RPD.glog(t[3])
RPD.glog(t[4])
--]]
end
end
}
local level = {
-- отправка уровня
sendLevel = function()
if client == nil then
Server:connect()
end
level = {}
level[1] = Cstats
for i = 2, RPD.Dungeon.level:getLength() do
level[i] = RPD.Dungeon.level.map[i]
end
-- переработка в строку
v = table.concat(level," ")
--RPD.glog(v)
client:sendMessage(v)
end,
-- получение
receiveLevel = function()
if client == nil then
Server:connect()
end
level = Server:receiveData()
--RPD.glog(level)
-- обработка в массив
sep = "%s"
t={} 
i=1
for str in string.gmatch(level, "([^"..sep.."]+)") do
t[i] = str
i = i + 1
end
-- если это мне
if t[1] == User.status then -- так и должно быть!
RPD.Dungeon.level:set(1,4)
s = {}
for i = 2, #t do
s[i-1] = t[i]
end
s[#t] = 4
for i = 1, #s-2 do
RPD.Dungeon.level:set(i,s[i])
RPD.GameScene:updateMap(i)
--RPD.glog(i.." of "..RPD.Dungeon.level:getLength())
end
-- удаление мобов и предметов
if Cstats == User.player then
for i = 0,RPD.Dungeon.level:getLength()-1 do         
local item = RPD.Dungeon.level:getHeap(i)
if item then
item:pickUp()
end
local mob = RPD.Actor:findChar(i)
if mob and mob ~= RPD.Dungeon.hero then
mob:destroy()
mob:getSprite():killAndErase()
end
if RPD.Dungeon.level.map[i] == RPD.Terrain.EXIT or RPD.Dungeon.level[i] == 25 then
RPD.Dungeon.level:set(i-1, 4)
end
end
end

end

for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.ENTRANCE then
f = i-1
end
end
RPD.Dungeon.hero:move(f)
RPD.Dungeon.hero:getSprite():move(RPD.Dungeon.hero:getPos(),f)
end,
sendDie = function()
if client == nil then
Server:connect()
end
v = table.concat({User.status,"true"}," ")
client:sendMessage(v)
end,
receiveDie = function()
die = Server:receiveData()
sep = "%s"
t={} 
i=1
for str in string.gmatch(die, "([^"..sep.."]+)") do
t[i] = str
i = i + 1
end
if t[1] == Cstats then
if t[2] == "true" then
RPD.glog("-- Ваш товарищ скончался.")
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() == "Heroes/Player" then
maybeMob:die()
end
end
end
end
end
}
local Multiplayer = {
hero = hero,
level = level,
sprite = sprite,
item = item
}
return Multiplayer

local level = {
sendData = function()

if client == nil then
SClientLua = luajava.bindClass("com.nyrds.pixeldungeon.networking.SClientLua")
client = SClientLua:createNew( "37.194.195.213" ,3002):connect()
end

data = {}

-- кому
user = Cstatus

-- отправка предмета
Citem = tostring(Process.item)

-- отправка уровня

-- размер уровня
length = tostring(RPD.Dungeon.level:getLength())

-- уровень
level = {}
for i = 1, RPD.Dungeon.level:getLength()-1 do
level[i] = RPD.Dungeon.level.map[i]
end
level = table.concat(level,",")

-- мобы
mobs = {}
for i = 1, RPD.Dungeon.level:getLength()-1 do
local mob = RPD.Actor:findChar(i)
if mob and mob ~= RPD.Dungeon.hero then
mobs[i] = mob:getMobClassName()
else
mobs[i] = "nil"
end
end
mobs = table.concat(mobs,"1")

-- предметы
items = {}
for i = 1, RPD.Dungeon.level:getLength()-1 do
local item = RPD.Dungeon.level:getHeap(i)
if item then
items[i] = item:peek():getClassName()
else
items[i] = "nil"
end
end
items = table.concat(items,"1")

-- глубина
depth = tostring(RPD.Dungeon.depth)

data[1] = user
data[2] = Citem
data[3] = length
data[4] = level
data[5] = mobs
data[6] = items
data[7] = depth

v = table.concat(data," ")
--RPD.glog(v)
client:sendMessage(v)
end,



receiveData = function()

while not client:canReceive() do
end
data = client:receiveMessage();

sep = "%s"
t={}
i=1
for str in string.gmatch(data, "([^"..sep.."]+)") do
t[i] = str
i = i + 1
end

-- если это нам
if t[1] == User.status then

--[[
-- переработка level в массив
sep = "%D"
level={}
i=1
for str in string.gmatch(t[4], "([^"..sep.."]+)") do
level[i] = str
i = i + 1
end
for i = 1, #level do
level[i] = tonumber(level[i])
end

-- переработка mobs в массив
sep = "%d"
mobs={}
i=1
for str in string.gmatch(t[5], "([^"..sep.."]+)") do
mobs[i] = str
i = i + 1
end

-- переработка items в массив
sep = "%d"
items={}
i=1
for str in string.gmatch(t[6], "([^"..sep.."]+)") do
items[i] = str
i = i + 1
end
--]]

-- итого мы имеем:
item = t[2]
length = tonumber(t[3])
level = level
mobs = mobs
items = items
depth = tonumber(t[7])

-- выдача предмета
if item ~= "nil" then
local item = RPD.ItemFactory:itemByName(item) 
RPD.Dungeon.hero:collect(item)
end

--[[
-- редактирование уровня

-- размер не превышен
if length == RPD.Dungeon.level:getLength() then

-- глубина соответствует
if depth == RPD.Dungeon.depth then

-- удаление мобов и предметов
for i = 0,RPD.Dungeon.level:getLength()-1 do         
local item = RPD.Dungeon.level:getHeap(i)
if item then
item:pickUp()
end
local mob = RPD.Actor:findChar(i)
if mob and mob ~= RPD.Dungeon.hero then
mob:destroy()
mob:getSprite():killAndErase()
end
end

-- уровень
for i = 1, length-1 do
RPD.Dungeon.level:set(i,level[i])
RPD.GameScene:updateMap(i)
end

-- мобы
for i = 1, length-1 do
if mobs[i] ~= "nil" then
local mob = RPD.MobFactory:mobByName(mobs[i])
mob:setPos(i)
RPD.Dungeon.level:spawnMob(mob);
end
end

-- предметы
for i = 1, length-1 do
if items[i] ~= "nil" then
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName(items[i])
level:drop(i)
end
end

-- отправка героя ко входу
for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.ENTRANCE then
f = i
end
end
RPD.Dungeon.hero:move(f)
RPD.Dungeon.hero:getSprite():move(RPD.Dungeon.hero:getPos(),f)


end
end
--]]

end
end
}

