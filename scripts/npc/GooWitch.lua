--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local mob = require"scripts/lib/mob"

return mob.init({
interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("GooWitch_Phrase1"))
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Artifacts/MirrorWormsShard") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("GooWitch_Phrase2"))
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Artifacts/MirrorWormsShard"):detach(hero:getBelongings().backpack)


local level = RPD.Dungeon.level
local pos = self:getPos()
local w = level:getWidth()
local mob = RPD.mob("GooZombie")
mob:setPos(pos-w-1)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero),0,self:getPos())
mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
RPD.playSound( "snd_cursed.mp3" )
local mob = RPD.mob("GooZombie")
mob:setPos(pos-w+1)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero),0,self:getPos())
mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
RPD.playSound( "snd_cursed.mp3" )
local mob = RPD.mob("GooZombie")
mob:setPos(pos+w+1)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero),0,self:getPos())
mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
RPD.playSound( "snd_cursed.mp3" )
local mob = RPD.mob("GooZombie")
mob:setPos(pos+w-1)
level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero),0,self:getPos())
mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
RPD.playSound( "snd_cursed.mp3" )


storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("GooWitch_Phrase3"))
else
EPD.showQuestWindow(self, RPD.StringsManager:maybeId("GooWitch_Phrase4"))
self:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.LIGHT ), 4)
self:die()
self:getSprite():killAndErase()
end
end
})

