local Piece = require 'src.level1.piece'

local Game = {}


function Game:enter()
  self.pieces = {}

  self:start()
end

function Game:start()
  for i = 1,7 do 
    table.insert(self.pieces, Piece(i, 100*(i-1), 100))
  end
end

function Game:update(dt)
  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:update(dt)
  end
end

function Game:draw()
  love.graphics.rectangle("fill", 20, 50, 800, 581)
  for i = #self.pieces, 1, -1 do
    self.pieces[i]:draw()
  end

  -- for i, piece in ipairs(self.pieces) do
  --   self.pieces[i]:draw()
  -- end
end

function Game:mousepressed(x,y,button)
  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:mousepressed(x,y,button)
  end
end

function Game:mousereleased(x,y,button)
  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:mousereleased(x,y,button)
  end
end

function Game:keypressed(key)
  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:keypressed(key)
  end
end

return Game