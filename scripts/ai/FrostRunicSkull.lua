---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 23.08.18 22:51
---

local RPD = require "scripts/lib/commonClasses"

local ai = require "scripts/lib/ai"

return ai.init{

act       = function(self, ai, me)

addSkeleton = function()
local level = RPD.Dungeon.level
local x = level:cellX(me:getPos())
local y = level:cellY(me:getPos())
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMBERS and pos ~= me:getPos() then
mob = RPD.MobFactory:mobByName("IceSkeleton")
local level = RPD.Dungeon.level
mob:setPos(pos-1)
level:spawnMob(mob)
mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
me:spend(2)
end
end
end
me:getSprite():zap(me:getPos())
end

if RPD.Dungeon.level:distance(me:getPos(),RPD.Dungeon.hero:getPos()) < 5 then
addSkeleton()
end
me:spend(1)
end,

    gotDamage = function(self, ai, me, src, dmg)

    end,

    status = function(self, ai, me)
        return RPD.textById("attack_on_you")
    end
}