local RPD = require("scripts/lib/commonClasses")
local function cellHalls()
return RPD.Dungeon.hero:getPos()
end
local Process = {
    multiplayer_start = nil,
    beckon_player     = nil,
    was               = false,
    life              = nil,
    ht                = nil,
    hp                = nil,
    pos               = nil,
    class             = nil,
    depth             = nil,
    item              = nil,
    pet               = nil,
    data              = nil,
    cell_halls        = cellHalls()
}
return Process