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
           image     = math.random(0,11),
            imageFile = "items/Scrolls.png",
            name      = "Свиток хаоса",
            info      = "Свиток содержит в себе мощную магию хаоса, готовую вот-вот выбраться на свободу.",
            stackable = true,
            upgradable    = false,
 defaultAction = RPD.Actions.read,
             price     = 45
        }
    end, actions = function() return {RPD.Actions.read} end,
    execute = function(self, item, hero, action, cell)
RPD.Dungeon.hero:spend(TIME_TO_READ)
RPD.playSound( "snd_read.mp3")
        if action == RPD.Actions.read then 
local blobs = {
    RPD.Blobs.Fire,
 RPD.Blobs.Regrowth,
RPD.Blobs.ToxicGas, RPD.Blobs.ConfusionGas,
RPD.Blobs.ParalyticGas
}
item:detach(RPD.Dungeon.hero:getBelongings().backpack)

       local level = RPD.Dungeon.level
        print(self, cause)

       local x = level:cellX(cell)
        local y = level:cellY(cell)
        for i = x - 1, x + 3 do
            for j = y - 1, y + 3 do    
              local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
  
    RPD.placeBlob( blobs[math.random(1,5)], pos, 50 );
         end
    end
  end
 end 
end,
bag = function(self, item)
        return "ScrollHolder"
    end

        
}
    

