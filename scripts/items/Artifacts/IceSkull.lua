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
           image     = 8,
            imageFile = "items/ArtifactsMod.png",
            name      = RPD.textById("IceSkull_Name"),
            info      = RPD.textById("IceSkull_Info"),
            stackable = false,
            upgradable    = false,
            isArtifact    = true,
            price     = 0
             }
    end,   

activate = function(self, item, hero)
if RPD.Dungeon.hero ~= nil then
self.data.activationCount = (self.data.activationCount or 0) + 1
        RPD.permanentBuff(RPD.Dungeon.hero, "IceSkull")
end
     end,

deactivate = function(self, item, hero)
        RPD.removeBuff(RPD.Dungeon.hero, "IceSkull")
    end
}