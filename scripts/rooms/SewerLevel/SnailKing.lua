local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 2, 2, 2, 2, 2, 4, 4, 2, 2, 2, 2, 2, 4, 4, 2, 2, 2, 2, 2, 4, 4, 2, 2, 2, 2, 2, 4, 4, 2, 2, 2, 2, 2, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)

local function add(cell)
local plants =
{
--[[
"Icecap",
"Dremweed",
"Fadeleaf",
"Firebloom",
"Rotberry",
"Sorromowss",
"Sungrass"
--]]
"Rotberry.Seed",
"Earthroot.Seed",
"Firebloom.Seed",
"Sungrass.Seed",
"Dreamweed.Seed",
"Sorrowmoss.Seed",
"Icecap.Seed",
"Fadeleaf.Seed"
}
--[[
local objectFactory = luajava.bindClass("com.nyrds.pixeldungeon.levels.objects.LevelObjectsFactory");
local object = objectFactory:objectByName(plants[math.random(1,7)])
object:setPos(cell)
RPD.Dungeon.level:addLevelObject(object)
--]]
RPD.Dungeon.level:plant(RPD.item(plants[math.random(1,8)]),cell)
end
local W = RPD.Dungeon.level:getWidth()
add(cell-W*2-2)
add(cell-W*2-1)
add(cell-W*2)
add(cell-W*2+1)
add(cell-W*2+2)
add(cell-W-2)
add(cell-2)
add(cell+W-2)
add(cell+W*2-2)
add(cell+W*2-1)
add(cell+W*2)
add(cell+W*2+1)
add(cell+W*2+2)
add(cell-W+2)
add(cell+2)
add(cell+W+2)
local mob = RPD.mob("SnailKingNPC")
mob:setPos(cell)
RPD.Dungeon.level:spawnMob(mob)
end,
locked = function()
return nil
end
}
return customRoom