local table = 
{
kind = "Womb",
Entrance = "CavesEntrance",
EntranceDebag = "EntranceDebag",
Exit = "CavesExit",
ExitHeigth = 4,
ExitWidth = 4,
RoomHeigth = 7,
RoomWidth = 7, 
RandRooms = {"GutsArmory","GutsRoom","GutsHell","GutsLibrary","BigGutsLibrary","GutsHeart","BlueFungus","ShadowScorpionsNest","GutsNightmares","GutsChaos","FungusScorpionsNest","GutsFishbowl","GutsTomb","GutsAlhimy"},
--RandRooms = {"SpinnerNest"},
HasBase = false,
Items = {"Ration"},
Water = true,
WaterMin = 1,
WaterMax = 3,
WaterChanse = 0.0005,
Grass = true,
GrassChanse = 0.0001,
GrassMin = 1,
GrassMax = 3,
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
Shop = "GutsShop",
LevelShop = 37,
ShopWidth = 7,
ShopHeigth = 7,
NPC = nil,
levelNPC = 37,
NPCRoom = nil,
NPCRoomWidth = 7,
NPCRoomHeigth = 7,
Range = 10000,
GinFactor = 20,
RoomFactor = 0,
MiniBoss = {"YogsEyeRoom"},
LevelMiniBoss = 39,
WombFactor = 2,
WombFactorChanse = 60,
WombSeed = 10
}

return table