---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 04.08.18 18:14
---

local RPD = require "scripts/lib/epicClasses"

local actor = require "scripts/lib/actor"

local Halo = RPD.new("com.watabou.pixeldungeon.effects.Halo",10,0xffffff,0.1)

return actor.init({
    actionTime = function()
        return 1
    end,
    activate = function()
Halo:point(58,46)
RPD.GameScene:effect(Halo)
emitter = RPD.Sfx.CellEmitter:get(i)
emitter:pos(58,46,1,1)
emitter:pour(RPD.Sfx.FlameParticle.FACTORY, 0.16)
RPD.GameScene:particleEffect("Candle", 32);
local levelSize = RPD.Dungeon.level:getLength()
        for i = 0 , levelSize - 1 do
  local mob = RPD.Actor:findChar(i)
  if mob then
  mob:getSprite():tint(0,0,0,0.3)
  end
        end

    end

})
