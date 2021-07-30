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
if RPD.Dungeon.depth == 6 then
if not storage.get("storycrab") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,RPD.textById("Crab_Story"))
       RPD.GameScene:show(wnd)
       storage.get("storycrab",true)
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
