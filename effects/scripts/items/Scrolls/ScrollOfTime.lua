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
            name          = RPD.StringsManager:maybeId("ScrollOfTime_Name"),
            info          = RPD.StringsManager:maybeId("ScrollOfTime_Info"),
            stackable     = true,
            defaultAction = "Scroll_ACRead",
            price         = 50
        }
    end,
    actions = function() return {RPD.Actions.read} end,
    execute = function(self, item, hero, action)
RPD.Dungeon.hero:spend(TIME_TO_READ)
RPD.playSound( "snd_read.mp3")
        if action == RPD.Actions.read then
            RPD.Buffs.Buff:affect(RPD.Dungeon.hero, RPD.Buffs.Invisibility ,70);           RPD.Buffs.Buff:affect(RPD.Dungeon.hero, RPD.Buffs.Paralysis ,70)
        end
item:detach(RPD.Dungeon.hero:getBelongings().backpack) 
    end,
    bag = function(self, item)
        return "ScrollHolder"
    end


}
