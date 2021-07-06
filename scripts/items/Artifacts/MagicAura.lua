--
-- User: mike
-- Date: 26.05.2018
-- Time: 21:32
-- This file is part of Remixed Pixel Dungeon.
--

local RPD = require "scripts/lib/commonClasses"

local item = require "scripts/lib/item"

local effect = {
RPD.Sfx.Speck.HEALING,
RPD.Sfx.Speck.STAR,
RPD.Sfx.Speck.LIGHT,
RPD.Sfx.Speck.QUESTION,
RPD.Sfx.Speck.UP,
RPD.Sfx.Speck.SCREAM,
RPD.Sfx.Speck.BONE,
RPD.Sfx.Speck.WOOL,
RPD.Sfx.Speck.ROCK,
RPD.Sfx.Speck.NOTE,
RPD.Sfx.Speck.CHANGE,
RPD.Sfx.Speck.HEART,
RPD.Sfx.Speck.BUBBLE,
RPD.Sfx.Speck.STEAM,
RPD.Sfx.Speck.COIN,
RPD.Sfx.Speck.MIST,
RPD.Sfx.Speck.SPELL_STAR,
RPD.Sfx.Speck.DISCOVER,
RPD.Sfx.Speck.EVOKE,
RPD.Sfx.Speck.MASTERY,
RPD.Sfx.Speck.KIT,
RPD.Sfx.Speck.RATTLE,
RPD.Sfx.Speck.JET,
RPD.Sfx.Speck.TOXIC,
RPD.Sfx.Speck.PARALYSIS,
RPD.Sfx.Speck.DUST,
RPD.Sfx.Speck.FORGE,
RPD.Sfx.Speck.CONFUSION,
RPD.Sfx.Speck.MAGIC
}

return item.init{
    desc  = function ()
        return {
           image     = 1,
            imageFile = "items/ArtifactsMod.png",
            name      = "Аура заклинателя",
            info      = "Эта штука никак не влияет на геймплей, но с её помощью вы сможете наложить на героя рандомный визуальный эффект, который исчезнет если покинуть этаж или перезайти в игру.",
            stackable = false,
            upgradable    = false,
 
             price     = 50
        }
    end, actions = function() return {RPD.Actions.zap} end,
    execute = function(self, item, hero, action, cell, char, data) 
        if action == RPD.Actions.zap then       
        local hero = RPD.Dungeon.hero
          if cloud == nil then
cloud = hero:getSprite():emitter()
cloud:pour(RPD.Sfx.Speck:factory(effect[math.random(29)]), 0.1)
    end      
  end 
end 
}