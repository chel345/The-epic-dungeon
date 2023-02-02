--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"
local DungeonTileMap = luajava.bindClass("com.watabou.pixeldungeon.DungeonTilemap")

local storage = require "scripts/lib/storage"

local mob = require"scripts/lib/mob"

return mob.init{
act       = function(me)
local variations = {
1,
1,
1,
3,
3,
2
}
local zap = function(from,to,a)
if a == 1 then
RPD.zapEffect(from,to,"LightPotion")
local bolt = RPD.new("com.watabou.pixeldungeon.effects.Halo",2,0xffffff,0.5)

local Splash = luajava.bindClass("com.watabou.pixeldungeon.effects.Splash")
Splash.at(me:getSprite():emitter(), to,0xfffff3,10, -10 , 9)
RPD.playSound( "snd_shatter.ogg" )

local s = DungeonTileMap:tileCenterToWorld(to)
bolt.x = s.x - 16*4
bolt.y = s.y - 16*4
RPD.GameScene:effect(bolt)
local function update(f)
if f >= 12 then
bolt:killAndErase()
return false
end
bolt:setScale(f/20,f/20)
return true
end
RPD.addFunction(update)
local function light(cell)
local mob = RPD.Actor:findChar(cell)
if mob then
mob:damage(math.random(2,10),me)
end
end
RPD.forCellsAround(to,light)
light(to)
elseif a == 2 then
RPD.zapEffect(from,to,"ManaPotion")
local Splash = luajava.bindClass("com.watabou.pixeldungeon.effects.Splash")
Splash.at(me:getSprite():emitter(), to,0x5b92e7,10,-10, 9)
RPD.playSound( "snd_shatter.ogg" )
local mob = RPD.mob("ManaGoo")
mob:setPos(to)
RPD.Dungeon.level:spawnMob(mob)
elseif a == 3 then
RPD.zapEffect(from,to,"GooBeatle")
RPD.topEffect(to,"GooBeatleGoAway")
local mob = RPD.Actor:findChar(to)
if mob then
RPD.affectBuff(mob, RPD.Buffs.Poison , 5)
end
end

end


local mePos = me:getPos()
if level:distance(mePos,RPD.Dungeon.hero:getPos()) < 5 then
local level = RPD.Dungeon.level
local w = level:getWidth()
local center = mePos+w*2
local x = level:cellX(mePos)
local y = level:cellY(mePos)
for i = x - 3, x + 3 do
for j = y, y + 6 do
local pos = level:cell(i,j)
if level.map[pos] == RPD.Terrain.BOOKSHELF  and pos ~= mePos and math.random(1,10) == 1 then
local type = variations[math.random(1,#variations)]
local dst
if type == 3 then
dst = RPD.Ballistica:cast(pos, center, true,true,true)
else
dst = RPD.Ballistica:cast(pos, level:getEmptyCellNextTo(level:getEmptyCellNextTo(RPD.Dungeon.hero:getPos())),true,true,false)
end
zap(pos, dst, type)
return
end
end
end
end

end,
die = function(self)
if not storage.get("deth_bookshelf_monster1") then
storage.put("deth_bookshelf_monster1",true)
elseif not storage.get("deth_bookshelf_monster2") then
storage.put("deth_bookshelf_monster2",true)
else
return
end
local mob = RPD.mob("BookshelfMonster")
mob:setPos(self:getPos()+1)
RPD.Dungeon.level:spawnMob(mob)
end
}
