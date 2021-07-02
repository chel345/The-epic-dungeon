local RPD = require "scripts/lib/commonClasses"
  
local User = require "scripts/lib/User"

local Process = require "scripts/lib/Process"

if User.status == User.host then
Cstatus = User.player --User.player
else
Cstatus = User.host
end


local hero = {

sendItem = function()

if Process.item == nil then
return
end

if client == nil then
SClientLua = luajava.bindClass("com.nyrds.pixeldungeon.networking.SClientLua")
client = SClientLua:createNew( "37.194.195.213" ,3002):connect()
end

item = tostring(Process.item)
Process.item = nil

user = User.host

v = table.concat({user,"it",item,User.player}," ")
client:sendMessage(v)
-- client:stop()
--client:clear()
end,


receiveItem = function()

for i = 1, 100 do
data = 1

if client == nil then
SClientLua = luajava.bindClass("com.nyrds.pixeldungeon.networking.SClientLua")
client = SClientLua:createNew( "37.194.195.213" ,3002):connect()
end

time = 0
while not client:canReceive() do
if time == 100000 then
-- RPD.glog("-- Время вышло:скорее всего вам никто ничего не передавал.")
data = nil
return 
end
time = time + 1
end

if data ~= nil then
data = client:receiveMessage();
Process.data = data
else
data = Process.data
end

sep = "%s"
t={}
i=1
for str in string.gmatch(data, "([^"..sep.."]+)") do
t[i] = str
i = i + 1
end

-- если это мне
if t[1] == User.player then

if t[2] == "it" then

-- передача предмета
if t[3] ~= "nil" then
local item = RPD.unpackEntity(t[3])
RPD.Dungeon.hero:collect(item)
RPD.glog("++ "..t[4].." передал вам "..item:name())
end
else
--RPD.glog("-- Предмет не обнаружен")
end

end
--client:clear()
client:stop()
end
end,

sendMob = function()

if Process.pet == nil then
return
end

if client == nil then
SClientLua = luajava.bindClass("com.nyrds.pixeldungeon.networking.SClientLua")
client = SClientLua:createNew( "37.194.195.213" ,3002):connect()
end

mob = tostring(Process.pet)
Process.pet = nil

user = User.host

v = table.concat({user,"mb",mob}," ")
client:sendMessage(v)
--client:clear()
-- client:stop()
end,


receiveMob = function()

for i = 1, 100 do
data = 1

if client == nil then
SClientLua = luajava.bindClass("com.nyrds.pixeldungeon.networking.SClientLua")
client = SClientLua:createNew( "37.194.195.213" ,3002):connect()
end

time = 0
while not client:canReceive() do
if time == 100000 then
-- RPD.glog("-- Время вышло:скорее всего вам никто ничего не передавал.")
data = nil
return 
end
time = time + 1
end

if data ~= nil then
data = client:receiveMessage();
Process.data = data
else
data = Process.data
end

sep = "%s"
t={}
i=1
for str in string.gmatch(data, "([^"..sep.."]+)") do
t[i] = str
i = i + 1
end

-- если это мне
if t[1] == User.player then

if t[2] == "mb" then

-- передача моба
if t[3] ~= "nil" then
local mob = RPD.unpackEntity(t[3])
local pos = RPD.Dungeon.level:getEmptyCellNextTo(RPD.Dungeon.hero:getPos())
mob:setPos(pos)
RPD.Dungeon.level:spawnMob(mob)
end
else
-- RPD.glog("-- моб не обнаружен")
end
end
--client:clear()
client:stop()
end
end,

sendData = function()

if client == nil then
SClientLua = luajava.bindClass("com.nyrds.pixeldungeon.networking.SClientLua")
client = SClientLua:createNew( "37.194.195.213" ,3002):connect()
end

-- hero position
pos = RPD.Dungeon.hero:getPos()

-- мой класс
class = RPD.Dungeon.hero:getHeroClass()

-- на какой я глубине
depth = RPD.Dungeon.depth

-- g = table.concat({tostring(class),tostring(depth),tostring(pos),User.player},"!")
v = table.concat({g}," ")
RPD.glog(v)
client:sendMessage(v)

end,



receiveData = function()

if client == nil then
SClientLua = luajava.bindClass("com.nyrds.pixeldungeon.networking.SClientLua")
client = SClientLua:createNew( "37.194.195.213" ,3002):connect()
end


g = 0
while not client:canReceive() do
g = g + 1
if g == 100000 then
break
end
end
if g ~= 100000 then
data = client:receiveMessage();
else
data = "non"
end

if data ~= "non" then
sep = "%s"
s={}
i=1
for str in string.gmatch(data, "([^"..sep.."]+)") do
s[i] = str
i = i + 1
end

t = {}

for j = 1, #s do
sep = "!"
f={}
i=1
for str in string.gmatch(s[j], "([^"..sep.."]+)") do
f[i] = str
i = i + 1
end
t[j] = f
end

for i = 1, #t do

hero = {}

for k = 1, #t[i] do
hero[k] = t[i][k]
end

class = hero[1]
depth = hero[2]
pos = hero[3]
nik = hero[4]

RPD.glog(class.." "..depth.." "..pos.." "..nik)

if nik ~= User.player then
local HeroClass = luajava.bindClass("com.watabou.pixeldungeon.actors.hero.HeroClass")
if class == tostring(HeroClass.NECROMANCER) then
name = "Heroes/Player_Necromanter"
elseif class == tostring(HeroClass.ROGUE) then
name = "Heroes/Player_Rogue"
elseif class == tostring(HeroClass.HUNTRESS) then
name = "Heroes/Player_Hantress"
elseif class == tostring(HeroClass.WARRIOR) then
name = "Heroes/Player_Warror"
elseif class == tostring(HeroClass.GNOLL) then
name = "Heroes/Player_Gnoll"
elseif class == tostring(HeroClass.ELF) then
name = "Heroes/Player_Elf"
elseif class == tostring(HeroClass.MAGE) then
name = "Heroes/Player_Mage"
end

for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)

if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() == name then

if RPD.Dungeon.depth == depth then
Process.beckon_player = pos
else
maybeMob:destroy()
maybeMob:getSprite():killAndErase()
end
break
end
-- если оно не найдено
if i == RPD.Dungeon.level:getLength()-2 then

-- если оно может существовать
if RPD.Dungeon.depth == depth then

local mob = RPD.MobFactory:mobByName(name)
mob:setPos(pos)
RPD.Dungeon.level:spawnMob(mob);
break
end
end
end

end
end
end
-- отправка новых данных
if data ~= "non" then
for i = 1, #t do
for j = 1, #t[i] do
if t[i][j] == User.player then
t[i][j-1] = RPD.Dungeon.hero:getPos()
t[i][j-2] = RPD.Dungeon.depth
t[i][j-3] = tostring(RPD.Dungeon.hero:getHeroClass())
break
end
end
if i == #t-1 then
t[i+2] = {tostring(class),tostring(depth),tostring(pos),User.player}
end
end

mes = {}
for i = 1, #t do
mes[i] = table.concat(t[i],"!")
end
v = table.concat(mes," ")
--RPD.glog(v)
client:sendMessage(v)
else
-- hero position
pos = RPD.Dungeon.hero:getPos()

-- мой класс
class = RPD.Dungeon.hero:getHeroClass()

-- на какой я глубине
depth = RPD.Dungeon.depth

g = table.concat({tostring(class),tostring(depth),tostring(pos),User.player},"!")
v = table.concat({g}," ")
client:sendMessage(v)
end
end
}

local Multiplayer = {
hero = hero
}
return Multiplayer

