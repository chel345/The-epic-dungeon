--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local EPD = require "scripts/lib/dopClasses"


return item.init{
 desc  = function ()
        return {
           image     = 0,
            imageFile = "items/Tears.png",
            name      = "Камень слёз",
            info     = "Саммонит стражей. Цена - 20 маны.",
            stackable = false,
             price     = 200,
           isArtifact    = true
        }
    end,   
    actions = function(self, item,  hero)
        if item:isEquipped(hero) then
            return {"ИСПОЛЬЗОВАТЬ"}
        end
        return {}
    end,
        cellSelected = function(self, thisItem, action, cell)
        if action == "ИСПОЛЬЗОВАТЬ" then

mana = RPD.Dungeon.hero:getSkillPoints()
if mana > 20 then
RPD.Dungeon.hero:spendSkillPoints(20)
else
RPD.glog("-- Не хватает маны")
return
end

local level = RPD.Dungeon.level
if cell then
if level.fieldOfView[cell] then
RPD.playSound( "TearsRock.ogg" )
RPD.topEffect(cell,"BlueMagicCould")
local mob = RPD.MobFactory:mobByName("TearsGuard")
mob:setPos(cell)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero)) 
end
end
end
end,
    execute = function(self, item, hero, action)
        if action == "ИСПОЛЬЗОВАТЬ" then
            item:selectCell("ИСПОЛЬЗОВАТЬ","Выбирете клетку")
        end
    end

}