--
-- User: mike
-- Date: 25.11.2017
-- Time: 22:56
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local EPD = require "scripts/lib/dopClasses"
local mob = require"scripts/lib/mob"

local quest = require"scripts/lib/quest"

local questName = RPD.StringsManager:maybeId("NecroNPC_QuestName")

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
EPD.showQuestWindow(self,RPD.StringsManager:maybeId("NecroNPC_Phrase1"))

            quest.give(questName, chr, {kills={"DeathKnight"}})
            return
        end

        if quest.isCompleted(questName) then
EPD.showQuestWindow(self,RPD.StringsManager:maybeId("NecroNPC_Phrase2"))

            return
        end

        local ratsKilled = quest.state(questName).kills.DeathKnight or 0

        if ratsKilled < 5 then
EPD.showQuestWindow(self,RPD.StringsManager:maybeId("NecroNPC_Phrase3"))
        else
EPD.showQuestWindow(self,RPD.StringsManager:maybeId("NecroNPC_Phrase2"))
            RPD.Dungeon.level:drop(RPD.ItemFactory:itemByName(items[math.random(1,4)]),chr:getPos())
        for i = 1,math.random(1,5) do
            local mob = RPD.mob("DeathKnight")
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
