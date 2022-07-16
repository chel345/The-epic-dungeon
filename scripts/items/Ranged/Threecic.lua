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
            image = 3,
            imageFile = "items/RangedMod.png",
            name = RPD.StringsManager:maybeId("Threecic_Name"),
            info = RPD.StringsManager:maybeId("Threecic_Info"),
            stackable = true,
            upgradable = true,
            price = 10
        }
    end,
    typicalSTR = function(self, item)

        return 18 - item:level()
    end,

    requiredSTR = function(self, item)
        return 18 - item:level()
    end,

    onThrow = function(self, item, cell)
        local soul = RPD.Actor:findChar(cell)
        if soul then
            if RPD.onThrowChance(item,18) then

                RPD.affectBuff(soul, RPD.Buffs.Cripple, 8 + item:level())
                soul:damage(math.random(4, 5) * (item:level() + 1), RPD.Dungeon.hero)
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
