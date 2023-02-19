local Piece = Class('Piece')

is_pressed = 0
mouse_x, mouse_y = 0, 0
puzzle_piece_size = 0

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

  function object_drag(x,y,mouse_x,mouse_y)
    self.x = self.x + (x - mouse_x)
    self.y = self.y + (y - mouse_y)
  end

  function within_piece(x,y)
    result = 0
  end
end


function Piece:update(dt)
  local x, y = love.mouse.getPosition()
  if love.mouse.isDown(1) and (x > self.x) then
    object_drag(x,y,mouse_x,mouse_y)
    love.mouse.setCursor(love.mouse.getSystemCursor("hand"))
  else
    love.mouse.setCursor()
  end
  mouse_x, mouse_y = love.mouse.getPosition()
end

function Piece:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(self.image, self.x, self.y)
end

function Piece:mousepressed(x,y,button,istouch)
  if button == 1 then
    is_pressed = 1
  end
end

function Piece:mousereleased(x,y,button,istouch)
  if button == 1 then
    is_pressed = 0
  end
end

return Piece