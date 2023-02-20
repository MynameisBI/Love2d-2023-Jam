local Smui = require 'src.smui.smui'

local Menu = {}

local screenWidth, screenHeight = love.graphics.getDimensions()

function Menu:enter()
  self.timer = Timer.new()

  self.smui = Smui()

  self.startButton = self.smui:Button(screenWidth/2 - 140, 220, 280, 70, 'wassup baby girl', Fonts.menu_medium)
  self.startButton.released = function(startButton, x, y, button)
    Gamestate.switch(Game)
  end
  self.startButton.enter = function(startButton)
    if self.startButton.tweenHandle ~= nil then 
      self.timer:cancel(self.startButton.tweenHandle)  
    end
    self.startButton.tweenHandle = self.timer:tween(0.4, startButton, {sx = 1.2, sy = 1.2, x = screenWidth/2 - 168, y = 213}, 'out-quint')
  end
  self.startButton.exit = function(startButton)
    self.timer:cancel(self.startButton.tweenHandle)
    self.startButton.tweenHandle = self.timer:tween(0.4, startButton, {sx = 1, sy = 1, x = screenWidth/2 - 140, y = 220}, 'out-quint')
  end
end

function Menu:update(dt)
  self.timer:update(dt)
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