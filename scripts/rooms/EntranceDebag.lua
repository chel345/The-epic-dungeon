local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
1,1,1,
1,7,1,
1,1,1
}
end,
getHidth = function()
return 3
end,
getWidth = function()
return 3
end,
objects = function(cell)
end,
locked = function()
return nil
end
}
return customRoom