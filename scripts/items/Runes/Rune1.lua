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
            image         = 0,
            imageFile     = "items/Runes.png",
            name          = RPD.textById("RuneOfFlock_Name"),
            info          = RPD.textById("RuneOfFlock_Info"),
            stackable     = true,
            defaultAction = RPD.textById("Activate"),
            price         = 50,
            upgradable    = true
        }
    end,
    actions = function() return {RPD.textById("Activate")} end,

    cellSelected = function(self, thisItem, action, cell,item)
thisItem:detach(RPD.Dungeon.hero:getBelongings().backpack) 

        if action == RPD.textById("Activate") then 
local wand = RPD.ItemFactory:itemByName("WandOfFlock")
wand:mobWandUse(thisItem:getUser(), cell)
thisItem:getUser():spend(1)
for i = 1, thisItem:level() do
local wand = RPD.ItemFactory:itemByName("WandOfFlock")
wand:mobWandUse(thisItem:getUser(), cell)

end

end
end,
    execute = function(self, item, hero, action)
        if action == RPD.textById("Activate") then
            item:selectCell( RPD.textById("Activate") ,RPD.textById("Select_A_Cage"))
        end
end,
  bag = function(self, item)
        return "ScrollHolder"
    end

}
