--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"
local Spawner = loadfile"scripts/actors/Spawner.lua"
local mob = require "scripts/lib/mob"

local function getCell()
    local level = RPD.Dungeon.level
    local cell = math.random(1, level:getLength())
    if (not level.passable[cell]) or RPD.Actor:findChar(cell) or level:getTopLevelObject(cell) then
        return getCell()
    end
    return cell
end

return mob.init({
    act = function(me)
        local tgt = Spawner.getCell()
        if tgt > 0 then
            me:setPos(tgt)
            me:getSprite():update()
        end
        me:spend(1)
    end
})


