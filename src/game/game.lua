local Piece = require 'src.game.piece'

local Game = {}

function Game:enter()
  self.pieces = {}

  self:start()
end

function Game:start()
  table.insert(self.pieces, Piece(1, 100, 100))
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

return Game