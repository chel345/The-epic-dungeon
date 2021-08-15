--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"


return item.init{
    desc  = function ()
        return {
           image     = 19,
            imageFile = "items/ArtifactsMod.png",
            name      = RPD.StringsManager:maybeId("Test8_Name"),
            info      = RPD.StringsManager:maybeId("Test8_Info"),
            stackable = true,
            upgradable    = false,
 
             price     = 30,
defaultAction = RPD.Actions.drink
        }
    end, 
    actions = function() return {RPD.Actions.drink} end,
execute = function(self, item, user, action)
if action == RPD.Actions.drink then
item:getUser():spend(1)
local hero = RPD.Dungeon.hero
hero:getSprite():showStatus( 0xFF0000, RPD.StringsManager:maybeId("Stats_1"))
hero:getSprite():showStatus( 0x81ff2f, RPD.StringsManager:maybeId("Stats_2"))
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
