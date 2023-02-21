local Piece = Class('Piece')
piece_hold = false

function Piece:initialize(id, x, y)
  self.x, self.y = x, y
  self.id = id

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

  self.left_mouse_hold = 0
  self.mouse_x, self.mouse_y = 0, 0
  self.former_location = {x = 0, y = 0}
  self.piece_edge = {}
end

function Piece:drag_piece_to(x,y,mouse_x,mouse_y)
  local drag_vector = {x-mouse_x, y-mouse_y}
  self.x = self.x + drag_vector[1]
  self.y = self.y + drag_vector[2]
  return drag_vector
end

function Piece:within_piece(x,y)
  result = true
  if self.id == 1 then
    result = (x >= self.x) and (x <= self.x + 95) and (y >= self.y) and (y <= self.y + 428)
    result = result or ((x >= self.x + 96) and  (y >= self.y + 181) and (x <= self.x + 203) and (y <= self.y + 284))
  elseif self.id == 2 then
    result = (x >= self.x) and (x <= self.x + 255) and (y >= self.y) and (y <= self.y + 202)
    result = result and (not ((x >= self.x) and (y >= self.y + 98) and (x <= self.x + 107) and (y <= self.y + 203)))
  elseif self.id == 3 then
    result = (x >= self.x) and (x <= self.x + 419) and (y >= self.y) and (y <= self.y + 284)
    result = result and (not ((x >= self.x) and (y >= self.y + 82) and (x <= self.x + 255) and (y <= self.y + 285)))
  elseif self.id == 4 then
    result = (x >= self.x) and (x <= self.x + 378) and (y>= self.y) and (y<= self.y + 580)
    result = result and (not ((x >= self.x) and (x <= self.x + 93) and (y>= self.y) and (y <= self.y + 85)))
    result = result and (not ((x >= self.x) and (y >= self.y + 86) and (x <= self.x + 222) and (y <= self.y + 466)))
  elseif self.id == 5 then
    result = (x >= self.x) and (x <= self.x + 223) and (y >= self.y) and (y <= self.y + 383)
    result = result and (not ((x >= self.x) and (y >= self.y) and (x <= self.x + 94) and (y <= self.y + 200)))
  elseif self.id == 6 then
    result = (x >= self.x) and (x <= self.x + 324) and (y >= self.y) and (y <= self.y + 295)
    result = result and (not ((x >= self.x) and (y >= self.y + 181) and (x <= self.x + 223) and (y <= self.y + 295)))
    result = result and (not ((x >= self.x + 113) and (y >= self.y + 89) and (x <= self.x + 223) and (y <= self.y + 180)))
  elseif self.id == 7 then
    result = (x >= self.x) and (x <= self.x + 320) and (y >= self.y) and (y <= self.y + 205)
    result = result and (not ((x >= self.x) and (y >= self.y) and (x <= self.x + 208) and (y <= self.y + 91)))
  end
  return result
end

function Piece:update(dt)
  local x, y = love.mouse.getPosition()
  if (self.left_mouse_hold == 1) then
    self:drag_piece_to(x,y, self.mouse_x, self.mouse_y)
    love.mouse.setCursor(love.mouse.getSystemCursor("hand"))
  else
    love.mouse.setCursor()
  end
  self.mouse_x, self.mouse_y = love.mouse.getPosition()
end

function Piece:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(self.image, self.x, self.y)
end

function Piece:mousepressed(x,y,button)
  if button == 1 and self:within_piece(x,y) and (piece_hold == false) then
    self.left_mouse_hold = 1
    piece_hold = true
  end
  self.former_location.x = self.x
  self.former_location.y = self.y
end

function Piece:mousereleased(x,y,button)
  if button == 1 then
    self.left_mouse_hold = 0
    piece_hold = false
  end
  -- self.x, self.y = former_location[1], former_location[2]
end

function Piece:keypressed(key)
  if (self.left_mouse_hold == 1) then
    if key == "d" or key == "right" then
      self.x = self.x + 1
    end
    if key == "a" or key == "left" then
      self.x = self.x - 1
    end
    if key == "w" or key == "up" then
      self.y = self.y - 1
    end
    if key == "s" or key== "down" then
      self.y = self.y + 1
    end
  end
end

return Piece