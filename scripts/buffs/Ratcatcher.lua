local RPD = require "scripts/lib/epicClasses"

local buff = require "scripts/lib/buff"

local storage = require "scripts/lib/storage"

local IceBlock = luajava.bindClass("com.watabou.pixeldungeon.effects.IceBlock")

return buff.init{
desc = function ()
return {
icon = 8,
name = RPD.StringsManager:maybeId("Ratcatcher_Buff"),
info = "DieHard_Info",
}
end,
    textureLarge = function()
    return "ui/CustomBuffsLarge.png"
    end,
    textureSmall = function()
    return "ui/CustomBuffs.png"
    end,
attachTo = function(self, buff, target)
return true
end,
detach = function(self, buff)
end,
act = function(self,buff)
buff:detach()
end, 
charAct = function(self,buff)
if buff.target:hp() <= 20 then
if not storage.get("waess") then
storage.put("waess",true)

local level = RPD.Dungeon.level
local x = level:cellX(buff.target:getPos())
local y = level:cellY(buff.target:getPos())
for i = x - 4, x + 4 do
for j = y - 4, y + 4 do
local pos = RPD.Dungeon.level:cell(i,j)
if level.map[pos] == RPD.Terrain.EMPTY then
local mob = RPD.mob("RatcatcherAttack")
mob:setPos(pos)
level:spawnMob(mob)
return
end
end
end

end
end
end
}
