--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local hero = RPD.Dungeon.hero

return item.init{
    desc  = function ()
can2 = 2
if present2 == nil then
present2 = 0
end
        return {
           image     = 0,
            imageFile = "items/Guns.png",
            name       = RPD.textById("Muchket_Name"),
            info      = RPD.textById("Muchket_Info"),
            stackable = false,
            upgradable    = true,
             price     = 100,
equipable     = "left_hand"
        }
    end,
    actions = function(self,item,hero) 
if item:isEquipped(RPD.Dungeon.hero) then
return {RPD.textById("Fire"),("ЗАРЯДИТЬ("..present2.."/"..can2..")")} 
else
return {("ЗАРЯДИТЬ("..present2.."/"..can2..")")}
    end
    end,
activate = function(self, item, hero)
--                RPD.removeBuff(item:getUser(), "Gun")

--        RPD.permanentBuff(item:getUser(), "Gun")

p = item:getUser():speed()
if hero:effectiveSTR() < 10-item:level() then
hero:speed(hero:speed()-(10-hero:effectiveSTR()))
end    
    end,

    deactivate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Gun")

hero:speed(p)
    end,

                typicalSTR  = function(self, item)

            return 10 - item:level()
        end,

        requiredSTR = function(self, item)
            return 10 - item:level()
        end,

    cellSelected = function(self, thisItem, action, cell)

if action == RPD.textById("Fire") and cell ~= nil then
thisItem:getUser():getSprite():zap(cell)
if present2 <= can2 and present2 ~= 0 then
present2 = present2 -1
pos = RPD.Ballistica:cast(thisItem:getUser():getPos(),cell,true,true,true)
RPD.Sfx.CellEmitter:get(pos):burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.STEAM ), 7);

RPD.zapEffect(thisItem:getUser():getPos(),pos,"Bolt")
RPD.playSound( "snd_explosion.ogg" )
local maybeMob = RPD.Actor:findChar(pos)
if maybeMob then
maybeMob:damage(math.random(2*RPD.Dungeon.depth/4,2*RPD.Dungeon.depth*(thisItem:level()+1)),thisItem:getUser())
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
        if action == ("ЗАРЯДИТЬ("..present2.."/"..can2..")") then
item:getUser():getSprite():operate()
RPD.playSound( "snd_puff.ogg" )

if item:getUser():getBelongings():getItem("Guns/Bolt") then
if can2 > present2 then
item:getUser():getBelongings()
:getItem("Guns/Bolt"):detach(item:getUser():getBelongings()
.backpack)
a = 1
present2 = present2 + 1
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
end
}
