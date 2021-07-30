--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local hero = RPD.Dungeon.hero

local now = 0
local get = 5

return item.init{
    desc  = function ()
        return {
           image     = 2,
            imageFile = "items/Guns.png",
            name       = RPD.textById("Gun_Name"),
            info      = RPD.textById("Gun_Info"),
            stackable = false,
            upgradable    = true,
             price     = 250,
equipable     = "left_hand"
        }
end,

actions = function(self,item,hero)
if item:isEquipped(RPD.Dungeon.hero) then
return {RPD.textById("Fire"),("ЗАРЯДИТЬ("..now.."/"..get..")")} 
else
return {("ЗАРЯДИТЬ("..now.."/"..get..")")}
end
end,

activate = function(self, item, hero)

if hero:getBelongings().weapon then
RPD.Dungeon.level:drop(hero:getBelongings().weapon,hero:getPos())
hero:getBelongings().weapon:removeItemFrom(hero)
end
hero:getBelongings().slotBlocked(hero:getBelongings().weapon)
end,

deactivate = function(self, item, hero)
hero:getBelongings().slotBlocked(hero:getBelongings(),"weapon")
end,

typicalSTR  = function(self, item)
return 13 - item:level()
end,

requiredSTR = function(self, item)
return 13 - item:level()
end,

cellSelected = function(self, thisItem, action, cell)

if action == RPD.textById("Fire") and cell ~= nil then
thisItem:getUser():getSprite():zap(cell)
if now <= get and now ~= 0 then
now = now -1
pos = RPD.Ballistica:cast(thisItem:getUser():getPos(),cell,true,true,true)
RPD.Sfx.CellEmitter:get(pos):burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.STEAM ), 7);

RPD.zapEffect(thisItem:getUser():getPos(),pos,"Bolt")
RPD.playSound( "snd_explosion.mp3" )
local maybeMob = RPD.Actor:findChar(pos)
if maybeMob then
maybeMob:damage(math.random(2*RPD.Dungeon.depth,2*RPD.Dungeon.depth*(thisItem:level()+1)),thisItem:getUser())
if math.random(1,5) == 1 then
RPD.affectBuff(maybeMob,RPD.Buffs.Cripple,math.random(1,5))
end
end
local item = RPD.ItemFactory:itemByName("Guns/BrokenBolt")
if math.random(1,4) == 1 then
RPD.Dungeon.level:drop(item,pos)
end
else
RPD.glog(RPD.textById("NoCharge"))

end
end

end,

execute = function(self, item, hero, action)
if action == ("ЗАРЯДИТЬ("..now.."/"..get..")") then
item:getUser():getSprite():operate()
RPD.playSound( "snd_puff.ogg" )

if item:getUser():getBelongings():getItem("Guns/Bolt") then
if get > now then
item:getUser():getBelongings()
:getItem("Guns/Bolt"):detach(item:getUser():getBelongings()
.backpack)
now = now + 1
else
RPD.glog(RPD.textById("WeaponLoaded"))
end
else
RPD.glog(RPD.textById("NoBullets"))
end
end
if action == RPD.textById("Fire") then
item:selectCell( RPD.textById("Fire") ,RPD.textById("Select_A_Cage")")
end
end,

charAct = function(self,item)
if item:isEquipped(hero) then
hero:getBelongings().weapon.cursed = true
end
item:spend(1)
end

}
