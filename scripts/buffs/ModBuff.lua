-- This is demo buff for charAct

local RPD  = require "scripts/lib/commonClasses"

local buff = require "scripts/lib/buff"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

--tears loot
local TearsSword = require("scripts/items/Tears/TearsSword")

local TearsArmor = require("scripts/items/Tears/TearsArmor")

local TearsWand = require("scripts/items/Tears/TearsWand")

-- candles
local TearsCandle = require("scripts/items/Candles/TearsCandle")

local RatCandle = require("scripts/items/Candles/RatCandle")

local CaretakersCandle = require("scripts/items/Candles/CaretakersCandle")

local FireCandle = require("scripts/items/Candles/FireCandle")

local Candle = require("scripts/items/Candles/Candle")

return buff.init{
    desc  = function ()
        return {
            icon          = -1,
            name          = "CounterBuff_Name",
            info          = "CounterBuff_Info",
        }
    end,
    attachTo = function(self, buff, target)
cry = nil
    if type(target) == nil or type(RPD.Dungeon.hero) == nil then
    return
    end
    return false
    end,
    act = function(self,buff)
        buff:detach()
    end,



    detach = function(self, buff)
    end,
    act = function(self,buff)
        buff:detach()
end, 

    charAct = function(self,buff)
-- TearsSword
if RPD.Dungeon.hero ~= nil then
if RPD.Dungeon.hero:getBelongings():getItem("Tears/TearsSword") then
TearsSword.UpdateSprite()
end
end

-- TearsArmor
if RPD.Dungeon.hero ~= nil then
if RPD.Dungeon.hero:getBelongings():getItem("Tears/TearsArmor") then
TearsArmor.UpdateSprite()
end
end

-- TearsWand
if RPD.Dungeon.hero ~= nil then
if RPD.Dungeon.hero:getBelongings():getItem("Tears/TearsWand") then
TearsWand.UpdateSprite()
end
end

-- TearsCandle
if RPD.Dungeon.hero ~= nil then
if RPD.Dungeon.hero:getBelongings():getItem("Candles/TearsCandle") then
TearsCandle.CharAct()
end
end

-- RatCandle
if RPD.Dungeon.hero ~= nil then
if RPD.Dungeon.hero:getBelongings():getItem("Candles/RatCandle") then
RatCandle.CharAct()
end
end

-- CaretakersCandle
if RPD.Dungeon.hero ~= nil then
if RPD.Dungeon.hero:getBelongings():getItem("Candles/CaretakersCandle") then
CaretakersCandle.CharAct()
end
end

-- FireCandle
if RPD.Dungeon.hero ~= nil then
if RPD.Dungeon.hero:getBelongings():getItem("Candles/FireCandle") then
FireCandle.CharAct()
end
end

-- Candle
if RPD.Dungeon.hero ~= nil then
if RPD.Dungeon.hero:getBelongings():getItem("Candles/Candle") then
Candle.CharAct()
end
end

if not storage.get("Crystal") then
storage.put("Crystal",true)
for i = 1,RPD.Dungeon.level:getLength()-1 do  
local maybeMob = RPD.Actor:findChar(i)         
if maybeMob and maybeMob  ~= RPD.Dungeon.hero and maybeMob:getMobClassName() == "Crystal" then
maybeMob:destroy() 
maybeMob:getSprite():killAndErase()
CrystalMod:setPos(i)
local CrystalMod = RPD.MobFactory:mobByName("CrystalMod")

RPD.Dungeon.level:spawnMob(CrystalMod)
end
end
end

EPD.time = EPD.time + 1
if EPD.time % 8 == 0 then
RPD.Dungeon.hero:spendSkillPoints(-1)
end
end,
defenceProc = function(self,buff,enemy,damage)
-- RatCandle
if RPD.Dungeon.hero ~= nil then
if RPD.Dungeon.hero:getBelongings():getItem("Candles/RatCandle") then
RatCandle.DefenseProc()
end
end
return damage
end
}
