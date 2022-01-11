--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({ 
act       = function(me, ai, mee)
local n = 0
local level = RPD.Dungeon.level
for i = 0, level:getLength() do
local mob = RPD.Actor:findChar(i)
if mob and mob ~= RPD.Dungeon.hero and mob:getMobClassName() == "Nightmare/NightmareAngel" then
n = n + 1
end
end
if n == 0 then
local mob = RPD.mob("NightmareKing")
mob:setPos(97)
RPD.setAi(mob,"Hunting")
level:spawnMob(mob)
local Chest =
{
    kind="CustomObject",
    object_desc= "NightTile11"
}
RPD.createLevelObject(Chest,37)
local Chest =
{
    kind="CustomObject",
    object_desc= "NightTile12"
}
RPD.createLevelObject(Chest,52)
me:destroy()
me:getSprite():killAndErase()
end

end
})


