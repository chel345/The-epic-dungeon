--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"

local hero = RPD.Dungeon.hero
return item.init{
    desc  = function ()
        return {
            image         = 0,
            imageFile     = "items/Runes.png",
            name          = RPD.StringsManager:maybeId("RuneOfLight_Name"),
            info          = RPD.StringsManager:maybeId("RuneOfLight_Info"),
            stackable     = true,
            defaultAction = RPD.StringsManager:maybeId("Activate"),
            price         = 50,
            upgradable    = true
        }
    end,
    actions = function() return {RPD.StringsManager:maybeId("Activate")} end,

    cellSelected = function(self, thisItem, action, cell,item)
thisItem:detach(RPD.Dungeon.hero:getBelongings().backpack) 

        if action == RPD.StringsManager:maybeId("Activate") and cell ~= nil then
thisItem:getUser():spend(1)
local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)
local enemy = RPD.Actor:findChar(dst)
if enemy then
RPD.affectBuff(enemy, RPD.Buffs.Light , 10*thisItem:level())
RPD.affectBuff(enemy, RPD.Buffs.Vertigo , 10*thisItem:level())
enemy:damage(RPD.Dungeon.depth*math.random(1,RPD.Dungeon.hero:magicLvl()),thisItem:getUser())
enemy:getSprite():emitter():burst( RPD.Sfx.ShadowParticle.UP, 8 )
RPD.zapEffect( thisItem:getUser():getPos(), enemy:getPos(), "DeathRay")
else
RPD.zapEffect( thisItem:getUser():getPos(), dst, "DeathRay")
end

end
end,
    execute = function(self, item, hero, action)
        if action == RPD.StringsManager:maybeId("Activate") then
            item:selectCell( RPD.StringsManager:maybeId("Activate") ,RPD.StringsManager:maybeId("Select_A_Cage"))
        end
end,
  bag = function(self, item)
        return "ScrollHolder"
    end

}
