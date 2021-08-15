--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local wand = require "scripts/lib/wand"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local TIME_TO_ZAP = 1

return wand.init{ 
    desc  = function()  
        return {
           image     = 13,
            name      = RPD.StringsManager:maybeId("DragonWand_Name"),
            info      = RPD.StringsManager:maybeId("DragonWand_Info"),
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
item:getUser():spend(TIME_TO_ZAP)
RPD.Dungeon.level:addScriptedActor(RPD.new(RPD.Objects.Actors.ScriptedActor,"scripts/actors/Burn"))
end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "none"
end,

getMana = function()
return 10
end,

getManaMes = function()
return RPD.StringsManager:maybeId("No_Mana")
end
}
