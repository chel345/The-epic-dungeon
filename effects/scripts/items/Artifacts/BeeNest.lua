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
            image     = 11,
            imageFile = "items/ArtifactsMod.png",
            name      = RPD.StringsManager:maybeId("BeeNest_Name"),
            info      = RPD.StringsManager:maybeId("BeeNest_Info"),
            stackable = true,
            price     = 15
        }
    end,
    onThrow = function(self, item, cell)
        local level = RPD.Dungeon.level

        if level.map[cell] then
            local mob = RPD.mob("BeeFromNest")
            mob:setPos(cell)
            level:spawnMob(mob)
        else
            item:dropTo(cell)
        end
    end
}
