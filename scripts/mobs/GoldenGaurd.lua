--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD     = require "scripts/lib/epicClasses"

local mob     = require "scripts/lib/mob"

local Process = require "scripts/lib/Process"

return mob.init({
    act       = function(me, ai, s)

        local hPos  = RPD.Dungeon.hero:getPos()
        local myPos = me:getPos()

        if RPD.Dungeon.level:distance(hPos, myPos) < 4 then
            me:beckon(hPos)
        else
            local mySprite = me:getSprite()
            if Process.golden_gaurd_pos then
                if mySprite then
                    mySprite:move(myPos, Process.golden_gaurd_pos)
                    mySprite:idle()
                end
                me:move(Process.golden_gaurd_pos)
                me:spend(1)
            end
        end
    end
})
