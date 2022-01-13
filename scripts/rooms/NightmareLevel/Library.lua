local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 5, 4, 4, 4, 4, 4, 41, 41, 41, 1, 41, 41, 41, 4, 4, 41, 1, 1, 1, 1, 1, 41, 4, 4, 41, 1, 1, 1, 1, 1, 41, 4, 5, 1, 1, 1, 41, 1, 1, 1, 5, 4, 41, 1, 1, 1, 1, 1, 41, 4, 4, 41, 1, 1, 1, 1, 1, 41, 4, 4, 41, 41, 41, 1, 41, 41, 41, 4, 4, 4, 4, 4, 5, 4, 4, 4, 4
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

end,
locked = function()
return nil
end
}
return customRoom