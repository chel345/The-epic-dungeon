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
image     = 0,
name       = "Кожанный шлем",
info      = ("Шлем из шкуры монстра обеспечивает нормальную защиту."..descript(5,12))
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
