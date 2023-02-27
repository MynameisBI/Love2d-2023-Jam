local Piece = require 'src.level.piece'
local Smui = require 'src.smui.smui'

local Level = Class('Level')

function Level:initialize(puzzleX, puzzleY, puzzleSX, puzzleSY)
  self.puzzleX, self.puzzleY = puzzleX or 0, puzzleY or 0
  self.puzzleSX, self.puzzleSY = puzzleSX or 800, puzzleSY or 600
end

function Level:enter()
  self.pieces = {}
  self.world = love.physics.newWorld(0, 0)

  self.won = false

  self.camera = Camera.new()

  self.smui = Smui()

  self:start()
end

function Level:start()
  self.menuButton = self.smui:Button(912, 30, 86, 34, 'Menu', Fonts.menu_tiny, 
  {
    normal = {104/255, 126/255, 106/255},
    hovered = {84/255, 101/255, 88/255},
    pressed = {59/255, 76/255, 62/255}
  })
  self.menuButton.released = function(menuButton)
    Gamestate.switch(Menu)
    if menuButton.isHovered then menuButton.currentColor = menuButton.colors.hovered
    else menuButton.currentColor = menuButton.colors.normal
    end
  end


  self:_start()
end

function Level:_start()

end

function Level:onPieceReleased(piece_)
  local won = true -- Sacrifice efficiency for readability
  for i, piece in ipairs(self.pieces) do
    if piece.x ~= piece.ax or piece.y ~= piece.ay then
      won = false
    end
  end

  self.won = won
end


function Level:update(dt)
  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:update(dt)
  end

  self.smui:update(dt)
end

function Level:draw()
  self.camera:attach()

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

  self.camera:detach()

  if self.won then
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(Fonts.menu_small)
    love.graphics.print('Congratulations the puzzle is completed!', 1042/2, 25, 0, 1, 1,
        Fonts.menu_small:getWidth('Congratulation the puzzle is completed!')/2)
  end

  self.smui:draw()
end

function Level:mousepressed(x, y, button)
  self.smui:mousepressed(x, y, button)

  if self.won then return end

  local solved = false
  local x, y = self.camera:mousePosition()

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

        solved = true
        break
      end
    end
    
    if solved then break end
  end
end

function Level:mousereleased(x, y, button)
  self.smui:mousereleased(x, y, button)

  if self.won then return end

  local x, y = self.camera:mousePosition()

  for i, piece in ipairs(self.pieces) do
    self.pieces[i]:released(x, y, button)
  end
end

function Level:mousemoved(x, y)
  self.smui:mousemoved(x, y)
end

return Level