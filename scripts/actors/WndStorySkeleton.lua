--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"
local actor = require "scripts/lib/actor"

return actor.init({
    actionTime = function()
        return 1
    end,
    activate = function()
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,"Может Адская крепость и не была построена тёмными силами, но вот склеп точно! Никто и никогда не доходил так далеко!")
       RPD.GameScene:show(wnd)
    end
})