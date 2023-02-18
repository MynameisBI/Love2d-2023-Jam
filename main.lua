require 'globals'
require 'assets'


puzzle1 = {
  7,
  "puzzle1"
}

Menu = require 'src.menu.menu'
Game = require 'src.game.game'

function love.load()
  print("yay")
  print(puzzle1[0])
  -- for i in range(1, puzzle1[0] + 1) do
  --   print(i)

  Gamestate.registerEvents()
  Gamestate.switch(Game)
end

function love.update(dt)

end

function love.draw()
end