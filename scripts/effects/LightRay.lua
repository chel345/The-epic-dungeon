local RPD = require "scripts/lib/commonClasses"
local DungeonTileMap = luajava.bindClass("com.watabou.pixeldungeon.DungeonTilemap")
local LightRay = {
ray = function(from,to)

local image = RPD.new("com.watabou.noosa.Image","effects/LightRay.png")

local A = 180/math.pi

local s = DungeonTileMap:tileCenterToWorld(from)
local e = DungeonTileMap:tileCenterToWorld(to)

image.origin:set(0,image.height/2)

image.x = s.x - image.origin.x
image.y = s.y - image.origin.y

local dx = e.x-s.x
local dy = e.y-s.y

image.angle = math.atan2(dy,dx)*A
image:setScale(math.sqrt(dx*dx+dy*dy)/image.width,1)

RPD.GameScene:effect(image)
end
}
return LightRay
