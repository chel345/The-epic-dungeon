--[[
    Created by Богдашка Ивашка.
    DateTime: 19.01.19 21:24
    This file is part of pixel-dungeon-remix
]]

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"


local npc
local client

local dialog = function(index)
    if index == 0 then
        if client:gold() >= 100 then
            client:spendGold(50)
RPD.Dungeon.level:drop( RPD.ItemFactory:itemByName("ShopShopers"), client:getPos())
            return
        end
        npc:say("Прости, но ниже цену вообще никак.")
    end
    end

return mob.init({
    interact = function(self, chr)
        client = chr
        npc = self

        RPD.chooseOption( dialog,
                "Торговец торговцами",
                "У меня самые лучшие торговцы.",
                "Торговец-100g"
                )
    end
})
