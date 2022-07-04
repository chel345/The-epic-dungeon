local RPD = require "scripts/lib/epicClasses"
local DungeonTileMap = luajava.bindClass("com.watabou.pixeldungeon.DungeonTilemap")

local speed = 1

local LightRay = {
    add = function(cell)
        local image = RPD.new("com.watabou.noosa.Image", "effects/GooSquid.png")
        image.x = DungeonTileMap:tileCenterToWorld(cell).x
        image.y = DungeonTileMap:tileCenterToWorld(cell).y
        local function update(n)
            image:setPos(image.x,image.y - speed)
            if n % (30*16) == 0 then
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

