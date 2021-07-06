--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

return item.init{
    desc  = function ()
        return {
           image     = 15,
            imageFile = "items/ArtifactsMod.png",
            name      = "Рог гноллов",
            info      = "Особый магический рог, способный призвать на помощь гноллов-собратьев, которые объязаны прийдти на помощь. Обычно такие роги выдают героям за храбрость в бою. При использовании этот рог также может ошеломить ближайших врагов. Цена- 45 маны.",
            stackable = false,
            upgradable    = false,
 
             price     = 50
        }
    end, actions = function() return {"ПОДУТЬ"} end,
    execute = function(self, item, hero, action, cell, char, data) 
    if action == "ПОДУТЬ" then  

mana = RPD.Dungeon.hero:getSkillPoints()
if mana > 45 then
RPD.Dungeon.hero:spendSkillPoints(45)
else
RPD.glog("-- Не хватает маны")
return
end

gnolls = {
      "Gnoll",
      "Shaman",
      "Brute",
      "Shielded",
      "GnollLiber"
}

for i=1,RPD.Dungeon.level:getLength()-1 do
if RPD.Dungeon.level.map[i] == RPD.Terrain.EMPTY then
if math.random(1,100) == 1 then
local mob = RPD.MobFactory:mobByName(gnolls[math.random(1,#gnolls)]) 
mob:setPos(i-1)
RPD.Dungeon.level:spawnMob(RPD.Mob:makePet(mob,RPD.Dungeon.hero))
end
end
end

for i = 1,RPD.Dungeon.level:getLength()-1 do                local maybeMob = RPD.Actor:findChar(i)          
if maybeMob and RPD.Dungeon.level.fieldOfView[i] and maybeMob ~= RPD.Dungeon.hero and not maybeMob:isPet() then 
RPD.affectBuff(maybeMob, RPD.Buffs.Vertigo,RPD.Dungeon.hero:magicLvl()*2+10)
if math.random(1,5) == 1 then
maybeMob:damage(math.random(1,5),RPD.Dungeon.hero)
end
end
end

local hero = RPD.Dungeon.hero
hero:getSprite():emitter():burst(RPD.Sfx.Speck:factory(RPD.Sfx.Speck.SCREAM), 2)
RPD.playSound( "Horn.ogg" )
end 

end 
}