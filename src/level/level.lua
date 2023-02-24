local Piece = require 'src.level.piece'

local Level = Class('Level')

function Level:enter()
  self.pieces = {}
  self.world = love.physics.newWorld(0, 0)

  self:start()
end

function Level:start()
  
end

function Level:update(dt)
  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:update(dt)
  end
end

function Level:draw()
  love.graphics.setBackgroundColor(114/255, 146/255, 121/255)

  for i = #self.pieces, 1, -1 do
    self.pieces[i]:draw()
  end

  if _DEBUG then
    for i, piece in ipairs(self.pieces) do
      local x, y = piece.body:getPosition()
      local globalPoints = {}
      local localPoints = {piece.shape:getPoints()}
      for j = 1, #localPoints/2, 1 do
        globalPoints[j*2 - 1] = localPoints[j*2 - 1] + x
        globalPoints[j*2] = localPoints[j * 2] + y
      end
      love.graphics.setColor(1, 1, 1)
      love.graphics.polygon('line', globalPoints)
    end
  end
end

function Level:mousepressed(x, y, button)
  for i, piece in ipairs(self.pieces) do
    for j, shape in ipairs(self.pieces[i].shapes) do
      local hit = shape:testPoint(piece.body:getX(), piece.body:getY(), 0, x, y) 
      if hit then
        piece:pressed(x, y, button)
        goto exit
      end
    end
  end
  ::exit::
end

function Level:mousereleased(x, y, button)
  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:released(x, y, button)
  end
end

return Level