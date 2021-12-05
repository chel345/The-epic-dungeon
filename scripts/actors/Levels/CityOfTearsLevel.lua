--[[
    Created by mike.
    DateTime: 25.10.18 22:21
    This file is part of pixel-dungeon-remix
]]



local RPD = require "scripts/lib/epicClasses"

local actor = require "scripts/lib/actor"

local storage = require "scripts/lib/storage"

return actor.init({
activate = function()
if RPD.Dungeon.depth == 31 then
RPD.GameScene:particleEffect("Smoke", 194)
RPD.GameScene:particleEffect("Smoke", 196)
RPD.GameScene:particleEffect("Torch", 274)
RPD.GameScene:particleEffect("Torch", 277)
RPD.GameScene:particleEffect("Torch", 158)
RPD.GameScene:particleEffect("WaterSink", 242)
if not storage.get("g") then
RPD.createLevelObject({
    kind="Deco",
    object_desc="TearLight1"
}
,147)
RPD.createLevelObject({
    kind="Deco",
    object_desc="TearLight2"
}
,148)
storage.put("g",true)
end
for i = 1, RPD.Dungeon.level:getLength()-1 do
if math.random(1,10) == 1 and (RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY or RPD.Terrain.EMPTY_SP == RPD.Dungeon.level.map[i]) then
RPD.topEffect(i-1,"TearsRain")
end
end
end
if RPD.Dungeon.depth == 32 then
if not storage.get("gg") then
RPD.createLevelObject({
    kind="Deco",
    object_desc="FireCandle"
}
,50)
storage.put("gg",true)
end
end
if RPD.Dungeon.depth == 33 then

if not storage.get("tears") then
RPD.Dungeon.level:drop(RPD.item("Tears/TearsSword"),124).type = RPD.Heap.Type.LOCKED_CHEST

RPD.Dungeon.level:drop(RPD.item("Tears/TearsArmor"),126).type = RPD.Heap.Type.LOCKED_CHEST

RPD.Dungeon.level:drop(RPD.item("Tears/TearsRock"),128).type = RPD.Heap.Type.LOCKED_CHEST

RPD.Dungeon.level:drop(RPD.item("Tears/TearsWand"),130).type = RPD.Heap.Type.LOCKED_CHEST
storage.put("tears",true)
end

RPD.GameScene:particleEffect("Candle", 123)
RPD.GameScene:particleEffect("Candle", 183)
RPD.GameScene:particleEffect("Candle", 127)
RPD.GameScene:particleEffect("Candle", 187)
RPD.GameScene:particleEffect("Candle", 191)
RPD.GameScene:particleEffect("Candle", 131)

end
if RPD.Dungeon.depth == 35 then
if not storage.get("ggg") then
RPD.createLevelObject({
    kind="Deco",
    object_desc="SmokingCandle"
}
,30)
RPD.createLevelObject({
    kind="Deco",
    object_desc="FireCandle"
}
,23)
RPD.createLevelObject({
    kind="Deco",
    object_desc="candle"
}
,38)
RPD.createLevelObject({
    kind="Deco",
    object_desc="MagicCandle"
}
,46)
RPD.createLevelObject({
    kind="Deco",
    object_desc="RatCandle"
}
,19)
RPD.createLevelObject({
    kind="Deco",
    object_desc="LibCandle"
}
,34)
storage.put("ggg",true)
end
RPD.GameScene:particleEffect("Candle", 42)
RPD.GameScene:particleEffect("Torch", 68)
RPD.GameScene:particleEffect("Torch", 66)

end
return true
end,
act = function()
if RPD.Dungeon.depth == 33 then
RPD.RemixedDungeon:resetScene()
end
local level = RPD.Dungeon.level
if RPD.Dungeon.depth == 31 then
if not storage.get("storytears") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,RPD.StringsManager:maybeId("CityOfTears_Story"))
       RPD.GameScene:show(wnd)
       storage.put("storytears",true)
end
end
return true
end,
    actionTime = function()
        return 1000000
    end
})
