--
-- User: mike
-- Date: 03.06.2018
-- Time: 22:51
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local spell = require "scripts/lib/spell"

local mob = require "scripts/lib/mob"

local storage = require "scripts/lib/storage"

local latest_kill_index = "__latest_dead_mob"

local function updateLatestDeadMob(mob)
    storage.put(latest_kill_index, {class = mob:getMobClassName(), pos = mob:getPos()})
end

mob.installOnDieCallback(updateLatestDeadMob)

return spell.init{
    desc  = function ()
        return {
            image         = 0,
            imageFile     = "mobs/enslavedsoul.png",
            name          = "Порабощение",
            info          = "Это заклинание призовёт душу покойного врага и подчинит её.",
            magicAffinity = "Necromancy",
            targetingType = "none",
            spellCost     = 5,
            castTime      = 2,
            level         = 2
        }
    end,
    cast = function(self, spell, chr)
        local latestDeadMob = storage.get(latest_kill_index) or {}

        if latestDeadMob.class ~= nil then
            local mob = RPD.MobFactory:mobByName("EnslavedSoul")
            storage.put(latest_kill_index, {})

            local level = RPD.Dungeon.level
            local mobPos = latestDeadMob.pos

            if level:cellValid(mobPos) then
                mob:setPos(mobPos)
                mob:loot(RPD.ItemFactory:itemByName("Gold"))
                RPD.Mob:makePet(mob, chr)
                level:spawnMob(mob)
                chr:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
                mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
                RPD.playSound( "snd_cursed.mp3" )

                return true
            else
                RPD.glog("RaiseDead_NoSpace")
                return false
            end
        end

        RPD.glog("RaiseDead_NoKill")
        return false
    end
}
