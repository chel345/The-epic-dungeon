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
can1 = 4
if present1 == nil then
present1 = 0
end
        return {
           image     = 2,
            imageFile = "items/Guns.png",
            name       = "Гвардейское ружьё",
            info      = "Такое оружие носят стрельцы из полка короля Андервонда. Лучше ружья пока никто не придумал.",
            stackable = false,
            upgradable    = true,
             price     = 250,
equipable     = "left_hand"
        }
    end,
    actions = function(self,item,hero) 
if item:isEquipped(RPD.Dungeon.hero) then
return {"ВЫСТРЕЛИТЬ",("ЗАРЯДИТЬ("..present1.."/"..can1..")")} 
else
return {("ЗАРЯДИТЬ("..present1.."/"..can1..")")}
    end
    end,
activate = function(self, item, hero)
if item:getUser() ~= nil then
RPD.removeBuff(item:getUser(), "Gun")
RPD.permanentBuff(item:getUser(), "Gun")
p = item:getUser():speed()
if hero:effectiveSTR() < 13-item:level() then
hero:speed(hero:speed()-(13-hero:effectiveSTR()))
end
end    
    end,

    deactivate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Gun")

hero:speed(p)
    end,

                typicalSTR  = function(self, item)

            return 13 - item:level()
        end,

        requiredSTR = function(self, item)
            return 13 - item:level()
        end,

    cellSelected = function(self, thisItem, action, cell)

if action == "ВЫСТРЕЛИТЬ" and cell ~= nil then
thisItem:getUser():getSprite():zap(cell)
if present1 <= can1 and present1 ~= 0 then
present1 = present1 -1
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
RPD.glog("** Оружие не заряжено")

end
end

end,
    execute = function(self, item, hero, action)
        if action == ("ЗАРЯДИТЬ("..present1.."/"..can1..")") then
item:getUser():getSprite():operate()
RPD.playSound( "snd_puff.ogg" )

if item:getUser():getBelongings():getItem("Guns/Bolt") then
if can1 > present1 then
item:getUser():getBelongings()
:getItem("Guns/Bolt"):detach(item:getUser():getBelongings()
.backpack)
a = 1
present1 = present1 + 1
else
RPD.glog("** Оружие и так заряжено")
end
else
RPD.glog("** В твоём инвентаре нет патронов")
end
end
if action == "ВЫСТРЕЛИТЬ" then
item:selectCell( "ВЫСТРЕЛИТЬ" ,"Выбирите клетку.")
end
end
}
