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
           image     = 16,
            name      = "Жезл тьмы",
            info      = "При использовании этот жезл создаст облако тьмы. Цена 20 маны."
        }
end, 

activate = function(self, item, hero)
end,

deactivate = function(self, item, hero)
end,

castOnCell = function(self, thisItem, cell,tcell,l)

if thisItem:isEquipped(RPD.Dungeon
.hero) then
local dst = thisItem:getUser():getPos()
local level = RPD.Dungeon.level
        local x = level:cellX(dst)
        local y = level:cellY(dst)
        for i = x - 1, x + 1 do
     for j = y - 1, y + 1 do
            local pos = level:cell(i,j)
 local soul =  RPD.Actor:findChar(pos)
            if soul and soul ~= RPD.Dungeon.hero then 
 RPD.affectBuff(soul, RPD.Buffs.Slow , 30*(l+1));
RPD.affectBuff(soul, RPD.Buffs.Poison , 30*(l+1));
RPD.affectBuff(soul, RPD.Buffs.Vertigo , 25*(l+1));
soul:getSprite():emitter():start(RPD.Sfx.ShadowParticle.CURSE, 0.02,4)
if not level.solid[pos] then
RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.ShadowParticle.UP, 0.02, 20)
end
else
if not level.solid[pos] then
RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.ShadowParticle.UP, 0.02, 20)
end
end
end
end

end

local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)
local enemy = RPD.Actor:findChar(dst)
local l = thisItem:level()

RPD.playSound( "snd_badge.mp3" )

RPD.zapEffect(thisItem:getUser():getPos(),dst,"Shadow")
local level = RPD.Dungeon.level
        local x = level:cellX(dst)
        local y = level:cellY(dst)
        for i = x - 1-l, x + 1+l do
            for j = y - 1-l, y + 1+l do
            local pos = level:cell(i,j)
 local soul =  RPD.Actor:findChar(pos)
            if soul then 
 RPD.affectBuff(soul, RPD.Buffs.Slow , 30*(l+1));
RPD.affectBuff(soul, RPD.Buffs.Poison , 30*(l+1));
RPD.affectBuff(soul, RPD.Buffs.Vertigo , 25*(l+1));
soul:getSprite():emitter():start(RPD.Sfx.ShadowParticle.CURSE, 0.02,4)
if not level.solid[pos] then
RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.ShadowParticle.UP, 0.02, 20)
end
else
if not level.solid[pos] then
RPD.Sfx.CellEmitter:get(pos):start(RPD.Sfx.ShadowParticle.UP, 0.02, 20)
end
end
end
end

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
return 20
end,

getManaMes = function()
return "-- не хватает маны"
end
}