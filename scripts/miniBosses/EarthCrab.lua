--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require "scripts/lib/mob"

local storage = require "scripts/lib/storage"

local DungeonTileMap = luajava.bindClass("com.watabou.pixeldungeon.DungeonTilemap")

local function throwSeed(self, enemy)
    local level = RPD.Dungeon.level
    local cell = level:getEmptyCellNextTo(enemy:getPos())
    local type = math.random(1, 8)
    local plants = {
        "Rotberry.Seed",
        "Earthroot.Seed",
        "Firebloom.Seed",
        "Sungrass.Seed",
        "Dreamweed.Seed",
        "Sorrowmoss.Seed",
        "Icecap.Seed",
        "Fadeleaf.Seed"
    }
    level:plant(RPD.item(plants[type]), cell)
    RPD.zapEffect(self:getPos(), cell, plants[type])
end

local function getCell(cell)
    local level = RPD.Dungeon.level
    local x = level:cellX(cell)
    local y = level:cellY(cell)
    for i = x - 3, x + 3 do
        for j = y - 3, y + 3 do
            local pos = level:cell(i, j)
            local dst = RPD.Ballistica:cast(cell, pos, false, false, false)
            if dst ~= cell and level:distance(dst, cell) > 1 then
                return dst
            end
        end
    end
    return cell
end

local function throwRock(self, enemy)
    RPD.playSound("snd_rocks.mp3")
    local missile = self:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
    missile:reset(self:getPos(), enemy:getPos(), nil)
    missile:size(10)
    missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.05)
end

local emitter

return mob.init {
    zapMiss = function(self, enemy)
        throwRock(self, enemy)
    end,
    zapProc = function(self, enemy, dmg)
        if math.random(1, 3) == 1 then
            throwSeed(self, enemy)
        end
        throwRock(self, enemy)
        return dmg
    end,
    damage = function(me)
        local n = getCell(me:getPos())
        me:setPos(n)
        RPD.Tweeners.JumpTweener:attachTo(me:getSprite(), n, 30, 0.5)
        me:getSprite():update()
    end,
    spawn = function(self)
        RPD.permanentBuff(self, RPD.Buffs.Invisibility)
    end,
    die = function(self)
        if emitter then
            emitter.on = false
        end
    end,
    act = function(self)
        if not emitter then
            emitter = self:getSprite():emitter()
            emitter:pour(RPD.Sfx.LeafParticle.LEVEL_SPECIFIC, 0.05)
        end
        if RPD.Dungeon.level:distance(self:getPos(), RPD.Dungeon.hero:getPos()) < 3 and not (storage.get("earth_crab_was_activated")) then
            self:move(self:getPos() - RPD.Dungeon.level:getWidth())
            RPD.removeBuff(self, RPD.Buffs.Invisibility)
            RPD.Tweeners.JumpTweener:attachTo(self:getSprite(), self:getPos(), 3, 0.5)
            local Camera = luajava.bindClass("com.watabou.noosa.Camera")
            Camera.main:shake(3, 0.5)
            storage.put("earth_crab_was_activated", true)
        end
    end
}
