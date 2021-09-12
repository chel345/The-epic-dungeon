local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {

map = function()
return {
15,15,35,35,35,35,15,35,35,35,2,35,2,15,15,2,15,35,2,2,2,2,15,2,15,35,15,15,2,2,35,15,15,2,15,15,15,2,2,35,15,35,35,15,15,2,35,35,2
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
