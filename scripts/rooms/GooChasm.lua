local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
63, 63, 63, 63, 63, 63, 63, 63, 0, 0, 0, 0, 0, 63, 63, 0, 1, 1, 1, 0, 63, 63, 0, 1, 11, 1, 0, 63, 63, 0, 1, 1, 1, 0, 63, 63, 0, 0, 0, 0, 0, 63, 63, 63, 63, 63, 63, 63, 63
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
end,
locked = function()
return nil
end
}
return customRoom