--
-- User: mike
-- Date: 28.05.2018
-- Time: 22:35
-- This file is part of Remixed Pixel Dungeon.
--

local serpent = require "scripts/lib/serpent"
local RPD     = require "scripts/lib/epicClasses"
local util    = require "scripts/lib/util"

local wand    = {}

wand.__index  = wand

function wand.actions(self, wand, hero)
    return { RPD.StringsManager:maybeId("Wave") }
end

function wand.burn(self, wand, cell)
    return wand
end

function wand.freeze(self, wand, cell)
    return wand
end

function wand.poison(self, wand, cell)
    return wand
end

function wand.onThrow(self, wand, cell)
    wand:dropTo(cell)
end

function wand.act(self, wand)
    wand:deactivateActor()
end

function wand.cast(self, wand, lvl)
end

function wand.cellSelected(self, wand, action, cell)
    if cell ~= nil and action == RPD.StringsManager:maybeId("Wave") then

        wand:getUser():getSprite():zap(cell)
        local dst = RPD.Ballistica:cast(wand:getUser():getPos(), cell, true, false,false)
        local lvl = wand:level()

        self.castOnCell(self, wand, cell, dst, lvl)
    end
end

function wand.castOnCell(self, wand, cell)
end

function wand.activate(self, wand, hero)
end

function wand.deactivate(self, wand, hero)
end

function wand.saveData(self)
    return serpent.dump(self.data or {})
end

function wand.loadData(self, _, str)
    local _, data = serpent.load(str)
    self.data     = data or {}
end

function wand.storeData(self, data)
    self.data = data or {}
end

function wand.restoreData(self)
    return self.data or {}
end

function wand.defaultDesc()
    return {
        image         = 1,
        imageFile     = "items/WandsMod.png",
        name          = "smth",
        info          = "smth",
        stackable     = false,
        upgradable    = true,
        identified    = true,
        defaultAction = RPD.StringsManager:maybeId("Wave"),
        price         = 200,
        equipable     = "left_hand"
    }
end

function wand.selectType()
    return "none"
end

function wand.getMana()
    return 15
end

function wand.getManaMes()
    return RPD.StringsManager:maybeId("No_Mana")
end

function wand.execute(self, wand, hero, action)
    local own = self:selectType()
    if action == RPD.StringsManager:maybeId("Wave") then
        if own == "cell" then
            mana = self:getMana()
            if mana <= hero:getSkillPoints() then
                RPD.Dungeon.hero:spendSkillPoints(mana)
            else
                RPD.glog(self:getManaMes())
                return
            end
            wand:selectCell(RPD.StringsManager:maybeId("Wave"), RPD.StringsManager:maybeId("SelectDirectionWave"))
        else
            mana = self:getMana()
            if mana <= hero:getSkillPoints() then
                RPD.Dungeon.hero:spendSkillPoints(mana)
            else
                RPD.glog(self:getManaMes())
                return
            end
            self.cast(self, wand, wand:level())
        end
    end
end

function wand.itemDesc(self, thisitem)
    local ret = wand.defaultDesc(thisitem)
    local own = self:desc(thisitem)

    if own.isArtifact then
        own.equipable = "artifact"
    end

    self.data = own.data or {}

    for k, v in pairs(own) do
        ret[k] = v
    end

    return ret
end

function wand.desc(self, wand)
    return wand.defaultDesc()
end

wand.init = function(desc)
    setmetatable(desc, wand)
    return desc
end

return wand
