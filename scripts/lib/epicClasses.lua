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

RPD.functions = {}

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

return RPD
