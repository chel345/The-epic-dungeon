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
           image     = 2,
            imageFile = "items/Shards.png",
            name      = RPD.StringsManager:maybeId("BlackShard_Name"),
            info      = RPD.StringsManager:maybeId("BlackShard_Info"),
            stackable = false,
            upgradable    = false,
             price     = 50
        }
    end,
    actions = function() return {RPD.Actions.zap} end,

    cellSelected = function(self, thisItem, action, cell)
        if action == RPD.Actions.zap then 
local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)
thisItem:getUser():spend(1)
       RPD.zapEffect(thisItem:getUser():getPos(), dst, "Shadow")
            RPD.placeBlob( 
RPD.Blobs.ToxicGas, dst, 50)
end
thisItem:detach(RPD.Dungeon.hero:getBelongings().backpack) 
end,
    execute = function(self, item, hero, action)
        if action == RPD.Actions.zap then
            item:selectCell( RPD.Actions.zap ,RPD.StringsManager:maybeId("Select_A_Cage"))
        end
end
}
