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
            name      = "Призрачная роза",
            info      = "Эта роза почти прозрачна, она напоминает ,нарисованный простым карандашём на картине, цветок. Смотря на этот цветок тебя всё сильнее хочется уколоться об её шипы.",
            stackable = false,
            upgradable    = false,
 
             price     = 50
        }
    end, actions = function() return {"УКОЛОТЬСЯ"} end,
    execute = function(self, item, hero, action, cell, char, data) 
        if action == "УКОЛОТЬСЯ" then       
local hero = RPD.Dungeon.hero
hero:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.STEAM), 2)
if math.random(1,2) == 1 then
RPD.permanentBuff(hero, RPD.Buffs.Invisibility)
else
hero:STR(math.max(hero:STR()-1,1))
hero:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
hero:getSprite():showStatus( 0xFF0000, RPD.textById("Str_lose"))
RPD.playSound( "snd_cursed.mp3" )
end
  end 
item:detach(RPD.Dungeon.hero:getBelongings().backpack)
end 
}