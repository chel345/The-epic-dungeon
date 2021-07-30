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
           image     = 1,
            imageFile = "items/RangedMod.png",
            name      = RPD.textById("Bomb_Name"),
            info      = RPD.textById("Bomb_Info"),
            stackable = true,
            upgradable    = true,
 
             price     = 45
        }
    end,
    onThrow = function(self, item, cell,enemy,dmg,soul)
        local level = RPD.Dungeon.level
        local hero = RPD.Dungeon.hero
        if level.map[cell] then
RPD.playSound( "snd_blast.ogg")
local level = RPD.Dungeon.level
        local x = level:cellX(cell)
        local y = level:cellY(cell)
        for i = x - 1*(item:level()+1), x + 1*(item:level()+1) do
            for j = y - 1*(item:level()+1), y + 1*(item:level()+1) do
local pos = level:cell(i,j)
local soul =  RPD.Actor:findChar(pos)
            if soul then 
RPD.Sfx.CellEmitter:get(pos):burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.STEAM ), 7);
soul:damage(10*(item:level()+1),RPD.Dungeon.hero)
return dmg
else
RPD.Sfx.CellEmitter:get(pos):burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.STEAM ), 7);
              end
        end
    end 
        end
    end,
    bag = function(self, item)
        return "Quiver"
    end,
isFliesStraight = function()
return true
end

}
