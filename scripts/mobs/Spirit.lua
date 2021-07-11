
local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    spawn = function(self)
RPD.setAi(self, "ThiefFleeing")
    end
})


