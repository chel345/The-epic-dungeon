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

if RPD.Dungeon.depth ~= 35 then
Ginerator.CreateLevel("LibraryLevel")
end
local tile =
{
    kind = "Deco",
    object_desc = ("LibraryTile"..math.random(1,6))
}

if not storage.get("Deco") then
storage.put("Deco")
local level = RPD.Dungeon.level
local W = level:getWidth()
for i = 1, level:getLength()-1 do
if level.map[i] == 4 then
if not level:getTopLevelObject(i) then
if 
level.map[i+W] == 1 or
level.map[i+W] == 2 or
level.map[i+W] == 3 or
level.map[i+W] == 7 or
level.map[i+W] == 8 or
level.map[i+W] == 9 or
level.map[i+W] == 11 or
level.map[i+W] == 14 or
level.map[i+W] == 17 or
level.map[i+W] == 18 or
level.map[i+W] == 19 or
level.map[i+W] == 20 or
level.map[i+W] == 21 or
level.map[i+W] == 22 or
level.map[i+W] == 23 or
level.map[i+W] == 24 or
level.map[i+W] == 27 or
level.map[i+W] == 28 or
level.map[i+W] == 29 or
level.map[i+W] == 30 or
level.map[i+W] == 31 or
level.map[i+W] == 32 or
level.map[i+W] == 33 or
level.map[i+W] == 34 or
level.map[i+W] == 35 or
level.map[i+W] == 36 or
level.map[i+W] == 37 or
level.map[i+W] == 38 or
level.map[i+W] == 39 or
level.map[i+W] == 40 or
level.map[i+W] == 42 or
level.map[i+W] == 43 or
level.map[i+W] == 44 or
level.map[i+W] == 45 or
level.map[i+W] == 46 or
level.map[i+W] == 47 or
level.water[i+W] then
local tile =
{
    kind = "Deco",
    object_desc = ("LibraryTile"..math.random(1,6))
}
RPD.createLevelObject(tile,i-1)
end
end
end
end
end

local level = RPD.Dungeon.level
local W = level:getWidth()
for i = 1, RPD.Dungeon.level:getLength()-1 do
if math.random(1,50) == 1 then
if
level.map[i] == 1 or
level.map[i] == 2 or
level.map[i] == 3 or
level.map[i] == 7 or
level.map[i] == 8 or
level.map[i] == 9 or
level.map[i] == 11 or
level.map[i] == 14 or
level.map[i] == 17 or
level.map[i] == 18 or
level.map[i] == 19 or
level.map[i] == 20 or
level.map[i] == 21 or
level.map[i] == 22 or
level.map[i] == 23 or
level.map[i] == 24 or
level.map[i] == 27 or
level.map[i] == 28 or
level.map[i] == 29 or
level.map[i] == 30 or
level.map[i] == 31 or
level.map[i] == 32 or
level.map[i] == 33 or
level.map[i] == 34 or
level.map[i] == 35 or
level.map[i] == 36 or
level.map[i] == 37 or
level.map[i] == 38 or
level.map[i] == 39 or
level.map[i] == 40 or
level.map[i] == 42 or
level.map[i] == 43 or
level.map[i] == 44 or
level.map[i] == 45 or
level.map[i] == 46 or
level.map[i] == 47 then
RPD.topEffect(i-1,"FlyLight")
end
end
end

for i = 1,RPD.Dungeon.level:getLength()-1 do       
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"LibraryKeeper")
maybeMob:getSprite():killAndErase()
end

end

return true
end,
    actionTime = function()
        return 1
    end,
act = function()
if RPD.Dungeon.depth == 31 then
if not storage.get("storylib") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,RPD.StringsManager:maybeId("Library_Story"))
       RPD.GameScene:show(wnd)
       storage.put("storylib",true)
end
end
return true
end
})
