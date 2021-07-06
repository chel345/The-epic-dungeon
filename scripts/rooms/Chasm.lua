local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local room = require "scripts/lib/room"

local customRoom = {
map = function()
return {
1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
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
end,
Objects2 = function(cell)
local level = RPD.Dungeon.level
local W = level:getWidth()
level:set(cell,0)
RPD.GameScene:updateMap(cell)
level:set(cell-W,0)
RPD.GameScene:updateMap(cell-W)
level:set(cell-W-1,0)
RPD.GameScene:updateMap(cell -W-1)
level:set(cell -W+1,0)
RPD.GameScene:updateMap(cell -W+1)
level:set(cell -W*2,0)
RPD.GameScene:updateMap(cell -W*2)
level:set(cell +W-1,0)
RPD.GameScene:updateMap(cell +W-1)
level:set(cell +W+1,0)
RPD.GameScene:updateMap(cell +W+1)
level:set(cell +W,0)
RPD.GameScene:updateMap(cell+W)
level:set(cell+W*2,0)
RPD.GameScene:updateMap(cell+W*2)
level:set(cell+2,0)
RPD.GameScene:updateMap(cell+2)
level:set(cell-2,0)
RPD.GameScene:updateMap(cell-2)
level:set(cell+1,0)
RPD.GameScene:updateMap(cell+1)
level:set(cell-1,0)
RPD.GameScene:updateMap(cell-1)
end
}
return customRoom