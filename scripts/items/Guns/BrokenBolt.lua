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
            image     = 4,
            imageFile = "items/Guns.png",
            name      = RPD.textById("BrokenBolt_Name"),
            info      = RPD.textById("BrokenBolt_Info"),
            stackable = true,
            price     = 1
        }
    end
}
