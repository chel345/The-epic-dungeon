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
if RPD.Dungeon.depth ~= 25 then
Ginerator.CreateLevel("NightmareLevel",true)
for i = 1,RPD.Dungeon.level:getLength()-1 do       
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"NightmareKeeper")
maybeMob:getSprite():killAndErase()
end
end
end

if RPD.Dungeon.depth == 25 and (not storage.get("obj")) then
storage.put("obj",true)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,63)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,48)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,64)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,49)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,65)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,66)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,50)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,51)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,68)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,53)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,69)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,54)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,70)
local Chest =
{
    kind="CustomObject",
    object_desc= ("Viewer"..tostring(math.random(1,5)))
}
RPD.createLevelObject(Chest,55)
end
return true
end,
    actionTime = function()
        return 1
    end,
act = function()
if RPD.Dungeon.depth == 21 then
if not storage.get("storynight") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,RPD.StringsManager:maybeId("Night_Story"))
       RPD.GameScene:show(wnd)
       storage.put("storynight",true)
end
end

return true
end
})
