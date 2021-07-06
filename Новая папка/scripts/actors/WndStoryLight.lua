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
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,"После дворфийской метрополии простирался ещё один подземный город. Никто не знает, кто здесь жил и почему он погиб. Некоторые полагают, что город погиб по той же причине, что и дворфийская метрополия: великая война со старым богом. Лишь немногие добирались так далеко...")
       RPD.GameScene:show(wnd)
    end
})