
local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    interact = function(self, chr)
        self:say(CityWispNPC_Phrase1)
    end
})


