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
image     = 0,
name       = RPD.StringsManager:maybeId("LeatherHelmet_Name"),
info      = (RPD.StringsManager:maybeId("LeatherHelmet_Info")..descript(5,12))
}
end,

getStr = function()
return 12
end,

getSprite = function()
return "LeatherHelmet"
end,

getDr = function()
return 5
end,

addHead = function()
return true
end

}
