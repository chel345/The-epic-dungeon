--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 
act       = function(me, ai, e)
if me:getPos() ~= 176 then
RPD.Sfx.MagicMissile:whiteLight(me:getSprite():getParent(),me:getPos(),176,nil)
me:move(176)
me:getSprite():move(me:getPos(),176,false)
me:getSprite():emitter():start(RPD.Sfx.Speck:factory( RPD.Sfx.Speck.LIGHT), 0.1,3);
RPD.playSound( "snd_zap.ogg" )
end

for i = 1, RPD.Dungeon.level:getLength()-1 do
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:ht() == 3500 then
local dst = RPD.Ballistica:cast(me:getPos(),i-1,true,true,true)
local damager = RPD.Actor:findChar(dst)
RPD.Sfx.MagicMissile:purpleLight(me:getSprite():getParent(),me:getPos(),dst,nil)
if damager then
damager:damage(math.random(30,70),me)
end
me:getSprite():zap(dst)
RPD.playSound( "snd_zap.ogg" )
end
end
end,
interact = function(self,chr)
for i = 1, RPD.Dungeon.level:getLength()-1 do
local maybeMob = RPD.Actor:findChar(i)        
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:ht() == 76 then
break
end
if i == RPD.Dungeon.level:getLength()-2 then
if bttt == nil then
bttt = 1
local EPD = require "scripts/lib/dopClasses"

EPD.showQuestWindow(self,RPD.StringsManager:maybeId("BattleWarlok_Phrase1"))
RPD.Dungeon.level:drop(RPD.ItemFactory:itemByName("ArmorKit"),chr:getPos())
else
local EPD = require "scripts/lib/dopClasses"

EPD.showQuestWindow(self,RPD.StringsManager:maybeId("BattleWarlok_Phrase2"))

end
end
end
end
  })


