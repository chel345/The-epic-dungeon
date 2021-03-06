--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"

local EPD = require "scripts/lib/dopClasses"


return item.init{
 desc  = function ()
        return {
           image     = 5,
            imageFile = "items/BooksInCityLibrary.png",
            name      = RPD.StringsManager:maybeId("BookOfDragoman_Name"),
            info      = RPD.StringsManager:maybeId("BookOfDragoman_Info"),
            stackable = false,
            upgradable    = false,
         equipable     = "left_hand",
             price     = 200,
         --   isArtifact    = true,
defaultAction = RPD.StringsManager:maybeId("Action_Use")
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
            return {RPD.StringsManager:maybeId("Action_Use")}
        end
    end,
    
cellSelected = function(self, thisItem, action, cell)
local dialog = function(index)
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
ctor:selectCell(selectMob,RPD.StringsManager:maybeId("Choose_A_Target"))
end
end
if action == RPD.StringsManager:maybeId("Action_Use") then
ctor = thisItem
--local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)
local char = RPD.Actor:findChar(cell)
if char and char ~= RPD.Dungeon.hero then
if char:isPet() then
selff = char
RPD.chooseOption( dialog,
selff:getName(),
(RPD.StringsManager:maybeId("HealthPointsMobs_1")..selff:hp()..RPD.StringsManager:maybeId("HealthPointsMobs_2")..selff:ht()..RPD.StringsManager:maybeId("AgilityMobs_1")..selff:attackSkill()..RPD.StringsManager:maybeId("AgilityMobs_2")),
RPD.StringsManager:maybeId("StandStill"),
RPD.StringsManager:maybeId("MoveInMyDirection"),
RPD.StringsManager:maybeId("ExploreTheLevel"),
RPD.StringsManager:maybeId("ChoosePriorityTarget")
        )
else
char:yell(RPD.StringsManager:maybeId("IAmStronger"))
end
else
RPD.glog(RPD.StringsManager:maybeId("EmptyHere"))
end
end
if action == selectMob then
if RPD.Actor:findChar(cell) then
EPD.Char = RPD.Actor:findChar(cell)
RPD.permanentBuff(selff,"Attacher")
else
RPD.glog(RPD.StringsManager:maybeId("EmptyHere"))
end
end

end,
    execute = function(self, item, hero, action)
        if action == RPD.StringsManager:maybeId("Action_Use") then
            item:selectCell(RPD.StringsManager:maybeId("Action_Use"),RPD.StringsManager:maybeId("Select_A_Cage"))
        end
    end

}
