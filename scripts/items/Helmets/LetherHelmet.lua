--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"

local EPD = require "scripts/lib/dopClasses"

local hero = RPD.Dungeon.hero

bunus = 4

return item.init{

desc  = function ()
return {
image     = 0,
imageFile = "items/Helmets.png",
name       = "Кожанный шлем",
info      = ("Шлем из шкуры монстра обеспечивает достаточно надёжную защиту. Он даст тебе +"..bunus.." к броне."),
stackable = false,
upgradable    = true,
price     = 50,
equipable     = "left_hand"
}
end,

activate = function(self, item, hero)
RPD.removeBuff(item:getUser(),"Helmet")
RPD.permanentBuff(item:getUser(),"Helmet")
p = item:getUser():speed()
if hero:effectiveSTR() < 11-item:level() then
hero:speed(hero:speed()-(11-hero:effectiveSTR()))
end
level = item:level()+1
hero:dr(hero:dr()+4 * level)
end,

deactivate = function(self, item, hero)
RPD.removeBuff(item:getUser(),"Helmet")
hero:speed(p)
hero:dr(hero:dr()+4+level)
end,

typicalSTR  = function(self, item)
level = item:level()
bunus = 4+level
return 11 - item:level()
end,

requiredSTR = function(self, item)
return 11 - item:level()
end,
}
