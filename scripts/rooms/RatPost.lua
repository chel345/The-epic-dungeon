local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 14, 14, 14, 14, 14, 4, 4, 4, 4, 4, 4, 4, 4
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
local RatBanner =
{
    kind="Deco",
    object_desc="RatImperiaBanner"
}
RPD.createLevelObject(RatBanner, cell-W*2+1)
RPD.createLevelObject(RatBanner, cell-W*2-1)
RPD.createLevelObject(RatBanner, cell+W*3+1)
RPD.createLevelObject(RatBanner, cell+W*3-1)
RPD.createLevelObject(RatBanner, cell-3)
RPD.createLevelObject(RatBanner, cell+3)
local mob = RPD.MobFactory:mobByName("RatGuard")
local level = RPD.Dungeon.level
mob:setPos(cell+W-1)
level:spawnMob(mob);
local mob = RPD.MobFactory:mobByName("RatGuard")
local level = RPD.Dungeon.level
mob:setPos(cell+W+1)
level:spawnMob(mob);
local mob = RPD.MobFactory:mobByName("RatArcher")
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);
end,
locked = function()
return nil
end,
Object2 = function(cell)
end
}
return customRoom