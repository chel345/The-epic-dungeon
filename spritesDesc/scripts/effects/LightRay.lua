local RPD = require "scripts/lib/epicClasses"
local DungeonTileMap = luajava.bindClass("com.watabou.pixeldungeon.DungeonTilemap")
local storage = require "scripts/lib/storage"

local image

local LightRay = {
ray = function(from,to)

image = RPD.new("com.watabou.noosa.Image","effects/LightRay.png")

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

--[[
local ball = RPD.MobFactory:mobByName("effects/Boll")
ball:setPos(0)
RPD.Dungeon.level:spawnMob(ball)
RPD.setAi(ball,"update")
--]]
local function test(n)
RPD.glog("DF")
image:setScale(math.sqrt(dx*dx+dy*dy)/image.width,n/30)
if n % 29 == 0 then
image:killAndErase()
table.remove(RPD.functions,#RPD.functions)
end
end
RPD.functions[#RPD.functions+1] = test
RPD.GameScene:effect(image)
return
end
}
return LightRay
