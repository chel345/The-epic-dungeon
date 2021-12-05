local RPD = require("scripts/lib/epicClasses")

local function have(mas,n)
	if not mas then
		return false
	end
	for _,i in pairs(mas) do
		if i == n then
			return true
		end
	end
	return false
end

local function canAttack(me,mob,desc)
	local dst = RPD.Dungeon.level:distance(me:getPos(),mob:getPos())
	if dst <= desc.attackRange then
		return true
	end
	return false
end

local function getMob(desc,why)
	local dst
	for _,mob in pairs(RPD.getMobs(RPD.Dungeon.level)) do
		dst = RPD.Dungeon.level:distance(why:getPos(),mob:getPos())
		if dst <= desc.maxDistance then
			if mob == RPD.Dungeon.hero and (not have(desc["allies"],"hero")) then
			  return mob
			end
			if tostring(mob.fraction) ~= 'NEUTRAL' and (not have(desc["allies"],mob:getMobClassName())) and mob ~= why then
          return mob
			end
		end
	end
	return false
end

local function canTo(pos,desc)
  if desc.stayOnSpawn then
    if RPD.Dungeon.level:distance(pos,desc.cell_spawn) > desc.maxSpawnDst then
      return false
    end
  end
  return true
end

local MobAi = {
update = function(me,aiDesc)
  local s = canTo(me:getPos(),aiDesc)
	if not s then
	  me:beckon(aiDesc.cell_spawn)
	  --RPD.glog(aiDesc.cell_spawn)
	  return
	end
	local mob = getMob(aiDesc,me)
	if not mob then
		return
	end
	if canAttack(me,mob,aiDesc) then
		me:doAttack(mob)
	elseif s and canTo(mob:getPos(),aiDesc) and mob ~= RPD.Dungeon.hero then
    	me:beckon(mob:getPos())
	end
end
}

return MobAi