--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD     = require "scripts/lib/commonClasses"

local wand    = require "scripts/lib/wand"

local EPD     = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

return wand.init {
    desc       = function()
        return {
            image = 1,
            name  = "Жезл магических молний",
            info  = "При использовании этот жезл испустит молнию, которая нанесёт урон врагам, а также с шансом может оживить статую. Цена 20 маны."
        }
    end,

    activate   = function(self, item, hero)
        RPD.removeBuff(item:getUser(), RPD.Buffs.Light)

        RPD.permanentBuff(item:getUser(), RPD.Buffs.Light)

        RPD.removeBuff(item:getUser(), "Lighting")

        RPD.permanentBuff(item:getUser(), "Lighting")

    end,

    deactivate = function(self, item, hero)
        RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
        RPD.removeBuff(item:getUser(), "Lighting")
    end,

    castOnCell = function(self, thisItem, cell, dst, lvl)

        if math.random(1, 2) == 1 then
            if RPD.Dungeon.level.map[cell] == RPD.Terrain.STATUE or RPD.Dungeon.level.map[cell] == RPD.Terrain.STATUE_SP then
                RPD.Dungeon.level:set(cell, RPD.Terrain.EMPTY)
                EPD.SpawnMob("SumStatue", cell, true)
                RPD.zapEffect(thisItem:getUser():getPos(), cell, "Lightning")
            end
        end

        if enemy then

            if math.random(1, 25 - lvl) == 1 then
                RPD.affectBuff(enemy, RPD.Buffs.Paralysis, 10)
            end
            enemy:damage(2 * RPD.Dungeon.depth, thisItem:getUser())
            enemy:getSprite():emitter():start(RPD.Sfx.SparkParticle.FACTORY, 0.1, 1)
            RPD.zapEffect(thisItem:getUser():getPos(), enemy:getPos(), "Lightning")
        else
            RPD.zapEffect(thisItem:getUser():getPos(), dst, "Lightning")
        end

    end,

    bag        = function(self, item)
        return "WandHolster"
    end,

    selectType = function()
        return "cell"
    end,

    getMana    = function()
        return 20
    end,

    getManaMes = function()
        return "-- не хватает маны"
    end
}
