--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local function zapEffect(self, enemy)
local missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( self:getPos(),enemy:getPos(),nil)
missile:size(1)
missile:pour(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.COIN  ), 0.1)
local item = RPD.item("Gold")
local cellToDrop = level:getEmptyCellNextTo(enemy:getPos())
if not RPD.Dungeon.level:getTopLevelObject(cellToDrop) then
RPD.Dungeon.level:drop(item, cellToDrop).sprite:drop(cell)
end
RPD.playSound( "snd_gold.ogg" )
end

return mob.init{
zapMiss = function(self,enemy)
zapEffect(self, enemy)
end,
zapProc = function(self, enemy, dmg)
zapEffect(self, enemy)
return dmg
end,
die = function(self, cause)
local deco = {
    kind="Deco",
    object_desc="BrokenChest"
    }
RPD.createLevelObject(deco,self:getPos())
self:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.UP, 6 )
end
}
