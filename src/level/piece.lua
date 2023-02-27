local Piece = Class('Piece')

local rounder = 40

function Piece:initialize(world, x, y, ox, oy, image, shapes, ax, ay)
  self.x, self.y = x, y
  self.sx, self.sy = 1, 1
  self.ox, self.oy = ox, oy
  self.image = image

  self.ax, self.ay = ax, ay

  self.world = world
  self.body = love.physics.newBody(world, x + ox, y + oy, 'static')
  self.shapes = {}
  self.fixtures = {}
  for i = 1, #shapes do
    table.insert(self.shapes, love.physics.newPolygonShape(shapes[i]))
    table.insert(self.fixtures, love.physics.newFixture(self.body, self.shapes[i]))
  end

  self.selected = false
  self.offsetToMouseX, self.offsetToMouseY = 0, 0

  self.timer = Timer.new()
  self.sizeHandle = self.timer:after(0, function() end) -- Placeholder handle
end

function Piece:setPosition(x, y)
  self.x, self.y = x, y
  self.body:setPosition(x + self.ox, y + self.oy)
end

function Piece:update(dt)
  self.timer:update(dt)

  if self.selected then
    local mouseX, mouseY = Gamestate.current().camera:mousePosition()
    self:setPosition(mouseX - self.offsetToMouseX, mouseY - self.offsetToMouseY)
  end
end

function Piece:draw()
  if self.selected then
    local x = self:roundToNearest(self.x, rounder)
    local y = self:roundToNearest(self.y, rounder)

    love.graphics.setColor(1, 1, 1, 0.4)
    love.graphics.draw(self.image, x + self.ox, y + self.oy, 0, 1, 1)
  end

  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(self.image,
      self.x + self.ox - self.image:getWidth()/2 * (self.sx - 1),
      self.y + self.oy - self.image:getHeight()/2 * (self.sy - 1),
      0, self.sx, self.sy)
end

function Piece:pressed(x, y, button)
  self.selected = true
  love.mouse.setCursor(love.mouse.getSystemCursor("hand"))

  self.offsetToMouseX = x - self.x
  self.offsetToMouseY = y - self.y

  self.timer:cancel(self.sizeHandle)
  self.sizeHandle = self.timer:tween(0.4, self, {sx = 0.85, sy = 0.85}, 'out-quint')
end

function Piece:released(x, y, button)
  if self.selected then
    self:setPosition(self:roundToNearest(self.x, rounder),
      self:roundToNearest(self.y, rounder))

    self.timer:cancel(self.sizeHandle)
    self.sizeHandle = self.timer:tween(0.4, self, {sx = 1, sy = 1}, 'out-quint')
    
    Gamestate.current():onPieceReleased(self)
  end

  self.selected = false
  love.mouse.setCursor()
end

function Piece:roundToNearest(number, nearest)
  local remainder = number % nearest
  return remainder < nearest / 2 and number - remainder or number - remainder + nearest
end

return Piece