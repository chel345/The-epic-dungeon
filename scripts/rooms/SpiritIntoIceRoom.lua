local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 12, 0, 0, 12, 0, 0, 12, 4, 4, 0, 1, 1, 1, 1, 1, 0, 4, 4, 0, 1, 12, 1, 1, 1, 0, 4, 4, 12, 1, 1, 1, 1, 1, 12, 4, 4, 0, 1, 1, 1, 1, 1, 0, 4, 4, 0, 1, 1, 1, 1, 1, 0, 4, 4, 12, 0, 0, 12, 0, 0, 12, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local level = RPD.Dungeon.level
local W = level:getWidth()
local mob = RPD.MobFactory:mobByName("SpiritIntoIceNPC")
local level = RPD.Dungeon.level
mob:setPos(cell-W-1)
level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom