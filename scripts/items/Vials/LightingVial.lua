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
            image     = 1,
            imageFile = "items/TrapVials.png",
            name      = RPD.StringsManager:maybeId("LightingVial_Name"),
            info      = RPD.StringsManager:maybeId("LightingVial_Desc"),
            stackable = true,
            price     = 20
        }
    end,
    onThrow = function(self, item, cell, thrower)
    RPD.playSound( "snd_shatter.ogg")
        local level = RPD.Dungeon.level
        local hero = RPD.Dungeon.hero
        if level.map[cell] then
					RPD.playSound( "snd_lightning.ogg")
        		local x = level:cellX(cell)
        		local y = level:cellY(cell)
           for i = x - 1, x + 1 do
             for j = y - 1, y + 1 do
               local pos = level:cell(i,j)
               local soul =  RPD.Actor:findChar(pos)
                if soul then
                    soul:getSprite():emitter():start(RPD.Sfx.SparkParticle.FACTORY, 0.1, 1)
                    soul:damage(10*RPD.Dungeon.depth,RPD.Dungeon.hero)
                end
                RPD.zapEffect(cell,pos,"Lightning")
             end
           end 
        end
        local Splash = luajava.bindClass("com.watabou.pixeldungeon.effects.Splash")
        Splash.at( RPD.Sfx.CellEmitter:get(cell) , cell,-3,3, 0x81ff2f, 1)
    end,
    glowing = function(self, ite)
        --if self.data.activationCount >= 1 then
            return item.makeGlowing( 0xC6EEFF , 1)
        --end
    end
}
