local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4,4,4,4,4,4,4,
4,1,1,1,1,1,4,
4,1,1,1,1,1,4,
4,1,1,7,1,1,4,
4,1,1,1,1,1,4,
4,1,1,1,1,1,4,
4,4,4,4,4,4,4
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