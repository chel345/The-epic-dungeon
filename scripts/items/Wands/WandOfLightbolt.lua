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
           image     = 0,
            name      = RPD.StringsManager:maybeId("WandOfLightbolt_Name"),
            info      = RPD.StringsManager:maybeId("WandOfLightbolt_Info")
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
thisItem:getUser():spend(TIME_TO_ZAP)
local enemy = RPD.Actor:findChar(dst)
if enemy then
RPD.affectBuff(enemy, RPD.Buffs.Light , 10*(thisItem:level()+1))
RPD.affectBuff(enemy, RPD.Buffs.Vertigo , 10*(thisItem:level()+1))
enemy:damage(RPD.Dungeon.depth*math.random(1,RPD.Dungeon.hero:magicLvl()),thisItem:getUser())
enemy:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.UP, 8 )
RPD.zapEffect( thisItem:getUser():getPos(), enemy:getPos(), "DeathRay")
else
RPD.zapEffect( thisItem:getUser():getPos(), dst, "DeathRay")
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
