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
            imageFile = "RunicSkull2.png",
            name      = RPD.textById("IceRunicSkull_2_Name"),
            info      = RPD.textById("IceRunicSkull_2_Info"),
            stackable = true,
            price     = 150
        }
    end,
    onThrow = function(self, item, cell)
        local level = RPD.Dungeon.level

        if level.map[cell] then
            local mob = RPD.MobFactory:mobByName("RunicSkull2")
            mob:setPos(cell)
      level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))     
        else
            item:dropTo(cell)
        end
    end
}
