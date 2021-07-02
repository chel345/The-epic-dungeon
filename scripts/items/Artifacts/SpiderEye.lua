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
           image     = 20,
            imageFile = "items/ArtifactsMod.png",
            name      = "Глаз паука",
            info      = "Мерзость.",
            stackable = true,
            upgradable    = true,
 
             price     = 30
        }
    end
}
