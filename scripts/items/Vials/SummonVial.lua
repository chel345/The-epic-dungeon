--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"

return item.init{
    desc  = function ()
        return {
            image     = 7,
            imageFile = "items/TrapVials.png",
            name      = RPD.StringsManager:maybeId("SummonVial_Name"),
            info      = RPD.StringsManager:maybeId("SummonVial_Desc"),
            stackable = true,
            price     = 20
        }
    end,
    onThrow = function(self, item, cell, thrower)
    RPD.playSound( "snd_shatter.ogg")
    local lvl = RPD.Dungeon.level
    local Best = luajava.bindClass("com.watabou.pixeldungeon.actors.mobs.Bestiary")
    local mob = Best:mob(lvl)
    mob:setPos(cell)
    lvl:spawnMob(RPD.Mob:makePet(mob,item:getUser()))
    local Splash = luajava.bindClass("com.watabou.pixeldungeon.effects.Splash")
    Splash.at( RPD.Sfx.CellEmitter:get(cell) , cell,-3,3, 0xF8FF00, 1)
    end,
    glowing = function(self, ite)
        --if self.data.activationCount >= 1 then
            return item.makeGlowing( 0x0021FF , 1)
        --end
    end
}
