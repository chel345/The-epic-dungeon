--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local actor = require "scripts/lib/actor"

local storage = require "scripts/lib/storage"

local Ginerator = require "scripts/lib/Ginerator"

return actor.init({
activate = function()

if RPD.Dungeon.depth ~= 30 then

local level = RPD.Dungeon.level
if not storage.get("castl") then
for i = 1, level:getLength() do
level:set(i-1,0)
end
storage.put("castl",true)
end

Ginerator.CreateLevel("SpiderCastleLevel")

if not storage.get("cas") then

canSpawn = function(cell)
local lvl = RPD.Dungeon.level
local x = lvl:cellX(cell)
local y = lvl:cellY(cell)
for i = x-1, x+1 do
 for j = y-1,y+1 do
local pos = lvl:cell(i,j)
if lvl.map[pos] ~= 0 then
return false
end
end
end
return true
end

local lvl = RPD.Dungeon.level
for i = 1, lvl:getLength() do
if canSpawn(i) and math.random(1,35) == 1 then
if math.random(1,3) == 1 then
local candle =
{
    kind="CustomObject",
    object_desc="SpiderTile1"
}
RPD.createLevelObject(candle, i-1)
lvl:set(i-1,1)
elseif math.random(1,2) == 1 then
lvl:set(i-1,1)
local mob = RPD.mob("SpiderStatue")
mob:setPos(i-1)
lvl:spawnMob(mob)
elseif math.random(1,3) == 1 then
local W = RPD.Dungeon.level:getWidth()
local web =
{
    kind="CustomObject",
    object_desc="SpiderTile10"
}
RPD.createLevelObject(web, i-W-1)
local web =
{
    kind="CustomObject",
    object_desc="SpiderTile11"
}
RPD.createLevelObject(web, i-1)
else
lvl:set(i-1,1)
local mob = RPD.mob("EnFireThrower")
mob:setPos(i-1)
lvl:spawnMob(mob)
end
end
end

local level = RPD.Dungeon.level
for i = 1,RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
end
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.EMPTY_DECO)
end
end

end
storage.put("cas",true)

end

for i = 1,RPD.Dungeon.level:getLength()-1 do       
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"SpiderKeeper")
maybeMob:getSprite():killAndErase()
end
end

return true
end,
    act = function()
    if RPD.Dungeon.depth == 26 then
if not storage.get("storyspider") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,RPD.StringsManager:maybeId("Spider_Story"))
       RPD.GameScene:show(wnd)
       storage.put("storyspider",true)
end
end
    return true
    end,
    actionTime = function()
        return 1
    end
})
