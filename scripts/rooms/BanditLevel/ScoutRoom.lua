local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1, 1, 1, 4, 4, 4, 4, 1, 23, 23, 23, 1, 4, 4, 4, 4, 1, 23, 23, 23, 1, 4, 4, 4, 4, 1, 23, 23, 23, 1, 4, 4, 4, 4, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()

local mob = RPD.mob("Scout")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)

local mob = RPD.mob("FetidRat")
local level = RPD.Dungeon.level
mob:setPos(cell-W*2+2)
level:spawnMob(mob)
local h = 100
mob:ht(h)
mob:hp(mob:ht())
mob:loot(RPD.item("Gold"))
mob:beckon(mob:getPos())

end
}
return customRoom