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
            image = 0,
            imageFile = "items/RangedMod.png",
            name = RPD.StringsManager:maybeId("GuardsHammer_Name"),
            info = RPD.StringsManager:maybeId("GuardsHammer_Info"),
            stackable = true,
            upgradable = true,
            price = 100
        }
    end,

    actions = function()
        return {}
    end,
    typicalSTR = function(self, item)

        return 16 - item:level()
    end,

    requiredSTR = function(self, item)
        return 16 - item:level()
    end,

    onThrow = function(self, item, cell)
        local soul = RPD.Actor:findChar(cell)
        if soul then
            if RPD.onThrowChance(item,16) then
                RPD.affectBuff(soul, RPD.Buffs.Paralysis, 5 + item:level())
                soul:damage(math.random(4, 5) * (item:level() + 1), RPD.Dungeon.hero)
                RPD.playSound("snd_hit.mp3")
                return dmg
            else
                soul:getSprite():showStatus(0xCCAA44, "Уклонился")
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