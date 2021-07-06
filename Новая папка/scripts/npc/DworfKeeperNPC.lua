--
-- User: mike
-- Date: 23.11.2017
-- Time: 21:04
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

return mob.init({
    interact = function(self, chr)
local EPD = require "scripts/lib/dopClasses"
chr = chr
local dialog = function(index)
if index == 0 then
if chr:gold() >= 300 then
chr:spendGold(300)
local key = RPD.ItemFactory:itemByName("GoldenKey")
RPD.Dungeon.level:drop(key, chr:getPos())
self:say("Выбирай, что нужно.")
return
end
end
if index == 1 then
chr:say("И чем тебе моя идея не понравилась...")
end
end
RPD.chooseOption(
dialog,
"Дворф-торговец",
"Здраствуй! Добро пожаловать в месный fix price мы предлагаем вам купить ключ, которым вы отроете сундук, с тем, что вам нужно! Сундуки прозрачные! Не стисняйтесь!",
"Купить ключ- 300g",
"Уйти"
)

end
})


