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
            image     = 4,
            imageFile = "items/RunicMaterials.png",
            name      = RPD.StringsManager:maybeId("Quartz_Name"),
            info      = RPD.StringsManager:maybeId("Quartz_Info"),
            stackable = true,
            price     = 15
        }
    end
}
