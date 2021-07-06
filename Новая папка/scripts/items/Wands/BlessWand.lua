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
            image         = 21,
            imageFile     = "items/wands_remastered.png",
            name      = "Жезл света",
            info      = "Подобный жезл ты видел у епископа. Цена 5 маны."
        }
end, 

activate = function(self, item, hero)
end,

deactivate = function(self, item, hero)
end,

castOnCell = function(self, thisItem, cell,dsty,l)

if thisItem:isEquipped(RPD.Dungeon
.hero) then
local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)
local level = RPD.Dungeon.level
        local x = level:cellX(dst)
        local y = level:cellY(dst)
        for i = x - 1, x + 1 do
     for j = y - 1, y + 1 do
            local pos = level:cell(i,j)
 local soul =  RPD.Actor:findChar(pos)
            if soul and soul ~= RPD.Dungeon.hero then 
 RPD.affectBuff(soul, RPD.Buffs.Blessed , 30*(thisItem:level()+1));
if not level.solid[pos] then
     RPD.Sfx.CellEmitter:get(pos):burst( RPD.Sfx.ShaftParticle.FACTORY, 5)
end
else
if not level.solid[pos] then
     RPD.Sfx.CellEmitter:get(pos):burst( RPD.Sfx.ShaftParticle.FACTORY, 5)
end
end
end
end

end

local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)
local lvl = thisItem:level()

                local soul =  RPD.Actor:findChar(dst)
                if soul then
        RPD.affectBuff(soul, RPD.Buffs.Blessed , 50*(lvl+1));
        soul:getSprite():emitter():burst( RPD.Sfx.ShaftParticle.FACTORY, 5)
   else
     RPD.Sfx.CellEmitter:get(dst):burst( RPD.Sfx.ShaftParticle.FACTORY, 5)
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
return 5
end,

getManaMes = function()
return "-- Не хватает маны"
end
}