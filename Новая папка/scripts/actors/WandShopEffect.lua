--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"
local actor = require "scripts/lib/actor"

return actor.init({
    activate = function()
RPD.Sfx.CellEmitter:get(17):pour(RPD.Sfx.SnowParticle.FACTORY, 0.08);
RPD.Sfx.CellEmitter:get(18):pour(RPD.Sfx.PurpleParticle.FACTORY, 0.08);
            end
})