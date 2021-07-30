--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"
local TIME_TO_READ = 1
local item = require "scripts/lib/item"


return item.init{
    desc  = function ()
        return {
           image     = math.random(0,11),
            imageFile = "items/Scrolls.png",
            name          = RPD.textById("ScrollOfMirror_Name"),
            info          = RPD.textById("ScrollOfMirror_Info"),
            stackable     = true,
            defaultAction = "Scroll_ACRead",
            price         = 50
        }
    end,
    actions = function() return {RPD.Actions.read} end,
    execute = function(self, item, hero, action, cause )
RPD.Dungeon.hero:spend(TIME_TO_READ)
RPD.playSound( "snd_read.mp3")
        if action == RPD.Actions.read then
        local level = RPD.Dungeon.level
item:detach(RPD.Dungeon.hero:getBelongings().backpack) 
for i=1,2 do 
            local mob = RPD.MobFactory:mobByName("Mirror")
            local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
local image  = item:getUser():makeClone();
RPD.Wands.wandOfBlink:appear( image, pos );
            RPD.Buffs.Buff:affect(RPD.Dungeon.hero, RPD.Buffs.Invisibility ,7);
    end
  end
 end 
end,
bag = function(self, item)
        return "ScrollHolder"
    end



}
