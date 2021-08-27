--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local mob = require"scripts/lib/mob"

local spells = {
DarkSperal = {"S1","S2","S3","S4"},
YellowSperal = {"A1","A2","A3","A4"},
TombPiece = {"B1","B2","B3","B4"},
BluePitch = {"C1","C2","C3","C4"},
Quartz = {"D1","D2","D3","D4"},
SpiderHelmet = {"I1","I2","I3","I4"},
DworfSkull = {"F1","F2","F3","F4"},
HandmadeCrystal = {"J1","J2","J3","J4"}
}

local perf

local material
local materials = {}
local spell
local cast

local l

return mob.init({
stats = function(self)
end,
interact = function(self, chr)

local function selectMaterial()

local function getItem(mtrl)
if RPD.Dungeon.hero:getBelongings():getItem("Materials/"..mtrl) then
return true
end
return false
end

local function chooseMaterial(idx)
material = materials[idx+1]
RPD.chooseOption(perf,self:name(),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase1"),(material.."_Name"),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase2"),"Уйти")
end

local mass = {}
if getItem("DarkSperal") then
mass[#mass+1] = RPD.StringsManager:maybeId("DarkSperal_Name")
materials[#materials+1] = "DarkSperal"
end
if getItem("YellowSperal") then
mass[#mass+1] = RPD.StringsManager:maybeId("YellowSperal_Name")
materials[#materials+1] = "YellowSperal"
end
if getItem("TombPiece") then
mass[#mass+1] = RPD.StringsManager:maybeId("TombPiece_Name")
materials[#materials+1] = "TombPiece"
end
if getItem("BluePitch") then
mass[#mass+1] = RPD.StringsManager:maybeId("BluePitch_Name")
materials[#materials+1] = "BluePitch"
end
if getItem("Quartz") then
mass[#mass+1] = RPD.StringsManager:maybeId("Quartz_Name")
materials[#materials+1] = "Quartz"
end
if getItem("SpiderHelmet") then
mass[#mass+1] = RPD.StringsManager:maybeId("SpiderHelmet_Name")
materials[#materials+1] = "SpiderHelmet"
end
if getItem("HandmadeCrystal") then
mass[#mass+1] = RPD.StringsManager:maybeId("HandmadeCrystal_Name")
materials[#materials+1] = "HandmadeCrystal"
end
if getItem("DworfSkull") then
mass[#mass+1] = RPD.StringsManager:maybeId("DworfSkull_Name")
materials[#materials+1] = "DworfSkull"
end
if #mass == 0 then
RPD.glog(RPD.StringsManager:maybeId("RunicSkullMaster_Phrase3"))
return
end
RPD.chooseOption(chooseMaterial,self:name(),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase5"),mass[1],mass[2],mass[3],mass[4],mass[6],mass[7],mass[8])
end

local function selectSpell()
if not material then
RPD.glog(RPD.StringsManager:maybeId("RunicSkullMaster_Phrase4"))
return
end

local function chooseSpell(idx)
if idx == 0 then
spell = spells[material][1]
cast = 300
end
if idx == 1 then
spell = spells[material][2]
cast = 600
end
if idx == 2 then
spell = spells[material][3]
cast = 900
end
if idx == 3 then
spell = spells[material][4]
cast = 1200
end
l = idx + 1
RPD.chooseOption(perf,self:name(),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase1"),(material.."_Name"),(spell.."_Name"),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase6"),(RPD.StringsManager:maybeId("RunicSkullMaster_Phrase7")..tostring(cast).."g"))
end

RPD.chooseOption(chooseSpell,self:name(),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase8"),spells[material][1],spells[material][2],spells[material][3],spells[material][4])
end

perf = function(idx)
if idx == 0 then
selectMaterial()
end
if idx == 1 then
selectSpell()
end
if idx == 3 then
       if chr:gold() >= cast then
            chr:spendGold(cast)
            if material == "DarkSperal" then
            l = 10 + l
            end
            if material == "YellowSperal" then
            l = 20 + l
            end
            if material == "TombPiece" then
            l = 30 + l
            end
            if material == "BluePitch" then
            l = 40 + l
            end
            if material == "Quartz" then
            l = 50 + l
            end
            if material == "SpiderHelmet" then
            l = 60 + l
            end
            if material == "DworfSkull" then
            l = 70 + l
            end
            if material == "HandmadeCrystal" then
            l = 80 + l
            end
            RPD.Dungeon.level:drop(RPD.createItem("Skulls/CustomSkull",{level=l}), chr:getPos())
            RPD.Dungeon.hero:getBelongings():getItem("Materials/"..material):removeItemFrom(chr)
            material = nil
            materials = {}
            spell = nil
            cast = nil
            return
       end
end
end
if material then
RPD.chooseOption(perf,self:name(),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase1"),(material.."_Name"),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase5"),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase6"))
else
RPD.chooseOption(perf,self:name(),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase1"),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase9"),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase10"),RPD.StringsManager:maybeId("RunicSkullMaster_Phrase6"))
end
end
})


