
local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    spawn = function(self)
RPD.setAi(self, "ThiefFleeing")
    end
})


