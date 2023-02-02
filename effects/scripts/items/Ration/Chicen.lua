--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"


return item.init{
    desc  = function ()
        return {
            image         = 11,
            imageFile     = "items/food.png",
            name          = RPD.StringsManager:maybeId("Chicen_Name"),
            info          = RPD.StringsManager:maybeId("Chicen_Info"),
            stackable     = true,
            defaultAction = "Food_ACEat",
            price         = 10
        }
    end,
    actions = function() return {RPD.Actions.eat} end,
    execute = function(self, item, hero, action)
        if action == RPD.Actions.eat then
            hero:eat(item,RPD.Buffs.Hunger.STARVING, RPD.StringsManager:maybeId("Delicious"))
        end
    end 
}