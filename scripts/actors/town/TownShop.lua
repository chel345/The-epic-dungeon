---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 04.08.18 18:14
---

local RPD = require "scripts/lib/epicClasses"

local actor = require "scripts/lib/actor"

local emitter
local Halo = RPD.new("com.watabou.pixeldungeon.effects.Halo",20,0xffffff,0.1)

return actor.init({
    actionTime = function()
        return 1
    end,
    activate = function()
Halo:point(152,129)
RPD.GameScene:effect(Halo)
emitter = RPD.Sfx.CellEmitter:get(i)
emitter:pos(151,127,2,2)
emitter:pour(RPD.Sfx.FlameParticle.FACTORY, 0.16)
--RPD.GameScene:particleEffect("Candle", 137);
RPD.createLevelObject({
    kind="CustomObject",
    object_desc="CandleOnTable"
}
,137)
RPD.createLevelObject({
    kind="CustomObject",
    object_desc="Table2"
}
,138) 
        local levelSize = RPD.Dungeon.level:getLength()
        for i = 0 , levelSize - 1 do
            if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY and math.random(1,3) == 1 then
                local emitter = RPD.Sfx.CellEmitter:get(i-1)
                emitter:pour(RPD.Sfx.WindParticle.FACTORY, 16)
            end
        end

    end

})
