--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
interact = function(self, chr)
    RPD.resetPos(self,chr)
end,
zapProc = function(self,enemy,dmg)
Splash = luajava.bindClass("com.watabou.pixeldungeon.effects.Splash")
Splash.at(enemy:getSprite():emitter(), enemy:getPos(),-3,3, 0xFFBB0000, 9)
RPD.playSound( "ToxicZap.ogg" )
end,
attackProc = function(self,enemy,dmg)
Splash = luajava.bindClass("com.watabou.pixeldungeon.effects.Splash")
Splash.at(enemy:getSprite():emitter(), enemy:getPos(),-3,3, 0x81ff2f, 9)
RPD.playSound( "ToxicZap.ogg" )
end
}
