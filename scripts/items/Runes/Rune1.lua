--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"

local hero = RPD.Dungeon.hero
return item.init{
    desc  = function ()
        return {
            image         = 0,
            imageFile     = "items/Runes.png",
            name          = RPD.StringsManager:maybeId("RuneOfFlock_Name"),
            info          = RPD.StringsManager:maybeId("RuneOfFlock_Info"),
            stackable     = true,
            defaultAction = RPD.StringsManager:maybeId("Activate"),
            price         = 50,
            upgradable    = true
        }
    end,
    actions = function() return {RPD.StringsManager:maybeId("Activate")} end,

    cellSelected = function(self, thisItem, action, cell,item)
thisItem:detach(RPD.Dungeon.hero:getBelongings().backpack) 

        if action == RPD.StringsManager:maybeId("Activate") then 
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
        if action == RPD.StringsManager:maybeId("Activate") then
            item:selectCell( RPD.StringsManager:maybeId("Activate") ,RPD.StringsManager:maybeId("Select_A_Cage"))
        end
end,
  bag = function(self, item)
        return "ScrollHolder"
    end

}
