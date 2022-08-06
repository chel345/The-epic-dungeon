local RPD = require "scripts/lib/epicClasses"

local room = require "scripts/lib/room"

local storage = require"scripts/lib/storage"

local script
local gin

local Ginerator = {
CreateLevel = function(file)

if storage.get("key") then
return
end

script = loadfile("levelsGinerators/"..file..".lua")
gin = script()
for i = 1, RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.ENTRANCE then
RPD.Dungeon.hero:move(i-1)
end
end

if not gin.HasBase then
room.ClearLevel()
end


}
return Ginerator 
