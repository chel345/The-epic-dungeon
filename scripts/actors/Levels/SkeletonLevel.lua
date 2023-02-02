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

if RPD.Dungeon.depth ~= 30 then
Ginerator.CreateLevel("SkeletonLevel",true)
end

for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() ==  "Shopkeeper" then
RPD.topEffect(i,"ShadowKeeper")
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
if not storage.get("storyskeleton") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,RPD.StringsManager:maybeId("Skeleton_Story"))
       RPD.GameScene:show(wnd)
       storage.put("storyskeleton",true)
end
end
return true
end
})
