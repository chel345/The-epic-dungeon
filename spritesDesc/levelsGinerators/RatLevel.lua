local table = 
{
kind = "Caves",
Entrance = "CavesEntrance",
EntranceDebag = "EntranceDebag",
Exit = "CavesExit",
ExitHeigth = 4,
ExitWidth = 4,
RoomHeigth = 5,
RoomWidth = 5, 
RandRooms = {"RatBigCave","RatLibrary","RatBigLibrary","RatArmory","RatArmoryBlue","RatFishbowl","RatWarehause","RatAlhimy","RatBank","RatTomb","RatGarden","RatGuards","RatArchers","RatRiches","RatBestRoom","RatBestRoom","RatBestRoom","RatBestRoom"},
--RandRooms = {"RatBank"},
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
Shop = "RatShop",
LevelShop = 6,
ShopWidth = 5,
ShopHeigth = 5,
levelNPC = 8,
NPCRoom = "RatEpicBankerRoom",
NPCRoomWidth = 9,
NPCRoomHeigth = 9,
Range = 10000,
GinFactor = 20,
RoomFactor = 0,
MiniBoss = "RatcatcherRoom",
LevelMiniBoss = 7
}

return table
