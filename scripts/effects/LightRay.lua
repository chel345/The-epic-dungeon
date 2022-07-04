local RPD = require "scripts/lib/epicClasses"
local DungeonTileMap = luajava.bindClass("com.watabou.pixeldungeon.DungeonTilemap")


local LightRay = {
    ray = function(from, to)
        RPD.playSound( "snd_ray" )
        
        local image = RPD.new("com.watabou.noosa.Image", "effects/LightRay.png")

        local A = 180 / math.pi

        local s = DungeonTileMap:tileCenterToWorld(from)
        local e = DungeonTileMap:tileCenterToWorld(to)

        image.origin:set(0, image.height / 2)
        
        image:setPos(s.x - image.origin.x, s.y - image.origin.y)

        local dx = e.x - s.x
        local dy = e.y - s.y

        image.angle = math.atan2(dy, dx) * A
        image:setScale(math.sqrt(dx * dx + dy * dy) / image.width, 1)

        local function update(n)
            --image:setScale(math.sqrt(dx * dx + dy * dy) / image.width, n / 5)
            --image:setScale(math.sqrt(dx * dx + dy * dy) / image.width, n/5)
            image:setScaleX(math.sqrt(dx * dx + dy * dy) / image.width)
            image:setScaleY(n/10)
            if n == 10 then
                image:killAndErase()
                return false --we are done here
            end
            return true --we want next frame
        end

        RPD.addFunction(update)

        RPD.GameScene:effect(image)
    end
}
return LightRay

