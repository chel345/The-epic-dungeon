local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 0, 0, 0, 0, 0, 14, 14, 0, 14, 14, 14, 0, 14, 14, 0, 14, 11, 14, 0, 14, 14, 0, 14, 14, 14, 0, 14, 14, 0, 0, 0, 0, 0, 14, 14, 14, 14, 14, 14, 14, 14
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local mob = RPD.MobFactory:mobByName("ChaosAngel")
local level = RPD.Dungeon.level
local W = level:getWidth()
mob:setPos(cell)
level:spawnMob(mob)

local mob = RPD.MobFactory:mobByName("ChaosKnight")
local level = RPD.Dungeon.level
mob:setPos(cell-W*3-3)
level:spawnMob(mob)

local mob = RPD.MobFactory:mobByName("ChaosKnight")
local level = RPD.Dungeon.level
mob:setPos(cell-W*3+3)
level:spawnMob(mob)

local mob = RPD.MobFactory:mobByName("ChaosKnight")
local level = RPD.Dungeon.level
mob:setPos(cell+W*3-3)
level:spawnMob(mob)

local mob = RPD.MobFactory:mobByName("ChaosKnight")
local level = RPD.Dungeon.level
mob:setPos(cell+W*3+3)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom