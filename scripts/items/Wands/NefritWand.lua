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

return wand.init{ 
    desc  = function()  
        return {
           image     = 11,
            name      = "Жезл ледяного эфрита",
            info      = "Подобные жезлы имеются у ледяных эфритов."
        }
end, 

activate = function(self, item, hero)
end,

deactivate = function(self, item, hero)
end,

cast = function(self,thisItem,lvl)
thisItem:getUser():getSprite():zap()
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
thisItem:getUser():getSprite():zap()

local level = RPD.Dungeon.level
        local hero = RPD.Dungeon.hero
  
            local mob = RPD.MobFactory:mobByName("IceNefrit")
local cell = hero:getPos()
            mob:setPos(cell)
      level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))
      else
      RPD.glog("Ничего не произошло")
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
return "-- не хватает маны"
end
}