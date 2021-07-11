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
           image     = 19,
            imageFile = "items/ArtifactsMod.png",
            name      = "Тест #8",
            info      = "Это странное зелье обранил алхимик. На нём имеется надпись 'тест номер 8'.",
            stackable = true,
            upgradable    = false,
 
             price     = 30,
defaultAction = RPD.Actions.drink
        }
    end, 
    actions = function() return {RPD.Actions.drink} end,
execute = function(self, item, user, action)
if action == RPD.Actions.drink then
local hero = RPD.Dungeon.hero
hero:getSprite():showStatus( 0xFF0000, "-5 здоровье")
hero:getSprite():showStatus( 0x81ff2f, "+1 сила")
if hero:hp() == hero:ht() then
hero:hp(hero:hp()-5)
end
hero:ht(hero:ht()-5)
hero:STR(hero:STR()+1)
item:detach(RPD.Dungeon.hero:getBelongings().backpack)
end
end,
      bag = function(self, item)
        return "PotionBelt"
    end

}
