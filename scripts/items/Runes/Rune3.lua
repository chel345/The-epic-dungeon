--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local hero = RPD.Dungeon.hero
return item.init{
    desc  = function ()
        return {
            image         = 0,
            imageFile     = "items/Runes.png",
            name          = "Руна светового патрона",
            info          = "Эта руна мигает тёмно-фиолетовым цветом. На ней имеются искусстно вырезанные заклятья. При использовании эта руна создаст мощный луч энергии в определённом направлении.",
            stackable     = true,
            defaultAction = "Wand_ACZap",
            price         = 50,
            upgradable    = true
        }
    end,
    actions = function() return {"АКТИВИРОВАТЬ"} end,

    cellSelected = function(self, thisItem, action, cell,item)
thisItem:detach(RPD.Dungeon.hero:getBelongings().backpack) 

        if action == "АКТИВИРОВАТЬ" and cell ~= nil then

local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)
local enemy = RPD.Actor:findChar(dst)
if enemy then
RPD.affectBuff(enemy, RPD.Buffs.Light , 10*thisItem:level())
RPD.affectBuff(enemy, RPD.Buffs.Vertigo , 10*thisItem:level())
enemy:damage(RPD.Dungeon.depth*math.random(1,RPD.Dungeon.hero:magicLvl()),thisItem:getUser())
enemy:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.UP, 8 )
RPD.zapEffect( thisItem:getUser():getPos(), enemy:getPos(), "DeathRay")
else
RPD.zapEffect( thisItem:getUser():getPos(), dst, "DeathRay")
end

end
end,
    execute = function(self, item, hero, action)
        if action == "АКТИВИРОВАТЬ" then
            item:selectCell( "АКТИВИРОВАТЬ" ,"Выбирите клетку.")
        end
end,
  bag = function(self, item)
        return "ScrollHolder"
    end

}
