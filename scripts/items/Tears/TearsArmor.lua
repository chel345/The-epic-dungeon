--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"


return item.init{
    desc  = function (self,item)
itt = item
        return {
            imageFile = "items/TearsArmor.png",
            name      = "Броня слёз",
            info      = "Переливающийся блекло - синими и блекло - фиолетовыми оттенками, броня, что была выкованна неизвестным кузнецом из руды печали и закалённая в слезах. Она приобрела свойство впитывать боль своего носителя, тем самым укрепляясь.",
            stackable = false,
            price     = 10000,
            upgradable = true,
            equipable = "armor"
        }
    end,
image = function()
if itt:level() > 10 then
return 4
end
if itt:level() > 7 then
return 4
end
if itt:level() > 5 then
return 3
end
if itt:level() > 3 then
return 2
end
if itt:level() > 1 then
return 1
end
return 0
end,
typicalSTR  = function(self, item)
return 14 - item:level()
end,
requiredSTR = function(self, item)
return 14 - item:level()
end,
effectiveDr = function(user)
return 10*itt:level()
end,

defenceProc = function(self,item,hero,enemy,dmg)
if dmg >= item:level()*10+1.5 then
item:level(item:level()+1)
else
item:level(item:level()-1)
end
return dmg
end,


UpdateSprite = function()
local hero = RPD.Dungeon.hero
local dr = hero:getBelongings().armor
local itt = RPD.Dungeon.hero:getBelongings():getItem("Tears/TearsArmor")
armor = "hero_modern/armor/Tears/TearsArmor"
if itt:level() > 7 then
armor = (armor.."_lvl4.png")
elseif itt:level() > 5 then
armor = (armor.."_lvl3.png")
elseif itt:level() > 3 then
armor = (armor.."_lvl2.png")
elseif itt:level() > 1 then
armor = (armor.."_lvl1.png")
else
armor = (armor..".png")
end

if dr == itt and stat ~= armor then
stat = armor
hero:overrideSpriteLayer("armor",armor)
pcall(function() hero:updateSprite() end)
elseif dr ~= itt and stat == armor then 
hero:overrideSpriteLayer("armor",nil)
pcall(function() hero:updateSprite() end)
stat = nil
end
end
}
