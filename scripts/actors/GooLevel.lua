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
for i = 0,RPD.Dungeon.level:getLength()-1 do            
RPD.Sfx.CellEmitter:get(i):pour(RPD.Sfx.ShadowParticle.UP, 3.8);
end
end,
act = function()
  if RPD.Dungeon.level.water[RPD.Dungeon.hero:getPos()] then
        RPD.affectBuff(RPD.Dungeon.hero, RPD.Buffs.Slow , 1)
    end
return true
    end,
    actionTime = function()
        return 1
    end
})