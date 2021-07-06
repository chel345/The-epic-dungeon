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
return ("\n\nЭтот шлем блокирует "..dr.." единиц урона и требует "..str.." очков силы. В противном случае, в нём будет плохо видно.")
end

return helmet.init{

desc  = function ()
return {
image     = 2,
name       = "Латный шлем",
info      = ("Шлем из сплетённых между собой латных пластин довольно хорош."..descript(15,18))
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
