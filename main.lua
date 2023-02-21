require 'globals'
require 'assets'


Menu = require 'src.menu.menu'
Game = require 'src.game.game'
Level2 = require 'src.level2.level2'


function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(Level2)
end

function love.update(dt)

end

function love.draw()
end