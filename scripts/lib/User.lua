s = tostring(math.random(1000,9999))
local User ={
host = "Host", -- здесь нужно указать ник хоста 
player = s, -- здесь нужно указать ник игрока
status = "Host/Player" -- здесь нужно указать ник того, кем вы являетесь в этом подключении host или player
}
return User