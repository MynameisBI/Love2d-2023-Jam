local Level = require 'src.level.level'
local Piece = require 'src.level.piece'
local Smui = require 'src.smui.smui'

local Level2 = Class('Level2', Level)

function Level2:initialize()
  Level.initialize(self, 120, 80, 640, 480)
end

function Level2:enter()
  self.puzzleX, self.puzzleY = 120, 80
  self.puzzleSX, self.puzzleSY = 700, 500

  self.pieces = {}
  self.world = love.physics.newWorld(0, 0)

  self.won = false

  self.camera = Camera.new()
  self.camera:zoomTo(1.14)
  self.camera:lookAt(475, 315)

  self.smui = Smui()

  self:start()
end

function Level2:_start()
  table.insert(self.pieces,
      Piece(self.world, 120, 80, 0, 0, Sprites.puzzle2[1], {{0, 0, 0, 306, 140, 188}},
      120, 80))
  table.insert(self.pieces,
      Piece(self.world, 120, 80, 0, 0, Sprites.puzzle2[2], {{0, 0, 206, 0, 250, 96, 140, 188}},
      120, 80))
  table.insert(self.pieces,
      Piece(self.world, 120, 80, 0, 11, Sprites.puzzle2[3], {{0, 55, 65, 0, 252, 96, 112, 250, 0, 250}},
      120, 320))
  table.insert(self.pieces,
      Piece(self.world, 120, 80, -16, 15, Sprites.puzzle2[4], {{0, 155, 186, 0, 337, 330}},
      200, 160))
  table.insert(self.pieces,
      Piece(self.world, 120, 80, 6, 0, Sprites.puzzle2[5], {{0, 0, 260, 0, 328, 95}},
      320, 80))
  table.insert(self.pieces,
      Piece(self.world, 120, 80, 6, 0, Sprites.puzzle2[6], {{0, 0, 84, 187, 167, 240, 403, 201, 328, 95}},
      320, 80))
  table.insert(self.pieces,
      Piece(self.world, 120, 80, -9, -13, Sprites.puzzle2[7], {{139, 0, 0, 154, 438, 154}},
      240, 440))
  table.insert(self.pieces,
      Piece(self.world, 120, 80, -15, 0, Sprites.puzzle2[8], {{0, 1, 99, 138, 233, 46, 233, 2}},
      600, 80))
  table.insert(self.pieces,
      Piece(self.world, 120, 80, 4, 6, Sprites.puzzle2[9], {{1, 93, 45, 155, 134, 224, 134, 0}},
      680, 120))
  table.insert(self.pieces,
      Piece(self.world, 120, 80, 13, 1, Sprites.puzzle2[10], {{2, 40, 325, 250, 325, 70, 237, 0}},
      480, 280))
  table.insert(self.pieces,
      Piece(self.world, 120, 80, 10, 26, Sprites.puzzle2[11], {{1, 2, 108, 236, 256, 313, 408, 314, 408, 267}},
      400, 240))
end

return Level2