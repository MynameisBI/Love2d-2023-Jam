require 'globals'
require 'assets'


Menu = require 'src.menu.menu'
Level1 = require 'src.level1.level1'
Level2 = require 'src.level2.level2'


function love.load()
  Gamestate.registerEvents()
  Gamestate.switch(Level2)
end

function love.update(dt)

end

function love.draw()
end