local Level = require 'src.level.level'

local Piece = require 'src.level.piece'

local Level1 = Class('Level1', Level)

function Level1:initialize()
    Level.initialize(self)
end 

function Level1:enter()
    self.pieces = {}
    self.world = love.physics.newWorld(0, 0)

    self:start()
end

function Level1:start()
    table.insert(self.pieces,
      Piece(self.world, 120, 120, 0, 0, Sprites.puzzle1[1], {{0, 0, 95, 0, 95, 428, 0, 428},{95, 180, 203, 180, 203, 285, 95, 285}}))
    table.insert(self.pieces,
      Piece(self.world, 120, 120, 14, 2, Sprites.puzzle1[2], {{0, 0, 0, 96, 108, 96, 108, 96},{98, 0, 256, 0, 256, 245, 108, 204}}))
    table.insert(self.pieces,
      Piece(self.world,120, 120, 0, 0, Sprites.puzzle1[3], {{0, 0, 0, 82, 256, 82, 256, 0},{256, 82, 256, 0, 420, 0, }}))
    -- table.insert(self.pieces,
    --   Piece(self.world,120, 120, 0, 0, Sprites.puzzle1[4], {{0, 0, 0, 96, 108, 96, 108, 96},{98, 0, 256, 0, 256, 245, 108, 204}}))
    -- table.insert(self.pieces,
    --   Piece(self.world,120, 120, 0, 0, Sprites.puzzle1[5], {{0, 0, 0, 96, 108, 96, 108, 96},{98, 0, 256, 0, 256, 245, 108, 204}}))
    -- table.insert(self.pieces,
    --   Piece(self.world,120, 120, 0, 0, Sprites.puzzle1[6], {{0, 0, 0, 96, 108, 96, 108, 96},{98, 0, 256, 0, 256, 245, 108, 204}}))
    -- table.insert(self.pieces,
    --   Piece(self.world,120, 120, 0, 0, Sprites.puzzle1[7], {{0, 0, 0, 96, 108, 96, 108, 96},{98, 0, 256, 0, 256, 245, 108, 204}}))
    
end
    return Level1