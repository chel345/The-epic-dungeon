---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 23.08.18 22:51
---

local RPD = require "scripts/lib/epicClasses"

local ai = require "scripts/lib/ai"

return ai.init{

    act       = function(me, ai, me)
    
cell = 1
pos = 1
while(true) do
cell = math.random(1,RPD.Dungeon.level:getLength()-1)
pos = RPD.Ballistica:cast(me:getPos(),cell,true,true,true)
if RPD.Dungeon.hero:getPos() ~= pos  and not RPD.Actor:findChar(pos)  then
break
end
end

--me:getSprite():emitter():start(RPD.Sfx.ElmoParticle.FACTORY,0.001,RPD.Dungeon.level:distance(me:getPos()*0.1,pos) )
me:getSprite():move(me:getPos(),pos,true)
me:move(pos)
if math.random(1,20) == 1 then
RPD.affectBuff(me, RPD.Buffs.Invisibility,3)
end

me:spend(3)

local storage = require "scripts/lib/storage"


if not storage.get("ttt") then
storage.put("ttt",true) 
    for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.PEDESTAL then
local mob = RPD.MobFactory:mobByName("EpicIceRunicSkull")
mob:setPos(i-1)
RPD.Dungeon.level:spawnMob(mob)
mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
RPD.playSound( "snd_cursed.mp3" )
end
end
end

if math.random(1,10) == 1 then

for i = 1, RPD.Dungeon.level:getLength()-1 do
local maybeMob = RPD.Actor:findChar(i)        

if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:ht() == 70 then
break
end

if i == RPD.Dungeon.level:getLength()-2 then

for i = 1, RPD.Dungeon.level:getLength()-1 do

if RPD.Dungeon.level.map[i] == RPD.Terrain.PEDESTAL then
local mob = RPD.MobFactory:mobByName("ColdSpirit")
mob:setPos(i-1)
RPD.Dungeon.level:spawnMob(mob)
mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
RPD.playSound( "snd_cursed.mp3" )
end

end

end

end

end


end,

    gotDamage = function(me, ai, me, src, dmg)
end,

    status = function(me, ai, me)
        return RPD.StringsManager:maybeId("attack_on_you")
    end
}