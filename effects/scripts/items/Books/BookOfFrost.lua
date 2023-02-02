--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"

local hero = RPD.Dungeon.hero

local level = RPD.Dungeon.level

return item.init{
    desc  = function ()
        return {
           image     = 1,
            imageFile = "items/BooksInCityLibrary.png",
            name          = RPD.StringsManager:maybeId("BookOfFrost_Name"),
            info          = RPD.StringsManager:maybeId("BookOfFrost_Info"),
            stackable     = true,
            defaultAction = "Scroll_ACRead",
            price         = 50
        }
    end,
    actions = function() return {RPD.StringsManager:maybeId("IceArrow"),RPD.StringsManager:maybeId("CraftIceItem"),RPD.StringsManager:maybeId("SummonIcyEssence")} end,
cellSelected = function(self, thisItem, action, cell)
        if action == RPD.StringsManager:maybeId("IceArrow") then 
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
        if action == RPD.StringsManager:maybeId("IceArrow") then
            item:selectCell( RPD.StringsManager:maybeId("IceArrow") , RPD.StringsManager:maybeId("Select_A_Cage"))
end
        if action == RPD.StringsManager:maybeId("CraftIceItem") then
local IceItems = {
"IceWand",
"NefritWand",
"RingOfFrost",
"WandOfIcebolt"
}
RPD.Dungeon.level:drop( RPD.ItemFactory:itemByName(IceItems[math.random(1,4)]), hero:getPos())
end
    if action == RPD.StringsManager:maybeId("SummonIcyEssence") then
 local mobs = {
"IceElemental",
"IceNefrit",
"IceGaurdian",
"ColdSpirit"
}
        local level = RPD.Dungeon.level
            local mob = RPD.mob(mobs[math.random(1,4)])
            local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero));
    end
  end
end
}
