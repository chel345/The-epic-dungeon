--
-- User: mike
-- Date: 25.11.2017
-- Time: 22:56
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local mob = require"scripts/lib/mob"

local storage = require "scripts/lib/storage"

local Flute = "Flute"

local Item = RPD.item("Test")

local dialog = function(index)
    if index == 0 then
    storage.put(Flute, true)
    return
    end
    end
    
local dialog2 = function(index)
    if index == 0 then
Item:detach(RPD.Dungeon.hero:getBelongings()) 
    return
    end
    end

return mob.init({
    interact = function(self, chr)
    if not storage.get(Flute) then
        RPD.chooseOption( dialog,
                "Горожанин",
                "Принеси мне флейту.",
                "Я могу тебе помочь.",
                "Прости, я сейчас занят.")
                return
                end
    if storage.get(Flute) then
        RPD.chooseOption( dialog2,
                "Горожанин",
                "Как там дела с моей дудочкой?",
                "Я нашел её!",
                "Никак"
                )
                return
                end
end
})
