--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local helmet = require "scripts/lib/helmet"

local EPD = require "scripts/lib/dopClasses"

descript = function(dr,str)
return (RPD.StringsManager:maybeId("ArmorPoints")..dr..RPD.StringsManager:maybeId("StrengthPoints_1")..str..RPD.StringsManager:maybeId("StrengthPoints_2"))
end

return helmet.init{

desc  = function ()
return {
image     = 2,
name       = RPD.StringsManager:maybeId("PlateHelmet_Name"),
info      = (RPD.StringsManager:maybeId("PlateHelmet_Info")..descript(15,18))
}
end,

getStr = function()
return 18
end,

getSprite = function()
return "PlateHelmet"
end,

getDr = function()
return 15
end,

addHead = function()
return false
end

}
