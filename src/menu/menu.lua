local Smui = require 'src.smui.smui'

local Menu = {}

local screenWidth, screenHeight = love.graphics.getDimensions()

function Menu:enter()
  self.timer = Timer.new()
  self.camera = Camera.new()
  self.camera.smooth = Camera.smooth.damped(4.8)

  self.smui = Smui()
  self.currentFrame = 'main'

  -- Main frame
  self.startButton = self.smui:Button(screenWidth/2 - 140, 360, 280, 70, 'PLAY', Fonts.menu_medium)
  self.startButton.released = function(startButton, x, y, button)
    self.currentFrame = 'levels'

    if startButton.isHovered then startButton.color = {0.4, 0.4, 0.4}
    else startButton.color = {0.2, 0.2, 0.2}
    end
  end
  self.startButton.enter = function(startButton)
    if self.startButton.tweenHandle ~= nil then 
      self.timer:cancel(self.startButton.tweenHandle)  
    end
    self.startButton.tweenHandle = self.timer:tween(0.4, startButton, {sx = 1.2, sy = 1.2, x = screenWidth/2 - 168, y = 353}, 'out-quint')

    if not self.isSelected then self.color = {0.4, 0.4, 0.4} end
  end
  self.startButton.exit = function(startButton)
    self.timer:cancel(self.startButton.tweenHandle)
    self.startButton.tweenHandle = self.timer:tween(0.4, startButton, {sx = 1, sy = 1, x = screenWidth/2 - 140, y = 360}, 'out-quint')

    if not self.isSelected then self.color = {0.2, 0.2, 0.2} end
  end

  -- Levels frame
  self.level1 = self.smui:Button(1400, 200, 200, 200)
  self.level1.released = function()
    Gamestate.switch(Game)
  end
  self.level2 = self.smui:Button(1700, 200, 200, 200)
  self.level2.released = function()
    Gamestate.switch(Level2)
  end
  self.level3 = self.smui:Button(2000, 200, 200, 200)
  self.level3.released = function()
    Gamestate.switch(Game)
  end
  self.levelBack = self.smui:Button(2200, 600, 140, 60, 'BACK', Fonts.menu_medium)
  self.levelBack.released = function(levelBack, x, y, button)
    self.currentFrame = 'main'
  end
end

function Menu:update(dt)
  self.timer:update(dt)
  self.smui:update(dt)

  if self.currentFrame == 'main' then
    self.camera:lockX(screenWidth * 0.5, self.camera.smooth)
  elseif self.currentFrame == 'levels' then
    self.camera:lockX(screenWidth * 1.5, self.camera.smooth)
  end
end

function Menu:draw()
  self.camera:attach()
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(Fonts.menu_big)
    love.graphics.print(love.window.getTitle(),
        screenWidth/2 - Fonts.menu_big:getWidth(love.window.getTitle())/2, 200)

    self.smui:draw()    
  self.camera:detach()
end

function Menu:mousepressed(x, y, button)
  local mx, my = self.camera:mousePosition()
  self.smui:mousepressed(mx, my, button)
end

function Menu:mousereleased(x, y, button)
  local mx, my = self.camera:mousePosition()
  self.smui:mousereleased(mx, my, button)
end

function Menu:mousemoved(x, y)
  local mx, my = self.camera:mousePosition()
  self.smui:mousemoved(mx, my)
end

return Menu