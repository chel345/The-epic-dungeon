--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init{
    damage = function(self, cause) 
self:getSprite():emitter():start(RPD.Sfx.Speck:factory( RPD.Sfx.Speck.COIN), 0.1,10);
local item = RPD.ItemFactory:itemByName("Gold")
RPD.Dungeon.level:drop(item,self:getPos())
end,
    move = function(self, cause) 
self:getSprite():emitter():start(RPD.Sfx.Speck:factory( RPD.Sfx.Speck.COIN), 0.1,4);
end
}
