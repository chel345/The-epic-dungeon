--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD     = require "scripts/lib/epicClasses"

local mob     = require "scripts/lib/mob"

return mob.init({
    act       = function(me, ai, s)

        local hPos  = RPD.Dungeon.hero:getPos()
        local myPos = me:getPos()

        if RPD.Dungeon.level:distance(hPos, myPos) < 4 then
            me:beckon(hPos)
        else
            me:spend(1)
        end
    end
})
