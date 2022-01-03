--
-- User: mike
-- Date: 07.11.2017
-- Time: 0:13
-- This file is part of Remixed Pixel Dungeon.
--

local Indicator = loadfile "mobsDesc/Indicator.lua"
local RPD = require "scripts/lib/commonClasses"

RPD.StringsManager = luajava.bindClass("com.watabou.noosa.StringsManager")

RPD.ModdingMode = luajava.bindClass("com.nyrds.util.ModdingMode")

local functions = {}

RPD.addFunction = function(f)
	table.insert(functions, {f = f, n = 1})
end

RPD.runFunctions = function()
	for k, entry in pairs(functions) do
		if not entry.f(entry.n) then
			functions[k] = nil
		end
		entry.n = entry.n + 1
	end
end

RPD.mob = function(strMob)
	for _,i in pairs(Indicator()) do
		if RPD.ModdingMode:isResourceExistInMod("mobsDesc/"..i.."/"..strMob..".json") then
			return RPD.MobFactory:mobByName(i.."/"..strMob)
		end
	end
	return RPD.MobFactory:mobByName(strMob)
end

RPD.resetPos = function(mob,chr)
	local ownPos  = mob:getPos()
    local newPos  = chr:getPos()
    mob:move(newPos)
    mob:getSprite():move(ownPos, newPos)
    chr:move(ownPos)
    chr:getSprite():move(newPos, ownPos)
end

RPD.neutralMob = function()
	return require "scripts/lib/MobAi"
end

RPD.getMobs = function(level)
	local mobs = {}
	for i = 1, level:getLength() do
		local maybe = RPD.Actor:findChar(i)
		if maybe then
			mobs[#mobs+1] = maybe
		end
	end
	return mobs
end

RPD.roomsInstruments = {
spawnObj = function(tile,obj,radius,cell)
local level = RPD.Dungeon.level
local x = level:cellX(cell)
local y = level:cellY(cell)
for o = x - radius, x + radius do
for k = y - radius, y + radius do
local pos = RPD.Dungeon.level:cell(o,k)
if level.map[pos] == tile then
RPD.createLevelObject(obj,pos-1)
end
end
end
end,
spawnIt = function(tile,item,radius,cell)
local level = RPD.Dungeon.level
local cells = {0}
local x = level:cellX(cell)
local y = level:cellY(cell)
for o = x - radius, x + radius do
for k = y - radius, y + radius do
local pos = RPD.Dungeon.level:cell(o,k)
if level.map[pos] == tile then
cells[#cells+1]=pos
end
end
end
level:drop(item,cells[math.random(1,#cells)])
end
}

return RPD
