--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

return actor.init({
    activate = function()
RPD.Dungeon.level:drop(RPD.item("PotionOfStrength"),55).type = RPD.Heap.Type.CRYSTAL_CHEST
RPD.GameScene:updateMap(55)
RPD.GameScene:updateMap(55)
RPD.Dungeon.level:drop(RPD.item("PotionOfHealing"),75).type = RPD.Heap.Type.CRYSTAL_CHEST
RPD.GameScene:updateMap(75) 
RPD.GameScene:updateMap(75)
RPD.Dungeon.level:drop(RPD.item("ScrollOfWeaponUpgrade"),77).type = RPD.Heap.Type.CRYSTAL_CHEST
RPD.GameScene:updateMap(77)
RPD.GameScene:updateMap(77)
RPD.Dungeon.level:drop(RPD.item("Ration"),58).type = RPD.Heap.Type.CRYSTAL_CHEST
RPD.GameScene:updateMap(58)
RPD.GameScene:updateMap(58)
return true
end,
    actionTime = function()
        return 1
    end,
act = function()
return true
end
})
