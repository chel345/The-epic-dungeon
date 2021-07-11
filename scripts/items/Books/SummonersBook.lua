--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"
local shields = require "scripts/lib/shields"
local EPD = require "scripts/lib/dopClasses"


return item.init{
 desc  = function ()
        return {
           image     = 6,
            imageFile = "items/BooksInCityLibrary.png",
            name      = "Книга призывателя",
            info      = "В этой книге находятся заклинания для призыва великих сущностей, написанные на древнем языке прищывателей. Ты, однако, способен прочесть лишь одно заклинание- Призыв клыков. Это заклинание создаёт множество клыков, направленных в одну сторону. Призыв каждого расходует 10 единицу маны.",
            stackable = false,
            upgradable    = true,
         equipable     = "left_hand",
             price     = 200,
         --   isArtifact    = true,
              defaultAction = "ИСПОЛЬЗОВАТЬ"
        }
    end,   
    actions = function(self, item,  hero)
        if item:isEquipped(hero) then
            return {"ИСПОЛЬЗОВАТЬ"}
        end
    end,
        cellSelected = function(self, thisItem, action, cell)
        if action == "ИСПОЛЬЗОВАТЬ" then

EPD.Klak(cell,RPD.Dungeon.depth*(thisItem:level()+1),RPD.Dungeon.depth*(thisItem:level()+10),thisItem:getUser(),10-RPD.Dungeon.hero:magicLvl(),math.random(1,RPD.Dungeon.hero:lvl()),true)
end
end,
    execute = function(self, item, hero, action)
        if action == "ИСПОЛЬЗОВАТЬ" then
            item:selectCell("ИСПОЛЬЗОВАТЬ","Выбирете клетку")
        end
    end

}
