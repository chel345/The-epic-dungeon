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
            name          = RPD.StringsManager:maybeId("ElementalScroll_Name"),
            info          = RPD.StringsManager:maybeId("ElementalScroll_Info"),
            stackable     = true,
            defaultAction = "Scroll_ACRead",
            price         = 50,
defaultAction = RPD.Actions.read
        }
    end,
    actions = function() return {RPD.Actions.read} end,
    execute = function(self, item, hero, action, cause )
RPD.Dungeon.hero:spend(TIME_TO_READ)
RPD.playSound( "snd_read.mp3")
        if action == RPD.Actions.read then
local mobs = {
 "AirElemental",
"WaterElemental",
"EarthElemental",
"IceElemental"
}
        local level = RPD.Dungeon.level
            local mob = RPD.mob(mobs[math.random(1,4)])
            local pos = level:getEmptyCellNextTo(hero:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero));
    end
  end
  item:detach(RPD.Dungeon.hero:getBelongings().backpack) 
 end,
 bag = function(self, item)
        return "ScrollHolder"
    end



}
