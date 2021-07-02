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
           image     = 5,
            name      = "Жезл землятресения",
            info      = "При использовании этот жезл вызовет землетрясение в указанной области. Цена 15 маны."
        }
end, 

    activate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Rock")

        RPD.permanentBuff(item:getUser(), "Rock")

    end,

    deactivate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Rock")
    end,

castOnCell = function(self, thisItem, cell,dst,lvl)

local l = thisItem:level()

RPD.playSound( "snd_zap.mp3" )
RPD.playSound( "snd_rocks.mp3" )
--RPD.zapEffect(thisItem:getUser():getPos(),dst,"Bombardo")
EPD.ZapWand("WandOfSlowness",thisItem:level(),thisItem:getUser(),dst)
RPD.topEffect(dst,"BombardoCenter")
local level = RPD.Dungeon.level
        local x = level:cellX(dst)
        local y = level:cellY(dst)
        for i = x - 1-l, x + 1+l do
            for j = y - 1-l, y + 1+l do
            local pos = level:cell(i,j)
 local soul =  RPD.Actor:findChar(pos)
            if soul then 
RPD.affectBuff(soul, RPD.Buffs.Paralysis , 10*(l+1))
        soul:damage(RPD.Dungeon.depth+(l*2), thisItem:getUser())
if not level.solid[pos] then
RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.Speck:factory( RPD.Sfx.Speck.ROCK), 0.1,1);
end
else
if not level.solid[pos] then
RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.Speck:factory( RPD.Sfx.Speck.ROCK),math.random(1,3)*0.1,1);
end
end
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
return 15
end,

getManaMes = function()
return "-- не хватает маны"
end
}