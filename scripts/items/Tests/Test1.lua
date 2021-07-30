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
            imageFile = "MagicEye.png",
            name      = "MobTest",
            info      = "С помощью этой штуки ты сможешь призвать кристалл, который будет сражаться на твоей стороне.",
            stackable = true,
            price     = 10
        }
    end,
    onThrow = function(self, item, cell)
        local level = RPD.Dungeon.level

        if level.map[cell] then
            local mob = RPD.MobFactory:mobByName("CrystalGuard")
            mob:setPos(cell)
      level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero)) 

        else
            item:dropTo(cell)
        end
    end
}
