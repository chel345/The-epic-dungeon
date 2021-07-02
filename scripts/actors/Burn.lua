--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"
local actor = require "scripts/lib/actor"

return actor.init({
    act = function() 
        local levelSize = RPD.Dungeon.level:getLength()
        local cell = math.random(levelSize)-1
        if not RPD.Dungeon.level.solid[cell] then
RPD.placeBlob( RPD.Blobs.LiquidFlame, cell, 10)
RPD.topEffect(cell,"Explotion")
RPD.playSound( "snd_explosion.mp3" )
        end

        return true
    end,
    actionTime = function()
        return math.random(1,10)
    end
})