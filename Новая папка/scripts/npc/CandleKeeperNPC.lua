--[[
    Created by mike.
    DateTime: 19.01.19 21:24
    This file is part of pixel-dungeon-remix
]]

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"


local buy = function(candle, level,cast)
local item = RPD.creteItem(candle,{level=level})
local client = RPD.Dungeon.hero
if client:gold() >= cast then
client:spendGold(cast)
client:collect(item)
return
else
RPD.glog("Денег нет")
end
end

local dialog = function(index)
    if index == 0 then
buy("Candles/TearsCandle",5,400)
    end

    if index == 1 then
buy("Candles/RatCandle",5,300)
    end

    if index == 2 then
buy("Candles/CaretakersCandle",5,400)
    end
    
    if index == 3 then
buy("Candles/FireCandle",5,500)
    end
    
    if index == 4 then
buy("Candles/Candle",5,100)
    end

end


return mob.init({
    interact = function(self, chr)
        client = chr
        npc = self
        RPD.chooseOption( dialog,
                "Торговец свечами",
                "Свечу не желаете?",
    "Свеча слёз -400 g",
    "Крысья свеча -300 g",
    "Свеча смотрителя -400 g",
    "Свеча ада -500 g",
    "Свеча -100 g",

                "Уйти"
        )
    end,
})
