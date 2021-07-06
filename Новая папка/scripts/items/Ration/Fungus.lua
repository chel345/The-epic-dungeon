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
            image     = 0,
            imageFile = "items/FoodMod.png",
            name      = "Нарост",
            info      = "Может вызвать отравление",
            stackable = true,
            defaultAction = "Food_ACEat",
            price         = 7
        }
    end,
    actions = function() return {RPD.Actions.eat} end,
    execute = function(self, item, hero, action)
if action == RPD.Actions.eat then
local hero = RPD.Dungeon.hero
hero:eat(item,RPD.Buffs.Hunger.HUNGRY,"RawFish_Taste")
if math.random(1,4) == 1 then
RPD.affectBuff(hero, RPD.Buffs.Poison , 5)
end
        end
    end
}
