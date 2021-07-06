--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

local mob = require"scripts/lib/mob"

return mob.init({
spawn = function(self)
RPD.permanentBuff(self, RPD.Buffs.Light)
--RPD.removeBuff(self, RPD.Buffs.Light)
end,
interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, "Здравствуйте, извиняюсь, не будет ли у вас лишнего свитка телепортации? Моя смена давно кончилась, но вот мой маяк дал сбой. Мне нужен всего один, в награду я отдам тебе свой фонарь.")
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("ScrollOfTeleportation") then
EPD.showQuestWindow(self, "Благодарю вас... Да, это действительно свиток телепортации. Как и обещал отдаю вам свой фонарь.. Ох и влетит же мне за это от начальника стражи... *читает свиток*")
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("ScrollOfTeleportation"):detach(hero:getBelongings().backpack)
local wand = RPD.item("Artifacts/CaretakerLight")
RPD.Dungeon.hero:collect(wand)
RPD.glog("Теперь у тебя есть "..wand:name())
self:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.LIGHT ), 4)
self:die()
self:getSprite():killAndErase()
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, "Точно нет? Проверьте, я уже устал от своей смены.")
end
end
})

