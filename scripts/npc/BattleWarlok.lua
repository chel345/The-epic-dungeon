--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 

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
end,
    spawn = function(self,me, level)

        RPD.setAi(self,"BattleWarlok")
end
  })


