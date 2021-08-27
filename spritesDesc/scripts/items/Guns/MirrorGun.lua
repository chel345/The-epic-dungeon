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
            imageFile = "items/Guns.png",
            name = RPD.Dungeon.hero:getBelongings().leftHand:name()
            }
    end,
    image = function()
    return RPD.Dungeon.hero:getBelongings().leftHand:image()
    end,
    info = function()
    return RPD.Dungeon.hero:getBelongings().leftHand:info()
    end
}
