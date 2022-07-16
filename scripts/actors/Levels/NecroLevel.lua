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

if RPD.Dungeon.depth ~= 15 and RPD.Dungeon.depth ~= 14 then
Ginerator.CreateLevel("NecroLevel",true)
end
if not storage.get("Deco") then
storage.put("Deco")
for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == 4 then
if math.random(1,50) == 1 then
RPD.Dungeon.level:set(i-1,RPD.Terrain.WALL_DECO)
RPD.GameScene:updateMap(i-1)
end
end
end
end
for i = 1,15*15-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL_DECO then
RPD.GameScene:particleEffect("Torch", i-1)
end
end
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob:getEntityKind() ==  "Shopkeeper" and RPD.Dungeon.depth ~= 14 then
RPD.topEffect(i,"DarckKeeper")
maybeMob:getSprite():killAndErase()
end
end
local keepers = {"DarckKeeper","DarkShopkeeper1","DarkShopkeeper2"}
if RPD.Dungeon.depth == 14 then
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob:getEntityKind() ==  "Shopkeeper" then
RPD.topEffect(i,keepers[math.random(1,#keepers)])
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
if RPD.Dungeon.depth == 11 then
if not storage.get("storynecro") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,RPD.StringsManager:maybeId("Necro_Story"))
       RPD.GameScene:show(wnd)
       storage.put("storynecro",true)
end
end
return true
end
})
