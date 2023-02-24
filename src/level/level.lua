local Piece = require 'src.level.piece'

local Level = Class('Level')

function Level:initialize(puzzleX, puzzleY, puzzleSX, puzzleSY)
  self.puzzleX, self.puzzleY = puzzleX or 0, puzzleY or 0
  self.puzzleSX, self.puzzleSY = puzzleSX or 800, puzzleSY or 600
end

function Level:enter()
  self.pieces = {}
  self.world = love.physics.newWorld(0, 0)

  self:start()
end

function Level:start()
  
end

function Level:onPieceReleased(piece_)
  local won = true -- Sacrifice efficiency for readability
  for i, piece in ipairs(self.pieces) do
    if piece.x ~= piece.ax or piece.y ~= piece.ay then
      won = false
    end
  end

  if won then
    print('Yo Mr White we won')
  end
end


function Level:update(dt)
  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:update(dt)
  end
end

function Level:draw()
  love.graphics.setBackgroundColor(114/255, 146/255, 121/255)

  love.graphics.setColor(1, 1, 1, 0.4)
  love.graphics.rectangle('fill', self.puzzleX or 0, self.puzzleY or 0, self.puzzleSX or 800, self.puzzleSY or 600)

  love.graphics.setColor(1, 1, 1)
  for i = #self.pieces, 1, -1 do
    self.pieces[i]:draw()
  end

  if _DEBUG then
    for i, piece in ipairs(self.pieces) do
      local x, y = piece.body:getPosition()
      for j, shape in ipairs(piece.shapes) do
        local globalPoints = {}
        local localPoints = {shape:getPoints()}
        for j = 1, #localPoints/2, 1 do
          globalPoints[j*2 - 1] = localPoints[j*2 - 1] + x
          globalPoints[j*2] = localPoints[j * 2] + y
        end
        love.graphics.setColor(1, 1, 1)
        love.graphics.polygon('line', globalPoints)
      end
    end
  end
end

function Level:mousepressed(x, y, button)
  for i, piece in ipairs(self.pieces) do
    for j, shape in ipairs(self.pieces[i].shapes) do
      local hit = shape:testPoint(piece.body:getX(), piece.body:getY(), 0, x, y) 
      if hit then
        piece:pressed(x, y, button)

        local numberOfPieces = #self.pieces
        for k = numberOfPieces, 1, -1 do
          self.pieces[k+1] = self.pieces[k]
        end
        self.pieces[1] = self.pieces[i+1]
        table.remove(self.pieces, i+1)

        goto exit
      end
    end
  end
  ::exit::

  -- if self.pieces[i].selected then

  -- end
end

function Level:mousereleased(x, y, button)
  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:released(x, y, button)
  end
end

return Level