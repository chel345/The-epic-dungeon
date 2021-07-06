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
interact = function(self, chr)
if not storage.get("interact") then
EPD.showQuestWindow(self, "Здравствуй, путник. Не поможешь ли мне? Я бы не отказался от одного сухпайка...")
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("Ration") then
EPD.showQuestWindow(self, "Спасибо! У меня нет ничего, что я могу дать в награду, кроме ключа, который я нашёл неподалеку от этих мест.")
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("Ration"):detach(hero:getBelongings().backpack)
RPD.Sfx.SpellSprite:show(self, RPD.Sfx.SpellSprite.FOOD)
local wand = RPD.creteItem("GoldenKey", {levelId="TempleOfTears"})
RPD.Dungeon.hero:collect(wand)
RPD.glog("Теперь у тебя есть "..wand:name())
storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, "Всего лишь один сухпаёк, дружище!")
else
EPD.showQuestWindow(self, "Ам ням...")
end
end
})

