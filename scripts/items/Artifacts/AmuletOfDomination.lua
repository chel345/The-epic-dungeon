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
           image     = 22,
            imageFile = "items/ArtifactsMod.png",
            name      = "Амулет подчинения",
            info      = "Метни меня во врага.",
            stackable = false,
            price     = 300
        }
end,
onThrow = function(self,item,cell)
local mob = RPD.Actor:findChar(cell)
if mob then
RPD.Mob:makePet(mob,RPD.Dungeon.hero)
if math.random(1,2) == 1 then
item:dropTo(cell)
end
else
item:dropTo(cell)
end
end
}
