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
            imageFile = "items/ArtifactsMod.png",
            name      = "Звезда ада",
            info      = "В этой звезде заключены души грешников.",
            stackable = false,
            price     = 10
        }
    end
}
