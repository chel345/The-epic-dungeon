-- aliases for protected environments
local assert, io_open
    = assert, io.open

-- load the ltn12 module
local ltn12 = require("scripts/lib/ltn12")

-- No more global accesses after this point
--[[
if _VERSION == "Lua 5.2" then _ENV = nil end
--]]

-- copy a file
local copy_file = function(path_src, path_dst)
  ltn12.pump.all(
      ltn12.source.file(assert(io_open(path_src, "rb"))),
      ltn12.sink.file(assert(io_open(path_dst, "wb")))
    )
end

return {
   copy_file = copy_file;
}