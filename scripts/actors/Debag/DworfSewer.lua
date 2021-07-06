--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local Process = require"scripts/lib/Process"

local storage = require "scripts/lib/storage"

return actor.init({
    activate = function()
if not storage.get("key") then
Ginerator.CreateLevel("SewerLevel")
end
storage.put("key",true)
end,
act = function()
return true
end,
    actionTime = function()
        return 5*math.random(1,10)
    end
})