require 'globals'
require 'assets'


Menu = require 'src.menu.menu'
Game = require 'src.game.game'


function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(Game)
end

function love.update(dt)

end

function love.draw()
end