--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init{
stats = function(self)
RPD.permanentBuff(self, RPD.Buffs.Roots)
end,
interact = function(self, chr)
local ownPos  = self:getPos()
local newPos  = chr:getPos()
self:move(newPos)
self:getSprite():move(ownPos, newPos)
chr:move(ownPos)
chr:getSprite():move(newPos, ownPos)
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
