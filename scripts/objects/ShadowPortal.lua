---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 9/25/21 7:41 PM
---

local RPD = require "scripts/lib/commonClasses"

local object = require "scripts/lib/object"

local DungeonTileMap = luajava.bindClass("com.watabou.pixeldungeon.DungeonTilemap")

return object.init{
    getLayer = function()
    return 0
    end,
    stepOn = function(self, object, hero)
        return true
    end,
    addedToScene = function(self, object,level, data)
			local emitter = RPD.Sfx.CellEmitter:get(object:getPos())
			emitter:pour(RPD.Sfx.ShadowParticle.CURSE, 0.16)
    end
}