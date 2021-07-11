local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local Process = require "scripts/lib/Process"
local depth

local customRoom = {
map = function()
return {
1,1,1,
1,RPD.Terrain.EMBERS,1,
1,1,1
}
end,
getHidth = function()
return 3
end,
getWidth = function()
return 3
end,
objects = function(cell)
depth = RPD.Dungeon.depth % 10

portal =
{
kind = "PortalGateSender",
target = {
levelId = ("Halls"..depth),
x = level:cellX(Process.cell_halls),
y = level:cellY(Process.cell_halls)
}
}
level:set(cell,RPD.Terrain.EMBERS)
RPD.createLevelObject(portal,cell)
end,
locked = function()
return nil
end
}
return customRoom