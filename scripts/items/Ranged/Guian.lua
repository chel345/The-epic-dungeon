--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"

return item.init {
    desc = function()
        return {
            image = 2,
            imageFile = "items/RangedMod.png",
            name = RPD.StringsManager:maybeId("Guian_Name"),
            info = RPD.StringsManager:maybeId("Guian_Info"),
            stackable = true,
            upgradable = true,
            price = 10
        }
    end,
    typicalSTR = function(self, item)

        return 12 - item:level()
    end,

    requiredSTR = function(self, item)
        return 12 - item:level()
    end,

    onThrow = function(self, item, cell)
        local Callback = luajava.bindClass("com.watabou.utils.Callback")
        local user = item:getUser()
        local sprite = user:getSprite()

        if sprite:hasParent() then
            missile = sprite:getParent():recycle(RPD.Sfx.MagicMissile)
            missile:reset(user:getPos(), cell, Callback.callback)
            missile:size(4);
            missile:pour(RPD.Sfx.EarthParticle.FACTORY, 0.08)
        end

        local soul = RPD.Actor:findChar(cell)
        if soul then
            if RPD.onThrowChance(item,12) then

                RPD.affectBuff(soul, RPD.Buffs.Roots, 10)
                soul:damage(20 * (item:level() + 1), RPD.Dungeon.hero)
                RPD.playSound("snd_hit.mp3")
                return dmg
            else
                soul:getSprite():showStatus(0xCCAA44, RPD.StringsManager:maybeId("Dodged"))
                item:dropTo(cell)
            end

        else
            item:dropTo(cell)
        end
    end,
    bag = function(self, item)
        return "Quiver"
    end,
    isFliesStraight = function()
        return true
    end
}