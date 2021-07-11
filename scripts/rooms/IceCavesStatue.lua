local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 36, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 36, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()

l = {
"ArmoredStatue",
"Statue"
}
mob = RPD.MobFactory:mobByName(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(cell-W*3-1)
level:spawnMob(mob);

mob = RPD.MobFactory:mobByName(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(cell-W*3+1)
level:spawnMob(mob);

mob = RPD.MobFactory:mobByName(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(cell+W*3+1)
level:spawnMob(mob);

mob = RPD.MobFactory:mobByName(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(cell+W*3-1)
level:spawnMob(mob);
end
}
return customRoom