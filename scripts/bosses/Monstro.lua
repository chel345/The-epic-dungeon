--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

local EPD = require "scripts/lib/dopClasses"
return mob.init({ 
spawn = function(self)
lol = nil
local storage = require "scripts/lib/storage"
storage.put("keys",false) 
RPD.setAi(self,"Monstro")
end,
die = function(self, cause)
--[[
local storage = require "scripts/lib/storage"
storage.put("keys",false) 
--]]
RPD.GameScene:bossSlain()
RPD.playSound("snd_boss.mp3")
for i = 1, RPD.Dungeon.level:getLength()-1 do
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:ht() == 76 then
maybeMob:damage(100,RPD.Dungeon.hero)
end
end
        local Camera = luajava.bindClass("com.watabou.noosa.Camera")
Camera.main:shake(8,0.7)
local level = RPD.Dungeon.level
local item = RPD.ItemFactory:itemByName("SkeletonKey")
level:drop(item,RPD.Dungeon.hero:getPos())
local itemf = RPD.ItemFactory:itemByName("Artifacts/ChestSharm")
level:drop(itemf,RPD.Dungeon.hero:getPos())
local Music = luajava.bindClass("com.watabou.noosa.audio.Music")
Music.INSTANCE:play("Return.ogg",true)

end
  })


