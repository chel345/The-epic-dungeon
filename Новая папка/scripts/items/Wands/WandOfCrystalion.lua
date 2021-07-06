--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local wand = require "scripts/lib/wand"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

return wand.init{ 
    desc  = function()  
        return {
           image     = 3,
            name      = "Жезл кристализации",
            info      = "При использовании этот жезл начнёт начнёт кристализировать окружающую среду. Цена 10 маны."
        }
end, 

activate = function(self, item, hero)
RPD.removeBuff(hero, RPD.Buffs.Light)
RPD.permanentBuff(hero, RPD.Buffs.Light)
end,

deactivate = function(self, item, hero)
RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
end,

castOnCell = function(self, thisItem, cell,dst,lvl)

for i = 1,RPD.Dungeon.level:getLength()-1 do                local maybeMob = RPD.Actor:findChar(dst)          
if maybeMob and RPD.Dungeon.level.fieldOfView[i] and maybeMob ~= RPD.Dungeon.hero then 
RPD.playSound( "snd_degrade.ogg" )
RPD.topEffect(dst,"smash_blast")
maybeMob:damage(RPD.Dungeon.depth*(lvl+1), thisItem:getUser())
break
end
end

end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "cell"
end,

getMana = function()
return 10
end,

getManaMes = function()
return "-- не хватает маны"
end
}