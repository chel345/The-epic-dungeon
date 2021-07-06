--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"
dialog = function(index)
if index == 0 then
local Bundle = luajava.bindClass("com.watabou.utils.Bundle")
local HeroClass = luajava.bindClass("com.watabou.pixeldungeon.actors.hero.HeroClass")
local HeroSubClass = luajava.bindClass("com.watabou.pixeldungeon.actors.hero.HeroSubClass")
--error("Кто прочитал, тот гей")
--os.rename("/strings_ru_2.json", "/strings_ru_1.json")
HeroClass_Necromancer = "Ледомант"

RPD.glog("** теперь ты ледомант!")
end
end


return item.init{
    desc  = function ()
        return {
           image     = 8,
            imageFile = "items/ArtifactsMod.png",
            name      = "Плащ маэстро Гримма",
            info      = "Это плащ состоит из нескольких сшитых между собой чёрных с одной стороны и красных с другой лент.",
            stackable = true,
            upgradable    = false,
            isArtifact    = true,
            price     = 0
             }
    end,   
    actions = function(self, item,  hero)
            return {"ПОГЛАТИТЬ"}
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
if action == "ПОГЛАТИТЬ" then
RPD.chooseOption(
dialog,
"Ледомантия",
"Ты уверен в своём решении?",
"Да...",
"Нет, я не хочу этого"
)

end
    end

}