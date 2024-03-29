--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require "scripts/lib/mob"

local emitter = false --тут получается что он один и тот же для всех мобов этого вида, не надо так

return mob.init {
    die = function(self, cause)
        local tomb = {
            kind = "CustomObject",
            object_desc = "RoseTomb"
        }
        RPD.createLevelObject(tomb, self:getPos())

        if emitter then
            emitter.on = false
        end
    end,
    spawn = function(self)
        if not emitter then
            emitter = self:getSprite():emitter()
            emitter:pour(RPD.Sfx.LeafParticle.LEVEL_SPECIFIC, 0.08)
        end
    end
}
