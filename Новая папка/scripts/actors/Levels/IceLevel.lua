--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

return actor.init({
activate = function()

if RPD.Dungeon.depth ~= 20 then
Ginerator.CreateLevel("IceLevel")

if not storage.get("jkjkjk") then
local level = RPD.Dungeon.level
local W = level:getWidth()

for i = 1,level:getLength()-1 do
if level.map[i] == 4 then
if level.map[i+1] == 1 and level.map[i-1] == 1 then
level:set(i-1,0)
local object = RPD.Dungeon.level:getTopLevelObject(i-1)
if object then
RPD.Dungeon.level:remove(object)
object.sprite:kill()
end
end

if level.map[i+W] == 1 and level.map[i-W] == 1 then
level:set(i-1,0)
local object = RPD.Dungeon.level:getTopLevelObject(i-1)
if object then
RPD.Dungeon.level:remove(object)
object.sprite:kill()
end
end
end

if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
--RPD.GameScene:particleEffect("Torch", i-1)
RPD.GameScene:updateMap(i-1)
end
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.EMPTY_DECO)
end
end
end

for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"IceKeeper")
maybeMob:getSprite():killAndErase()
end
end


end
return true
end,
    actionTime = function()
        return 1
    end,
act = function()
storage.put("jkjkjk",true)
return true
end
})
