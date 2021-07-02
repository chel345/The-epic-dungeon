--[[
    Created by Богдашка Ивашка.
    DateTime: 19.01.19 21:24
    This file is part of pixel-dungeon-remix
]]

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

local NormalItem = 
{
"Bomb",
"GuadsMolot",
"LightDanger"
}

local PremiomItem =
{
"BlackWand2",
"BlessWand",
"ChaosWand",
"RegwithWand",
"FireWand",
"IceWand",
"LightWand",
"FireNefritWand",
"WandOfLightbolt",
"WandOfFireRune",
"WandOfGoodMage",
"WandOfMagicbolt"
}

local CoolItem =
{
"WaterSpear",
"DragonWand"
} 
local npc
local client

local dialog = function(index)
    if index == 0 then
        if client:gold() >= 500 then
            client:spendGold(50)
RPD.Dungeon.level:drop( RPD.ItemFactory:itemByName(NormalItem[math.random(1,3)]), client:getPos())
            return
        end
        npc:say("Прости, но ниже цену вообще никак.")
    end

    if index == 1 then
        if client:gold() >= 100 then
            client:spendGold(1000)
   RPD.Dungeon.level:drop( RPD.ItemFactory:itemByName(PremiomItem[math.random(1,8)]), client:getPos())
            return
        end
        npc:say("Прости, но ниже цену вообще никак.")
    end

if index == 2 then
        if client:gold() >= 10000 then
            client:spendGold(100)
   RPD.Dungeon.level:drop( RPD.ItemFactory:itemByName(CoolItem[math.random(1,2)]), client:getPos())
            return
        end
        npc:say("Прости, но ниже цену вообще никак.")
    end
 end

return mob.init({
    interact = function(self, chr)
        client = chr
        npc = self

    end
})
