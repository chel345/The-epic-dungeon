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
           image     = 19,
            name      = RPD.textById("LordWand_Name"),
            info      = RPD.textById("LordWand_Info")
        }
end, 

activate = function(self, item, hero)
RPD.removeBuff(hero, RPD.Buffs.Light)
RPD.permanentBuff(hero, RPD.Buffs.Light)
end,

deactivate = function(self, item, hero)
RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
end,

castOnCell = function(self, thisItem, on,dst,lvl)
thisItem:getUser():spend(TIME_TO_ZAP)
local level = RPD.Dungeon.level
local me = thisItem:getUser()
lvl = lvl + 1

ray = function(cell)
local from = level:cellX(cell)
local to = cell
local enemy = RPD.Actor:findChar(to)
RPD.zapEffect(from,to,"DeathRay")
if enemy and enemy ~= me then
enemy:damage(math.random(10,20),me)
end
end

local x = level:cellX(on)
local y = level:cellY(on)
for i = x - 4-lvl, x + 4+lvl do
for j = y - 4-lvl, y + 4+lvl do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] ~= RPD.Terrain.WALL and level.map[pos] ~= RPD.Terrain.WALL_DECO and math.random(1,6) == 1 then
ray(pos-1)
end
end
end
end,

bag = function(self, item)
        return "WandHolster"
end,

selectType = function()
return "cell"
end,

getMana = function()
return 25
end,

getManaMes = function()
return RPD.textById("No_Mana")
end
}
