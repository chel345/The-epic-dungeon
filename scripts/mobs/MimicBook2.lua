--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
spawn = function(self)
RPD.setAi(self,"Books/MimicBook2")
end,
attackProc = function(self,enemy,dmg)
RPD.setAi(self,"Books/MimicBook2")
return dmg*0
end,
die = function(self, enemy, cell, dmg)
RPD.topEffect(self:getPos(),"Explotion")
local Treasury = luajava.bindClass("com.nyrds.pixeldungeon.items.Treasury")
local item = Treasury:getLevelTreasury():bestOf(Treasury.Category.SCROLL,4 )
RPD.Dungeon.level:drop(item,self:getPos())
end
}
