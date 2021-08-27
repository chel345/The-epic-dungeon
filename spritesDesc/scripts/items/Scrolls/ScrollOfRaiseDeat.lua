--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"
local TIME_TO_READ = 1
local hero = RPD.Dungeon.hero

local item = require "scripts/lib/item"

 local mob = require "scripts/lib/mob"

local storage = require "scripts/lib/storage"

local latest_kill_index = "__latest_dead_mob"

local function updateLatestDeadMob(mob)
    storage.put(latest_kill_index, {class = mob:getMobClassName(), pos = mob:getPos()})
end

mob.installOnDieCallback(updateLatestDeadMob)



return item.init{
    desc  = function ()
        return {
           image     = math.random(0,11),
            imageFile = "items/Scrolls.png",
            name          = RPD.StringsManager:maybeId("ScrollOfRaiseDeat_Name"),
            info          = RPD.StringsManager:maybeId("ScrollOfRaiseDeat_Info"),
            stackable     = true,
            defaultAction = "Scroll_ACRead",
            price         = 50
        }
    end,
    actions = function() return {RPD.Actions.read} end,
    execute = function(self, item, hero, action)
        if action == RPD.Actions.read then
        local latestDeadMob = storage.get(latest_kill_index) or {}

        if latestDeadMob.class ~= nil then
            local mob = RPD.MobFactory:mobByName(latestDeadMob.class)
            storage.put(latest_kill_index, {})
           
            local level = RPD.Dungeon.level
            local mobPos = latestDeadMob.pos

            if level:cellValid(mobPos) then
                mob:setPos(mobPos)
item:detach(RPD.Dungeon.hero:getBelongings().backpack) 
mob:loot(RPD.ItemFactory:itemByName("Gold"))
                RPD.Mob:makePet(mob, hero)
                level:spawnMob(mob)
                hero:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 ) 
                mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
                RPD.playSound( "snd_cursed.mp3" )
RPD.Dungeon.hero:spend(TIME_TO_READ)
RPD.playSound( "snd_read.mp3")
                return true
            else
                RPD.glog("RaiseDead_NoSpace")
                return false
            end
        end

        RPD.glog("RaiseDead_NoKill")
        return false
    end
  end,
  bag = function(self, item)
        return "ScrollHolder"
    end


}
