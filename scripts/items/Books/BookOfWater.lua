--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local hero = RPD.Dungeon.hero

local level = RPD.Dungeon.level

return item.init{
    desc  = function ()
        return {
           image     = 0,
            imageFile = "items/BooksInCityLibrary.png",
            name          = "Книга воды",
            info          = "Эта книга содержит древние знания магов воды... Твой разум способен воплотить лишь малую часть этой силы...",
            stackable     = true,
            defaultAction = "Scroll_ACRead",
            price         = 50
        }
    end,
    actions = function() return {"Ледяная стрела","Призвать елементаля","Водная регенерация"} end,
cellSelected = function(self, thisItem, action, cell)
        if action == "Ледяная стрела" then 
                local soul =  RPD.Actor:findChar(cell)
                if soul then
        RPD.affectBuff(soul, RPD.Buffs.Slow , 10);
        RPD.zapEffect( hero:getPos(), soul:getPos(), "Ice")
    else
    RPD.zapEffect( hero:getPos(), cell, "Ice")
end
end
  end,
    execute = function(self, item, hero, action)
        if action == "Ледяная стрела" then
            item:selectCell( "Ледяная стрела" , "Выберете клетку")
end

    if action == "Призвать елементаля" then
 local mobs = {
"WaterElemental"
}
        local level = RPD.Dungeon.level
            local mob = RPD.MobFactory:mobByName(mobs[1])
            local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero));
    end
  end
    if action == "Водная регенерация" then
RPD.affectBuff(hero,"WaterRegeneration", 10000);
end
end
}
