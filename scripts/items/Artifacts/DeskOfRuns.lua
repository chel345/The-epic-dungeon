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
           image     = 21,
            imageFile = "items/ArtifactsMod.png",
            name      = "Табличка с рунами",
            info      = "Вернее часть таблички с рунами.",
            stackable = false,
            upgradable    = false,
 
             price     = 30
        }
    end
}
