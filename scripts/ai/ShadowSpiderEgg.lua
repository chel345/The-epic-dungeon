---
--- Generated by EmmyLua(https://github.com/EmmyLua)
--- Created by mike.
--- DateTime: 23.08.18 22:51
---

local RPD = require "scripts/lib/commonClasses"

local ai = require "scripts/lib/ai"

local storage = require "scripts/lib/storage"

return ai.init{

act       = function(me, ai, me)

summonBee = function()
local level = RPD.Dungeon.level
local hero = RPD.Dungeon.hero
local mob = RPD.MobFactory:mobByName("ShadowSpider")
local pos = level:getEmptyCellNextTo(me:getPos())
if (level:cellValid(pos)) then
mob:setPos(pos)
level:spawnMob(mob,0,me:getPos())
me:damage(100,me)
end
end

me:spend(math.random(10,20))
summonBee()

end,

    gotDamage = function(me, ai, me, src, dmg)
end,

    status = function(me, ai, me)
        return "охотится на тебя."
    end
}