local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 1, 1, 1, 14, 4, 4, 14, 1, 1, 1, 14, 4, 4, 14, 1, 1, 1, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)

local W = RPD.Dungeon.level:getWidth()
local Column_1 =
{
    kind="Deco",
    object_desc="SewerColumn_2"
}
RPD.createLevelObject(Column_1,cell-W*2-2)
RPD.createLevelObject(Column_1,cell-W*2-1)
RPD.createLevelObject(Column_1,cell-W*2)
RPD.createLevelObject(Column_1,cell-W*2+1)
RPD.createLevelObject(Column_1,cell-W*2+2)
RPD.createLevelObject(Column_1,cell-W-2)
RPD.createLevelObject(Column_1,cell-2)
RPD.createLevelObject(Column_1,cell+W-2)
RPD.createLevelObject(Column_1,cell+W*2-2)
RPD.createLevelObject(Column_1,cell+W*2-1)
RPD.createLevelObject(Column_1,cell+W*2)
RPD.createLevelObject(Column_1,cell+W*2+1)
RPD.createLevelObject(Column_1,cell+W*2+2)
RPD.createLevelObject(Column_1,cell-W+2)
RPD.createLevelObject(Column_1,cell+2)
RPD.createLevelObject(Column_1,cell+W+2)
local Column_2 =
{
    kind="Deco",
    object_desc="SewerColumn_1"
}
RPD.createLevelObject(Column_2,cell-W*2-2-W)
RPD.createLevelObject(Column_2,cell-W*2-1 -W)
RPD.createLevelObject(Column_2,cell-W*2 -W)
RPD.createLevelObject(Column_2,cell-W*2+1 -W)
RPD.createLevelObject(Column_2,cell-W*2+2 -W)
RPD.createLevelObject(Column_2,cell-W-2 -W)
RPD.createLevelObject(Column_2,cell-2 -W)
RPD.createLevelObject(Column_2,cell+W-2 -W)
RPD.createLevelObject(Column_2,cell+W*2-2 -W)
RPD.createLevelObject(Column_2,cell+W*2-1 -W)
RPD.createLevelObject(Column_2,cell+W*2 -W)
RPD.createLevelObject(Column_2,cell+W*2+1 -W)
RPD.createLevelObject(Column_2,cell+W*2+2 -W)
RPD.createLevelObject(Column_2,cell-W+2 -W)
RPD.createLevelObject(Column_2,cell+2 -W)
RPD.createLevelObject(Column_2,cell+W+2 -W)

RPD.createLevelObject(Column_2,cell+W*2-1 -W)
RPD.createLevelObject(Column_2,cell+W*2 -W)
RPD.createLevelObject(Column_2,cell+W*2+1 -W)


end,
locked = function()
return nil
end
}
return customRoom