--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"

return item.init{
    desc  = function (self, item)
        return {
            image         = 4,
            imageFile     = "items/ArtifactsMod.png",
            name          = RPD.StringsManager:maybeId("IceCrystal_Name"),
            info          = RPD.StringsManager:maybeId("IceCrystal_Info"),
            stackable     = false,
            defaultAction = RPD.StringsManager:maybeId("Action_Use"),
            price         = 700,
            isArtifact    = true,
            upgradable    = true
            }
    end,
    actions = function(self, item,  hero)
        if item:isEquipped(hero) then
            return {RPD.StringsManager:maybeId("Action_Use")}
        end
    end,

    cellSelected = function(self, thisItem, action, cell)
        if action == RPD.StringsManager:maybeId("Action_Use") then
        if math.random(1,8) == 1 then

RPD.glog(RPD.StringsManager:maybeId("Сrystal_Broke"))
thisItem:removeItemFrom(RPD.Dungeon.hero)
return
end
local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)

 local enemy = RPD.Actor:findChar(dst)
  if enemy and enemy ~= RPD.Dungeon.hero then

            RPD.zapEffect(thisItem:getUser():getPos(), dst, "Ice")
  enemy:damage(10+(thisItem:level()*2), thisItem:getUser())
            RPD.placePseudoBlob( RPD.PseudoBlobs.Freezing, dst)
        else
            RPD.zapEffect(thisItem:getUser():getPos(), dst, "Ice")
            RPD.placePseudoBlob( RPD.PseudoBlobs.Freezing, dst)
end
        end
    end,

    execute = function(self, item, hero, action)
        if action == RPD.StringsManager:maybeId("Action_Use") then
            item:selectCell(RPD.StringsManager:maybeId("Action_Use"),RPD.StringsManager:maybeId("Select_A_Cage"))
        end
    end
}
