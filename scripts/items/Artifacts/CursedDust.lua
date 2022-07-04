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
           image     = 15,
            imageFile = "items/artifacts.png",
            name      = RPD.StringsManager:maybeId("CorpseDust_Name"),
            info      = RPD.StringsManager:maybeId("CorpseDust_Info"),
            stackable = false,
            upgradable    = false,
 
             price     = 0
        }
   end
}
