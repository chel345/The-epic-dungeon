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
            image     = 8,
            imageFile = "items/TrapVials.png",
            name      = RPD.StringsManager:maybeId("GrippingVial_Name"),
            info      = RPD.StringsManager:maybeId("GrippingVial_Desc"),
            stackable = true,
            price     = 20
        }
    end,
    onThrow = function(self, item, cell, thrower)
    RPD.playSound( "snd_shatter.ogg")
        local level = RPD.Dungeon.level
        local hero = RPD.Dungeon.hero
        if level.map[cell] then
        		local x = level:cellX(cell)
        		local y = level:cellY(cell)
           for i = x - 1, x + 1 do
             for j = y - 1, y + 1 do
               local pos = level:cell(i,j)
               local mob = RPD.Actor:findChar(pos)
               	if mob then
               			if math.random(1,3) == 1 then
               					RPD.affectBuff(mob, RPD.Buffs.Cripple , 4)
               			end
               			mob:damage(math.random(10,50),item:getUser())
               	end
               	RPD.topEffect(pos,"Klak")
             end
           end 
        end
        local Splash = luajava.bindClass("com.watabou.pixeldungeon.effects.Splash")
        Splash.at( RPD.Sfx.CellEmitter:get(cell) , cell,-3,3, 0x81ff2f, 1)
    end
}
