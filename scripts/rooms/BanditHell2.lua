local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 36, 4, 36, 4, 4, 4, 4, 4, 14, 14, 14, 14, 14, 4, 4, 4, 36, 14, 14, 14, 14, 14, 36, 4, 4, 4, 14, 14, 14, 14, 14, 4, 4, 4, 36, 14, 14, 14, 14, 14, 36, 4, 4, 4, 14, 14, 14, 14, 14, 4, 4, 4, 4, 4, 36, 4, 36, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 9
end,
getWidth = function()
return 9
end,
objects = function(st)
local level = RPD.Dungeon.level

end,
locked = function()
return nil
end
}
return customRoom