--
-- User: mike
-- Date: 06.11.2017
-- Time: 23:57
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"
local actor = require "scripts/lib/actor"
local storage = require "scripts/lib/storage"

return actor.init({
    activate = function()
if not storage.get("storycastle") then
       local wnd = RPD.new(RPD.Objects.Ui.WndStory,"Адская крепость, пролигающая после изумрудного собора является тоже своеобразной задворкой. Никому не известно кто построил её. Историки утверждают, что она была создана той неизвестной рассой и использовалось как укрытие, другие же суйверные говорят, что её построил сам дьявол, чтобы пытать там грешные души...")
       RPD.GameScene:show(wnd)
end
storage.put("storycastle",true)
local mob = RPD.MobFactory:mobByName("Shopkeeper")
local CastleKeeper = RPD.MobFactory:mobByName("CastleKeeperNPC")
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() == "Shopkeeper" then
maybeMob:destroy()
maybeMob:getSprite():killAndErase()
CastleKeeper:setPos(i)
RPD.Dungeon.level:spawnMob(CastleKeeper)
end
end

    end,
 act = function()
local mob = RPD.MobFactory:mobByName("AirElemental")
local mob2 = RPD.MobFactory:mobByName("FireNefrit")
for i = 1,RPD.Dungeon.level:getLength()-1 do           
local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and maybeMob ~= RPD.Dungeon.hero and maybeMob:getMobClassName() == "AirElemental" then
maybeMob:destroy()
maybeMob:getSprite():killAndErase()
mob2:setPos(i)
RPD.Dungeon.level:spawnMob(mob2)
end
end
return true
    end,
    actionTime = function()
        return 10
    end
})
