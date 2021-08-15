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
image     = 1,
name       = RPD.StringsManager:maybeId("GoticHelmet_Name"),
info      = (RPD.StringsManager:maybeId("GoticHelmet_Info")..descript(18,20))
}
end,

getStr = function()
return 20
end,

getSprite = function()
return "GoticHelmet"
end,

getDr = function()
return 18
end,

addHead = function()
return false
end
}
