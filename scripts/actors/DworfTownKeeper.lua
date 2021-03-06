--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local actor = require "scripts/lib/actor"

local Ginerator = require "scripts/lib/Ginerator"

local storage = require "scripts/lib/storage"

return actor.init({
    activate = function()
if RPD.Dungeon.depth == 16 then
if not storage.get("storydworf") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,RPD.StringsManager:maybeId("DworfTown_Story"))
       RPD.GameScene:show(wnd)
       storage.put("storydworf",true)
local item = RPD.Dungeon.level:drop(RPD.item("PotionOfStrength"),55)
item.type = RPD.Heap.Type.CRYSTAL_CHEST

local item = RPD.Dungeon.level:drop(RPD.item("PotionOfHealing"),75)
item.type = RPD.Heap.Type.CRYSTAL_CHEST

local item = RPD.Dungeon.level:drop(RPD.item("ScrollOfWeaponUpgrade"),77)
item.type = RPD.Heap.Type.CRYSTAL_CHEST

local item = RPD.Dungeon.level:drop(RPD.item("Ration"),58)
item.type = RPD.Heap.Type.CRYSTAL_CHEST

end
end

return true
end,
    actionTime = function()
        return 1
    end,
act = function()
return true
end
})
