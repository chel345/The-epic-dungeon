--
-- User: mike
-- Date: 25.11.2017
-- Time: 22:56
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local EPD = require "scripts/lib/dopClasses"
local mob = require"scripts/lib/mob"

local quest = require"scripts/lib/quest"

local questName = "Некромант"

local items = {
 "Skulls/RunicSkull1",
 "Skulls/RunicSkull2",
 "Skulls/RunicSkull3",
 "Skulls/RunicSkull4"
}
return mob.init({
    interact = function(self, chr)
local level = RPD.Dungeon.level
        if not quest.isGiven(questName) then
EPD.showQuestWindow(self,"Так... Ты! Сделаешь для меня одно дельце? Насчёт награды не беспокойся, плохого не дам. Ты должен убить 5 тёмных рыцарей. Не меньше!")

            quest.give(questName, chr, {kills={"DeathKnight"}})
            return
        end

        if quest.isCompleted(questName) then
EPD.showQuestWindow(self,"С вами приятно иметь дело... хе хе хе хе...")

            return
        end

        local ratsKilled = quest.state(questName).kills.DeathKnight or 0

        if ratsKilled < 5 then
EPD.showQuestWindow(self,"Этого мало!")
        else
EPD.showQuestWindow(self,"С вами приятно иметь дело... хе хе хе хе...")
            RPD.Dungeon.level:drop(RPD.ItemFactory:itemByName(items[math.random(1,4)]),chr:getPos())
        for i = 1,math.random(1,5) do
            local mob = RPD.MobFactory:mobByName("DeathKnight")
            local pos = level:getEmptyCellNextTo(self:getPos())
            if (level:cellValid(pos)) then
                mob:setPos(pos)
                level:spawnMob(mob)
mob:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.CURSE, 6 )
RPD.playSound( "snd_cursed.mp3" )
           end
        end 
self:destroy()
self:getSprite():killAndErase()
            quest.complete(questName)
        end
    end
})
