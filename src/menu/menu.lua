local Smui = require 'src.smui.smui'

local Menu = {}

function Menu:enter()
  self.smui = Smui()

  self.startButton = self.smui:Button(100, 100, 160, 100, 'wassup baby girl')
  self.startButton.released = function (self, x, y, button)
    Gamestate.switch(Game)
  end
end

function Menu:update(dt)
  self.smui:update(dt)
end

function Menu:draw()
  self.smui:draw()
end

function Menu:mousepressed(x, y, button)
  self.smui:mousepressed(x, y, button)
end

function Menu:mousereleased(x, y, button)
  self.smui:mousereleased(x, y, button)
end

function Menu:mousemoved(x, y)
  self.smui:mousemoved(x, y)
end

return Menu