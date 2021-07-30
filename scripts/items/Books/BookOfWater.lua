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
            name          = RPD.textById("BookOfWater_Name"),
            info          = RPD.textById("BookOfWater_Info"),
            stackable     = true,
            defaultAction = "Scroll_ACRead",
            price         = 50
        }
    end,
    actions = function() return {RPD.textById("SeaArrow"),RPD.textById("SummonElemental"),RPD.textById("WaterRegeneration")} end,
cellSelected = function(self, thisItem, action, cell)
        if action == RPD.textById("SeaArrow") then 
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
        if action == RPD.textById("SeaArrow") then
            item:selectCell( RPD.textById("SeaArrow") , RPD.textById("Select_A_Cage"))
end

    if action == RPD.textById("SummonElemental") then
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
    if action == RPD.textById("WaterRegeneration") then
RPD.affectBuff(hero,"WaterRegeneration", 10000);
end
end
}
