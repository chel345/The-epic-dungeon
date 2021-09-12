local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 2, 1, 1, 41, 41, 4, 4, 1, 1, 1, 1, 41, 4, 4, 35, 1, 1, 1, 41, 4, 4, 1, 1, 1, 1, 1, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
locked = function()
return nil
end,
objects = function(cell)
local W = RPD.Dungeon.level:getWidth()
-- RPD.Dungeon.level:drop(item,cell)
local npc = RPD.mob("WandmakerModNPC")
npc:setPos(cell)
local Thornvine =
{
    kind="Deco",
    object_desc="Thornvine_Deco"
}
local candle =
{
    kind="Deco",
    object_desc="MagicCandle"
}
local table =
{
    kind="Deco",
    object_desc="DecoTable1"
}
local Wand1 =
{
    kind = "Deco",
    object_desc = "Wand1"
}
local Wand2 =
{
    kind = "Deco",
    object_desc = "Wand2"
}
RPD.Dungeon.level:spawnMob(npc)
RPD.createLevelObject(Thornvine, cell-W*2-2)
RPD.createLevelObject(candle, cell+2+W)
RPD.createLevelObject(table, cell-2)
RPD.createLevelObject(Wand1, cell-2-W*3)
RPD.createLevelObject(Wand2, cell-1-W*3)
end
}
return customRoom