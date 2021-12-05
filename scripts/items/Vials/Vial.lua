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
            image     = 0,
            imageFile = "items/TrapVials.png",
            name      = RPD.StringsManager:maybeId("Vial_Name"),
            info      = RPD.StringsManager:maybeId("Vial_Desc"),
            stackable = true,
            price     = 20
        }
    end,
    onThrow = function(self, item, cell, thrower)
        local level = RPD.Dungeon.level
        if level.map[cell] == RPD.Terrain.LIGHTNING_TRAP then
        		RPD.item("Vials/LightingVial"):dropTo(cell)
        		level:set(cell, RPD.Terrain.INACTIVE_TRAP)
        		RPD.GameScene:updateMap(cell)
        		return
        elseif level.map[cell] == RPD.Terrain.FIRE_TRAP then
        		RPD.item("Vials/FireVial"):dropTo(cell)
        		level:set(cell, RPD.Terrain.INACTIVE_TRAP)
        		RPD.GameScene:updateMap(cell)
        		return
        elseif level.map[cell] == RPD.Terrain.POISON_TRAP then
        		RPD.item("Vials/PoisonVial"):dropTo(cell)
        		level:set(cell, RPD.Terrain.INACTIVE_TRAP)
        		RPD.GameScene:updateMap(cell)
        		return
        elseif level.map[cell] == RPD.Terrain.TOXIC_TRAP then
        		RPD.item("Vials/ToxicVial"):dropTo(cell)
        		level:set(cell, RPD.Terrain.INACTIVE_TRAP)
        		RPD.GameScene:updateMap(cell)
        		return
        elseif level.map[cell] == RPD.Terrain.ALARM_TRAP then
        		RPD.item("Vials/ParalysisVial"):dropTo(cell)
        		level:set(cell, RPD.Terrain.INACTIVE_TRAP)
        		RPD.GameScene:updateMap(cell)
        		return
        	elseif level.map[cell] == RPD.Terrain.SUMMONING_TRAP then
        		RPD.item("Vials/SummonVial"):dropTo(cell)
        		level:set(cell, RPD.Terrain.INACTIVE_TRAP)
        		RPD.GameScene:updateMap(cell)
        		return
        	elseif level.map[cell] == RPD.Terrain.GRIPPING_TRAP then
        		RPD.item("Vials/GrippingVial"):dropTo(cell)
        		level:set(cell, RPD.Terrain.INACTIVE_TRAP)
        		RPD.GameScene:updateMap(cell)
        		return
        end

        item:dropTo(cell)
    end
}
