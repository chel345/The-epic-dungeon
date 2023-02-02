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
local level = RPD.Dungeon.level
if RPD.Dungeon.depth ~= 25 then
Ginerator.CreateLevel("NightmareLevel",true)
for i = 1,RPD.Dungeon.level:getLength()-1 do       
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"NightmareKeeper")
maybeMob:getSprite():killAndErase()
end
end

if not storage.get("deco") then
storage.put("deco",true)
for i = 1, RPD.Dungeon.level:getLength()-1 do
if level.map[i] == 36 and math.random(1,3) == 1 then
local Chest =
{
    kind="CustomObject",
    object_desc="YellowLamp"
}
RPD.createLevelObject(Chest,i-1)
level:set(i-1,14)
end
if RPD.Dungeon.level.map[i] == 0 and (not level:getTopLevelObject(i)) then
if math.random(1,10) == 1 then
local tile =
{
    kind="CustomObject",
    object_desc="NightmareChasmLight"
}
RPD.createLevelObject(tile,i-1)
end
end

if RPD.Dungeon.level.map[i] == 1 and (not level:getTopLevelObject(i)) then
if math.random(1,70) == 1 then
local Chest =
{
    kind="CustomObject",
    object_desc= ("NightTile"..tostring(math.random(3,4)))
}
RPD.createLevelObject(Chest,i-1)
end
end
end
end

end

if RPD.Dungeon.depth == 25 and (not storage.get("obj")) then
storage.put("obj",true)
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
