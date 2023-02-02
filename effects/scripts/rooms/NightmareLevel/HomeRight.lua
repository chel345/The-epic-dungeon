local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1, 1, 1, 4, 4, 4, 4, 4, 4, 1, 1, 1, 4, 41, 41, 41, 41, 4, 1, 1, 1, 4, 14, 14, 14, 41, 4, 1, 1, 1, 5, 14, 14, 14, 41, 4, 1, 1, 1, 4, 14, 14, 14, 41, 4, 1, 1, 1, 4, 14, 14, 14, 41, 4, 1, 1, 1, 4, 14, 14, 14, 42, 4, 1, 1, 1, 4, 14, 14, 14, 41, 4, 1, 1, 1, 4, 4, 4, 4, 4, 4
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
    object_desc="NightTile5"
}

RPD.roomsInstruments.spawnObj(4,tile,4,cell)

for i = 0, math.random(0,10) do
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.POTION,4 )
RPD.roomsInstruments.spawnIt(14,item,4,cell)
end
for i = 0, math.random(0,10) do
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.roomsInstruments.spawnIt(14,item,4,cell)
end

end,
locked = function()
return nil
end
}
return customRoom