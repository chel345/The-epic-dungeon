--
-- User: mike
-- Date: 25.01.2018
-- Time: 0:26
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/epicClasses"

local mob = require"scripts/lib/mob"

local MobAi = require"scripts/lib/MobAi"

local aiDesc = {
	stayOnSpawn  = true,
	maxDistance = 2,
	allies = {"Custom/Piranha"},
	attackRange = 1,
	maxSpawnDst = 2
}

local colors = {
	{ 136/255, 39/255, 39/255, 0.6 },
	{ 82/255, 145/255, 138/255, 0.6 },
	{ 153/255, 68/255, 176/255, 0.6 },
	{ 32/255, 146/255, 237/255, 0.6 },
	{ 248/255, 212/255, 52/255, 0.6 }
}

local function makeMob()
  local data
  local pos
  return {
  		spawn = function(self)
  			pos = self:getPos()
  			self:addImmunity(RPD.Blobs.Fire)
  		end,
    act = function(self)
    	  data = mob.restoreData(self)
    	  data.spawn_pos = data.spawn_pos or pos
    	  data.color = data.color or colors[math.random(1,5)]
    	  mob.storeData(self,data)
	  	  aiDesc.cell_spawn = data.spawn_pos
			self:getSprite():tint(data.color[1],data.color[2],data.color[3],data.color[4])
		  MobAi.update(self,aiDesc)
		  if data.stats then
		  		return
		  	end
		  	data.stats = data.stats or true
		  	mob.storeData(self,data)
		  	self:hp(5 + RPD.Dungeon.depth*2)
  			self:ht(self:hp())
  			--[[
  			self.dmgMin = math.ceil(RPD.Dungeon.depth/2)
  			self.dmgMax = self.dmgMin*2
  			self.dr  =math.floor(RPD.Dungeon.depth/2)
  			self.baseDefenseSkill = 5 + RPD.Dungeon.depth * 2
  			self.baseAttackSkill = 10 + RPD.Dungeon.depth * 2
  			--]]
		end
  }
end
return mob.init(makeMob())
