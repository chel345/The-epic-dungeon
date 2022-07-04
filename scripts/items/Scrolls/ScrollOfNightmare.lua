--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"
local TIME_TO_READ = 1
local item = require "scripts/lib/item"

local NightamreFires = require "scripts/effects/NightmareFires"

return item.init{
    desc  = function ()
        return {
           image     = math.random(0,11),
            imageFile = "items/Scrolls.png",
            name          = RPD.StringsManager:maybeId("ScrollOfNightmare_Name"),
            info          = RPD.StringsManager:maybeId("ScrollOfNightmare_Info"),
            stackable     = true,
            defaultAction = "Scroll_ACRead",
            price         = 50
        }
    end,
    actions = function() return {RPD.Actions.read} end,

    execute = function(self, item, hero, action, cause )
   
if action == RPD.Actions.read then

local level = RPD.Dungeon.level
local dmg = RPD.Dungeon.depth*5

local n = 0
for i = 0, level:getLength()-1 do
local mob = RPD.Actor:findChar(i)
if mob and level.fieldOfView[i] and mob ~= item:getUser() then
n = n + 1
end
end
for i = 0, level:getLength()-1 do
local mob = RPD.Actor:findChar(i)
if mob and level.fieldOfView[i] and mob ~= item:getUser() then
mob:damage(dmg/n,item:getUser())
NightamreFires.attach(item:getUser():getPos(),i,1)
end
end

item:detach(RPD.Dungeon.hero:getBelongings().backpack)
RPD.Dungeon.hero:spend(TIME_TO_READ)
RPD.playSound( "snd_read.mp3")

end

end,

bag = function(self, item)
        return "ScrollHolder"
    end


}
