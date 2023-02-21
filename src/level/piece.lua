local Piece = Class('Piece')

local rounder = 40

function Piece:initialize(world, x, y, image, shapes)
  self.x, self.y = x, y
  self.image = image
  self.points = points

  self.world = world
  self.body = love.physics.newBody(world, x, y, 'static')
  self.shapes = {}
  self.fixtures = {}
  for i = 1, #shapes do
    table.insert(self.shapes, love.physics.newPolygonShape(shapes[i]))
    table.insert(self.fixtures, love.physics.newFixture(self.body, self.shapes[i]))
  end

  self.selected = false
  self.offsetToMouseX, self.offsetToMouseY = 0, 0
end

function Piece:setPosition(x, y)
  self.x, self.y = x, y
  self.body:setPosition(x, y)
end

function Piece:update(dt)
  if self.selected then
    local mouseX, mouseY = love.mouse.getPosition()
    self:setPosition(mouseX - self.offsetToMouseX, mouseY - self.offsetToMouseY)
  end
end

function Piece:draw()
  love.graphics.setColor(1, 1, 1)
  love.graphics.draw(self.image, self.x, self.y)
end

function Piece:pressed(x, y, button)
  self.selected = true
  self.offsetToMouseX = x - self.x
  self.offsetToMouseY = y - self.y
end

function Piece:released(x, y, button)
  if self.selected then
    self:setPosition(self:roundToNearest(self.x, rounder),
      self:roundToNearest(self.y, rounder))
  end
  self.selected = false
end

function Piece:roundToNearest(number, nearest)
  local remainder = number % nearest
  return remainder < nearest / 2 and number - remainder or number - remainder + nearest
end

return Piece