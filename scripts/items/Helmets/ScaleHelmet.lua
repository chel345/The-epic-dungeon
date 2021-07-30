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
image     = 3,
name       = RPD.textById("ScaleHelmet_Name"),
info      = (RPD.textById("ScaleHelmet_Info")..descript(10,16))
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
