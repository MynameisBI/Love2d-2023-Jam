local Piece = require 'src.game.piece'

local Game = {}


function Game:enter()
  self.pieces = {}

  self:start()
end

function Game:start()
  for i = 1, 1 do 
    table.insert(self.pieces, Piece(i, 100*(i-1), 100))
  end
end

function Game:update(dt)
  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:update(dt)
  end
end

function Game:draw()
  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:draw()
  end
end

function Game:mousepressed(button, x, y)
  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:mousepressed(button, x, y)
  end
end

return Game