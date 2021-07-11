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
            imageFile = "items/PotionsMod.png",
            name      = "Зелье теней",
            info      = "Точно не известно как работает это зелье и как его сварить.",
            stackable = true,
            upgradable    = true,
 
             price     = 30,
defaultAction = RPD.Actions.drink
        }
    end, 
    actions = function() return {RPD.Actions.drink} end,
    execute = function(self, item, hero, action)
        if action == RPD.Actions.drink then
RPD.Buffs.Buff:affect(hero, RPD.Buffs.Poison, 10)
item:detach(RPD.Dungeon.hero:getBelongings().backpack) 
        end
    end,
    onThrow = function(self, item, cell)
        local level = RPD.Dungeon.level
        local hero = RPD.Dungeon.hero
        if level.map[cell] then
        RPD.placeBlob( RPD.Blobs.Foliage, cell,         (item:level()+1)*60 );

        end
    end,
      bag = function(self, item)
        return "PotionBelt"
    end

}
