--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"


return item.init{
    desc  = function ()
        return {
           image     = 1,
            imageFile = "CustomSkull.png",
            name      = RPD.StringsManager:maybeId("CustomSkull_Name"),
            info      = RPD.StringsManager:maybeId("CustomSkull_Info"),
            stackable = true,
            price     = 150,
            upgradable    = false
        }
    end,
    onThrow = function(self, item, cell)
        local level = RPD.Dungeon.level
        if level.map[cell] then
            local mob = RPD.MobFactory:mobByName("CustomSkull")
            mob:setPos(cell)
            level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))
            local Buff = RPD.affectBuff(mob,"CustomSkull", 1000000)
            Buff:level(item:level())
        else
            item:dropTo(cell)
        end
    end
}
