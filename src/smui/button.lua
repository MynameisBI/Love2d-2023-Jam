local SmuiButton = Class('SmuiButton')

function SmuiButton:initialize(x, y, w, h, text, font, colors)
  self.x, self.y = x or 0, y or 0
  self.w, self.h = w or 0, h or 0
  self.sx, self.sy = 1, 1

  self.colors = colors or {
    normal = {0.2, 0.2, 0.2},
    hovered = {0.4, 0.4, 0.4},
    pressed = {0.7, 0.7, 0.7},
  }
  self.currentColor = self.colors.normal

  self.text = text or ''
  self.font = font or love.graphics.getFont()
  self.textColor = {0.9, 0.9, 0.9}

  self.isHovered = false
  self.isSelected = false
end

function SmuiButton:_enter()
  self.isHovered = true
  self:enter()
end

function SmuiButton:_exit()
  self.isHovered = false
  self:exit()
end

function SmuiButton:_pressed()
  self.isSelected = true
  self:pressed()
end

function SmuiButton:_released()
  self.isSelected = false
  self:released()
end


-- Override functions

function SmuiButton:update(dt)
end

function SmuiButton:draw()
  love.graphics.setColor(self.currentColor)
  love.graphics.rectangle('fill', self.x, self.y, self.w * self.sx, self.h * self.sy)

  love.graphics.setColor(self.textColor)
  love.graphics.setFont(self.font)
  love.graphics.print(self.text, self.x + self.w/2 * self.sx, self.y + self.h/2 * self.sy, 0, self.sx, self.sy,
      self.font:getWidth(self.text)/2, self.font:getHeight()/2)

  love.graphics.setColor(1, 1, 1)
end

function SmuiButton:pressed(button)
  self.currentColor = self.colors.pressed
end

function SmuiButton:released(button)
  if self.isHovered then
    self.currentColor = self.colors.hovered
  else
    self.currentColor = self.colors.normal
  end
end

function SmuiButton:enter()
  if not self.isSelected then
    self.currentColor = self.colors.hovered
  end
end

function SmuiButton:exit()
  if not self.isSelected then
    self.currentColor = self.colors.normal
  end
end

return SmuiButton