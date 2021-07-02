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
           image     = 13,
            name      = "Жезл дракона",
            info      = "При использовании этот жезл наложит на уровень проклятье огня. Цена 50 маны.",
equipable = ""
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
RPD.Dungeon.level:addScriptedActor(RPD.new(RPD.Objects.Actors.ScriptedActor,"scripts/actors/Burn"))
end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "none"
end,

getMana = function()
return 50
end,

getManaMes = function()
return "-- не хватает маны"
end
}