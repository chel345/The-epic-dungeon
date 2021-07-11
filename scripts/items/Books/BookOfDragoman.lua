--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local EPD = require "scripts/lib/dopClasses"

dialog = function(index)
if index == 0 then
RPD.setAi(selff,"SetPos")
RPD.removeBuff(selff,"FollowMe")
RPD.removeBuff(selff,"Attacher")
end
if index == 1 then
RPD.permanentBuff(selff,"FollowMe")
end
if index == 2 then
RPD.removeBuff(selff,"FollowMe")
RPD.setAi(selff,"none")
RPD.removeBuff(selff,"Attacher")
end
if index == 3 then
RPD.removeBuff(selff,"FollowMe")
RPD.removeBuff(selff,"Attacher")
ctor:selectCell(selectMob,"Выбирете цель")
end
end


return item.init{
 desc  = function ()
        return {
           image     = 5,
            imageFile = "items/BooksInCityLibrary.png",
            name      = "Кодекс подземелья",
            info      = "В этой книге находятся множество текстов о языках подземелья. Теперь ты можешь разговаривать с другими обитателями и командовать своими приспешниками!, Пхх-Пхх,Ааа!",
            stackable = false,
            upgradable    = false,
         equipable     = "left_hand",
             price     = 200,
         --   isArtifact    = true,
defaultAction = "ИСПОЛЬЗОВАТЬ"
        }
    end,   
activate = function(self, item, hero)
--                RPD.removeBuff(item:getUser(), "Butterflys")

--        RPD.permanentBuff(item:getUser(), "Butterflys")
    end,

    deactivate = function(self, item, hero)
 --               RPD.removeBuff(item:getUser(), "Butterflys")
    end,

    actions = function(self, item,  hero)
        if item:isEquipped(hero) then
            return {"ИСПОЛЬЗОВАТЬ"}
        end
    end,
    
cellSelected = function(self, thisItem, action, cell)
if action == "ИСПОЛЬЗОВАТЬ" then
ctor = thisItem
--local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)
local char = RPD.Actor:findChar(cell)
if char and char ~= RPD.Dungeon.hero then
if char:isPet() then
selff = char
RPD.chooseOption( dialog,
selff:getName(),
("Чего желаешь, хозяин? Сейчас у меня "..selff:hp().." здоровья из "..selff:ht()..".Моя ловкость "..selff:attackSkill().." ."),
"Стой на месте",
"Следуй за мной.",
"Исследуй уровень",
"Задать приоритетную цель"
        )
else
char:yell("У тебя нет власти надо мной")
end
else
RPD.glog("Здесь никого нет")
end
end
if action == selectMob then
if RPD.Actor:findChar(cell) then
EPD.Char = RPD.Actor:findChar(cell)
RPD.permanentBuff(selff,"Attacher")
else
RPD.glog("Здесь никого нет")
end
end

end,
    execute = function(self, item, hero, action)
        if action == "ИСПОЛЬЗОВАТЬ" then
            item:selectCell("ИСПОЛЬЗОВАТЬ","Выбирете клетку")
        end
    end

}
