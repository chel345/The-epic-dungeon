local RPD = require "scripts/lib/commonClasses"

local customRoom = {

map = function()
return {
4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,1,35,1,35,1,4,1,1,1,11,1,1,1,4,1,35,1,35,1,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
RPD.Dungeon.level:drop(RPD.item("ScrollOfUpgrade"),cell)
end
}
return customRoom
