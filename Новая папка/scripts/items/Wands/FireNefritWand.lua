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
            info      = "При использовании этот жезл начнёт начнёт кристализировать окружающую среду."
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

RPD.glog(tostring(self).." "..tostring(thisItem).." "..tostring(cell).." "..tostring(dst)..tostring(lvl))

end,

cast = function(self,item,lvl)
RPD.glog(tostring(item).." "..tostring(lvl))
end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "cell"
end,

getMana = function()
return 10000
end,

getManaMes = function()
return "-- test"
end
}