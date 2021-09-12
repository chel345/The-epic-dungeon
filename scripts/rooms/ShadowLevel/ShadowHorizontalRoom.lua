local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {

map = function()
return {
4,4,4,4,4,4,4,35,1,1,35,1,1,35,1,1,35,1,1,35,1,1,1,1,1,1,1,1,35,1,1,35,1,1,35,1,1,35,1,1,35,1,4,4,4,4,4,4,4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end
}
return customRoom
