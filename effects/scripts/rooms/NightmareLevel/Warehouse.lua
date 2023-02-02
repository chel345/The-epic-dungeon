local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 1, 1, 1, 4, 9, 9, 9, 41, 4, 1, 1, 1, 4, 9, 9, 9, 9, 4, 13, 1, 1, 4, 9, 9, 9, 9, 4, 13, 1, 1, 4, 5, 4, 4, 4, 4, 13, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 13, 13, 13, 13, 13, 13
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()

local tile =
{
    kind="CustomObject",
    object_desc="HallTile4"
}

RPD.roomsInstruments.spawnObj(9,tile,4,cell)

for i = 0, math.random(0,10) do
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.POTION,4 )
RPD.roomsInstruments.spawnIt(9,item,4,cell)
end
for i = 0, math.random(0,10) do
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.roomsInstruments.spawnIt(9,item,4,cell)
end

end,
locked = function()
return nil
end
}
return customRoom