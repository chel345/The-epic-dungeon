--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"


return item.init{
    desc  = function ()
        return {
            image         = 11,
            imageFile     = "items/food.png",
            name          = "Индейка",
            info          = "Гигантский кусок индейки.",
            stackable     = true,
            defaultAction = "Food_ACEat",
            price         = 10
        }
    end,
    actions = function() return {RPD.Actions.eat} end,
    execute = function(self, item, hero, action)
        if action == RPD.Actions.eat then
            hero:eat(item,RPD.Buffs.Hunger.STARVING, "Вкусно!")
        end
    end 
}