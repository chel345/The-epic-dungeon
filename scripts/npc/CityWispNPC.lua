
local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    interact = function(self, chr)
        self:say("Это место когда то было настолько красивым и полным знаний. К сожалению, все это уже давно пропало. Береги свою душу, странник...")
    end
})


