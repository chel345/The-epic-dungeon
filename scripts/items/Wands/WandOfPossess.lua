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
           image     = 8,
            name      = "Жезл одержимости",
            info      = "Имба за 40 маны."
        }
end, 

    activate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Posses")

        RPD.permanentBuff(item:getUser(), "Posses")

    end,

    deactivate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Posses")
    end,

castOnCell = function(self, thisItem, cell,dst,lvl)

local soul =  RPD.Actor:findChar(dst)
if soul and soul ~= RPD.Dungeon.hero  then
soul:setState(RPD.MobAi:getStateByTag("ControlledAi"))
RPD.Mob:makePet(soul, RPD.Dungeon.hero)
            RPD.Dungeon.hero:setControlTarget(soul)
soul:getSprite():emitter():burst( RPD.Sfx.ElmoParticle.FACTORY, 5)
RPD.playSound( "snd_teleport.mp3" )
   else
     RPD.Sfx.CellEmitter:get(dst):burst( RPD.Sfx.ElmoParticle.FACTORY, 5)
     end

end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "cell"
end,

getMana = function()
return 40
end,

getManaMes = function()
return "-- не хватает маны"
end
}