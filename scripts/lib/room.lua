local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"

local canSpawnAtCounter = 0

local room = {
    printRoom = function(cell, Room)
        CustomRoom = require("scripts/rooms/" .. Room)
        local Hr = CustomRoom:getHidth()
        local Wr = CustomRoom:getWidth()
        local w = RPD.Dungeon.level:getWidth()
        local map = CustomRoom.map()
        num = 1
        for i = math.floor(Hr / 2 * (-1)), math.floor(Hr / 2) do
            local Ccell = cell + w * (i + 1)
            for j = Ccell - math.floor(Wr / 2), Ccell + math.floor(Wr / 2) do
                if num > Hr * Wr then
                    if CustomRoom.objects ~= nil then
                        CustomRoom.objects(cell)
                    end
                    return
                end
                pcall(function()
                    RPD.Dungeon.level:set(j, map[num])
                end)
                pcall(function()
                    RPD.GameScene:updateMap(j)
                end)
                num = num + 1
            end
        end
        pcall(CustomRoom.objects(cell, RPD.Dungeon.level:getWidth()))
    end,
    resetSpawnCounter = function()
        canSpawnAtCounter = 0
    end,
    getSpawnAtCounter = function()
        return canSpawnAtCounter
    end,
    canSpawnAt = function(cell, w, h)

        local level = RPD.Dungeon.level
        local W = level:getWidth()
        local x = level:cellX(cell)
        local y = level:cellY(cell)
        local l = level:getLength()
        if cell > l or cell < 1 then
            return false
        end

        canSpawnAtCounter = canSpawnAtCounter + 1

        if canSpawnAtCounter > 5000 then
            error("Too many room spawn checks")
        end

        if x >= math.ceil(w / 2) and x <= W - math.ceil(w / 2) then
            if cell >= W * (w / 2) + 1 and cell <= l - W * (w / 2) - 1 then
                for t = x - math.ceil(w / 2), x + math.ceil(w / 2) do
                    for j = y - math.ceil(h / 2), y + math.ceil(h / 2) do
                        local pos = level:cell(t, j)
                        --if not level.solid[pos] then
                        if level.map[pos] == RPD.Terrain.EMPTY or level.map[pos] == RPD.Terrain.EMPTY_DECO or level.map[pos] == RPD.Terrain.WATER or level.map[pos] == RPD.Terrain.EMPTY_SP or level.map[pos] == RPD.Terrain.WATER or level.map[pos] == RPD.Terrain.PEDESTAL or level.map[pos] == RPD.Terrain.GRASS or level.map[pos] == RPD.Terrain.EMBERS then
                            if level:getTopLevelObject(pos) then
                                return false
                            end
                            return false
                        end
                    end
                end
                return true
            end
        end
        return false
    end,
    addWater = function(min, max, chanse)
        for i = 2, RPD.Dungeon.level:getLength() - 1 do
            r = math.random(min, max)
            --if canSpawnAt(i,r,r) then
            level = RPD.Dungeon.level
            local W = level:getWidth()
            local x = level:cellX(i)
            local y = level:cellY(i)
            local l = level:getLength()
            chansse = chanse * 100
            if math.random(math.floor(chansse), 100) == 100 then
                for t = x - r, x + r do
                    for j = y - r, y + r do
                        local pos = level:cell(t, j)
                        if level:getTopLevelObject(pos) then
                            break
                        end
                        if level.map[pos] == 1 then
                            pcall(function()
                                level:set(pos - 1, RPD.Terrain.WATER)
                            end)
                        end

                    end
                end
            end
        end
    end,
    addGrass = function(min, max, chanse)
        for i = 2, RPD.Dungeon.level:getLength() - 1 do
            r = math.random(min, max)
            --if canSpawnAt(i,r,r) then
            level = RPD.Dungeon.level
            local W = level:getWidth()
            local x = level:cellX(i)
            local y = level:cellY(i)
            local l = level:getLength()
            chansse = chanse * 100
            if math.random(math.floor(chansse), 100) == 100 then
                for t = x - r, x + r do
                    for j = y - r, y + r do
                        local pos = level:cell(t, j)
                        if level.map[pos] == 1 or level.map[pos] == RPD.Terrain.EMPTY_DECO then
                            if t == x - r or t == x + r or j == y - r or j == y + r then
                                pcall(function()
                                    level:set(pos - 1, RPD.Terrain.GRASS)
                                end)
                            else
                                pcall(function()
                                    level:set(pos - 1, RPD.Terrain.HIGH_GRASS)
                                end)
                            end
                        end

                    end
                end
            end
        end
    end,
    addTraps = function(traps, chanse)

        for i = 2, RPD.Dungeon.level:getLength() - 1 do
            chanss = math.floor(chanse * 100)
            if RPD.Dungeon.level.map[i] == 1 or RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY_DECO then
                if math.random(chanss, 100) == 100 then
                    trap = traps[math.random(1, #traps)]
                    if trap == "ToxicTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.TOXIC_TRAP)
                        end)
                    elseif trap == "FireTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.FIRE_TRAP)
                        end)
                    elseif trap == "ParalyticTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.PARALYTIC_TRAP)
                        end)
                    elseif trap == "PoisonTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.POISON_TRAP)
                        end)
                    elseif trap == "AlaramTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.ALARM_TRAP)
                        end)
                    elseif trap == "LightingTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.LIGHTNING_TRAP)
                        end)
                    elseif trap == "SummoningTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.SUMMONING_TRAP)
                        end)
                    elseif trap == "InactiveTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.INACTIVE_TRAP)
                        end)
                    elseif trap == "GrippingTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.GRIPPING_TRAP)
                        end)
                    elseif trap == "SecretToxicTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.SECRET_TOXIC_TRAP)
                        end)
                    elseif trap == "SecretFireTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.SECRET_FIRE_TRAP)
                        end)
                    elseif trap == "SecretParalyticTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.SECRET_PARALYTIC_TRAP)
                        end)
                    elseif trap == "SecretPoisonTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.SECRET_POISON_TRAP)
                        end)
                    elseif trap == "SecretAlaramTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.SECRET_ALARM_TRAP)
                        end)
                    elseif trap == "SecretLightingTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.SECRET_LIGHTNING_TRAP)
                        end)
                    elseif trap == "SecretSummoningTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.SECRET_SUMMONING_TRAP)
                        end)
                    elseif trap == "SecretInactiveTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.SECRET_INACTIVE_TRAP)
                        end)
                    elseif trap == "SecretGrippingTrap" then
                        pcall(function()
                            level:set(i - 1, RPD.Terrain.SECRET_GRIPPING_TRAP)
                        end)
                    else
                        local trap = {
                            kind = "Trap",
                            uses = 1,
                            trapKind = "scriptFile",
                            script = ("scripts/traps/" .. trap)
                        }
                        RPD.createLevelObject(trap, i - 1)
                    end
                end
            end
        end

    end,
    Tunel = function(from, cell)
        local level = RPD.Dungeon.level
        local w = level:getWidth()

        local set = function(p, k)
            local pos = p
            local level = RPD.Dungeon.level

            --RPD.glog(tostring(pos).." - ")
            pos = p + k
            --RPD.glog(tostring(pos))
            --[[
            if level.map[pos] == RPD.Terrain.WALL then
            level:set(p, RPD.Terrain.EMPTY)
            RPD.bottomEffect(p,"Debag")
            end
            --]]

            local object = level:getTopLevelObject(p)
            if object and level.map[pos] ~= RPD.Terrain.STATUE_SP and level.map[pos] ~= RPD.Terrain.LOCKED_DOOR and level.map[pos] ~= RPD.Terrain.EMBERS then
                level:remove(object)
                object.sprite:kill()
            end

            if level.map[pos] == RPD.Terrain.PEDESTAL then
                level:set(p, RPD.Terrain.EMPTY_SP)
            elseif level.map[pos] == 0 then
                level:set(p, RPD.Terrain.EMPTY_SP)
            elseif level.map[pos] == RPD.Terrain.BARRICADE then
                level:set(p, RPD.Terrain.EMPTY)
            elseif level.map[pos] == RPD.Terrain.WALL then
                level:set(p, RPD.Terrain.EMPTY)
            elseif level.map[pos] == RPD.Terrain.WALL_DECO then
                level:set(p, RPD.Terrain.EMPTY)
            elseif level.map[pos] == RPD.Terrain.BOOKSHELF then
                level:set(p, RPD.Terrain.EMPTY)
            elseif level.map[pos] == RPD.Terrain.STATUE_SP then
            if level.map[cell] ~= 0 then
                level:set(p, level.map[cell])
            else
                 level:set(p, RPD.Terrain.EMPTY)
            end
            elseif level.map[pos] == RPD.Terrain.STATUE then
            if level.map[cell] ~= 0 then
                level:set(p, level.map[cell])
            else
                 level:set(p, RPD.Terrain.EMPTY)
            end
            end


        end

        local to_y = level:cellY(cell)
        local to_x = level:cellX(cell)
        local variant = math.random(1, 2)
        local function create(now)
            if now == cell then
                return
            end
            local from_y = level:cellY(now)
            local from_x = level:cellX(now)
            local g = 0

            if from_y ~= to_y then
                if from_y > to_y then
                    f = -w
                else
                    f = w
                end
            end

            if from_x ~= to_x then
                if from_x > to_x then
                    f = -1
                    g = 1
                else
                    f = 1
                    g = 1
                end
            end

            set(now + f, g)

            return create(now + f)
        end

        create(from, 0)
        set(from, 0)
        set(cell, 0)
        set(level:cell(level:cellX(cell), level:cellY(from)), 0)
    end,

    Correct = function()
        local level = RPD.Dungeon.level
        local w = level:getWidth()

        for i = 1, RPD.Dungeon.level:getLength() - 1 do
            if level.map[i] == RPD.Terrain.EMPTY then

                if level.map[i + 1] == RPD.Terrain.WALL and level.map[i - 1] == RPD.Terrain.WALL and level.map[i + w] == RPD.Terrain.EMPTY and level.map[i - w] == RPD.Terrain.EMPTY
                then
                    if level.map[i + w + 1] == RPD.Terrain.EMPTY or
                            level.map[i + w - 1] == RPD.Terrain.EMPTY or
                            level.map[i - w - 1] == RPD.Terrain.EMPTY or
                            level.map[i - w + 1] == RPD.Terrain.EMPTY then
                        if not (
                                level.map[i - 1] == RPD.Terrain.DOOR or
                                        level.map[i + 1] == RPD.Terrain.DOOR or
                                        level.map[i + w] == RPD.Terrain.DOOR or
                                        level.map[i - w] == RPD.Terrain.DOOR or
                                        level.map[i - w - 1] == RPD.Terrain.DOOR or
                                        level.map[i - w + 1] == RPD.Terrain.DOOR or
                                        level.map[i + w - 1] == RPD.Terrain.DOOR or
                                        level.map[i + w + 1] == RPD.Terrain.DOOR
                        )
                        then
                            level:set(i - 1, RPD.Terrain.DOOR)
                        end
                    end
                end
                if level.map[i + w] == RPD.Terrain.WALL and level.map[i - w] == RPD.Terrain.WALL and level.map[i - 1] == RPD.Terrain.EMPTY and level.map[i + 1] == RPD.Terrain.EMPTY
                then
                    if level.map[i + w - 1] == RPD.Terrain.EMPTY or
                            level.map[i - w - 1] == RPD.Terrain.EMPTY or
                            level.map[i + w + 1] == RPD.Terrain.EMPTY or
                            level.map[i - w + 1] == RPD.Terrain.EMPTY
                    then
                        level:set(i - 1, RPD.Terrain.DOOR)
                    end
                end

                local water = RPD.Terrain.WATER

                if level.map[i + 1] == RPD.Terrain.WALL and level.map[i - 1] == RPD.Terrain.WALL and level.map[i + w] == water or
                        level.map[i + 1] == RPD.Terrain.WALL and level.map[i - 1] == RPD.Terrain.WALL and level.map[i - w] == water
                then
                    if level.map[i + w + 1] == water or
                            level.map[i + w - 1] == water or
                            level.map[i - w - 1] == water or
                            level.map[i - w + 1] == water then
                        if not (
                                level.map[i - 1] == RPD.Terrain.DOOR or
                                        level.map[i + 1] == RPD.Terrain.DOOR or
                                        level.map[i + w] == RPD.Terrain.DOOR or
                                        level.map[i - w] == RPD.Terrain.DOOR or
                                        level.map[i - w - 1] == RPD.Terrain.DOOR or
                                        level.map[i - w + 1] == RPD.Terrain.DOOR or
                                        level.map[i + w - 1] == RPD.Terrain.DOOR or
                                        level.map[i + w + 1] == RPD.Terrain.DOOR
                        )
                        then
                            level:set(i - 1, RPD.Terrain.DOOR)
                        end
                    end
                end
                if level.map[i + w] == RPD.Terrain.WALL and level.map[i - w] == RPD.Terrain.WALL and level.map[i - 1] == water or
                        level.map[i + w] == RPD.Terrain.WALL and level.map[i - w] == RPD.Terrain.WALL and level.map[i + 1] == water
                then
                    if level.map[i + w - 1] == water or
                            level.map[i - w - 1] == water or
                            level.map[i + w + 1] == water or
                            level.map[i - w + 1] == water
                    then
                        level:set(i - 1, RPD.Terrain.DOOR)
                    end
                end
            end

            if level.map[i] == RPD.Terrain.EMPTY then
                if
                level.map[i + 1] == RPD.Terrain.WALL and level.map[i - 1] == RPD.Terrain.WALL and level.map[i - w] == RPD.Terrain.EMPTY_SP or
                        level.map[i + 1] == RPD.Terrain.WALL and level.map[i - 1] == RPD.Terrain.WALL and level.map[i + w] == RPD.Terrain.EMPTY_SP
                then
                    if level.map[i + w + 1] == RPD.Terrain.EMPTY_SP or
                            level.map[i + w - 1] == RPD.Terrain.EMPTY_SP or
                            level.map[i - w - 1] == RPD.Terrain.EMPTY_SP or
                            level.map[i - w + 1] == RPD.Terrain.EMPTY_SP then
                        if not (
                                level.map[i - 1] == RPD.Terrain.DOOR or
                                        level.map[i + 1] == RPD.Terrain.DOOR or
                                        level.map[i + w] == RPD.Terrain.DOOR or
                                        level.map[i - w] == RPD.Terrain.DOOR or
                                        level.map[i - w - 1] == RPD.Terrain.DOOR or
                                        level.map[i - w + 1] == RPD.Terrain.DOOR or
                                        level.map[i + w - 1] == RPD.Terrain.DOOR or
                                        level.map[i + w + 1] == RPD.Terrain.DOOR
                        )
                        then
                            level:set(i - 1, RPD.Terrain.DOOR)
                        end
                    end
                end
                if level.map[i + w] == RPD.Terrain.WALL and level.map[i - w] == RPD.Terrain.WALL and level.map[i - 1] == RPD.Terrain.EMPTY_SP or
                        level.map[i + w] == RPD.Terrain.WALL and level.map[i - w] == RPD.Terrain.WALL and level.map[i + 1] == RPD.Terrain.EMPTY_SP
                then
                    if level.map[i + w - 1] == RPD.Terrain.EMPTY_SP or
                            level.map[i - w - 1] == RPD.Terrain.EMPTY_SP or
                            level.map[i + w + 1] == RPD.Terrain.EMPTY_SP or
                            level.map[i - w + 1] == RPD.Terrain.EMPTY_SP
                    then
                        level:set(i - 1, RPD.Terrain.DOOR)
                    end
                end
            end
        end

    end,

    MakeBorder = function()
        delete = function(cell)
            local level = RPD.Dungeon.level
            if level.map[cell] ~= RPD.Terrain.EMBERS and level.map[cell] ~= RPD.Terrain.STATUE then
                local object = RPD.Dungeon.level:getTopLevelObject(cell)
                if object then
                    RPD.Dungeon.level:remove(object)
                    object.sprite:kill()
                end
                local item = RPD.Dungeon.level:getHeap(cell)
                if item then
                    item:pickUp()
                end
                local mob = RPD.Actor:findChar(cell)
                if mob and mob ~= RPD.Dungeon.hero then
                    mob:destroy()
                    mob:getSprite():killAndErase()
                end
            end
        end
        local level = RPD.Dungeon.level
        local W = level:getWidth()
        for i = 1, RPD.Dungeon.level:getLength() - 1 do
            --- top
            if i <= W then
                delete(i - 1)
                level:set(i - 1, RPD.Terrain.WALL)
                RPD.GameScene:updateMap(i - 1)
            end
            --- left and right
            if level:cellX(i) == 1 and i ~= 1 then
                delete(i - 1)
                level:set(i - 1, RPD.Terrain.WALL)
                RPD.GameScene:updateMap(i - 1)
                delete(i - 2)
                level:set(i - 2, RPD.Terrain.WALL)
                RPD.GameScene:updateMap(i - 2)
            end
            --- bottom
            if level:cellY(i) == level:getHeight() - 1 then
                delete(i - 1)
                level:set(i - 1, RPD.Terrain.WALL)
                RPD.GameScene:updateMap(i - 1)
            end
        end
    end,

    ClearLevel = function()
        local Object = luajava.bindClass("com.nyrds.pixeldungeon.levels.objects.LevelObject")

        for i = 1, RPD.Dungeon.level:getLength() - 1 do
            RPD.Dungeon.level:set(i - 1, RPD.Terrain.WALL)
        end
    end,

    addDoors = function(Room, cell)
        CustomRoom = require("scripts/rooms/" .. Room)
        if pcall(
                function(cell)
                    CustomRoom.object2(cell)
                end
        ) then
        end
        local level = RPD.Dungeon.level
        local Hr = CustomRoom:getHidth()
        local Wr = CustomRoom:getWidth()
        local w = RPD.Dungeon.level:getWidth()
        local x = level:cellX(cell)
        local y = level:cellY(cell)
        for t = x - math.floor(Wr / 2) - 1, x + math.floor(Wr / 2) + 1 do
            for j = y - math.floor(Hr / 2) - 1, y + math.floor(Hr / 2) + 1 do
                local pos = level:cell(t, j)
                if level.map[pos] == RPD.Terrain.DOOR then
                    if CustomRoom.locked() == nil then
                        return
                    end
                    if CustomRoom.locked() == "Barricade" then
                        level:set(pos, RPD.Terrain.BARRICADE)
                        cell = level:randomRespawnCell()
                        dst = level:distance(pos, cell)
                        while (dst > Hr and dst > Wr) do
                            cell = level:randomRespawnCell()
                            dst = level:distance(pos, cell)
                            level:drop(RPD.item("PotionOfLiquidFlame"), cell)
                        end

                        if CustomRoom.locked() == "LockedDoor" then
                            level:set(pos, RPD.Terrain.LOCKED_DOOR)
                            cell = level:randomRespawnCell()
                            dst = level:distance(pos, cell)
                            while (dst > Hr and dst > Wr) do
                                cell = level:randomRespawnCell()
                                dst = level:distance(pos, cell)
                                level:drop(RPD.item("IronKey"), cell)
                            end
                        end
                    end
                end
            end
        end

    end
}
return room
