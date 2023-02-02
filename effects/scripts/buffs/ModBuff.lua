-- This is demo buff for charAct

local RPD  = require "scripts/lib/epicClasses"

local buff = require "scripts/lib/buff"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

--tears loot
local TearsSword = require("scripts/items/Tears/TearsSword")

local TearsArmor = require("scripts/items/Tears/TearsArmor")

local TearsWand = require("scripts/items/Tears/TearsWand")

-- candles
local TearsCandle = require("scripts/items/Candles/TearsCandle")

local RatCandle = require("scripts/items/Candles/RatCandle")

local CaretakersCandle = require("scripts/items/Candles/CaretakersCandle")

local FireCandle = require("scripts/items/Candles/FireCandle")

local Candle = require("scripts/items/Candles/Candle")

return buff.init{
    desc  = function ()
        return {
            icon          = -1,
            name          = RPD.StringsManager:maybeId("J"),
            info          = "CounterBuff_Info"
        }
    end,
    textureLarge = function()
    return "ui/CustomBuffsLarge.png"
    end,
    textureSmall = function()
    return "ui/CustomBuffs.png"
    end,
    attachTo = function(self, buff, target)
cry = nil
    if type(target) == nil or type(RPD.Dungeon.hero) == nil then
    return
    end
    return false
    end,
    act = function(self,buff)
        buff:detach()
    end,



    detach = function(self, buff)
    end,
    act = function(self,buff)
        buff:detach()
end, 

    charAct = function(self,buff)
EPD.time = EPD.time + 1
if EPD.time % 8 == 0 then
RPD.Dungeon.hero:spendSkillPoints(-1)
end
end
}
