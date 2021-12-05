--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"

return item.init{
    desc  = function ()
        return {
            image     = 5,
            imageFile = "items/TrapVials.png",
            name      = RPD.StringsManager:maybeId("ParalysisVial_Name"),
            info      = RPD.StringsManager:maybeId("ParalysisVial_Desc"),
            stackable = true,
            price     = 20
        }
    end,
    onThrow = function(self, item, cell, thrower)
    RPD.playSound( "snd_shatter.ogg")
    RPD.placeBlob( RPD.Blobs.ParalyticGas , cell, 20)
    local Splash = luajava.bindClass("com.watabou.pixeldungeon.effects.Splash")
    Splash.at( RPD.Sfx.CellEmitter:get(cell) , cell,-3,3, 0xF8FF00, 1)
    end,
    glowing = function(self, ite)
        --if self.data.activationCount >= 1 then
            return item.makeGlowing( 0x81FF00 , 1)
        --end
    end
}
