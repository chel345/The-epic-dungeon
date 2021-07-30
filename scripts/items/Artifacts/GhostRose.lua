--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

return item.init{
    desc  = function ()
        return {
           image     = 10,
            imageFile = "items/ArtifactsMod.png",
            name      = RPD.textById("GhostRose_Name"),
            info      = RPD.textById("GhostRose_Info"),
            stackable = false,
            upgradable    = false,
 
             price     = 50
        }
    end, actions = function() return {RPD.textById("Prick")} end,
    execute = function(self, item, hero, action, cell, char, data) 
        if action == RPD.textById("Prick") then       
local hero = RPD.Dungeon.hero
hero:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.STEAM), 2)
if math.random(1,2) == 1 then
RPD.affectBuff(hero, RPD.Buffs.Invisibility,100)
else
RPD.affectBuff(hero, RPD.Buffs.Blindness,100)
hero:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
RPD.playSound( "snd_cursed.mp3" )
end
  end 
item:detach(RPD.Dungeon.hero:getBelongings().backpack)
end 
}
