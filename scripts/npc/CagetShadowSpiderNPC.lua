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
EPD.showQuestWindow(self, "Ц-ц-ц, эй человек! Ц-ц не поможешь мне выбраться из этой клетки!? Ц-ц-ц. Нужно лишь найти ключ.")
storage.put("interact",true)
return
end
if RPD.Dungeon.hero:getBelongings():getItem("IronKey") then
EPD.showQuestWindow(self, "Спасибо тебе большое, человечишка! Ты спас мне жизнь, теперь ты мой хозяин.")
local hero = RPD.Dungeon.hero
hero:getBelongings():getItem("IronKey"):detach(hero:getBelongings().backpack)


local mob = RPD.MobFactory:mobByName("ShadowSpider")
mob:setPos(self:getPos())
RPD.Dungeon.level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))

self:getSprite():killAndErase()
self:destroy()

storage.put("complete",true)
elseif not storage.get("complete") then
EPD.showQuestWindow(self, "Ц-ц-ц")
end
end
})

