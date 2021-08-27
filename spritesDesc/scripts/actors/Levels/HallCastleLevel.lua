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

if RPD.Dungeon.depth ~= 33 then

local level = RPD.Dungeon.level
if not storage.get("castl") then
for i = 1, level:getLength() do
level:set(i-1,0)
end
storage.put("castl",true)
end

Ginerator.CreateLevel("HallCastleLevel",true)
if not storage.get("deco") then
for i = 1,RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL and math.random(1,20) == 1 then

if math.random(1,2) == 1 then
tile =
{
    kind="Deco",
    object_desc=("HallCastleTile1")
}
RPD.createLevelObject(tile,i-1)
elseif math.random(1,2) == 1 then
tile =
{
    kind="Deco",
    object_desc=("HallCastleTile6")
}
RPD.createLevelObject(tile,i-1)
RPD.Dungeon.level:set(i-1,RPD.Terrain.STATUE)
else
tile =
{
    kind="Deco",
    object_desc=("HallCastleTile5")
}
RPD.createLevelObject(tile,i-1)
end

end
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY and math.random(1,20) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.EMPTY_DECO)
end
end
end
storage.put("deco",true)

end
if RPD.Dungeon.depth == 31 then
if not storage.get("storycastle") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,RPD.StringsManager:maybeId("HellCastle_Story"))
       RPD.GameScene:show(wnd)
       storage.put("storycastle",true)
end
end
return true
end,
    act = function()
    return true
    end,
    actionTime = function()
        return 1
    end
})
