--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"
local shields = require "scripts/lib/shields"
local EPD = require "scripts/lib/dopClasses"


return item.init{
 desc  = function ()
        return {
           image     = 6,
            imageFile = "items/BooksInCityLibrary.png",
            name      = RPD.StringsManager:maybeId("SummonersBook_Name"),
            info      = RPD.StringsManager:maybeId("SummonersBook_Info"),
            stackable = false,
            upgradable    = true,
         equipable     = "left_hand",
             price     = 200,
         --   isArtifact    = true,
              defaultAction = RPD.StringsManager:maybeId("Action_Use")
        }
    end,   
    actions = function(self, item,  hero)
        if item:isEquipped(hero) then
            return {RPD.StringsManager:maybeId("Action_Use")}
        end
    end,
        cellSelected = function(self, thisItem, action, cell)
        if action == RPD.StringsManager:maybeId("Action_Use") then
thisItem:getUser():spend(2)
EPD.Klak(cell,RPD.Dungeon.depth*(thisItem:level()+1),RPD.Dungeon.depth*(thisItem:level()+10),thisItem:getUser(),10-RPD.Dungeon.hero:magicLvl(),math.random(1,RPD.Dungeon.hero:lvl()),true)
end
end,
    execute = function(self, item, hero, action)
        if action == RPD.StringsManager:maybeId("Action_Use") then
            item:selectCell(RPD.StringsManager:maybeId("Action_Use"),RPD.StringsManager:maybeId("Select_A_Cage"))
        end
    end

}
