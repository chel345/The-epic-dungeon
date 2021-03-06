--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local item = require "scripts/lib/item"
dialog = function(index)
if index == 0 then
local Bundle = luajava.bindClass("com.watabou.utils.Bundle")
local HeroClass = luajava.bindClass("com.watabou.pixeldungeon.actors.hero.HeroClass")
local HeroSubClass = luajava.bindClass("com.watabou.pixeldungeon.actors.hero.HeroSubClass")
--error(RPD.StringsManager:maybeId("HeroClass_Necromancer_Error"))
--os.rename("/strings_ru_2.json", "/strings_ru_1.json")
HeroClass_Necromancer = RPD.StringsManager:maybeId("HeroClass_Necromancer")

RPD.glog(RPD.StringsManager:maybeId("YouIceMaster"))
end
end


return item.init{
    desc  = function ()
        return {
           image     = 8,
            imageFile = "items/ArtifactsMod.png",
            name      = RPD.StringsManager:maybeId("GrimmsClack_Name"),
            info      = RPD.StringsManager:maybeId("GrimmsClack_Info"),
            stackable = true,
            upgradable    = false,
            isArtifact    = true,
            price     = 0
             }
    end,   
    actions = function(self, item,  hero)
            return {RPD.StringsManager:maybeId("Absorb")}
    end,

activate = function(self, item, hero)
if RPD.Dungeon.hero ~= nil then
self.data.activationCount = (self.data.activationCount or 0) + 1
        RPD.permanentBuff(RPD.Dungeon.hero, "IceSkull")
end
     end,

deactivate = function(self, item, hero)
        RPD.removeBuff(RPD.Dungeon.hero, "IceSkull")
    end,
    execute = function(self, item, hero, action)
if action == RPD.StringsManager:maybeId("Absorb") then
RPD.chooseOption(
dialog,
RPD.StringsManager:maybeId("IceMagic"),
RPD.StringsManager:maybeId("IceMagic_Question"),
RPD.StringsManager:maybeId("IceMagic_Yes"),
RPD.StringsManager:maybeId("IceMagic_No")
)

end
    end

}