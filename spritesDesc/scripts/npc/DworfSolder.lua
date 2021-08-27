--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local maybeMob
local n = 100

return mob.init({
act = function(me,mee)
for i = 1, RPD.Dungeon.level:getLength()-1 do
local mob = RPD.Actor:findChar(i)        
if mob and mob ~= RPD.Dungeon.hero and mob:ht() == 76 then
if n > RPD.Dungeon.level:distance(me:getPos(),mob:getPos() ) then
n = RPD.Dungeon.level:distance(me:getPos(),mob:getPos() )
maybeMob = mob
end
end
end


if maybeMob then
--RPD.topEffect(maybeMob:getPos(),"Debag")
if RPD.Dungeon.level:distance(me:getPos(),maybeMob:getPos() ) == 1 then
me:getSprite():attack(maybeMob:getPos())
maybeMob:damage(math.random(30,60),me)
RPD.playSound( "snd_hit.ogg" )

if not maybeMob then
maybeMob = false
end

else
me:beckon(maybeMob:getPos())
end
else
me:getSprite():idle()
end

end,
    spawn = function(self,me, level)
        --RPD.setAi(self,"Wandering")
end,
move = function(self)
        --RPD.setAi(self,"DworfSolder")
end,
    interact = function(self, chr)
        local ownPos  = self:getPos()
        local newPos  = chr:getPos()

        self:move(newPos)
        self:getSprite():move(ownPos, newPos)

        chr:move(ownPos)
        chr:getSprite():move(newPos, ownPos)
end


  })


