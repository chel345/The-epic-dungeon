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
image     = 3,
name       = "Чешуйчатый шлем",
info      = ("Достаточно неплохой шлем от чешуйчатого доспеха."..descript(10,16))
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
