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
image     = 3,
name       = RPD.StringsManager:maybeId("ScaleHelmet_Name"),
info      = (RPD.StringsManager:maybeId("ScaleHelmet_Info")..descript(10,16))
}
end,

getStr = function()
return 16
end,

getSprite = function()
return "ScaleHelmet"
end,

getDr = function()
return 10
end,

addHead = function()
return false
end

}
