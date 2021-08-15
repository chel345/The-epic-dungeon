--
-- User: mik
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"

return item.init{
    desc  = function ()
        return {
           image     = 0,
            imageFile = "items/Shards.png",
            name      = RPD.StringsManager:maybeId("Shard_Name"),
            info      = RPD.StringsManager:maybeId("Shard_Info"),
            stackable = false,
            upgradable    = false,
             price     = 50
          }
    end,
    burn   = function() return RPD.ItemFactory:itemByName("Shards/FireShard") end,
    freeze = function() return RPD.ItemFactory:itemByName("Shards/IceShard") end,
    poison = function() return RPD.ItemFactory:itemByName("Shards/BlackShard") end
}
