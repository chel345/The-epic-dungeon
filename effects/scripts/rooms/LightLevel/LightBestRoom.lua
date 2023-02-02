local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
0, 63, 0, 0, 0, 63, 0, 63, 12, 63, 0, 63, 12, 63, 0, 63, 0, 0, 0, 63, 0, 0, 0, 36, 11, 36, 0, 0, 0, 63, 0, 0, 0, 63, 0, 63, 12, 63, 0, 63, 12, 63, 0, 63, 0, 0, 0, 63, 0
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
RPD.Dungeon.level:drop(RPD.item("ScrollOfUpgrade"),cell)

end,
locked = function()
return nil
end
}
return customRoom