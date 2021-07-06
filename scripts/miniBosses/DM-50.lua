--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

return mob.init{
move = function(self)
RPD.playSound( "snd_rocks.mp3" )
RPD.placeBlob(RPD.Blobs.ParalyticGas, self:getPos(), 50);
local Camera = luajava.bindClass("com.watabou.noosa.Camera")
Camera.main:shake(4,0.5f)
end,
die = function(self)
self:getSprite():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.WOOL), 10)
end
}
