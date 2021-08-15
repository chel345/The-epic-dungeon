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
                    spawn = function(me, level)
                        Process.golden_gaurd_pos = me:getPos()
                        RPD.setAi(me, "GoldenGaurd")
                    end,
                    move  = function(me)
                        RPD.setAi(me, "GoldenGaurd")
                    end
                })


