--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local room = require "scripts/lib/room"

local Spawner = loadfile "scripts/actors/Spawner.lua"

local storage = require "scripts/lib/storage"

local Ginerator = {
    CreateLevel = function(file, spawner)
        local function CreateLevelImpl(file, spawner)
            spawner = spawner or false
            if not storage.get("key") then
                script = loadfile("levelsGinerators/" .. file .. ".lua")
                gin = script()
                if gin.MiniBoss then
                    gin.MiniBoss = gin.MiniBoss[math.random(1, #gin.MiniBoss)]
                end
                for i = 1, RPD.Dungeon.level:getLength() - 1 do
                    if RPD.Dungeon.level.map[i] == RPD.Terrain.ENTRANCE then
                        RPD.Dungeon.hero:move(i - 1)
                        break
                    end
                end

                if gin.Shop then
                    gin.Shop = (file .. "/" .. gin.Shop)
                end
                if gin.NPCRoom then
                    gin.NPCRoom = (file .. "/" .. gin.NPCRoom)
                end
                if gin.MiniBoss then
                    gin.MiniBoss = (file .. "/" .. gin.MiniBoss)
                end
                for i = 1, #gin.RandRooms do
                    gin.RandRooms[i] = (file .. "/" .. gin.RandRooms[i])
                end

                local level = RPD.Dungeon.level
                local L = level:getLength()
                local w = level:getWidth()
                local st = RPD.Dungeon.hero:getPos()
                local wr = gin.RoomWidth
                local hr = gin.RoomHeigth
                local old = st
                local l = st

                if gin.kind == "Caves" or gin.kind == "Womb" then

                    if gin.kind == "Womb" then
                        room.ClearLevel()

                        local rr = gin.WombFactor

                        local set = function(cell)
                            local level = RPD.Dungeon.level
                            local x = level:cellX(cell)
                            local y = level:cellY(cell)
                            for i = x - rr, x + rr do
                                for j = y - rr, y + rr do
                                    local pos = level:cell(i, j)
                                    level:set(pos - 1, 1)
                                end
                            end
                        end
                        local a = RPD.Dungeon.hero:getPos()
                        set(a)

                        for i = 1, gin.WombSeed do
                            a = math.random(w * rr, L - w * rr)
                            while level.map[a] == 1 do
                                a = math.random(w * rr, L - w * rr)
                            end
                            set(a)
                        end

                        for i = 1, gin.WombFactorChanse do
                            a = math.random(w * rr, L - w * rr)
                            while level.map[a] ~= 1 do
                                a = math.random(w * rr, L - w * rr)
                            end
                            set(a)
                        end

                        room.printRoom(st, "EntranceDebag")
                    end

                    if not gin.HasBase and gin.kind ~= "Womb" then
                        room.ClearLevel()
                        if room.canSpawnAt(st, gin.RoomWidth - 1, gin.RoomHeigth - 1) then
                            room.printRoom(st, gin.Entrance)
                        else
                            room.printRoom(st, "EntranceDebag")
                        end
                    end

                    local function spawnRoomForSure(roomWidth,roomHeight, roomKind)
                        local r = math.random(w, L - w)
                        while (not room.canSpawnAt(r, roomWidth, roomHeight)) do
                            r = math.random(w, L - w)
                        end
                        room.printRoom(r, roomKind)
                        room.Tunel(st, r)
                        return r
                    end

                    st = spawnRoomForSure(gin.ExitWidth, gin.ExitHeigth, gin.Exit)

                    if gin.Shop and gin.LevelShop == RPD.Dungeon.depth then
                        st = spawnRoomForSure(gin.NPCRoomWidth, gin.NPCRoomHeigth, gin.Shop)
                    end

                    if gin.MiniBoss and gin.LevelMiniBoss == RPD.Dungeon.depth then
                        st = spawnRoomForSure(gin.NPCRoomWidth, gin.NPCRoomHeigth, gin.MiniBoss)
                    end

                    if gin.NPCRoom and gin.levelNPC == RPD.Dungeon.depth then
                        st = spawnRoomForSure(gin.NPCRoomWidth, gin.NPCRoomHeigth, gin.NPCRoom)
                    end

                    -- st

                    for i = 1, L - 1 do
                        if room.canSpawnAt(i, gin.RoomWidth, gin.RoomHeigth) then
                            local rooms = gin.RandRooms
                            local s = rooms[math.random(1, #rooms)]
                            room.printRoom(i - 1, s)
                            room.Tunel(st, i - 1)
                            st = i - 1
                        end
                    end


                elseif gin.kind == "Castle" then

                    if not gin.HasBase then
                        room.ClearLevel()
                    end
                    if room.canSpawnAt(st, hr, wr) then
                        room.printRoom(st, gin.Entrance)
                    else
                        room.printRoom(st, gin.EntranceDebag)
                    end

                    local function getRandomCellAround(cell)
                        if cell then
                            if room.canSpawnAt(cell + wr, wr - 1, hr - 1) and level:cellY(cell) == level:cellY(cell + wr) then
                                return cell + wr
                            end
                            if room.canSpawnAt(cell - wr, wr - 1, hr - 1) and level:cellY(cell) == level:cellY(cell - wr) then
                                return cell - wr
                            end
                            if room.canSpawnAt(cell - (w * hr), wr - 1, hr - 1) then
                                return cell - (w * hr)
                            end
                            if room.canSpawnAt(cell + (w * hr), wr - 1, hr - 1) then
                                return cell + (w * hr)
                            end
                            if room.canSpawnAt(cell + (w * hr) - wr, wr - 1, hr - 1) then
                                return cell + (w * hr) - wr
                            end
                            if room.canSpawnAt(cell + (w * hr) + wr, wr - 1, hr - 1) then
                                return cell + (w * hr) + wr
                            end
                            if room.canSpawnAt(cell - (w * hr) - wr, wr - 1, hr - 1) then
                                return cell - (w * hr) - wr
                            end
                            if room.canSpawnAt(cell - (w * hr) + wr, wr - 1, hr - 1) then
                                return cell - (w * hr) + wr
                            end
                        end
                        return false
                    end

                    local function generate()
                        if getRandomCellAround(st) then
                            old = st
                            st = getRandomCellAround(st)
                            if gin.Shop and RPD.Dungeon.depth == gin.LevelShop then
                                room.printRoom(st, gin.Shop)
                                gin.Shop = false
                            elseif gin.NPCRoom and gin.levelNPC == RPD.Dungeon.depth then
                                room.printRoom(st, gin.NPCRoom)
                                gin.NPCRoom = false
                            elseif gin.MiniBoss and gin.LevelMiniBoss == RPD.Dungeon.depth then
                                room.printRoom(st, gin.MiniBoss)
                                gin.MiniBoss = false
                            else
                                room.printRoom(st, gin.RandRooms[math.random(1, #gin.RandRooms)])
                            end
                            room.Tunel(st, old)
                            return generate()
                        else
                            if getRandomCellAround(l) then
                                st = l
                                return generate()
                            else
                                room.printRoom(st, gin.Exit)
                                room.Tunel(old, st)
                                level:setExit(st)
                            end
                        end
                    end
                    generate()


                elseif gin.kind == "Town" then
                    local level = RPD.Dungeon.level
                    local l = level:getLength() - 1
                    local chanse = gin.Chanse * 100
                    local Wr = gin.RoomWidth
                    local Hr = gin.RoomHeigth
                    local W = level:getWidth()
                    local H = level:getHeight()

                    canSpawn = function(cell, w, h)
                        if not (
                                cell > W * math.ceil(h / 2) and
                                        cell < l - W * math.ceil(h / 2) and
                                        level:cellX(cell) > math.ceil(w / 2) and
                                        level:cellX(cell) < H - math.ceil(w / 2)
                        ) then
                            return false
                        end
                        local x = level:cellX(cell)
                        local y = level:cellY(cell)
                        local l = level:getLength()
                        for t = x - math.floor(w / 2), x + math.floor(w / 2) do
                            for j = y - math.floor(h / 2), y + math.floor(h / 2) do
                                local pos = level:cell(t, j)
                                if
                                level.map[pos] == RPD.Terrain.WALL
                                        or
                                        level.map[pos] == RPD.Terrain.WALL_DECO
                                        or
                                        level.map[pos] == RPD.Terrain.EMPTY_SP
                                        or
                                        level.map[pos] == RPD.Terrain.STATUE
                                        or
                                        level.map[pos] == RPD.Terrain.BOOKSHELF
                                        or
                                        level.map[pos] == RPD.Terrain.STATUE_SP
                                        or
                                        level.map[pos] == RPD.Terrain.ENTRANCE
                                        or
                                        level.map[pos] == RPD.Terrain.EXIT
                                        or
                                        level.map[pos] == RPD.Terrain.EMPTY_SP
                                        or
                                        level.map[pos] == RPD.Terrain.CHASM
                                        or
                                        level.map[pos] == RPD.Terrain.STATUE_SP
                                        or
                                        level.map[pos] == RPD.Terrain.EMBERS
                                        or
                                        level.map[pos] == RPD.Terrain.GRASS
                                then
                                    return false
                                end
                            end
                        end
                        return true
                    end

                    for i = 1, l do
                        level:set(i - 1, 1)
                    end

                    if canSpawn(RPD.Dungeon.hero:getPos(), Hr, Wr) then
                        room.printRoom(RPD.Dungeon.hero:getPos(), gin.Entrance)
                    else
                        room.printRoom(RPD.Dungeon.hero:getPos(), "EntranceDebag")
                    end

                    for i = 1, l do
                        if math.random(chanse, 100) == 100 and canSpawn(i, Hr, Wr) then
                            if gin.Shop and gin.LevelShop == RPD.Dungeon.depth and canSpawn(i, Hr, Wr) then
                                room.printRoom(i, gin.Shop)
                                gin.Shop = nil
                            elseif gin.MiniBoss and gin.LevelMiniBoss == RPD.Dungeon.depth and canSpawn(i, Hr, Wr) then
                                room.printRoom(i, gin.MiniBoss)
                                gin.MiniBoss = nil
                            elseif gin.NPCRoom and gin.levelNPC == RPD.Dungeon.depth and canSpawn(i, Hr, Wr) then
                                room.printRoom(i, gin.NPCRoom)
                                gin.NPCRoom = nil
                            elseif gin.Exit and canSpawn(i, Hr, Wr) then
                                room.printRoom(i, gin.Exit)
                                level:setExit(i)
                                gin.Exit = nil
                            else
                                local room_to_spawn = gin.RandRooms[math.random(1, #gin.RandRooms)]
                                room.printRoom(i, room_to_spawn)
                            end
                        end
                    end
                end

                if gin.Water then
                    room.addWater(gin.WaterMin, gin.WaterMax, gin.WaterChanse)
                end
                if gin.Grass then
                    room.addGrass(gin.GrassMin, gin.GrassMax, gin.GrassChanse)
                end
                if gin.Traps then
                    room.addTraps(gin.Traps, gin.ChanseTrap)
                end

                room.Correct()
                room.MakeBorder()

                if gin.Items then
                    for i = 1, #gin.Items do
                        local r = Spawner().getCell()
                        RPD.Dungeon.level:drop(RPD.item(gin.Items[i]), r)
                    end
                end

                local l = level:getLength()
                for i = 1, l - 1 do
                    RPD.GameScene:updateMap(i)
                end
                local level = RPD.Dungeon.level
                level:buildFlagMaps()
                level:cleanWalls()
                if spawner then
                    RPD.Dungeon.level:addScriptedActor(RPD.new(RPD.Objects.Actors.ScriptedActor, "scripts/actors/Spawner"))
                end
                storage.put("key", true)

                RPD.RemixedDungeon:resetScene()

            end
        end

        local res, ret
        repeat
            room.resetSpawnCounter()
            res, ret = pcall(CreateLevelImpl, file, spawner)
            if not res then
                RPD.debug("Error in level " .. file .. ": " .. ret)
            end
            RPD.debug("canSpawnAtCounter %s %d", file, room.getSpawnAtCounter())
        until res

        return res
    end,

    CreateDeco = function(chance_wall, chance_empty)
        local level = RPD.Dungeon.level
        for i = 1, level:getLength() do
            if level.map[i] == RPD.Terrain.EMPTY and math.random(1, chance_empty) == 1 then
                level:set(i - 1, RPD.Terrain.EMPTY_DECO)
                RPD.GameScene:updateMap(i - 1)
            end
            if level.map[i] == RPD.Terrain.WALL and math.random(1, chance_wall) == 1 then
                level:set(i - 1, RPD.Terrain.WALL_DECO)
                RPD.GameScene:updateMap(i - 1)
            end
        end
    end
}
return Ginerator
