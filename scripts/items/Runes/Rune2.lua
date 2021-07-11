--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local hero = RPD.Dungeon.hero
return item.init{
    desc  = function ()
        return {
            image         = 1,
            imageFile     = "items/Runes.png",
            name          = "Руна защитного поля",
            info          = "Эта руна мигает тёмно-фиолетовым цветом. На ней имеются искусстно вырезанные заклятья. При использовании эта руна наложит на тебя особый щит, который сделает тебя неуязвимым к любому урону (кроме некоторых видов заклинаний).",
            stackable     = true,
            defaultAction = "АКТИВИРОВАТЬ",
            price         = 50,
            upgradable    = true
        }
    end,
    actions = function() return {"АКТИВИРОВАТЬ"} end,

    execute = function(self, item, hero, action)
        if action == "АКТИВИРОВАТЬ" then 
   RPD.affectBuff(RPD.Dungeon.hero, "LightShild" , 10+item:level())
   item:detach(RPD.Dungeon.hero:getBelongings().backpack)
        end
end,
  bag = function(self, item)
        return "ScrollHolder"
    end

}
