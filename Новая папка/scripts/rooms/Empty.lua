local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
41, 41, 41, 41, 41, 41, 41, 41, 1, 1, 1, 1, 1, 41, 41, 1, 1, 1, 1, 1, 41, 41, 1, 1, 1, 1, 1, 41, 41, 1, 1, 1, 1, 1, 41, 41, 1, 1, 1, 1, 1, 41, 41, 41, 41, 41, 41, 41, 41
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(st)
end,
locked = function()
return nil
end
}
return customRoom