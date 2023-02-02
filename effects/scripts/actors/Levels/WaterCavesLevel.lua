--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

return actor.init({
activate = function()
if RPD.Dungeon.depth ~= 20 then
Ginerator.CreateLevel("WaterCavesLevel",true)
end
local level = RPD.Dungeon.level
local W = level:getWidth()
for i = 1,level:getLength()-1 do
if level.map[i] == 4 then
if level.water[i+1] and level.water[i-1] then
level:set(i-1,0)
local object = RPD.Dungeon.level:getTopLevelObject(i-1)
if object then
RPD.Dungeon.level:remove(object)
object.sprite:kill()
end
end

if level.water[i+W] and level.water[i-W] == 1 then
level:set(i-1,0)
local object = RPD.Dungeon.level:getTopLevelObject(i-1)
if object then
RPD.Dungeon.level:remove(object)
object.sprite:kill()
end
end
end
end

for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == 4 then
if RPD.Dungeon.level.water[i+32] then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
RPD.GameScene:updateMap(i-1)
end
end
end

for i = 1, RPD.Dungeon.level:getLength()-1 do
if math.random(1,30) == 1 then
if RPD.Dungeon.level.water[i] then
RPD.topEffect(i-1,"Rain")
end
end
end

for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"WaterCavesKeeper")
maybeMob:getSprite():killAndErase()
end
end

return true
end,
    actionTime = function()
        return 1
    end,
act = function()
if RPD.Dungeon.depth == 16 then
if not storage.get("storywater") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,RPD.StringsManager:maybeId("Water_Story"))
       RPD.GameScene:show(wnd)
       storage.put("storywater",true)
end
end
return true
end
})
