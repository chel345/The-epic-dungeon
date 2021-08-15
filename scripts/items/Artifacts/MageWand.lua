--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"

local EPD = require "scripts/lib/dopClasses"

local storage = require "scripts/lib/storage"

n = 6

if not storage.get("a") then
storage.put("a",EPD.c )
else
EPD.c = storage.get("a")
end
if RPD.Dungeon.hero ~= nil then
    if not storage.get("Chars") then
storage.put("Chars",true)
        RPD.permanentBuff(RPD.Dungeon.hero, "Chars");
else
        RPD.permanentBuff(user, "Chars");
end
end

return item.init{
    desc  = function()

        return {
           image     = 3,
            imageFile = "items/ArtifactsMod.png",
            name      = "Посох мага",
            info      = "Этот посох сделан из особого магического дерева. Он излучает магическую ауру, но не может использовать её. Посох может принять вид жезла, если поймёт как устроена его стихия.",
            stackable = true,
            price     = 0
        }
    end, 
actions = function()


actionn = ("ВЗМАХНУТЬ("..EPD.c.."/"..n..")")

return {actionn} 
end,
    activate = function(self, item, hero)
                RPD.removeBuff(item:getUser(), RPD.Buffs.Light)

        RPD.permanentBuff(item:getUser(), RPD.Buffs.Light)

                RPD.removeBuff(item:getUser(), "Lighting")

        RPD.permanentBuff(item:getUser(), "Lighting")

    end,

    deactivate = function(self, item, hero)
            RPD.removeBuff(item:getUser(), RPD.Buffs.Light)
                RPD.removeBuff(item:getUser(), "Lighting")
    end,

    cellSelected = function(self, thisItem, action, cell)
        if actionn == action and cell ~= nil then
thisItem:getUser():getSprite():zap(cell)

if EPD.c  ~= 0 and EPD.c  <= n then

EPD.c  = EPD.c  - 1
storage.put("a",EPD.c )

local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)
local enemy = RPD.Actor:findChar(dst)
local l = thisItem:level()

if math.random(1,10) == 1 then
if RPD.Dungeon.level.map[cell] == RPD.Terrain.STATUE or RPD.Dungeon.level.map[cell] == RPD.Terrain.STATUE_SP then
RPD.Dungeon.level:set(cell, RPD.Terrain.EMPTY)
EPD.SpawnMob("SumStatue",cell,true)
RPD.zapEffect( thisItem:getUser():getPos(), cell, "Lightning")
end
end

if enemy then

if math.random(1,25-l) == 1 then
RPD.affectBuff(enemy, RPD.Buffs.Paralysis , 10)
end
enemy:damage(2*RPD.Dungeon.depth, thisItem:getUser())
enemy:getSprite():emitter():start( RPD.Sfx.SparkParticle.FACTORY, 0.1,1)
RPD.zapEffect( thisItem:getUser():getPos(), enemy:getPos(), "Lightning")
        else
RPD.zapEffect( thisItem:getUser():getPos(), dst, "Lightning")
end

else
RPD.glog("** Твоя палочка издаёт потрескивание: наверное, в ней кончились заряды.")
end

end
end,

    execute = function(self, item, hero, action)
        if actionn == action then
            item:selectCell(action,"Выбирите клетку")
        end
    end,
    bag = function(self, item)
        return "WandHolster"
    end

}