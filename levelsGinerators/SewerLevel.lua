local RPD = require "scripts/lib/commonClasses"
local table = 
{
kind = "Castle",
Entrance = "Entrance",
EntranceDebag = "EntranceDebag",
Exit = "Exit",
ExitHeigth = 4,
ExitWidth = 4,
RoomHeigth = 7,
RoomWidth = 7,
RandRooms = nil,
HasBase = false,
Chanse = 1,
Items = {"Ration"},
Water = true,
WaterMin = 2,
WaterMax = 3,
WaterChanse = 0.0005,
Grass = true,
GrassChanse = 0.0001,
GrassMin = 1,
GrassMax = 1,
Traps = {
"ToxicTrap",
"FireTrap",
"PoisonTrap",
"AlaramTrap",
"GrippingTrap",
"LightingTrap",
"ParalyticTrap",
"SecretToxicTrap",
"SecretFireTrap",
"SecretPoisonTrap",
"SecretAlaramTrap",
"SecretGrippingTrap",
"SecretLightingTrap",
"SecretParalyticTrap"
},
ChanseTrap = 0.1,
Shop = nil,
LevelShop = nil,
ShopWidth = 7,
ShopHeigth = 7,
NPC = "Ghost",
levelNPC = 2,
NPCRoom = nil,
NPCRoomWidth = nil,
NPCRoomHeigth = nil,
LevelNPC = nil,
Range = 100000,
GinFactor = 20,
RoomFactor = 0,
MiniBoss = "HugeCrabRoom",
LevelMiniBoss = 4
}
if RPD.Dungeon.depth > 3 then
table.RandRooms = {"Gold","Fishbowl","Sewer","Alhimy","Chasm","StatueRoom","Warehouse","Workshop","ArmorWarehouse","Library","BigLibrary","RatPost","LostRoom","LooserRoom","BestRoom","LowerRoom","BestRoom","BestRoom"}
elseif RPD.Dungeon.depth > 2 then
table.RandRooms = {"Gold","Fishbowl","Sewer","Alhimy","Chasm","StatueRoom","Warehouse","Workshop","ArmorWarehouse","Library","BigLibrary","LostRoom","LooserRoom","BestRoom","LowerRoom","BestRoom","BestRoom"}
else
table.RandRooms = {"Gold","Fishbowl","Alhimy","Chasm","StatueRoom","Warehouse","Workshop","ArmorWarehouse","Library","BigLibrary","LostRoom","LooserRoom","BestRoom","LowerRoom","BestRoom","BestRoom"}
end

return table
