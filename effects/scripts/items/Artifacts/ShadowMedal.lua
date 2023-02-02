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
            image     = 24,
            imageFile = "items/ArtifactsMod.png",
            name      = RPD.StringsManager:maybeId("ShadowMedal_Name"),
            info      = RPD.StringsManager:maybeId("ShadowMedal_Desc"),
            stackable = true,
            price     = 100
        }
    end
}
