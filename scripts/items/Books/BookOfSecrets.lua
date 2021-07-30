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
            name       = RPD.textById("BookOfSecrets_Name"),
            info       = RPD.textById("BookOfSecrets_Info"),
            stackable  = false,
            upgradable = false,
            equipable  = "left_hand",
            price      = 200,
            --   isArtifact    = true,
defaultAction = RPD.textById("Action_Use")
        }
    end,
    actions      = function(self, item, hero)
        if item:isEquipped(hero) then
            return { RPD.textById("Action_Use") }
        end
    end,
    activate     = function(self, item, hero)
    end,

    deactivate   = function(self, item, hero)
    end,
    cellSelected = function(self, thisItem, action, cell)
        if action == RPD.textById("Action_Use") and cell ~= nil then
thisItem:getUser():spend(2)
            local user         = thisItem:getUser()
            local level        = RPD.Dungeon.level
            local neutralGhost = RPD.MobFactory:mobByName("SumGhost")

            if user:getSkillPoints() >= 15 then
                user:spendSkillPoints(15)
            else
                RPD.glog(RPD.textById("No_Mana"))
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
                        -- neutralGhost:yell(RPD.textById("RoomNotOpening"))
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
                RPD.glog(RPD.textById("HereAreNoSecrets"))
            end
        end
    end,
    execute      = function(self, item, hero, action)
        if action == RPD.textById("Action_Use") then
            item:selectCell(RPD.textById("Action_Use"), RPD.textById("Select_A_Cage"))
        end
    end

}
