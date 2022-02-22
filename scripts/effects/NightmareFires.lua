local RPD = require "scripts/lib/epicClasses"
local DungeonTileMap = luajava.bindClass("com.watabou.pixeldungeon.DungeonTilemap")

local speed = 3

local getFactor = function()
    local p = math.random(-15,15)
    while (math.abs(p) < 9) do
        p = math.random(-15,15)
    end
    return p
end

local zap = function(from, to)
    local factor = getFactor()
        
    local bolt = RPD.new("com.watabou.pixeldungeon.effects.Halo",4,0xff1d00,0.7)
    local emitter = RPD.Sfx.CellEmitter:get(i)
    emitter:pour(RPD.Sfx.FlameParticle.FACTORY, 0.05)
    emitter.width = 4
    emitter.height = 4
    
    RPD.GameScene:effect(bolt)
    
    local s = DungeonTileMap:tileCenterToWorld(from)
    local e = DungeonTileMap:tileCenterToWorld(to)

    bolt.x = s.x - 16*4
    bolt.y = s.y - 16*4
    emitter.x = s.x
    emitter.y = s.y
        
    local c = 1
    
    local g = 1
    if s.x > e.x then
        g = -1
    end
    if s.x == e.x then
        c = 0
    end
    
    local time = s.x-e.x+1
    local d = s.y-e.y+1
    
    g = g*speed

    local function update(f)
        if f >= math.abs(time)/speed then
            bolt:killAndErase()
            emitter:killAndErase()
            return false
        end
        bolt.x = bolt.x + g*c
        bolt.y = bolt.y + d/time*g + (f-(math.abs(time)/speed/2))*g/factor --bolt.y + d/time*g
        emitter.x = emitter.x + g*c
        emitter.y = emitter.y + d/time*g + (f-(math.abs(time)/speed/2))*g/factor
        return true
    end
    RPD.addFunction(update)
end

local NightmareFires = {
    attach = function(from,to,n)
        local s = DungeonTileMap:tileCenterToWorld(from)
        local e = DungeonTileMap:tileCenterToWorld(to)
        local time = s.x-e.x+1
        
        local function update(f)
            if f >= n*math.abs(time)/speed then
                return false
            end
            if f % 5 == 0 then
                zap(from,to,n)
                RPD.playSound( "snd_zap" )
            end
            return true
        end
        RPD.addFunction(update)
    end
}

return NightmareFires