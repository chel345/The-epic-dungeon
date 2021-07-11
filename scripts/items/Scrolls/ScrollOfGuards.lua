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
           image     = math.random(0,11),
            imageFile = "items/Scrolls.png",
            name          = "Свиток Стражей",
            info          = "При использовании этот свиток создаст несколько статуй рядом с героем. Количество зависит от глубины.",
            stackable     = true,
            defaultAction = "Scroll_ACRead",
            price         = 50
        }
    end,
    actions = function() return {RPD.Actions.read} end,
    execute = function(self, item, hero, action, cause )
RPD.Dungeon.hero:spend(TIME_TO_READ)
RPD.playSound( "snd_read.mp3")
        if action == RPD.Actions.read then
local mobs = {
 "Statue",
"ArmoredStatue"
}
        local level = RPD.Dungeon.level

item:detach(RPD.Dungeon.hero:getBelongings().backpack) 
            local mob = RPD.MobFactory:mobByName(mobs[math.random(1,2)])

        local x = level:cellX(cell)
        local y = level:cellY(cell)
        for i = x - hero:lvl(), x + hero:lvl() do
            for j = y - hero:lvl(), y + hero:lvl() do
            local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero));
    end
  end
 end 
end
end,
bag = function(self, item)
        return "ScrollHolder"
    end



}
