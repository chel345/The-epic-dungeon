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
can3 = 3
if present == nil then
present = 0
end
        return {
           image     = 1,
            imageFile = "items/Guns.png",
            name       = "Пищаль",
            info      = "Ружьё с подозрительно длинным дулом. Его корпис состоит из древисины чёрного дуба- черезвычпйно дорого дерева.",
            stackable = false,
            upgradable    = true,
             price     = 200,
equipable     = "left_hand"
        }
    end,
    actions = function(self,item,hero) 
if item:isEquipped(RPD.Dungeon.hero) then
return {"ВЫСТРЕЛИТЬ",("ЗАРЯДИТЬ("..present.."/"..can3..")")} 
else
return {("ЗАРЯДИТЬ("..present.."/"..can3..")")}
    end
    end,
activate = function(self, item, hero)
if item:getUser() ~= nil then
                RPD.removeBuff(item:getUser(), "Gun")

        RPD.permanentBuff(item:getUser(), "Gun")

p = item:getUser():speed()
if hero:effectiveSTR() < 11-item:level() then
hero:speed(hero:speed()-(11-hero:effectiveSTR()))
end
end    
    end,

    deactivate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), "Gun")

hero:speed(p)
    end,

                typicalSTR  = function(self, item)

            return 11 - item:level()
        end,

        requiredSTR = function(self, item)
            return 11 - item:level()
        end,

    cellSelected = function(self, thisItem, action, cell)

if action == "ВЫСТРЕЛИТЬ" and cell ~= nil then
thisItem:getUser():getSprite():zap(cell)
if present <= can3 and present ~= 0 then
present = present -1
pos = RPD.Ballistica:cast(thisItem:getUser():getPos(),cell,true,true,true)
RPD.Sfx.CellEmitter:get(pos):burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.STEAM ), 7);

RPD.zapEffect(thisItem:getUser():getPos(),pos,"Bolt")
RPD.playSound( "snd_explosion.ogg" )
local maybeMob = RPD.Actor:findChar(pos)
if maybeMob then
maybeMob:damage(math.random(2*RPD.Dungeon.depth/3,2*RPD.Dungeon.depth*(thisItem:level()+1)),thisItem:getUser())
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
        if action == ("ЗАРЯДИТЬ("..present.."/"..can3..")") then
item:getUser():getSprite():operate()
RPD.playSound( "snd_puff.ogg" )

if item:getUser():getBelongings():getItem("Guns/Bolt") then
if can3 > present then
item:getUser():getBelongings()
:getItem("Guns/Bolt"):detach(item:getUser():getBelongings()
.backpack)
a = 1
present = present + 1
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
