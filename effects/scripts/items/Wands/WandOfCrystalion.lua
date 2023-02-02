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
           image     = 3,
            name      = RPD.StringsManager:maybeId("WandOfCrystalion_Name"),
            info      = RPD.StringsManager:maybeId("WandOfCrystalion_Info")
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
thisItem:getUser():spend(1)
local maybeMob = RPD.Actor:findChar(dst)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero then 
RPD.playSound( "snd_degrade.ogg" )
RPD.topEffect(dst,"smash_blast")
maybeMob:damage(RPD.Dungeon.depth*(lvl+1), thisItem:getUser())
end
end,

bag = function(self, item)
return "WandHolster"
end,

selectType = function()
return "cell"
end,

getMana = function()
return 5
end,

getManaMes = function()
return RPD.StringsManager:maybeId("No_Mana")
end
}
