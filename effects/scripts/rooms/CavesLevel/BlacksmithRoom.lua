local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")

local customRoom = {
map = function()
return {
4, 4, 4, 4, 4, 4, 4, 4, 19, 19, 19, 19, 19, 4, 4, 19, 14, 14, 14, 19, 4, 4, 19, 14, 14, 14, 19, 4, 4, 19, 14, 14, 14, 19, 4, 4, 19, 19, 19, 19, 19, 4, 4, 4, 4, 4, 4, 4, 4
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
local npc = RPD.mob("Blacksmith")
--local npc = luajava.bindClass("com.watabou.pixeldungeon.actors.mobs.npcs.Blacksmith")
--npc:spawn(cell+1)
npc:setPos(cell+1)
RPD.Dungeon.level:spawnMob(npc)

armor = {
"effects/ArmorOnHanger",
"effects/ArmorOnHanger_Cloth",
"effects/ArmorOnHanger_Lether",
"effects/ArmorOnHanger_Mail",
"effects/ArmorOnHanger_Scale",
"effects/ArmorOnHanger_Plate",
"effects/ArmorOnHanger_Gotic"
}
local level = RPD.Dungeon.level

local mob = RPD.mob(armor[math.random(1,#armor)])
if math.random(1,5) == 1 then
local level = RPD.Dungeon.level
mob:setPos(cell-W)
level:spawnMob(mob);
elseif math.random(1,3) == 1 then
local barrel =
{
    kind="Barrel"
}
RPD.createLevelObject(barrel, cell-1)
elseif math.random(1,15) == 1 then
if math.random(1,2) == 1 then
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.ARMOR,4 )
else
item = Treasury:getLevelTreasury():bestOf(Treasury.Category.WEAPON,4 )
end
RPD.Dungeon.level:drop(item,cell+W).type = RPD.Heap.Type.CHEST
RPD.GameScene:updateMap(cell+W)
end

end
}
return customRoom