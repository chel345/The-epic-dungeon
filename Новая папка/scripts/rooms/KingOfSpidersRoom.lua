local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)

local W = level:getWidth()
local mob = RPD.MobFactory:mobByName("WhiteBall")
local level = RPD.Dungeon.level
mob:setPos(cell-W*2-2)
level:spawnMob(mob)

local W = level:getWidth()
local mob = RPD.MobFactory:mobByName("WhiteBall")
local level = RPD.Dungeon.level
mob:setPos(cell-W*2+2)
level:spawnMob(mob)

local W = level:getWidth()
local mob = RPD.MobFactory:mobByName("WhiteBall")
local level = RPD.Dungeon.level
mob:setPos(cell+W*2-2)
level:spawnMob(mob)

local W = level:getWidth()
local mob = RPD.MobFactory:mobByName("WhiteBall")
local level = RPD.Dungeon.level
mob:setPos(cell+W*2+2)
level:spawnMob(mob)

local W = level:getWidth()
local mob = RPD.MobFactory:mobByName("miniBosses/KingOfSpiders")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)

end,
locked = function()
return nil
end
}
return customRoom