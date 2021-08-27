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
           image     = 5,
            name      = RPD.StringsManager:maybeId("WandOfRock_Name"),
            info      = RPD.StringsManager:maybeId("WandOfRock_Info")
        }
end, 

    activate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "RockW")

        RPD.permanentBuff(item:getUser(), "RockW")

    end,

    deactivate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "RockW")
    end,

castOnCell = function(self, thisItem, cell,dst,lvl)
thisItem:getUser():spend(TIME_TO_ZAP)
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
return 5
end,

getManaMes = function()
return RPD.StringsManager:maybeId("No_Mana")
end
}
