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

return RPD
