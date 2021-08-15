--[[
    Created by mike.
    DateTime: 19.01.19 21:24
    This file is part of pixel-dungeon-remix
]]

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local storage = require "scripts/lib/storage"

local npc = self
local client = RPD.Dungeon.hero

local Weapon1_ = "Dagger"

local Weapon2_ = "Longsword"

local Weapon3_ = "WarHammer"

local Weapon4_ = "Mace"

local Weapon5_ = "Quarterstaff"

local Weapon6_ = "BattleAxe"

local Weapon7_ = "Glaive"

local Weapon8_ = "Sword"

local Weapon9_ = "ShortSword"

local Weapon10_ = "Knuckles"

local Weapon11_ = "GnollTamahawk"

local Weapon12_ = "Spear"

local Weapon13_ = "Claymore"

local Weapon14_ = "Halberd"

local Weapon15_ = "GoldenSword"

local Weapon1 = RPD.ItemFactory:itemByName("Dagger")

local Weapon2 = RPD.ItemFactory:itemByName("Longsword")

local Weapon3 = RPD.ItemFactory:itemByName("WarHammer")

local Weapon4 = RPD.ItemFactory:itemByName("Mace")

local Weapon5 = RPD.ItemFactory:itemByName("Quarterstaff")

local Weapon6 = RPD.ItemFactory:itemByName("BattleAxe")

local Weapon7 = RPD.ItemFactory:itemByName("Glaive")

local Weapon8 = RPD.ItemFactory:itemByName("Sword")

local Weapon9 = RPD.ItemFactory:itemByName("ShortSword")

local Weapon10 = RPD.ItemFactory:itemByName("Knuckles")

local Weapon11 = RPD.ItemFactory:itemByName("GnollTamahawk")

local Weapon12 = RPD.ItemFactory:itemByName("Spear")

local Weapon13 = RPD.ItemFactory:itemByName("Claymore")

local Weapon14 = RPD.ItemFactory:itemByName("Halberd")

local Weapon15 = RPD.ItemFactory:itemByName("GoldenSword")

local dialogBuy = function(index)

local item =storage.get("item")
cast = storage.get("cast")
level = storage.get("level")

if index == 0 then
level = level+1
storage.put("level",level)

cast =  cast+level*50

BuyItem(item,cast,level)
return
end
if index == 1 then
if level <= 0 then
npc:say(RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase1"))
return
end
storage.put("level",level)

cast =  cast-level*50
level = level -1
BuyItem(item,cast,level)
end

if index == 2 then
if client:gold() >= cast then
client:spendGold(cast)
local maybeItem = RPD.creteItem(item, {level=level,identified=true})
cast = 0
storage.put("cast",cast )
level = 0
storage.put("level",level )
RPD.Dungeon.level:drop(maybeItem, client:getPos())
return
end
npc:say(RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase2"))
end

if index == 3 then
cast = 0
storage.put("cast",cast )
level =0
storage.put("level",level )
end
if not index then
RPD.glog(RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase3"))
gold = 0
storage.put("cast",cast )
level =0
storage.put("level",level )
end
end

BuyItem = function(item,cast,level)
storage.put("cast",cast)
storage.put("itemm",itemm )
storage.put("item",item)
storage.put("level",level)

local itemm = RPD.ItemFactory:itemByName(item)

if not storage.get("level") then
level = 0
else
level = storage.get("level")
end

RPD.chooseOption(
dialogBuy,
(itemm:name().." + "..level),
(itemm:info()..RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase4")..cast),
RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase5"),
RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase6"),
RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase7"),
RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase8")
        )
end


----Быстрое
local dialog2 = function(index)
    if index == 0 then
BuyItem(Weapon4_,5*Weapon4:price(),0)
    end
    if index == 1 then
BuyItem(Weapon10_,5*Weapon10:price(),0)
    end
    if index == 2 then
        npc:say(RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase9"))
    end
end
-- меткое
local dialog3 = function(index)
    if index == 0 then
BuyItem(Weapon14_,5*Weapon14:price(),0)
    end
    
    if index == 1 then
BuyItem(Weapon3_,5*Weapon3:price(),0)
    end

    if index == 2 then
BuyItem(Weapon7_,5*Weapon7:price(),0)
    end
    if index == 3 then
BuyItem(Weapon6_,5*Weapon6:price(),0)
    end
    if index == 4 then
BuyItem(Weapon1_,5*Weapon1:price(),0)
    end
    if index == 5 then
        npc:say(RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase9"))
    end
end
-- быстрое и меткое
local dialog4 = function(index)
    if index == 0 then
BuyItem(Weapon15_,5*Weapon15:price(),0)
    end

    if index == 1 then
        npc:say(RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase9"))
    end
end
-- обычное
local dialog5 = function(index)
    if index == 0 then
BuyItem(Weapon13_,5*Weapon13:price(),0)
    end

    if index == 1 then
BuyItem(Weapon2_,5*Weapon2:price(),0)
    end

    if index == 2 then
BuyItem(Weapon8_,5*Weapon8:price(),0)
    end
    if index == 3 then
BuyItem(Weapon12_,5*Weapon12:price(),0)
    end
    if index == 4 then
BuyItem(Weapon5_,5*Weapon5:price(),0)
    end
    if index == 5 then
BuyItem(Weapon11_,5*Weapon11:price(),0)
    end
    if index == 6 then
BuyItem(Weapon9_,5*Weapon9:price(),0)
    end
    if index == 7 then
        npc:say(RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase9"))
    end
end

local dialog1 = function(index)
if index == 0 then
RPD.chooseOption( dialog2,
                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase10"),
                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase11"),
(Weapon4:name()),
(Weapon10:name()),
                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase8")
        )
end
if index == 1 then
RPD.chooseOption( dialog3,
                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase10"),
                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase12"),
(Weapon14:name()),
(Weapon3:name()),
(Weapon7:name()),
(Weapon6:name()),
(Weapon1:name()),

                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase8")
        )
end
if index == 2 then
RPD.chooseOption( dialog5,
                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase10"),
                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase13"),
(Weapon13:name()),
(Weapon2:name()),
(Weapon8:name()),
(Weapon12:name()),
(Weapon5:name()),
(Weapon11:name()),
(Weapon9:name()),

                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase8")
        )
end
if index == 3 then
RPD.chooseOption( dialog4,
                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase10"),
                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase14"),
(Weapon15:name()),

                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase8")
        )
end

end


return mob.init({
    interact = function(self, chr)
        client = chr
        npc = self

        RPD.chooseOption( dialog1,
                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase10"),
                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase15"),
RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase16"),
RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase17"),
RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase18"),
RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase19"),

                RPD.StringsManager:maybeId("CastleKeeperNPC_Phrase8")
        )
    end,
})
