--
-- User: mike
-- Date: 02.06.2018
-- Time: 20:39
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local spell = require "scripts/lib/spell"

return spell.init{
    desc  = function ()
        return {
            image         = 17,
            imageFile     = "spellsIcons/elemental(new).png",
            name          = RPD.StringsManager:maybeId("NetherFire_Name"),
            info          = RPD.StringsManager:maybeId("NetherFire_Info"),
            magicAffinity = "Elemental",
            targetingType = "cell",
            level         = 3,
            spellCost     = 6,
            castTime      = 2
        }
    end,
    castOnCell = function(self, spell, chr, cell)
local level = RPD.Dungeon.leve
RPD.placeBlob( RPD.Blobs.LiquidFlame , cell, 50*chr:lvl());
RPD.topEffect(cell,"LavaFountain")
return true
   end
}
