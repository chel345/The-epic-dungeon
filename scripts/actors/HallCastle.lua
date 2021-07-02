--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

local storage = require "scripts/lib/storage"


return actor.init({
    act = function()
--if not storage.get("key") then


local mob = RPD.MobFactory:mobByName("AirElemental")
local mob2 = RPD.MobFactory:mobByName("FireNefrit")
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() == "AirElemental" then
maybeMob:destroy()
maybeMob:getSprite():killAndErase()
mob2:setPos(i)
RPD.Dungeon.level:spawnMob(mob2)
end
end
--end
--storage.put("key",true)
return true
    end,
    actionTime = function()
        return 1
    end
})
