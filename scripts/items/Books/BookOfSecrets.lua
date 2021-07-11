--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD  = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local EPD  = require "scripts/lib/dopClasses"

local room = require "scripts/lib/room"

return item.init {
    desc         = function()
        return {
            image      = 4,
            imageFile  = "items/BooksInCityLibrary.png",
            name       = "Книга тайн",
            info       = "Подземелье хранит в себе множество секретов и многие из них нельзя раскрыть просто открыв нужную дверь. С помощью этой книги ты сможешь открывать те, комнаты которые можно открыть только с помощью магии. Некоторые из секретов защищены особым заклятьем призыва стражей, которые будут атаковать всех, кого видят (врагов и героя). Стоит такое заклинание 15 маны.",
            stackable  = false,
            upgradable = false,
            equipable  = "left_hand",
            price      = 200,
            --   isArtifact    = true,
defaultAction = "ИСПОЛЬЗОВАТЬ"
        }
    end,
    actions      = function(self, item, hero)
        if item:isEquipped(hero) then
            return { "ИСПОЛЬЗОВАТЬ" }
        end
    end,
    activate     = function(self, item, hero)
    end,

    deactivate   = function(self, item, hero)
    end,
    cellSelected = function(self, thisItem, action, cell)
        if action == "ИСПОЛЬЗОВАТЬ" and cell ~= nil then

            local user         = thisItem:getUser()
            local level        = RPD.Dungeon.level
            local neutralGhost = RPD.MobFactory:mobByName("SumGhost")

            if user:getSkillPoints() >= 15 then
                user:spendSkillPoints(15)
            else
                RPD.glog("-- Не хватает маны")
                return
            end

            if room.canSpawnAt(cell, 2, 2) and RPD.Dungeon.depth > 0 then
                if math.random(1, 2) == 1 then

                    for i = 1, math.random(1, 3) do
                        local pos = level:getEmptyCellNextTo(user:getPos())
                        if level:cellValid(pos) then
                            neutralGhost:setPos(pos)
                            level:spawnMob(neutralGhost)
                            neutralGhost:ht(RPD.Dungeon.depth * 15)
                            neutralGhost:hp(neutralGhost:ht())
                        end
                        -- neutralGhost:yell("Ты не сможешь открыть эту комнату!")
                    end

                else

                    local rooms = {
                        "BookOfSecrets/Room1",
                        "BookOfSecrets/Room2",
                        "BookOfSecrets/Room3",
                        "BookOfSecrets/Room4"
                    }
                    room.printRoom(cell, rooms[math.random(1, #rooms)])
                    room.Tunel(user:getPos(), cell)
                    room.Correct()
                    user:move(cell)
                    user:getSprite():move(user:getPos(), cell)
                    RPD.Sfx.CellEmitter:get(cell):burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.STEAM), 7);
                    RPD.playSound("BookOfSecrets.ogg")
                    for i = 1, level:getLength() do
                        RPD.GameScene:updateMap(i - 1)
                    end
                end

            else
                RPD.glog("Здесь нет секретов")
            end
        end
    end,
    execute      = function(self, item, hero, action)
        if action == "ИСПОЛЬЗОВАТЬ" then
            item:selectCell("ИСПОЛЬЗОВАТЬ", "Выбирете клетку")
        end
    end

}
