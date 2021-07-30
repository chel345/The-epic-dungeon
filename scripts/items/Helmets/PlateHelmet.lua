--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local helmet = require "scripts/lib/helmet"

local EPD = require "scripts/lib/dopClasses"

descript = function(dr,str)
return (RPD.textById("ArmorPoints")..dr..RPD.textById("StrengthPoints_1")..str..RPD.textById("StrengthPoints_2"))
end

return helmet.init{

desc  = function ()
return {
image     = 2,
name       = RPD.textById("PlateHelmet_Name"),
info      = (RPD.textById("PlateHelmet_Info")..descript(15,18))
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
