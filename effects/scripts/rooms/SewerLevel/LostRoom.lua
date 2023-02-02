local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 13, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4
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
local Chest =
{
    kind="CustomObject",
    object_desc="Chest"
}
RPD.createLevelObject(Chest,cell-W*2-2)
RPD.createLevelObject(Chest,cell-W*2-1)
RPD.createLevelObject(Chest,cell-W*2)
RPD.createLevelObject(Chest,cell-W*2+1)
RPD.createLevelObject(Chest,cell-W*2+2)
RPD.createLevelObject(Chest,cell-W-2)
RPD.createLevelObject(Chest,cell-2)
RPD.createLevelObject(Chest,cell+W-2)
RPD.createLevelObject(Chest,cell+W*2-2)
RPD.createLevelObject(Chest,cell+W*2-1)
RPD.createLevelObject(Chest,cell+W*2)
RPD.createLevelObject(Chest,cell+W*2+1)
RPD.createLevelObject(Chest,cell+W*2+2)
RPD.createLevelObject(Chest,cell-W+2)
RPD.createLevelObject(Chest,cell+2)
RPD.createLevelObject(Chest,cell+W+2)
local trap = {
kind = "Trap",
uses = 1,
trapKind = "scriptFile",
script = "scripts/traps/OpenedChest"
}
RPD.createLevelObject(trap,cell+W+1)
end,
locked = function()
return nil
end
}
return customRoom