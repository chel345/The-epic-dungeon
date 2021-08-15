--[[
    Created by mike.
    DateTime: 19.01.19 21:24
    This file is part of pixel-dungeon-remix
]]

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local npc
local client

local Rune1 = RPD.ItemFactory:itemByName("ScrollOfMagicMapping")

local Rune2 = RPD.ItemFactory:itemByName("ScrollOfWeaponUpgrade")

local Rune3 = RPD.ItemFactory:itemByName("PotionOfStrength")

local dialog = function(index)
    if index == 0 then
        if client:gold() >= 300 then
            client:spendGold(300)
RPD.Dungeon.level:drop(Rune1, client:getPos())
            return
        end
        npc:say(RPD.StringsManager:maybeId("TearsFutureTellerNPC_Phrase1"))
    end

    if index == 1 then
        if client:gold() >= 1500 then
            client:spendGold(1500)
RPD.Dungeon.level:drop(Rune2, client:getPos())
            return
        end
        npc:say(RPD.StringsManager:maybeId("TearsFutureTellerNPC_Phrase1"))
    end

    if index == 2 then
        if client:gold() >= 2000 then
            client:spendGold(2000)
RPD.Dungeon.level:drop(Rune3, client:getPos())
            return
        end
        npc:say(RPD.StringsManager:maybeId("TearsFutureTellerNPC_Phrase1"))
    end

    if index == 3 then
        npc:say(RPD.StringsManager:maybeId("TearsFutureTellerNPC_Phrase2"))
    end
end


return mob.init({
    interact = function(self, chr)
        client = chr
        npc = self
        RPD.chooseOption( dialog,
                RPD.StringsManager:maybeId("TearsFutureTellerNPC_Phrase3"),
                RPD.StringsManager:maybeId("TearsFutureTellerNPC_Phrase4"),
    RPD.StringsManager:maybeId("TearsFutureTellerNPC_Phrase5"),
    RPD.StringsManager:maybeId("TearsFutureTellerNPC_Phrase6"),
    RPD.StringsManager:maybeId("TearsFutureTellerNPC_Phrase7"),
                RPD.StringsManager:maybeId("TearsFutureTellerNPC_Phrase8")
        )
    end,
})
