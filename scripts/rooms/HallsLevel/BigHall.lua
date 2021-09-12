local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
36, 14, 14, 14, 14, 14, 36, 14, 1, 1, 1, 1, 1, 14, 14, 1, 14, 14, 14, 1, 14, 14, 1, 14, 1, 14, 1, 14, 14, 1, 14, 14, 14, 1, 14, 14, 1, 1, 1, 1, 1, 14, 36, 14, 14, 14, 14, 14, 36
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

end
}
return customRoom