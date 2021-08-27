--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"
local TIME_TO_READ = 1
local item = require "scripts/lib/item"


return item.init{
    desc  = function ()
        return {
           image     = math.random(0,11),
            imageFile = "items/Scrolls.png",
            name      = RPD.StringsManager:maybeId("ScrollOfFire_Name"),
            info      = RPD.StringsManager:maybeId("ScrollOfFire_Info"),
            stackable = true,
            upgradable    = false,
 defaultAction = RPD.Actions.read,
             price     = 50
        }
    end, actions = function() return {RPD.Actions.read} end,
    execute = function(self, item, hero, action, cell, char, data) 
RPD.Dungeon.hero:spend(TIME_TO_READ)
RPD.playSound( "snd_read.mp3")
        if action == RPD.Actions.read then 
       local level = RPD.Dungeon.level
        local hero = RPD.Dungeon.hero
item:detach(RPD.Dungeon.hero:getBelongings().backpack) 
       local x = level:cellX(cell)
        local y = level:cellY(cell)
        for i = x - 1, x + 3 do
            for j = y - 1, y + 3 do
            local pos = level:getEmptyCellNextTo(hero:getPos())
 
            if (level:cellValid(pos)) then
      RPD.placeBlob( RPD.Blobs.Fire , pos, 50 );   
            end
        end
    end 
end
end,
bag = function(self, item)
        return "ScrollHolder"
    end


}
