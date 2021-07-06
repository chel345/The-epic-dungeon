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
RPD.Sfx.CellEmitter:get(249):pour(RPD.Sfx.ElmoParticle.FACTORY, 0.08);
RPD.Sfx.CellEmitter:get(247):pour(RPD.Sfx.ElmoParticle.FACTORY, 0.08);
RPD.Sfx.CellEmitter:get(217):pour(RPD.Sfx.ElmoParticle.FACTORY, 0.08);
RPD.Sfx.CellEmitter:get(215):pour(RPD.Sfx.ElmoParticle.FACTORY, 0.08)
            end
})