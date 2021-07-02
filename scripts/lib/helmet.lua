--
-- User: mike
-- Date: 28.05.2018
-- Time: 22:35
-- This file is part of Remixed Pixel Dungeon.
--

local serpent = require "scripts/lib/serpent"

local RPD = require "scripts/lib/commonClasses"

local util = require "scripts/lib/util"

local item = {}

item.__index = item

function item.actions(self, item, hero)
    return {}
end

function item.getStr()
return 10
end

function item.typicalSTR(self, item)
it = item
return self:getStr() - item:level()
end

function item.requiredSTR(self, item)
return self:getStr() - item:level()
end

function item.execute(self, item, hero, action)
end

function item.burn(self, item, cell)
    return item
end

function item.freeze(self, item, cell)
    return item
end

function item.poison(self, item, cell)
    return item
end

function item.onThrow(self, item, cell)
    item:dropTo(cell)
end


function item.cellSelected(self, item, action, cell)
end

function item.getSprite()
return "Helmet"
end

function item.addHead()
return true
end

function item.getDr()
return 10
end

function item.active(self,item,hero)
end

function item.activate(self, item, hero)
self:active(self,item,hero)

--[[
if hero:getBelongings().ring1 ~= item then
RPD.Dungeon.level:drop(hero:getBelongings().ring1,hero:getPos())
hero:getBelongings().ring1:removeItemFrom(hero)
end

if hero:getBelongings().ring2 ~= item then
RPD.Dungeon.level:drop(hero:getBelongings().ring2,hero:getPos())
hero:getBelongings().ring2:removeItemFrom(hero)
end
--]]

RPD.permanentBuff(hero, "Helmet"):level(self:getDr()*(item:level()+1))

if self:getStr() > item:getUser():effectiveSTR() then

blindness = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Blindness")
RPD.permanentBuff(hero, blindness)

end

hero:overrideSpriteLayer("helmet", "hero_modern/items/Helmets/"..self:getSprite()..".png")
hero:overrideSpriteLayer("hair", "hero_modern/empty.png")
if not self:addHead() then
hero:overrideSpriteLayer("head", "hero_modern/empty.png")
end
pcall(function() hero:updateSprite() end)
end

function item.dective(self,item,hero)
end

function item.deactivate(self, item, hero)
self:dective(self,item,hero)

blindness = luajava.bindClass("com.watabou.pixeldungeon.actors.buffs.Blindness")
RPD.removeBuff(hero, "Helmet")
RPD.removeBuff(hero, blindness)

hero:overrideSpriteLayer("helmet",nil)
hero:overrideSpriteLayer("hair",nil)
hero:overrideSpriteLayer("head",nil)
pcall(function() hero:updateSprite() end)
end

function item.saveData(self)
    return serpent.dump(self.data or {})
end

function item.loadData(self, _, str)
    local _,data = serpent.load(str)
    self.data = data or {}
end

function item.storeData(self, data)
    self.data = data or {}
end

function item.restoreData(self)
    return self.data or {}
end

function item.defaultDesc(self)
return {
        image         = 1,
        imageFile     = "items/Helmets.png",
        name          = "smth",
        info          = "smth",
        stackable     = false,
        upgradable    = true,
        identified    = true,
        defaultAction = "Item_ACThrow",
        price         = 500,
        equipable     = "artifact"
    }
end

function item.itemDesc(self,thisItem)
    local ret = item.defaultDesc(thisItem)
    local own = self:desc(thisItem)

    if own.isArtifact then
        own.equipable = "artifact"
    end

    self.data = own.data or {}

    for k,v in pairs(own) do
        ret[k] = v
    end

    return ret
end

function item.desc(self, item)
    return item.defaultDesc()
end

item.init = function(desc)
    setmetatable(desc, item)
    return desc
end

return item