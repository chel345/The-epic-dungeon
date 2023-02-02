--
-- User: mike
-- Date: 24.01.2018
-- Time: 23:58
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local Wands = {
"BlackWand",
"BlessWand",
"NefritWand",
"SummonerWand",
"WandOfBlast",
"WandOfCrystalion",
"WandOfFireRune",
"WandOfGoodMage",
"WandOfLightbolt",
"WandOfMagicbolt",
"WandOfPossess",
"WandOfRock"
}
local a 
return mob.init{
interact = function(self, chr)
RPD.resetPos(self,chr)
end,
stats = function(self)
local a = storage.get("Wand") or math.random(1,#Wands)
storage.put("Wand",a)

self:ht(RPD.Dungeon.depth*2)
self:hp(self:ht())
self:dr(RPD.Dungeon.depth-2)
RPD.permanentBuff(self, RPD.Buffs.Roots)
if RPD.Dungeon.depth ~= 0 then
s = math.floor(RPD.Dungeon.depth/3)
else
s = 0
end
end,
attackProc = function(self,enemy,dmg)
if RPD.Dungeon.depth ~= 0 then
EPD.mobWandUser(Wands[a], self, enemy:getPos(),RPD.Dungeon.depth/2)
else
EPD.mobWandUser(Wands[a], self, enemy:getPos(),0)
end
return dmg
end,
zapProc = function(self,enemy,dmg)
if RPD.Dungeon.depth ~= 0 then
EPD.mobWandUser(Wands[a], self, enemy:getPos(),RPD.Dungeon.depth/2)
else
EPD.mobWandUser(Wands[a], self, enemy:getPos(),0)
end
return dmg
end,
damage = function(me, level)
RPD.playSound( "CrystalGaurd.ogg" )
end,
die = function(self)
    if Wands[a] then
        local wand = RPD.creteItem(("Wands/"..Wands[a]) ,{level=s})
        RPD.Dungeon.level:drop(wand, self:getPos())
    end
end
}
