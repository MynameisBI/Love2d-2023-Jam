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
      Piece(self.world, 100, 100, Sprites.puzzle2[1], {{0, 0, 0, 306, 140, 188}}))
  table.insert(self.pieces,
      Piece(self.world, 100, 100, Sprites.puzzle2[2], {{0, 0, 206, 0, 250, 96, 140, 188}}))
  
end

return Level2