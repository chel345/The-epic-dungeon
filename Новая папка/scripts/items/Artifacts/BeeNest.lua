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
            image     = 11,
            imageFile = "items/ArtifactsMod.png",
            name      = "Пчелинное гнездо",
            info      = "В нём лежит гиганская пчола!",
            stackable = true,
            price     = 15
        }
    end,
    onThrow = function(self, item, cell)
        local level = RPD.Dungeon.level

        if level.map[cell] then
            local mob = RPD.MobFactory:mobByName("BeeFromNest")
            mob:setPos(cell)
            level:spawnMob(mob)
        else
            item:dropTo(cell)
        end
    end
}
