--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

local Best = luajava.bindClass("com.watabou.pixeldungeon.actors.mobs.Bestiary")

local max

local now = 0

local rat = RPD.MobFactory:mobByName("Rat")


return actor.init({
    getCell = function()
        return RPD.getCell()
    end,
    activate = function()
        local level = RPD.Dungeon.level
        if not storage.get("level_spawner") then
            if level:getLength() > 64 * 64 then
                max = math.floor(level:getLength() / 200)
            else
                max = math.floor(level:getLength() / 100)
            end
            for i = 1, max do
                local mob = Best:mob(level)
                local cell = RPD.getCell()
                if cell > 0 then
                    mob:setPos(cell)
                    level:spawnMob(mob)
                else
                    break
                end
            end
            storage.put("level_spawner", true)
        end
    end,
    act = function()
        local level = RPD.Dungeon.level
        local len = level:getLength()
        if len > 64 * 64 then
            max = math.floor(len / 200)
        else
            max = math.floor(len / 100)
        end
        now = 0

        for i = 0, len - 1 do
            if RPD.Actor:findChar(i) then
                now = now + 1
            end
        end
        if now > max then
            now = 0
            return true
        end
        local mob = Best:mob(level)
        local cell = RPD.getCell()
        if cell > 0 then
            mob:setPos(cell)
            level:spawnMob(mob)
            RPD.setAi(mob, "Wandering")
        end
        return true
    end,
    actionTime = function()
        if RPD.Dungeon.level:getLength() > 64 * 64 then
            return 60
        end
        return 30
    end
})
