-- This is demo buff for charAct

local RPD  = require "scripts/lib/epicClasses"

local buff = require "scripts/lib/buff"

local storage = require "scripts/lib/storage"

local emitters = {}

local d

return buff.init{
    desc  = function ()
        return {
            icon          = 1,
            name          = "none",
            info          = "CounterBuff_Info",
        }
    end,
    textureLarge = function()
    return "ui/CustomBuffsLarge.png"
    end,
    textureSmall = function()
    return "ui/CustomBuffs.png"
    end,
    detach = function(self, buff)
    storage.put("black_heart",false)
    storage.put("radius_black_heart",nil)
    storage.put("d_black_heart",nil)
    for i = 1, #emitters do
    emitters[i].on = false
    end
    emitters = {}
    local cells
    if d == 0 then
    cells = {849,663,671,857}
    else
    cells = {884}
    end
    local w = RPD.Dungeon.level:getWidth()
    for i = 1, #cells do
local mob = RPD.mob("GooBomb")
mob:setPos(cells[i]+w)
RPD.Dungeon.level:spawnMob(mob)
local Camera = luajava.bindClass("com.watabou.noosa.Camera")
Camera.main:shake(4,0.8f)
RPD.Tweeners.JumpTweener:attachTo(mob:getSprite(),cells[i],3,0.5f)
mob:setPos(cells[i])
    mob:spend(1)
    end
    buff.target:spend(2)
    end,
    act = function(self,buff)
    buff:detach()
    end, 
    attachTo = function(self, buff, target)
    d = storage.get("d_black_heart") or math.random(0,1)
    storage.put("d_black_heart",d)
    return true
    end,

    charAct = function(self,buff)
    local radius = storage.get("radius_black_heart") or 0
    local cell = buff.target:getPos()
    
for i = 1, #emitters do
emitters[i].on = false
end
emitters = {}
local r = math.floor(radius/2)
local w = RPD.Dungeon.level:getWidth()
local cells = {}
for i = -r+d, r-d do
cells[#cells+1] = cell-w*r+i
cells[#cells+1] = cell+w*r+i
cells[#cells+1] = cell-r+i*w
cells[#cells+1] = cell+r+i*w
end
for i = 1, #cells do
emitters[#emitters+1] = RPD.Sfx.CellEmitter:get(cells[i])
emitters[#emitters]:pour(RPD.Sfx.ShadowParticle.UP, 0.06)
local maybeMob = RPD.Actor:findChar(cells[i])
if maybeMob and maybeMob ~= buff.target then
maybeMob:damage(math.random(30,50),buff.target)
end
end

    storage.put("radius_black_heart",radius+1)
    end
}
