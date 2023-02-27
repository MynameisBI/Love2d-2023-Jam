local Level = require 'src.level.level'

local Piece = require 'src.level.piece'

local Level1 = Class('Level1', Level)

function Level1:initialize()
  Level.initialize(self)
end

function Level1:enter()
  self.puzzleX, self.puzzleY = 120, 80
  self.puzzleSX, self.puzzleSY = 799, 580

  self.pieces = {}
  self.world = love.physics.newWorld(0, 0)

  self.won = false

  self.camera = Camera.new()
  self.camera:lookAt(520, 360)

  self:start()
end

function Level1:start()
  table.insert(self.pieces,
    Piece(self.world, 120, 80, 0, 0, Sprites.puzzle1[1], {{0, 0, 95, 0, 95, 428, 0, 428},{95, 180, 203, 180, 203, 285, 95, 285}},
    120, 80))
  table.insert(self.pieces,
    Piece(self.world, 120, 80, 15, 2, Sprites.puzzle1[2], {{0, 0, 0, 96, 108, 96, 108, 96},{98, 0, 256, 0, 256, 245, 108, 204}},
    200, 160))
  table.insert(self.pieces,
    Piece(self.world,120, 80, 16, 0, Sprites.puzzle1[3], {{0, 0, 0, 81, 255, 81, 255, 0},{256, 0, 421, 0, 421, 284, 256,284}},
    200, 80))
  table.insert(self.pieces,
    Piece(self.world,120, 80, 21, 0, Sprites.puzzle1[4], {{94, 0, 378, 0, 378, 84, 94, 84},{223, 85, 378, 85,378,578,223,578},{0, 578,0,466,223,466,223,578}},
    520, 80))
  table.insert(self.pieces,
    Piece(self.world,120, 80, 21, 4, Sprites.puzzle1[5], {{95, 0, 223, 0, 223, 380, 95, 380},{0, 200, 94,200, 94, 380, 0,380}},
    520, 160))
  table.insert(self.pieces,
    Piece(self.world,120, 80, 16, 5, Sprites.puzzle1[6], {{0, 0, 112,0,112,180,0,180}, {113,0, 324, 0, 324,88, 113,88},{224, 89, 324, 89, 324,295, 224,295}},
    200, 360))
  table.insert(self.pieces,
    Piece(self.world,120, 80, 0, 14, Sprites.puzzle1[7], {{209,0, 320,0, 320,205, 209,205},{208,92, 208,205, 0,205, 0,92}},
    120, 440))
  
end

return Level1