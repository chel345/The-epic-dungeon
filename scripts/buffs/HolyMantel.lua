local RPD = require "scripts/lib/commonClasses"

local buff = require "scripts/lib/buff"

local IceBlock = luajava.bindClass("com.watabou.pixeldungeon.effects.IceBlock")

return buff.init{
desc = function ()
return {
icon = 50,
name = RPD.textById("Holy_Mantel_Buff"),
info = "DieHard_Info",
}
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
if buff.target:hp() <= 5 then
buff.target:hp(buff.target:ht())
IceBlock:freeze(buff.target:getSprite())
end
end
}