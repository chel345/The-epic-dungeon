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
it = item
        return {
            imageFile = "items/TearsSword.png",
            name      = RPD.textById("TearsSword_Name"),
            info      = RPD.textById("TearsSword_Info"),
            stackable = false,
            price     = 10000,
            upgradable = true,
            equipable = "weapon"
        }
    end,
image = function()
if it:level() > 7 then
return 4
end
if it:level() > 5 then
return 3
end
if it:level() > 3 then
return 2
end
if it:level() > 1 then
return 1
end
return 0
end,
attackProc = function(self,item,hero,enemy,dmg)
if dmg >= item:level()*20+1.5 then
item:level(item:level()+1)
else
item:level(item:level()-1)
end
if math.random(1,3) == 1 then
missile = hero:getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
missile:reset( hero:getPos(),enemy:getPos(),nil)
missile:size(7)
missile:pour( RPD.Sfx.ElmoParticle.FACTORY, 0.01f)
return dmg*2
end
return dmg
end,
typicalSTR  = function(self, item)
return 14 - item:level()
end,
requiredSTR = function(self, item)
return 14 - item:level()
end,
damageRoll = function(user)
return 20*it:level()
end,
isFliesStraight = function()
return true
end,
goodForMelee = function()
return true
end,
getAttackAnimationClass = function()
return "sword"
end,
UpdateSprite = function()
local hero = RPD.Dungeon.hero
local weapon = hero:getBelongings().weapon
local it = RPD.Dungeon.hero:getBelongings():getItem("Tears/TearsSword")
sword = "hero_modern/items/Tears/TearsSword"
if it:level() > 7 then
sword = (sword.."_lvl4.png")
elseif it:level() > 5 then
sword = (sword.."_lvl3.png")
elseif it:level() > 3 then
sword = (sword.."_lvl2.png")
elseif it:level() > 1 then
sword = (sword.."_lvl1.png")
else
sword = (sword..".png")
end

if weapon == it and stats ~= sword then
stats = sword
hero:overrideSpriteLayer("right_hand_item",sword)
pcall(function() hero:updateSprite() end)
elseif weapon ~= it and stats == sword then 
stats = nil
hero:overrideSpriteLayer("right_hand_item",nil)
pcall(function() hero:updateSprite() end)
end
end
}
