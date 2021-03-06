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
           image     = 2,
            imageFile = "items/ArtifactsMod.png",
            name      = RPD.StringsManager:maybeId("HeardOfFire_Name"),
            info      = RPD.StringsManager:maybeId("HeardOfFire_Info"),
            stackable = true,
            upgradable    = false,
 
             price     = 50,
            isArtifact    = true
        }
    end,   
activate = function(self, item, hero)
if RPD.Dungeon.hero ~= nil then
self.data.activationCount = (self.data.activationCount or 0) + 1
        RPD.permanentBuff(RPD.Dungeon.hero, "FireBless")
end
     end,

deactivate = function(self, item, hero)
        RPD.removeBuff(RPD.Dungeon.hero, "FireBless")
    end
}