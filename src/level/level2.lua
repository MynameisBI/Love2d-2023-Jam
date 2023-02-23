local Level = require 'src.level.level'

local Piece = require 'src.level.piece'

local Level2 = Class('Level2', Level)

function Level2:initialize()
  Level.initialize(self)
end

function Level2:enter()
  self.pieces = {}
  self.world = love.physics.newWorld(0, 0)

  self:start()
end

function Level2:start()
  table.insert(self.pieces,
      Piece(self.world, 120, 100, 0, 0, Sprites.puzzle2[1], {{0, 0, 0, 306, 140, 188}}))
  table.insert(self.pieces,
      Piece(self.world, 120, 200, 0, 0, Sprites.puzzle2[2], {{0, 0, 206, 0, 250, 96, 140, 188}}))
  table.insert(self.pieces,
      Piece(self.world, 120, 200, 0, 11, Sprites.puzzle2[3], {{0, 55, 65, 0, 252, 96, 112, 250, 0, 250}}))
  table.insert(self.pieces,
      Piece(self.world, 120, 200, -16, 15, Sprites.puzzle2[4], {{0, 155, 186, 0, 337, 330}}))
  table.insert(self.pieces,
      Piece(self.world, 120, 200, 6, 0, Sprites.puzzle2[5], {{0, 0, 260, 0, 328, 95}}))
  table.insert(self.pieces,
      Piece(self.world, 120, 200, 6, 0, Sprites.puzzle2[6], {{0, 0, 84, 187, 167, 240, 403, 201, 328, 95}}))
  table.insert(self.pieces,
      Piece(self.world, 120, 200, -9, -13, Sprites.puzzle2[7], {{139, 0, 0, 154, 438, 154}}))
  table.insert(self.pieces,
      Piece(self.world, 120, 200, -15, 0, Sprites.puzzle2[8], {{0, 1, 99, 138, 223, 46, 223, 2}}))
  table.insert(self.pieces,
      Piece(self.world, 120, 200, 4, 6, Sprites.puzzle2[9], {{1, 93, 45, 155, 134, 224, 134, 0}}))
  table.insert(self.pieces,
      Piece(self.world, 120, 200, 13, 1, Sprites.puzzle2[10], {{2, 40, 325, 250, 325, 70, 237, 0}}))
  table.insert(self.pieces,
      Piece(self.world, 100, 200, 10, 26, Sprites.puzzle2[11], {{1, 2, 108, 236, 256, 313, 408, 314, 408, 267}}))
  
  
end

return Level2