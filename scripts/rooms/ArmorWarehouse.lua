local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 4, 14, 14, 14, 4, 4, 4, 4, 14, 14, 14, 4, 4, 4, 4, 14, 14, 14, 4, 4, 4, 4, 14, 14, 14, 4, 4, 4, 4, 14, 14, 14, 4, 4, 4, 4, 4, 4, 4, 4, 4
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
item = {
"effects/ArmorOnHanger",
"effects/ArmorOnHanger_Cloth",
"effects/ArmorOnHanger_Lether",
"effects/ArmorOnHanger_Mail"
}
local mob = RPD.MobFactory:mobByName(item[math.random(1,#item)])
local level = RPD.Dungeon.level
mob:setPos(cell)
level:spawnMob(mob);
local mob = RPD.MobFactory:mobByName(item[math.random(1,#item)])
local level = RPD.Dungeon.level
mob:setPos(cell+W)
level:spawnMob(mob);
local mob = RPD.MobFactory:mobByName(item[math.random(1,#item)])
local level = RPD.Dungeon.level
mob:setPos(cell-W)
level:spawnMob(mob);
end
}
return customRoom
