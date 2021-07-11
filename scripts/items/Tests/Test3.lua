--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--0xFFFFFF

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local EPD = require "scripts/lib/dopClasses"

local room = require "scripts/lib/room"

local Ginerator = require "scripts/lib/Ginerator"

return item.init{
    desc  = function ()
        return {
            imageFile = "items/materials.png",
            name      = "Ледяной жезл",
            info      = "Жезл состоит из цельного куска льда. Не дают растаять ему три кристалла на вершине. При использовании он заморозит всё возле героя.",
            stackable = false,
            upgradable    = false,
 
             price     = 50,
heapScale = 3.;
             }
    end, 
    image = function()
    return 4.5
    end,
    actions = function()

 return {RPD.Actions.zap}
end,

    execute = function(self, item, hero, action, cell, char, data) 
         if action == RPD.Actions.zap then
local image = RPD.new("com.watabou.noosa.Image","ui/title.png")
RPD.GameScene:effect(image)
end 
end 
}
