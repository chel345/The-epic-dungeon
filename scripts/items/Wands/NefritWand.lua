--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local wand = require "scripts/lib/wand"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"
local TIME_TO_ZAP = 1
return wand.init{ 
    desc  = function()  
        return {
           image     = 11,
            name      = RPD.textById("NefritWand_Name"),
            info      = RPD.textById("NefritWand_Info")
        }
end, 

activate = function(self, item, hero)
end,

deactivate = function(self, item, hero)
end,

cast = function(self,thisItem,lvl)
thisItem:getUser():spend(TIME_TO_ZAP)
if thisItem:isEquipped(RPD.Dungeon
.hero) then
if math.random(1,3) == 1 then

--thisItem:detach(RPD.Dungeon.hero:getBelongings():getItem("NefritWand"))
thisItem:removeItemFrom(RPD.Dungeon.hero)
end
local level = RPD.Dungeon.level
        local hero = RPD.Dungeon.hero
  
            local mob = RPD.MobFactory:mobByName("IceNefrit")
local cell = hero:getPos()
            mob:setPos(cell)
      level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))
else
if math.random(1,2) == 1   then

local level = RPD.Dungeon.level
        local hero = RPD.Dungeon.hero
  
            local mob = RPD.MobFactory:mobByName("IceNefrit")
local cell = hero:getPos()
            mob:setPos(cell)
      level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))
      else
      RPD.glog(RPD.textById("NothingHasHappened"))
end  
end
thisItem:detach(RPD.Dungeon.hero:getBelongings().backpack)
end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "none"
end,

getMana = function()
return 0
end,

getManaMes = function()
return RPD.textById("No_Mana")
end
}
