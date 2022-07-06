--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"
local Spawner = loadfile "scripts/actors/Spawner.lua"

local mob = require "scripts/lib/mob"

local GameLoop = luajava.bindClass("com.nyrds.pixeldungeon.game.GameLoop")

return mob.init({
    damage = function(me)
        local level = RPD.Dungeon.level
        local cell = Spawner.getCell(level)
        if math.random(1, 2) == 1 and cell > 0 then
            local dst = RPD.Ballistica:cast(me:getPos(), cell, true, false, false)
            me:setPos(dst)
            me:getSprite():move(me:getPos(), dst)
        end
    end,
    zapProc = function(me, enemy, dmg)
        local level = RPD.Dungeon.level
        local hero = RPD.Dungeon.hero

        local function spawn(pos)
            local obj = level:getTopLevelObject(pos)
            if level.map[pos + 1] == RPD.Terrain.EMPTY and (not obj) then
                local deco = {
                    kind = "CustomObject",
                    object_desc = "FireTenguTrap"
                }
                --негры пидорасы
                RPD.createLevelObject(deco, pos)
                RPD.zapEffect(me:getPos(), pos, "FireTrapEffect")
            end
        end
        RPD.forCellsAround(me:getPos(), spawn)

        local i = Spawner.getCell()
        while level:distance(i, hero:getPos()) < 3 and level:distance(i, hero:getPos()) > 0 do
            i = Spawner.getCell()
        end

        local mob = RPD.mob("effects/Boll")
        mob:setPos(me:getPos())
        RPD.Dungeon.level:spawnMob(mob)
        local factor = RPD.Dungeon.level:distance(me:getPos(), i)
        RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(), i, factor * 10, factor * 0.1)
        mob:getSprite():emitter():start(RPD.Sfx.FlameParticle.FACTORY, 0.01, factor*10+1)
        mob:destroy()
        RPD.placeBlob(RPD.Blobs.LiquidFlame, i, 30)
        return dmg * 0

    end,
    die = function(self, cause)
        local level = RPD.Dungeon.level
        for i = 1, level:getLength() - 1 do
            local obj = level:getTopLevelObject(i)
            if obj then
                obj.sprite:kill()
                level:remove(obj)
            end
        end
        if GameLoop:getDifficultyFactor() == 2 then
            for i = 1, level:getLength() - 1 do
                local mob = RPD.Actor:findChar(i)
                if mob and mob ~= RPD.Dungeon.hero and mob:getMobClassName() == "Prison/PoisonTenguOnChains" then
                    local b = RPD.mob("PoisonTengu")
                    b:setPos(i - 1)
                    level:spawnMob(b)
                    local Camera = luajava.bindClass("com.watabou.noosa.Camera")
                    Camera.main:shake(8, 0.7)
                    RPD.setAi(b, "Hunting")
                    b:ht(b:ht() / 3)
                    b:hp(b:ht())
                    mob:die()
                    return
                end
            end
        end
        RPD.playSound("snd_boss.mp3")
        local level = RPD.Dungeon.level
        local item = RPD.ItemFactory:itemByName("SkeletonKey")
        level:drop(item, self:getPos())
        item = RPD.ItemFactory:itemByName("TomeOfMastery")
        level:drop(item, self:getPos())
        RPD.GameScene:bossSlain()
        level:set(127, RPD.Terrain.DOOR)
        RPD.GameScene:updateMap(127)
    end
})


