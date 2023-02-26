local Level = require 'src.level.level'

local CurvedPiece = require 'src.level.curvedPiece'

local Level3 = Class('Level3', Level)

function Level3:initialize()
  Level.initialize(self)
end

function Level3:enter()
  self.puzzleX, self.puzzleY = 120, 80
  self.puzzleSX, self.puzzleSY = 799, 580

  self.pieces = {}
  self.world = love.physics.newWorld(0, 0)

  self:start()
end

function Level3:start()
  table.insert(self.pieces,
    CurvedPiece(self.world, 120, 80, 0, 0, Sprites.puzzle3.images[1], Sprites.puzzle3.imageDatas[1], 120, 80))
end

function Level3:mousepressed(x, y, button)
  for i, piece in ipairs(self.pieces) do
    local imageW, imageH = piece.image:getWidth(), piece.image:getHeight()

    if piece.x + piece.ox <= x and x <= piece.x + piece.ox + imageW and
        piece.y + piece.oy <= y and y <= piece.y + piece.oy + imageH then
      local localMouseX = x - piece.x - piece.ox
      local localMouseY = y - piece.y - piece.oy

      local r, b, g, a = piece.imageData:getPixel(localMouseX, localMouseY)          

      if a > 0 then
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
end


return Level3