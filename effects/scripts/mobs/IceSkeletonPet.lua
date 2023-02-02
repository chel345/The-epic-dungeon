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
	stayOnSpawn  = false,
	maxDistance = 4,
	allies = {"Custom/IceSkeletonPet"},
	attackRange = 1
}

local function makeMob()
  local data
  local pos
  return {
  		spawn = function(self)
  			pos = self:getPos()
  		end,
    act = function(self)
    	  data = mob.restoreData(self)
    	  data.spawn_pos = data.spawn_pos or pos
    	  mob.storeData(self,data)
	  	  aiDesc.cell_spawn = data.spawn_pos
		  MobAi.update(self,aiDesc)
		  self:spend(1)
    end
  }
end
return mob.init(makeMob())
