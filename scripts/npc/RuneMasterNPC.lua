--[[
    Created by mike.
    DateTime: 19.01.19 21:24
    This file is part of pixel-dungeon-remix
]]

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

local npc
local client

local Rune1 = RPD.ItemFactory:itemByName("Runes/Rune1")

local Rune2 = RPD.ItemFactory:itemByName("Runes/Rune2")

local Rune3 = RPD.ItemFactory:itemByName("Runes/Rune3")

local dialog = function(index)
    if index == 0 then
        if client:gold() >= 450 then
            client:spendGold(450)
RPD.Dungeon.level:drop(Rune1, client:getPos())
            return
        end
        npc:say("Прости, но я не занимаю в долг.")
    end

    if index == 1 then
        if client:gold() >= 900 then
            client:spendGold(900)
RPD.Dungeon.level:drop(Rune2, client:getPos())
            return
        end
        npc:say("Прости, но я не занимаю в долг.")
    end

    if index == 2 then
        if client:gold() >= 600 then
            client:spendGold(600)
RPD.Dungeon.level:drop(Rune3, client:getPos())
            return
        end
        npc:say("Прости, но я не занимаю в долг.")
    end

    if index == 3 then
        npc:say("Приходи ещё.")
    end
end


return mob.init({
    interact = function(self, chr)
        client = chr
        npc = self
        RPD.chooseOption( dialog,
                "Рунный мастер",
                "О! Кто это тут у нас! Давненько я не видел путника! Желаешь приобрести руну?",
    "Руна стада -450 g",
    "Руна защитного поля -900 g",
    "Руна светового патрона -600 g",
                "Уйти"
        )
    end,
    spawn = function(self, enemy, dmg) 
self:getSprite():emitter():start( RPD.Sfx.FlowParticle.FACTORY, 0.8 )

--[[
for c = self:getPos()-5, self:getPos()+5 do
if RPD.Dungeon.level.map[c] == RPD.Terrain.EMPTY_SP and c ~= self:getPos() then
RPD.createLevelObject({
    kind="Deco",
    object_desc="DummyMagicGaurd"
}
,c)
break
end
end

a = self:getPos()-RPD.Dungeon.level:getWidth()*3
for i = 1,5 do
a = a+RPD.Dungeon.level:getWidth()
if RPD.Dungeon.level.map[a] == RPD.Terrain.EMPTY_SP and a ~= self:getPos() then
RPD.createLevelObject({
    kind="Deco",
    object_desc="OfftenMagicGaurd"
}
,a
)
break
end

if a == self:getPos()+RPD.Dungeon.level:getWidth()*3 then
break
end
end
--]]
end,
})
