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
RPD.glog(RPD.textById("CandleKeeperNPC_Phrase1"))
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
                RPD.textById("CandleKeeperNPC_Phrase2"),
                RPD.textById("CandleKeeperNPC_Phrase3"),
    RPD.textById("CandleKeeperNPC_Phrase4"),
    RPD.textById("CandleKeeperNPC_Phrase5"),
    RPD.textById("CandleKeeperNPC_Phrase6"),
    RPD.textById("CandleKeeperNPC_Phrase7"),
    RPD.textById("CandleKeeperNPC_Phrase8"),

                RPD.textById("CandleKeeperNPC_Phrase9")
        )
    end,
})
