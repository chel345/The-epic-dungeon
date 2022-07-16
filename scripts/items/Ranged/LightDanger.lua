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
            image = 5,
            imageFile = "items/RangedMod.png",
            name = RPD.StringsManager:maybeId("LightDanger_Name"),
            info = RPD.StringsManager:maybeId("LightDanger_Info"),
            stackable = true,
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
        local soul = RPD.Actor:findChar(cell)
        if soul then
            if RPD.onThrowChance(item,12) then
                RPD.playSound("dash.mp3")
                RPD.affectBuff(soul, RPD.Buffs.Vertigo, 5 + item:level());
                RPD.affectBuff(soul, RPD.Buffs.Light, 5 + item:level());
                soul:getSprite():emitter():burst(RPD.Sfx.ShadowParticle.UP, 8)
                soul:damage(3 * RPD.Dungeon.depth + item:level(), item:getUser())
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