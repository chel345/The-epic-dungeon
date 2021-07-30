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
            name          = RPD.textById("ScrollOfNightmare_Name"),
            info          = RPD.textById("ScrollOfNightmare_Info"),
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
 item:detach(RPD.Dungeon.hero:getBelongings().backpack) 
        local level = RPD.Dungeon.level
        for i = 1,4 do
            local mob = RPD.MobFactory:mobByName("NightmareBall")
            local pos = level:getEmptyCellNextTo(item:getUser():getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero));
           end
        end
 end 
end,
bag = function(self, item)
        return "ScrollHolder"
    end


}
