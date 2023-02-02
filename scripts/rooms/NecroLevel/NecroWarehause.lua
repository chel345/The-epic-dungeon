local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local Process = require "scripts/lib/Process"

local room = require "scripts/lib/room"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {

map = function()
return {
4,4,4,4,4,4,4,4,14,14,14,14,14,4,4,14,14,14,14,14,4,4,14,14,14,14,14,4,4,14,14,14,14,14,4,4,14,14,14,14,14,4,4,4,4,4,4,4,4
}
end,
getHidth = function()
return 7
end,
getWidth = function()
return 7
end,
objects = function(cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for i = x - 3, x + 3 do
	for j = y - 3, y + 3 do
local pos = RPD.Dungeon.level:cell(i,j)

armor = {
"effects/ArmorOnHanger",
"effects/ArmorOnHanger_Cloth",
"effects/ArmorOnHanger_Lether",
"effects/ArmorOnHanger_Mail",
"effects/ArmorOnHanger_Scale",
"effects/ArmorOnHanger_Plate",
"effects/ArmorOnHanger_Gotic"
}
if math.random(1,4) == 1 and level.map[pos] == 14 then
if math.random(1,3) == 3 then
mob = RPD.mob(armor[math.random(1,#armor)])
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
elseif math.random(1,3) == 1 then
RPD.createLevelObject({kind="Barrel"}, pos-1)
end
end


end
end
end
}
return customRoom
