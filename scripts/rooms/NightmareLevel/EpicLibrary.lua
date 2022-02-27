local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
41, 41, 41, 41, 41, 41, 41, 41, 41, 5, 1, 1, 1, 1, 1, 1, 1, 41, 41, 1, 14, 41, 5, 41, 14, 1, 41, 41, 1, 41, 0, 0, 0, 41, 1, 41, 41, 1, 5, 0, 11, 0, 5, 1, 41, 41, 1, 41, 0, 0, 0, 41, 1, 41, 41, 1, 14, 41, 5, 41, 14, 1, 41, 41, 1, 1, 1, 1, 1, 1, 1, 5, 41, 41, 41, 41, 41, 41, 41, 41, 41
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

for i = 0, math.random(0,10) do
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.roomsInstruments.spawnIt(1,item,4,cell)
end

local mob = RPD.mob("CrystalMod")
mob:setPos(cell)
RPD.Dungeon.level:spawnMob(mob)

local tile =
{
    kind="CustomObject",
    object_desc="YellowLamp"
}

RPD.roomsInstruments.spawnObj(14,tile,4,cell)
end,
locked = function()
return nil
end
}
return customRoom