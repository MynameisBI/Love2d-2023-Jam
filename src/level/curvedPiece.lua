local Piece = require 'src.level.piece'

local CurvedPiece = Class('CurvedPiece', Piece)

local rounder = 40

function CurvedPiece:initialize(world, x, y, ox, oy, image, imageData, ax, ay)
  Piece.initialize(self, world, x, y, ox, oy, image, {}, ax, ay)
  self.imageData = imageData
end


return CurvedPiece