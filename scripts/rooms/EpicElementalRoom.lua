local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
35, 14, 41, 41, 41, 14, 35, 14, 14, 14, 14, 14, 14, 14, 41, 14, 14, 14, 14, 14, 41, 41, 14, 14, 14, 14, 14, 41, 41, 14, 14, 14, 14, 14, 41, 14, 14, 14, 14, 14, 14, 14, 35, 14, 41, 41, 41, 14, 35
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

local Candle =
{
    kind="Deco",
    object_desc="MagicCandle"
}

local mob = RPD.MobFactory:mobByName("miniBosses/EpicElemental")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob)

RPD.createLevelObject(Candle,cell-2)
RPD.createLevelObject(Candle,cell+2)
RPD.createLevelObject(Candle,cell-W*2)
RPD.createLevelObject(Candle,cell+W*2)

end
}
return customRoom