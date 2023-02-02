local RPD = require "scripts/lib/epicClasses"

local buff = require "scripts/lib/buff"

local storage = require "scripts/lib/storage"

local Splash = luajava.bindClass("com.watabou.pixeldungeon.effects.Splash")

local emitters = {}
local pos

return buff.init{
desc = function ()
return {
icon = -1,
name = RPD.StringsManager:maybeId("Ratcatcher_Buff"),
info = "DieHard_Info"
}
end,
    textureLarge = function()
    return "ui/CustomBuffsLarge.png"
    end,
    textureSmall = function()
    return "ui/CustomBuffs.png"
    end,
attachTo = function(self, buff, target)
local level = RPD.Dungeon.level
local hero = RPD.Dungeon.hero

pos = storage.get("pos")

for i = 1, level:getLength()-1 do
if level:distance(i+1,pos) <= 2 and RPD.Dungeon.level.map[i+2]==1 then
emitters[#emitters+1] = RPD.Sfx.CellEmitter:get(i+1)
emitters[#emitters]:pour(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.WOOL  ),0.05)
end
end

return true
end,
detach = function(self, buff)
local level = RPD.Dungeon.level
local hero = RPD.Dungeon.hero

for i = 1, level:getLength()-1 do
local mob = RPD.Actor:findChar(i)
if mob and mob ~= hero and mob:getMobClassName() == "Bosses/PoisonTengu" then
RPD.removeBuff(mob,RPD.Buffs.Invisibility)
break
end
end

hero:setViewDistance(8)
for i = 1, #emitters do
emitters[i].on = false
emitters[i] = nil
end

end,
act = function(self,buff)
buff:detach()
end, 
charAct = function(self,buff)
local level = RPD.Dungeon.level
local hero = RPD.Dungeon.hero
local mob

pos = storage.get("pos")

for i = 1, #emitters do
emitters[i].on = false
end
emitters = {}

for i = 1, level:getLength()-1 do
if level:distance(i+1,pos) <= 2 and RPD.Dungeon.level.map[i+2]==1 then
emitters[#emitters+1] = RPD.Sfx.CellEmitter:get(i+1)
emitters[#emitters]:pour(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.WOOL  ),0.05)
end
end

for i = 1, level:getLength()-1 do
mob = RPD.Actor:findChar(i)
if mob and mob ~= hero and mob:getMobClassName() == "Bosses/PoisonTengu" then
break
end
end

if level:distance(pos,hero:getPos()) <= 2 then
hero:setViewDistance(1)
else
hero:setViewDistance(8)
end

local a = math.random(1,10)
if math.random(1,10) == 1 then
if a >= 2 then
local dst = RPD.Ballistica:cast(mob:getPos(),hero:getPos(),true,true,true)
RPD.placeBlob(RPD.Blobs.ConfusionGas, dst,15)
RPD.zapEffect(mob:getPos(),dst,"ConfushionVial")
mob:getSprite():zap(dst)
Splash.at(RPD.Sfx.CellEmitter:get(dst), dst,-3,3, 0x81ff2f, 9)
else
local dst = RPD.Ballistica:cast(mob:getPos(),hero:getPos(),true,true,true)
RPD.placeBlob(RPD.Blobs.ToxicGas, dst,15)
RPD.zapEffect(mob:getPos(),dst,"ToxicVial")
mob:getSprite():zap(dst)
Splash.at(RPD.Sfx.CellEmitter:get(dst), dst,-3,3, 0x81ff2f, 9)
end
end

end
}
