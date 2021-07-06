--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

local storage = require "scripts/lib/storage"

local Ginerator = require "scripts/lib/Ginerator"

return actor.init({
activate = function()
if RPD.Dungeon.depth == 31 then
if not storage.get("storycastle") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,"Адская крепость, пролигающая после изумрудного собора является тоже своеобразной задворкой. Никому не известно кто построил её. Историки утверждают, что она была создана той неизвестной рассой и использовалось как укрытие, другие же суйверные говорят, что её построил сам дьявол, чтобы пытать там грешные души...")
       RPD.GameScene:show(wnd)
end
end
storage.put("storycastle",true)
if RPD.Dungeon.depth ~= 33 then

local level = RPD.Dungeon.level
if not storage.get("castl") then
for i = 1, level:getLength() do
level:set(i-1,0)
end
storage.put("castl",true)
end

Ginerator.CreateLevel("HallCastleLevel")
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
return true
end,
    act = function()
    return true
    end,
    actionTime = function()
        return 1
    end
})
