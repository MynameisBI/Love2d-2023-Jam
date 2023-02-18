local Piece = Class('Piece')

function Piece:initialize(id, x, y)
  self.x, self.y = x, y

  self.image = nil 
  if id == 1 then
    self.image = Sprites.puzzle1[1]
  elseif id == 2 then
    self.image = Sprites.puzzle1[2]
  elseif id == 3 then
    self.image = Sprites.puzzle1[3]
  elseif id == 4 then
    self.image = Sprites.puzzle1[4]
  elseif id == 5 then
    self.image = Sprites.puzzle1[5]
  elseif id == 6 then
    self.image = Sprites.puzzle1[6]
  elseif id == 7 then
    self.image = Sprites.puzzle1[7]
  end
end

function Piece:update(dt)
  
end

function Piece:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(self.image, self.x, self.y)
end

return Piece