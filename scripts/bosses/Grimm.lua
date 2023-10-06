--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"
local Spawner = loadfile"scripts/actors/Spawner.lua"
local mob = require "scripts/lib/mob"

local NightamreFires = require "scripts/effects/NightmareFires"

local function tentacle(cell, me, j)
    local x = RPD.Dungeon.level:cellX(cell)
    local y = RPD.Dungeon.level:cellY(cell)
    for i = x - 2, x + 2 do
        for j = y - 3, y + 3 do
            local pos = RPD.Dungeon.level:cell(i, j) - 2
            local soul = RPD.Actor:findChar(pos - 1)
            if RPD.Dungeon.level.map[pos] == RPD.Terrain.EMPTY and pos % 2 == 0 then
                if soul and soul ~= me and soul == RPD.Dungeon.hero then
                    RPD.topEffect(pos - 1, "ShadowTentacle")
                    soul:damage(math.random(20, 40), me)
                else
                    RPD.topEffect(pos - 1, "ShadowTentacle")
                end
            end
        end
    end
end


return mob.init({
    act = function(me)
        local type = math.random(1, 2)
        if type == 1 then
            local function update(f)
                if f == 30 then
                    tentacle(114, me, 0)
                end
                if f == 50 then
                    tentacle(110, me, 0)
                    return false
                end
                if f == 1 then
                    tentacle(118, me, 0)
                end
                return true
            end
            RPD.addFunction(update)
        elseif type == 2 then
            local level = RPD.Dungeon.level
            local enemy = RPD.Dungeon.hero
            for i = 1, level:getLength() do
                local obj = level:getTopLevelObject(i)
                if obj and obj:getEntityKind() == "statue_sp" then
                    RPD.zapEffect(i, enemy:getPos(), "SkullBolt")
                    local object = RPD.Dungeon.level:getTopLevelObject(pos)
                    obj.sprite:kill()
                    level:remove(obj)
                    local tile = {
                        kind = "CustomObject",
                        object_desc = "SkullCharge1"
                    }
                    RPD.createLevelObject(tile, i)
                    local a = math.random(-1, 1)
                    enemy:move(enemy:getPos() + a)
                    enemy:getSprite():move(enemy:getPos(), enemy:getPos() + a)
                    return
                end
                if obj and obj:getEntityKind() == "SkullCharge1" then
                    RPD.zapEffect(i, enemy:getPos(), "SkullBolt")
                    local object = RPD.Dungeon.level:getTopLevelObject(pos)
                    obj.sprite:kill()
                    level:remove(obj)
                    local tile = {
                        kind = "CustomObject",
                        object_desc = "SkullCharge2"
                    }
                    RPD.createLevelObject(tile, i)
                    local a = math.random(-1, 1)
                    enemy:move(enemy:getPos() + a)
                    enemy:getSprite():move(enemy:getPos(), enemy:getPos() + a)
                    return
                end
                if obj and obj:getEntityKind() == "SkullCharge2" then
                    RPD.zapEffect(i, enemy:getPos(), "SkullBolt")
                    local object = RPD.Dungeon.level:getTopLevelObject(pos)
                    obj.sprite:kill()
                    level:remove(obj)
                    local a = math.random(-1, 1)
                    enemy:move(enemy:getPos() + a)
                    enemy:getSprite():move(enemy:getPos(), enemy:getPos() + a)
                    return
                end
            end

        end

        --[[
        if math.random(1,2) == 2 then
        me:spend(2)
        local n = getCell()
        me:setPos(n)
        me:getSprite():move(me:getPos(),n)
        me:getSprite():update()
                for i = 1,2 do
                    local mob = RPD.mob("NightmareBall")
                    local pos = RPD.Dungeon.level:getEmptyCellNextTo(me:getPos())
                    if (RPD.Dungeon.level:cellValid(pos)) then
                        mob:setPos(pos)
                        RPD.Dungeon.level:spawnMob(mob)
                   end
                end
        elseif math.random(1,2) == 2 then
        local x = RPD.Dungeon.level:cellX(me:getPos())
        local y = RPD.Dungeon.level:cellY(me:getPos())
                for i = x - 3, x + 3 do
                 for j = y - 3, y + 3 do
        local pos = RPD.Dungeon.level:cell(i,j)
        local soul =  RPD.Actor:findChar(pos)
        if RPD.Dungeon.level.map[pos] == RPD.Terrain.EMPTY then
        if soul and soul ~= me and soul == RPD.Dungeon.hero then
        RPD.topEffect(pos,"ShadowTentacle")
        soul:damage(math.random(25,60), me)
         else
        RPD.topEffect(pos,"ShadowTentacle")
        end
        end
        end
        end
        me:spend(1)
        local n = getCell()
        me:setPos(n)
        me:getSprite():move(me:getPos(),n)
        elseif math.random(1,2) == 2 then
        local n = 0
        local level = RPD.Dungeon.level
        for i = 0, level:getLength() do
        local mob = RPD.Actor:findChar(i)
        if mob and mob ~= RPD.Dungeon.hero and mob:getMobClassName() == "Nightmare/MirorGrimm" then
        n = n + 1
        end
        end
        if n < 4 then
        local n = getCell()
        me:setPos(n)
        me:getSprite():move(me:getPos(),n)
        me:getSprite():update()
                for i = 1,2 do
                    local mob = RPD.mob("MirorGrimm")
                    local pos = RPD.Dungeon.level:getEmptyCellNextTo(me:getPos())
                    if (RPD.Dungeon.level:cellValid(pos)) then
                        mob:setPos(pos)
                        RPD.Dungeon.level:spawnMob(mob)
                   end
                end
        end
        else
        RPD.topEffect(me:getPos()-RPD.Dungeon.level:getWidth()-1,"Void")
        RPD.zapEffect(me:getPos()-RPD.Dungeon.level:getWidth()-1, RPD.Dungeon.hero:getPos(), "Shadow")
        RPD.Dungeon.hero:damage(math.random(20,40), me)

        RPD.topEffect(me:getPos()-RPD.Dungeon.level:getWidth()+1,"Void")
        RPD.zapEffect(me:getPos()-RPD.Dungeon.level:getWidth()+1, RPD.Dungeon.hero:getPos(), "Shadow")
        RPD.Dungeon.hero:damage(math.random(20,40), me)

        RPD.topEffect(me:getPos()+RPD.Dungeon.level:getWidth()-1,"Void")
        RPD.zapEffect(me:getPos()+RPD.Dungeon.level:getWidth()-1, RPD.Dungeon.hero:getPos(), "Shadow")
        RPD.Dungeon.hero:damage(math.random(20,40), me)

        RPD.topEffect(me:getPos()+RPD.Dungeon.level:getWidth()+1,"Void")
        RPD.zapEffect(me:getPos()+RPD.Dungeon.level:getWidth()+1, RPD.Dungeon.hero:getPos(), "Shadow")
        RPD.Dungeon.hero:damage(math.random(20,40), me)
        end
        --]]

    end,
    zapProc = function(self, nome, dmg)
        local level = RPD.Dungeon.level

        zap = function(cell)

            local from = self:getPos()
            local to = cell
            local dst = RPD.Ballistica:cast(from, to, true, true, true)
            NightamreFires.attach(from, dst, 1)
            local enemy = RPD.Actor:findChar(dst)
            if enemy and enemy ~= self then
                enemy:damage(math.random(10, 20), self)
            end
        end

        local x = level:cellX(self:getPos() + 1)
        local y = level:cellY(self:getPos() + 1)
        for i = x - 1, x + 1 do
            for j = y - 1, y + 1 do
                local pos = RPD.Dungeon.level:cell(i, j)
                zap(pos - 1)
            end
        end

        return 0
    end,
    damage = function(me)
        RPD.GameScene:flash(0x370C0C)
        local n = Spawner().getCell()
        if n > 0 then
            me:setPos(n)
            me:getSprite():move(me:getPos(), n)
            me:getSprite():update()
        end
    end,
    die = function(self, cause)
        RPD.playSound("snd_boss.mp3")
        local level = RPD.Dungeon.level
        local item = RPD.ItemFactory:itemByName("SkeletonKey")
        level:drop(item, self:getPos())
        local level = RPD.Dungeon.level
        for i = 0, level:getLength() - 1 do
            local object = level:getTopLevelObject(i)
            local mob = RPD.Actor:findChar(i)
            if mob and mob ~= RPD.Dungeon.hero and not (mob:isPet()) then
                mob:getSprite():killAndErase()
                mob:destroy()
            end
            if object then
                object.sprite:kill()
                level:remove(object)
            end
        end
        RPD.GameScene:bossSlain()
    end
})


