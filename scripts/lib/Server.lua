if level.map[i] == RPD.Terrain.EMPTY_SP_SP then
if level.map[i+1] == RPD.Terrain.WALL and level.map[i-1] == RPD.Terrain.WALL and level.map[i+w] == RPD.Terrain.EMPTY_SP and level.map[i-w] == RPD.Terrain.EMPTY_SP
then
if level.map[i+w+1] == RPD.Terrain.EMPTY_SP or
level.map[i+w-1] == RPD.Terrain.EMPTY_SP or
level.map[i-w-1] == RPD.Terrain.EMPTY_SP or
level.map[i-w+1] == RPD.Terrain.EMPTY_SP then
if not (
level.map[i-1] == RPD.Terrain.DOOR or
level.map[i+1] == RPD.Terrain.DOOR or
level.map[i+w] == RPD.Terrain.DOOR or
level.map[i-w] == RPD.Terrain.DOOR or
level.map[i-w-1] == RPD.Terrain.DOOR or
level.map[i-w+1] == RPD.Terrain.DOOR or
level.map[i+w-1] == RPD.Terrain.DOOR or
level.map[i+w+1] == RPD.Terrain.DOOR
)
then
level:set(i-1,RPD.Terrain.DOOR)
end
end
end
if level.map[i+w] == RPD.Terrain.WALL and level.map[i-w] == RPD.Terrain.WALL and level.map[i-1] == RPD.Terrain.EMPTY_SP and level.map[i+1] == RPD.Terrain.EMPTY_SP
then
if level.map[i+w-1] == RPD.Terrain.EMPTY_SP or
level.map[i-w-1] == RPD.Terrain.EMPTY_SP or
level.map[i+w+1] == RPD.Terrain.EMPTY_SP or
level.map[i-w+1] == RPD.Terrain.EMPTY_SP 
then
level:set(i-1,RPD.Terrain.DOOR)
end
end
end