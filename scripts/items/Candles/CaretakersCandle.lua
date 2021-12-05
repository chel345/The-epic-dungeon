--250 level = 50
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local wand = require "scripts/lib/wand"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local caretakerscandle

return wand.init{ 
    desc  = function(self, item)
caretakerscandle = item
        return {
        imageFile = "items/Candles.png",
        name      = RPD.StringsManager:maybeId("CaretakersCandle_Name"),
        info      = RPD.StringsManager:maybeId("CaretakersCandle_Info")
        }
end, 

actions = function()
return {}
end,

image = function()
if caretakerscandle:level() >= 5 then
return 10
end
if caretakerscandle:level() == 4 then
return 11
end
if caretakerscandle:level() == 3 then
return 12
end
if caretakerscandle:level() == 2 then
return 13
end
if caretakerscandle:level() == 1 then
return 13
end
if caretakerscandle:level() == 0 then
return 14
end
end,

activate = function(self, item, hero)
if item:level() <= 0 then
RPD.glog(RPD.StringsManager:maybeId("ExtinguishedCandle"))
item:doUnequip(item:getUser(),true)
return
end
end,

act = function(self,item)
item:spend(1)
if item:isEquipped(RPD.Dungeon.hero) then
if EPD.time % 50 == 0 and item:level() > 0 then
item:level(item:level()-1)
end
if item:level() <= 0 then
item:activate(RPD.Dungeon.hero)
end
local Terror = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Terror")
local Flare = luajava.bindClass("com.watabou.pixeldungeon.effects.Flare")
if math.random(1,10) == 1 then
for i = 1,RPD.Dungeon.level:getLength()-1 do
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and RPD.Dungeon.level.fieldOfView[i] and maybeMob ~= RPD.Dungeon.hero then 
RPD.affectBuff(maybeMob, Terror,RPD.Dungeon.hero:magicLvl()+10)
--test = Flare(5,32)
--test:color( 0xFF0000, true )
--test:show( maybeMob:getSprite(), 2f )
maybeMob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
end
end
end
end
end

}