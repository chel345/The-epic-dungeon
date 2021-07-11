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
            image     = 3,
            imageFile = "items/Guns.png",
            name      = "Патрон",
            info      = "Стальной шарик оазмером с небольшой флакончик с зельем. Он отлично подойдёт для стрельбы из любого оружия.",
            stackable = true,
            price     = 15
        }
    end
}
