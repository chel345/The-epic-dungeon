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
           image     = 3,
            imageFile = "items/Shards.png",
            name      = "Осколок",
            info      = "Осколок призматического кристалла. В нём мелькают магические лучи.",
            stackable = false,
            upgradable    = false,
             price     = 50
        }
    end,
    actions = function() return {RPD.Actions.zap} end,

    cellSelected = function(self, thisItem, action, cell)
        if action == RPD.Actions.zap then 
        local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)

       RPD.zapEffect(thisItem:getUser():getPos(), dst, "Ice")
            RPD.placePseudoBlob( RPD.PseudoBlobs.Freezing, dst)
 
end
thisItem:detach(RPD.Dungeon.hero:getBelongings().backpack) 
end,
    execute = function(self, item, hero, action)
        if action == RPD.Actions.zap then
            item:selectCell( RPD.Actions.zap ,"Выбирете клетку")
        end
end
}
