--
-- User: mike
-- Date: 25.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--
local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"
 local storage = require "scripts/lib/storage"

local latest_kill_index = "__latest_dead_mob"

local function updateLatestDeadMob(mob)
    storage.put(latest_kill_index, {class = mob:getMobClassName(), pos = mob:getPos()})
end

mob.installOnDieCallback(updateLatestDeadMob)


return mob.init({
    die = function(self, mob)
        local latestDeadMob = storage.get(latest_kill_index) or {}

        if latestDeadMob.class ~= nil then
            local mob = RPD.MobFactory:mobByName("miniBosses/Vither2")
            storage.put(latest_kill_index, {})

            local level = RPD.Dungeon.level
            local mobPos = latestDeadMob.pos

            if level:cellValid(mobPos) then
                mob:setPos(mobPos)
                
                level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))
                self:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
                mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
                RPD.playSound( "snd_cursed.mp3" )
            end 
 end
        self:yell("Нееет!")
 end
  })



