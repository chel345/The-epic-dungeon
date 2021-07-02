local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 1, 1, 1, 1, 1, 1, 1, 13, 1, 1, 1, 13, 1, 1, 1, 13, 1, 1, 1, 1, 1, 1, 1, 1, 13, 1, 1, 1, 13, 1, 13, 1, 13, 1, 1, 1, 1, 1, 13, 1, 1, 1, 1, 1, 1, 1, 1, 1
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
mob:setPos(cell-2)
level:spawnMob(mob);
mob = RPD.MobFactory:mobByName(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(cell-W+2)
level:spawnMob(mob);
mob = RPD.MobFactory:mobByName(l[math.random(1,#l)])
local level = RPD.Dungeon.level
mob:setPos(cell+W+1)
level:spawnMob(mob);
end
}
return customRoom