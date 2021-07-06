--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local Multiplayer = require "scripts/lib/Multiplayer"

local User = require "scripts/lib/User"

local Process = require "scripts/lib/Process"

local storage = require"scripts/lib/storage"

return item.init{
    desc  = function ()
        return {
           image     = 9,
            imageFile = "items/ArtifactsMod.png",
            name      = "Мультиплеер",
            info      = "Этот предмет позволяет отдавать и принимать предметы и мобов (питомцев) от других игроков. Ничего больше. Пока... Не следует забывать про то, что предметы и мобов из мода не стоит отдавать. Ну и ясен пень нужен интернет.",
            stackable = true,
            upgradable    = false,
            price     = 0
             }
    end,
    actions = function() return {"МУЛЬТИПЛЕЕР"} end,
    execute = function(self, item, hero, action)
if action == "МУЛЬТИПЛЕЕР" then
user = item:getUser()

local select = function(index)


if index == 0 then

if not storage.gameGet("nik") then
storage.gamePut("nik",User.player)
end

User.player = storage.gameGet("nik")
select_nik = function(index)
if index == 0 then
RPD.System.Input:showInputDialog("Смена ника", ("Введите свой ник, ваш текущий ник "..User.player))
RPD.chooseOption( 
select_nik,
("Ваш ник: "..User.player),
"Выберите функцию",
"Изменить",
"Сохранить изменения"
)
end
if index == 1 then
User.player = RPD.System.Input:getInputString()
storage.gamePut("nik",User.player)
RPD.chooseOption( 
select_nik,
("Ваш ник: "..User.player),
"Выберите функцию",
"Изменить",
"Сохранить изменения"
)
end
end
RPD.chooseOption( 
select_nik,
("Ваш ник: "..User.player),
"Выберите функцию",
"Изменить",
"Сохранить изменения"
)

end



if index == 1 then
item:selectCell("МУЛЬТИПЛЕЕР","Выбирете предмет")
end


if index == 2 then
item:selectCell("МУЛЬТИПЛЕЕРР","Выбирете существо")
end


if index == 3 then
Multiplayer.hero:receiveItem()
end


if index == 4 then
Multiplayer.hero:receiveMob()
end


end


RPD.chooseOption( 
select,
"Мультиплеер",
"Выберите функцию",
"Изменить ник",
"Передать предмет",
"Передать существо",
"Принять предмет",
"Принять существо"
)

        end
    end,
cellSelected = function(self, thisItem, action, cell)

if action == "МУЛЬТИПЛЕЕР" then
local itemGive = RPD.Dungeon.level:getHeap(cell)
if not itemGive then
RPD.glog("Здесь ничего нет")
return
end
if User.player == "" then
RPD.glog("-- Ваш ник пуст.")
return
end
if itemGive then

RPD.System.Input:showInputDialog("Передача предмета","Введите свой ник, кому вы хотите передать предмет?")


select_item = function(index)
if index == 0 then
User.host = RPD.System.Input:getInputString()
item = RPD.Dungeon.level:getHeap(cell):peek()
--RPD.Dungeon.hero:collect(RPD.ItemFactory:itemByName(item:getClassName()))
Process.item = RPD.packEntity(item)
Multiplayer.hero:sendItem()
itemGive:pickUp()
RPD.glog("++ Вы отдали "..item:name())
end
if index == 1 then
return
end
end
RPD.chooseOption( 
select_item,
"Передача предмета",
("Вы уверены, что хотите передать предмет игроку?"),
"Да",
"Нет"
)
end
end
if action == "МУЛЬТИПЛЕЕРР" then
char = RPD.Actor:findChar(cell)
if char and char ~= RPD.Dungeon.hero then
if char:isPet() then
else
RPD.glog("-- Это существо вам не подчиняется")
return
end
if User.player == "" then
RPD.glog("-- Ваш ник пуст")
return
end
RPD.System.Input:showInputDialog("Передача предмета","Введите свой ник, кому вы хотите передать моба?")
select_mob = function(index)
if index == 0 then
User.host = RPD.System.Input:getInputString()
RPD.glog("++ Вы передали питомца в подчинение своему союзнику")
char = RPD.Actor:findChar(cell)
Process.pet = RPD.packEntity(char)
Multiplayer.hero:sendMob()
char:destroy()
char:getSprite():killAndErase()
end
if index == 1 then
return
end
end
RPD.chooseOption( 
select_mob,
"Передача моба",
("Вы уверены, что хотите передать моба в подчинение игроку?"),
"Да",
"Нет"
)

end
end
end
}
