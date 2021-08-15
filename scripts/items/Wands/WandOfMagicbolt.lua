--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD     = require "scripts/lib/epicClasses"

local wand    = require "scripts/lib/wand"

local EPD     = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"
local TIME_TO_ZAP = 1
return wand.init {
    desc       = function()
        return {
            image = 1,
            name  = RPD.StringsManager:maybeId("WandOfMagicbolt_Name"),
            info  = RPD.StringsManager:maybeId("WandOfMagicbolt_Info")
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
thisItem:getUser():spend(TIME_TO_ZAP)
            if RPD.Dungeon.level.map[cell] == RPD.Terrain.STATUE or RPD.Dungeon.level.map[cell] == RPD.Terrain.STATUE_SP then
                RPD.Dungeon.level:set(cell, RPD.Terrain.EMPTY)
                EPD.SpawnMob("SumStatue", cell, true)
                RPD.zapEffect(thisItem:getUser():getPos(), cell, "Lightning")
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
        return 5
    end,

    getManaMes = function()
        return RPD.StringsManager:maybeId("No_Mana")
    end
}
