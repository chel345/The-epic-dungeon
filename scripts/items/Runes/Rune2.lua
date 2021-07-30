--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local hero = RPD.Dungeon.hero
return item.init{
    desc  = function ()
        return {
            image         = 1,
            imageFile     = "items/Runes.png",
            name          = RPD.textById("RuneOfProtectiveField_Name"),
            info          = RPD.textById("RuneOfProtectiveField_Info"),
            stackable     = true,
            defaultAction = RPD.textById("Activate"),
            price         = 50,
            upgradable    = true
        }
    end,
    actions = function() return {RPD.textById("Activate")} end,

    execute = function(self, item, hero, action)
        if action == RPD.textById("Activate") then 
item:getUser():spend(1)
   RPD.affectBuff(RPD.Dungeon.hero, "LightShild" , 10+item:level())
   item:detach(RPD.Dungeon.hero:getBelongings().backpack)
        end
end,
  bag = function(self, item)
        return "ScrollHolder"
    end

}
