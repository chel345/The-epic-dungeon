local RPD  = require "scripts/lib/epicClasses"

local storage = require"scripts/lib/storage"

local EPD =
{
IceBlock = luajava.bindClass("com.watabou.pixeldungeon.effects.IceBlock"),
Char = nil,
time = 0,
bunus = 1,
spend = function(ms)
    local b = os.clock() * 1000
    while os.clock() * 1000 - b <= ms do end
end,
ZapWand = function(Wand,level,user,cell)

local Wand = RPD.creteItem(Wand, {level = level})
Wand:mobWandUse(user,cell)

end,
SpawnMob = function(mob,pos,pet)
local maybeMob = RPD.mob(mob)
maybeMob:setPos(pos)
if pet then
RPD.Dungeon.level:spawnMob(RPD.Mob:makePet(maybeMob,RPD.Dungeon.hero));
else
RPD.Dungeon.level:spawnMob(maybeMob)
end
end,

MakePets = function()
for i = 0,RPD.Dungeon.level:getLength()-1 do                
local maybeMob = RPD.Actor:findChar(i)          
    if maybeMob and maybeMob ~= RPD.Dungeon.hero then 
        RPD.Mob:makePet(maybeMob, RPD.Dungeon.hero)
    end
end
end,

Klak = function(cell,min,max,user,chanse, dartion, cast)
local b = 10
mana = RPD.Dungeon.hero:getSkillPoints()
local level = RPD.Dungeon.level
local W = level:getWidth()
local wall = RPD.Terrain.WALL
local wall2 = RPD.Terrain.WALL_DECO
local wall3 = RPD.Terrain.STATUE_SP
local wall4 = RPD.Terrain.STATUE
local wall5 = RPD.Terrain.BOOKSHELF

KlakCell = function(cell)
 
if cast then
if mana > b then
RPD.Dungeon.hero:spendSkillPoints(b)
else
RPD.glog(RPD.StringsManager:maybeId("No_Mana"))
return
end
end

local mob = RPD.Actor:findChar(a)
if mob and mob ~= user then
if math.random(1,chanse) == 1 then
RPD.affectBuff(mob, RPD.Buffs.Cripple , dartion)
end
mob:damage(math.random(min,max),user)
b = b +1
RPD.topEffect(cell,"Klak")
else
b = b+1
RPD.topEffect(cell,"Klak")
end
end


a = user:getPos()
a_y = level:cellY(a) 
cell_y = level:cellY(cell) 
a_x = level:cellX(a) 
cell_x = level:cellX(cell) 

while (a ~= cell) do

if level.solid[a] then
break
end

if cell ~= nil then

if cell < a then

if a_y == cell_y then
while a ~= cell do
if level.solid[a] then
break
end
a = a-1
KlakCell(a)
end
break
end

if a_x == cell_x then
while a ~= cell do
if level.solid[a] then
break
end

a = a - W
KlakCell(a)
end
end

if cell_x < a_x  then
a = a - W - 1
KlakCell(a)
end

if cell_x > a_x then
a = a - W + 1
KlakCell(a)
end

end

if cell > a then

if a_y == cell_y then
while a ~= cell do
if level.solid[a] then
break
end
a = a + 1
KlakCell(a-1)
end
break
end

if a_x == cell_x then
while a ~= cell do
if level.solid[a] then
break
end

a = a + W
KlakCell(a)
end
end 

if a_x > cell_x then
a = a + W - 1
KlakCell(a)
end

if a_x < cell_x then
a = a + W + 1
KlakCell(a)
end
end 
end
end

end,
    showQuestWindow = function(self, text)
        local wnd = luajava.newInstance(RPD.Objects.Ui.WndQuest, self, text)
        RPD.GameScene:show(wnd)
    end,

mobWandUser = function(wand,mob, to, level)

local dst = RPD.Ballistica:cast(mob:getPos(),to, true, true, true)

enemy = RPD.Actor:findChar(dst)

if wand == "WandOfLightbolt" then
if enemy then
RPD.affectBuff(enemy, RPD.Buffs.Light , 10*(level+1))
RPD.affectBuff(enemy, RPD.Buffs.Vertigo , 10*(level+1))
enemy:damage(RPD.Dungeon.depth*math.random(1,5),mob)
enemy:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.UP, 8 )
RPD.zapEffect( mob:getPos(), enemy:getPos(), "DeathRay")
else
RPD.zapEffect( mob:getPos(), dst, "DeathRay")
end

elseif wand == "WandOfRock" then
local l = level
RPD.playSound( "snd_zap.mp3" )
RPD.playSound( "snd_rocks.mp3" )
--RPD.zapEffect(thisItem:getUser():getPos(),dst,"Bombardo")
local Wand = RPD.creteItem( "WandOfSlowness" , {level = level })
Wand:mobWandUse(mob,dst)

RPD.topEffect(dst,"BombardoCenter")
local level = RPD.Dungeon.level
        local x = level:cellX(dst)
        local y = level:cellY(dst)
        for i = x - 1-l, x + 1+l do
            for j = y - 1-l, y + 1+l do
            local pos = level:cell(i,j)
 local soul =  RPD.Actor:findChar(pos)
            if soul then 
if math.random(1,10) == 1 then
RPD.affectBuff(soul, RPD.Buffs.Paralysis , 10*(l+1))
        soul:damage(RPD.Dungeon.depth+(l*2), mob)
end
if not level.solid[pos] then
RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.Speck:factory( RPD.Sfx.Speck.ROCK), 0.1,1);
end
end
end
end

elseif wand == "WandOfFireRune" then
local lvl = level
RPD.placeBlob( RPD.Blobs.LiquidFlame, dst, 60*(lvl+1))
RPD.zapEffect(mob:getPos(),dst,"Fire")

elseif wand == "WandOfBlast" then
local lvl = level
RPD.zapEffect(mob:getPos(),dst,"LightZap")
local Wand = RPD.creteItem( "WandOfPoison" , {level = RPD.Dungeon.depth+lvl })
Wand:mobWandUse(mob,dst)
RPD.placeBlob( RPD.Blobs.ConfusionGas, dst, 60*(lvl+1))
RPD.playSound( "snd_crystal.mp3" )
RPD.Sfx.CellEmitter:get(dst):start(RPD.Sfx.Speck:factory( RPD.Sfx.Speck.LIGHT), 0.1,3);

elseif wand == "BlackWand" then
local l = level
RPD.playSound( "snd_badge.mp3" )
RPD.zapEffect(mob:getPos(),dst,"Shadow")
local levelf = RPD.Dungeon.level
        local x = levelf:cellX(dst)
        local y = levelf:cellY(dst)
        for i = x - 1, x + 1 do
            for j = y - 1, y + 1 do
            local pos = levelf:cell(i,j)
 local soul =  RPD.Actor:findChar(pos)
            if soul then 
 RPD.affectBuff(soul, RPD.Buffs.Slow , 30*(l+1));
RPD.affectBuff(soul, RPD.Buffs.Poison , 30*(l+1));
RPD.affectBuff(soul, RPD.Buffs.Vertigo , 25*(l+1));
soul:getSprite():emitter():start(RPD.Sfx.ShadowParticle.CURSE, 0.02,4)
if not levelf.solid[pos] then
RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.ShadowParticle.UP, 0.02, 20)
end
else
if not levelf.solid[pos] then
RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.ShadowParticle.UP, 0.02, 20)
end
end
end
end

elseif wand == "BlessWand" then
lvl = level
if enemy then
RPD.affectBuff(enemy, RPD.Buffs.Blessed , 50*(lvl+1));
enemy:getSprite():emitter():burst( RPD.Sfx.ShaftParticle.FACTORY, 5)
else
RPD.Sfx.CellEmitter:get(dst):burst( RPD.Sfx.ShaftParticle.FACTORY, 5)
end

elseif wand == "NefritWand" then

local mobPos = RPD.Dungeon.level:getEmptyCellNextTo(mob:getPos())
    if RPD.Dungeon.level:cellValid(mobPos) then
        local mobm = RPD.mob("IceNefrit")
        mobm:setPos(mobPos)
        RPD.Dungeon.level:spawnMob(mobm)
    end

elseif wand == "SummonerWand" then
RPD.playSound( "snd_meld.mp3" )
local levele = RPD.Dungeon.level
for i = 1,2+level do
local mobb = RPD.mob("Bee")
local pos = levele:getEmptyCellNextTo(mob:getPos())
if (levele:cellValid(pos)) then
mobb:setPos(pos)
levele:spawnMob(mobb)
RPD.Sfx.Wound:hit(mobb)
RPD.Sfx.SpellSprite:show(mob, RPD.Sfx.SpellSprite.SUMMON)
end
end

elseif wand == "WandOfCrystalion" then
local lvl = level
RPD.playSound( "snd_degrade.ogg" )
RPD.topEffect(dst,"smash_blast")
if enemy then
enemy:damage(RPD.Dungeon.depth*(lvl+1),mob)
end

elseif wand == "WandOfGoodMage" then

local Wand = RPD.creteItem("WandOfRegrowth", {level = level})
Wand:mobWandUse(mob,dst)

if math.random(1,4) == 1 then
local maybeMob = RPD.mob("EarthElemental")
maybeMob:setPos(dst)
RPD.Dungeon.level:spawnMob(maybeMob)
end

elseif wand == "WandOfMagicbolt" then
local l = level

if enemy then

if math.random(1,25-l) == 1 then
RPD.affectBuff(enemy, RPD.Buffs.Paralysis , 10)
end
enemy:damage(2*RPD.Dungeon.depth, mob)
enemy:getSprite():emitter():start( RPD.Sfx.SparkParticle.FACTORY, 0.1,1)
RPD.zapEffect( mob:getPos(), enemy:getPos(), "Lightning")
        else
RPD.zapEffect( mob:getPos(), dst, "Lightning")
end

elseif wand == "WandOfMirror" then 
local pos = RPD.Dungeon.level:getEmptyCellNextTo(mob:getPos())
if ( RPD.Dungeon.level:cellValid(pos)) then
local image  = mob:makeClone();
RPD.Wands.wandOfBlink:appear( image, pos );
end

elseif wand == "WandOfPossess" then
local lvl = level
local soul =  RPD.Actor:findChar(dst)
if soul and soul ~= RPD.Dungeon.hero  then
soul:setState(RPD.MobAi:getStateByTag("ControlledAi"))
RPD.Dungeon.hero:setControlTarget(soul)
soul:getSprite():emitter():burst( RPD.Sfx.ElmoParticle.FACTORY, 5)
RPD.playSound( "snd_teleport.mp3" )
   else
RPD.Sfx.CellEmitter:get(dst):burst( RPD.Sfx.ElmoParticle.FACTORY, 5)
end

end
end
}

return EPD
