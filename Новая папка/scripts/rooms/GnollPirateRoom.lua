local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 9, 1, 1, 9, 1, 1, 36, 1, 1, 36, 1, 1, 36, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 9, 1, 1, 9, 1, 1, 9, 1, 1, 36, 1, 1, 36, 1, 1, 36, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
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
W = RPD.Dungeon.level:getWidth()

add = function(p)
local sp1 =
{
    kind = "Deco",
    object_desc = "BanditTile3"
}
local sp2 =
{
    kind = "Deco",
    object_desc = "BanditTile5"
}
RPD.createLevelObject(sp1,p-W)
RPD.createLevelObject(sp2,p)
RPD.Dungeon.level:set(p-W,RPD.Terrain.STATUE_SP)
end

local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 4, x + 5 do
for j = y - 4, y + 5 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.STATUE_SP then
add(pos-1)
end
end
end

local mob = RPD.MobFactory:mobByName("GnollPirateNPC")
local level = RPD.Dungeon.level
mob:setPos(cell-W-2)
level:spawnMob(mob)

end
}
return customRoom