local RPD = require "scripts/lib/epicClasses"
local DungeonTileMap = luajava.bindClass("com.watabou.pixeldungeon.DungeonTilemap")


local LightRay = {
    ray = function(from, to)
        RPD.playSound( "snd_ray" )
        
        local image = RPD.new("com.watabou.noosa.Image", "effects/YellowRay.png")
        
        local A = 180 / math.pi

        local s = DungeonTileMap:tileCenterToWorld(from)
        local e = DungeonTileMap:tileCenterToWorld(to)

        image.origin:set(0, image.height / 2)

        image.x = s.x - image.origin.x
        image.y = s.y - image.origin.y-7

        local dx = e.x - s.x
        local dy = e.y - s.y

        image.angle = math.atan2(dy, dx) * A

        local function update(n)
            image:setScale(math.sqrt(dx * dx + dy * dy) / image.width, n / 15)
            if n % 15 == 0 then
                image:killAndErase()
                return false
            end
            return true
        end

        RPD.addFunction(update)

        RPD.GameScene:effect(image)
    end
}
return LightRay

