--
-- User: mike
-- Date: 29.01.2019
-- Time: 20:33
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

return item.init{
    desc  = function (self, item)
        return {
            image         = 4,
            imageFile     = "items/ArtifactsMod.png",
            name          = "Ледяной кристалл",
            info          = "Издревле в обществе магов было принято заключать заклинания в кристаллическую оболочку для хранения или многоразового использования. Назначение кристалла определялось его мощностью. Если мощность кристалла равна мощности заклинания, то он был способен лишь хранить её. Но если мощь кристалла в разы больше, то он способен бесконечное количество раз повторять хранимое им заклинание. Обычно для создания такого кристалла использовались 8 типов кристаллов: 4 кристалла природных стихий и 4 кристалла Магических Сил: Света, Тьмы, Багрянца и Порчи. Однако Ледяные маги использовали для создания магических кристаллов чистейший лёд и сильную стужу, что умели делать только они... Вы чувствуете сильную ледяную магию внутри этого кристалла, так как держа его в руках, вы буквально промерзаете до костей.",
            stackable     = false,
            defaultAction = "action1",
            price         = 700,
            isArtifact    = true,
            upgradable    = true
            }
    end,
    actions = function(self, item,  hero)
        if item:isEquipped(hero) then
            return {"ИСПОЛЬЗОВАТЬ"}
        end
    end,

    cellSelected = function(self, thisItem, action, cell)
        if action == "ИСПОЛЬЗОВАТЬ" then
        if math.random(1,8) == 1 then

RPD.glog("-- Кристалл истощил свои запасы и разрушился :(")
thisItem:removeItemFrom(RPD.Dungeon.hero)
return
end
local dst = RPD.Ballistica:cast(thisItem:getUser():getPos(), cell, true, true, true)

 local enemy = RPD.Actor:findChar(dst)
  if enemy and enemy ~= RPD.Dungeon.hero then

            RPD.zapEffect(thisItem:getUser():getPos(), dst, "Ice")
  enemy:damage(10+(thisItem:level()*2), thisItem:getUser())
            RPD.placePseudoBlob( RPD.PseudoBlobs.Freezing, dst)
        else
            RPD.zapEffect(thisItem:getUser():getPos(), dst, "Ice")
            RPD.placePseudoBlob( RPD.PseudoBlobs.Freezing, dst)
end
        end
    end,

    execute = function(self, item, hero, action)
        if action == "ИСПОЛЬЗОВАТЬ" then
            item:selectCell("ИСПОЛЬЗОВАТЬ","Выбирете клетку")
        end
    end
}
