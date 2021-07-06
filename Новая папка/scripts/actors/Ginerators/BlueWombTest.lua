--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

return actor.init({
    activate = function()
if not storage.get("key") then

--подготовка
local level = RPD.Dungeon.level
for i = 0,RPD.Dungeon.level:getLength()-1 do           
level:set(i, RPD.Terrain.WALL )
RPD.GameScene:updateMap(i)
end

--генерация
local level = RPD.Dungeon.level
local l = level:getLength()
local w = level:getWidth()
a = 2 * w + 3
for i = 1, l do
if i == a then
c = i
Ginerator.CastleLevel.Room1(c)
break
end
end

d = 1 
s = w / 5
for i = 1, l-1 do
if i == c and d < s then
c = c + 2 * 2 + 1
Ginerator.CastleLevel.Room1(c-1)
d = d + 1
elseif i == c and d == s then
c = c + 2 * w * 2 + 5
d = 1
if c < l then
Ginerator.CastleLevel.Room1(c-1)
end
end
end



--[[
local a = 0
for i = 1, level:getLength()/13 do
a = a + 13
Ginerator.BlueWomb.Room4(a,1)
end
--]]


-- выход
--[[local p = RPD.Dungeon.level:randomRespawnCell()
RPD.Dungeon.level:setExit(p)
RPD.Dungeon.level:set(p, RPD.Terrain.EXIT )
RPD.GameScene:updateMap(p)
--]]

-- граница
Ginerator.MakeBorder()

end
storage.put("key",true)
end,
    actionTime = function()
        return 5*math.random(1,10)
    end
})