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
           image     = 1,
            imageFile = "items/BooksInCityLibrary.png",
            name          = "Книга льда",
            info          = "Эта книга веет хлодом, который чуть-чуть отмараживает руки. Книга написана на древнем языке кобольтов, но ты можешь прочесть некоторые заклятья.",
            stackable     = true,
            defaultAction = "Scroll_ACRead",
            price         = 50
        }
    end,
    actions = function() return {"Ледяная стрела","Создать ледяной предмет","Призвать ледяную сущность"} end,
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
        if action == "Создать ледяной предмет" then
local IceItems = {
"IceWand",
"NefritWand",
"RingOfFrost",
"WandOfIcebolt"
}
RPD.Dungeon.level:drop( RPD.ItemFactory:itemByName(IceItems[math.random(1,4)]), hero:getPos())
end
    if action == "Призвать ледяную сущность" then
 local mobs = {
"IceElemental",
"IceNefrit",
"IceGaurdian",
"ColdSpirit"
}
        local level = RPD.Dungeon.level
            local mob = RPD.MobFactory:mobByName(mobs[math.random(1,4)])
            local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero));
    end
  end
end
}
