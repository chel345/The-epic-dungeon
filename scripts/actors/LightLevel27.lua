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
    activate = function()
--if not storage.get("key") then


local mob = RPD.MobFactory:mobByName("AzuterronNPC")
local RuneMaster = RPD.MobFactory:mobByName("RuneMasterNPC")
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() == "AzuterronNPC" then
maybeMob:destroy()
RuneMaster:setPos(i)
RPD.Dungeon.level:spawnMob(RuneMaster)
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