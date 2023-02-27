local SmuiButton = require 'src.smui.button'

local Smui = Class('Smui')

function Smui:initialize()
  self.components = {}
end

function Smui:Button(x, y, w, h, text, font, colors)
  local button = SmuiButton(x, y, w, h, text, font, colors)
  table.insert(self.components, button)

  return button
end

function Smui:remove(component)
  for i, component_ in ipairs(self.components) do
    if component == component_ then
      table.remove(self.components, i)
      break
    end
  end
end

function Smui:update(dt)
  for i, component in ipairs(self.components) do
    component:update(dt)
  end
end

function Smui:draw()
  for i, component in ipairs(self.components) do
    component:draw()
  end
end

function Smui:mousepressed(x, y, button)
  for i, component in ipairs(self.components) do
    if self:_pointIsInRect(x, y, component.x, component.y, component.w, component.h) then
      component:_pressed(button)
    end
  end
end

function Smui:mousereleased(x, y, button)
  for i, component in ipairs(self.components) do
    if component.isSelected then
      component:_released(button)
    end
  end
end

function Smui:mousemoved(x, y)
  for i, component in ipairs(self.components) do
    if component.isHovered == false and
        self:_pointIsInRect(x, y, component.x, component.y, component.w, component.h) == true then
      component:_enter()
    elseif component.isHovered == true and
        self:_pointIsInRect(x, y, component.x, component.y, component.w, component.h) == false then
      component:_exit()
    end
  end
end

function Smui:_pointIsInRect(pointX, pointY, rectX, rectY, rectW, rectH)
  if rectX <= pointX and pointX <= rectX + rectW and
      rectY <= pointY and pointY <= rectY + rectH then
    return true
  else
    return false
  end
end

return Smui