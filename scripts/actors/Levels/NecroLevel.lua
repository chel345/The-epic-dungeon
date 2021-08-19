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
if RPD.Dungeon.depth == 11 then
if not storage.get("storynecro") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,RPD.StringsManager:maybeId("Necro_Story"))
       RPD.GameScene:show(wnd)
       storage.put("storynecro",true)
end
end
if RPD.Dungeon.depth ~= 15 and RPD.Dungeon.depth ~= 14 then
Ginerator.CreateLevel("NecroLevel",true)
end
for i = 1,15*15-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.WALL_DECO then
RPD.GameScene:particleEffect("Torch", i-1)
end
end
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"DarckKeeper")
maybeMob:getSprite():killAndErase()
end
end
return true
end,
    actionTime = function()
        return 1
    end,
act = function()
return true
end
})
