--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local LightRay = require "scripts/effects/LightRay"

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"

local Process = require "scripts/lib/Process"

--local Ginerator = require "scripts/lib/Ginerator"

local room = require "scripts/lib/room"

return item.init{
    desc  = function ()
        return {
            image     = 12,
            imageFile = "items/food.png",
            name      = "Test item",
            info      = "Item for script tests",
            stackable = true,
            defaultAction = "action3",
            price         = 7
        }
    end,
    actions = function() return {"action1","action2","action3"} end,

    cellSelected = function(self, thisItem, action, cell)
        if action == "action1" then
if RPD.Actor:findChar(cell) then
RPD.glog(RPD.Actor:findChar(cell):getMobClassName())
end
local level = RPD.Dungeon.level
RPD.glog(level.map[cell])
--RPD.glog((not (level.solid[cell] or level.nearWalls[cell] or level.pit[cell] or level.fieldOfView[cell] or (not level.passable[cell]) or level.map[cell] == RPD.Terrain.WALL or level.map[cell] == RPD.Terrain.WALL_DECO or RPD.Actor:findChar(cell) or cell == 0)))
end
        if action == "action3" then
            RPD.glogp("performing "..action.."on cell"..tostring(cell).."\n") 
local obj = RPD.Dungeon.level:getTopLevelObject(cell)
if obj then
RPD.glog(obj:getID())
end
--[[
RPD.Sfx.MagicMissile:purpleLight(thisItem:getUser():getSprite():getParent(),thisItem:getUser():getPos(),cell,Callback.callback)
--]]
--local Callback = luajava.bindClass("com.watabou.utils.Callback")
--missile = thisItem:getUser():getSprite():getParent():recycle(RPD.Sfx.MagicMissile)
--missile:reset( thisItem:getUser():getPos(),cell,Callback.callback)
--missile:size(40)
--BloodParticle = luajava.bindClass("com.watabou.pixeldungeon.effects.particles.BloodParticle")
--missile:pour( BloodParticle.FACTORY, 0.04)
--Splash = luajava.bindClass("com.watabou.pixeldungeon.effects.Splash")
--Splash.at(missile, 3.1415926f / 2, 0xFFBB0000, 9)
--Splash.at(missile, RPD.Dungeon.hero:getPos(),1,5, 0xFFBB0000, 90)
--missile:pour(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.COIN  ), 0.01)
RPD.glog(RPD.Dungeon.level:cellX(cell))
RPD.glog(RPD.Dungeon.level:cellY(cell))


--RPD.new("com.watabou.noosa.particles.Emitter")
--RPD.new("com.watabou.noosa.particles.PixelParticle")

LightRay.ray(RPD.Dungeon.hero:getPos(),cell)
        end
if action == "action2" then
RPD.glog(tostring(cell))
end
    end,

    execute = function(self, item, hero, action)
        if action == "action1" then
            item:selectCell("action1","Please select cell for action 1")
        end

        if action == "action2" then
            item:selectCell("action2","Please select cell for action 1")
        end

        if action == "action3" then
            item:selectCell("action3","Please select cell for action 1")
        end
    end,
}
