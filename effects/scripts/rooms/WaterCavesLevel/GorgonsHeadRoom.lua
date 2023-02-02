local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 9, 0, 0, 0, 9, 4, 4, 0, 63, 63, 63, 0, 4, 4, 0, 63, 63, 63, 0, 4, 4, 0, 63, 63, 63, 0, 4, 4, 9, 0, 0, 0, 9, 4, 4, 4, 4, 4, 4, 4, 4
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

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == 9 then
local mob = RPD.mob("GorgonsSmallLasher")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
level:set(pos-1,63)
end
end
end
local mob = RPD.mob("GorgonsHead")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)

local mob = RPD.mob("GorgonsBigLasher")
local level = RPD.Dungeon.level
mob:setPos(cell-W-1)
level:spawnMob(mob)

local mob = RPD.mob("GorgonsBigLasher")
local level = RPD.Dungeon.level
mob:setPos(cell-W+1)
level:spawnMob(mob)

local mob = RPD.mob("GorgonsBigLasher")
local level = RPD.Dungeon.level
mob:setPos(cell+W-1)
level:spawnMob(mob)

local mob = RPD.mob("GorgonsBigLasher")
local level = RPD.Dungeon.level
mob:setPos(cell+W+1)
level:spawnMob(mob)

end
}
return customRoom