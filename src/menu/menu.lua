local Smui = require 'src.smui.smui'

local Menu = {}

local screenWidth, screenHeight = love.graphics.getDimensions()
local blueColors = {
  normal = {90/255, 135/255, 150/255},
  hovered = {100/255, 145/255, 160/255},
  pressed = {142/255, 185/255, 207/255}
}

function Menu:enter()
  self.timer = Timer.new()
  self.camera = Camera.new()
  self.camera.smooth = Camera.smooth.damped(4.8)

  self.smui = Smui()
  self.currentFrame = 'main'

  -- Main frame
  self.startButton = self.smui:Button(screenWidth/2 - 140, 360, 280, 70, 'PLAY', Fonts.menu_medium)
  self.startButton.currentColor = {90/255, 135/255, 150/255}
  self.startButton.pressed = function(startButton)
    startButton.currentColor = {142/255, 185/255, 207/255}
  end
  self.startButton.released = function(startButton, x, y, button)
    self.currentFrame = 'levels'

    if startButton.isHovered then startButton.currentColor = {100/255, 145/255, 160/255}
    else startButton.currentColor = {90/255, 135/255, 150/255}
    end
  end
  self.startButton.enter = function(startButton)
    if self.startButton.tweenHandle ~= nil then 
      self.timer:cancel(self.startButton.tweenHandle)  
    end
    self.startButton.tweenHandle = self.timer:tween(0.4, startButton, {sx = 1.2, sy = 1.2, x = screenWidth/2 - 168, y = 353}, 'out-quint')

    if not startButton.isSelected then startButton.currentColor = {100/255, 145/255, 160/255} end
  end
  self.startButton.exit = function(startButton)
    self.timer:cancel(self.startButton.tweenHandle)
    self.startButton.tweenHandle = self.timer:tween(0.4, startButton, {sx = 1, sy = 1, x = screenWidth/2 - 140, y = 360}, 'out-quint')

    if not startButton.isSelected then startButton.currentColor = {90/255, 135/255, 150/255} end
  end

  -- Levels frame
  local levelButtonColors = {
    normal = {104/255, 126/255, 106/255},
    hovered = {84/255, 101/255, 88/255},
    pressed = {59/255, 76/255, 62/255}
  }

  self.level1 = self.smui:Button(1276, 180, 200, 300, 'Level 1', Fonts.menu_small, levelButtonColors)
  self.level1.released = function(level1Button)
    Gamestate.switch(Level1)
    if level1Button.isHovered then level1Button.currentColor = level1Button.colors.hovered
    else level1Button.currentColor = level1Button.colors.normal
    end
  end
  self.level1.draw = function(button)
    love.graphics.setColor(button.currentColor)
    love.graphics.rectangle('fill', button.x, button.y, button.w * button.sx, button.h * button.sy)

    love.graphics.setColor(button.textColor)
    love.graphics.setFont(button.font)
    love.graphics.print(button.text, button.x + 20, button.y + 16, 0, button.sx, button.sy)

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(Sprites.puzzle1[6], button.x + button.w/2, button.y + 176, 0, 0.487, 0.487,
        Sprites.puzzle1[6]:getWidth()/2, Sprites.puzzle1[6]:getHeight()/2)
  end

  self.level2 = self.smui:Button(1596, 180, 200, 300, 'Level 2', Fonts.menu_small, levelButtonColors)
  self.level2.released = function(level2Button)
    Gamestate.switch(Level2)
    if level2Button.isHovered then level2Button.currentColor = level2Button.colors.hovered
    else level2Button.currentColor = level2Button.colors.normal
    end
  end
  self.level2.draw = function(button)
    love.graphics.setColor(button.currentColor)
    love.graphics.rectangle('fill', button.x, button.y, button.w * button.sx, button.h * button.sy)

    love.graphics.setColor(button.textColor)
    love.graphics.setFont(button.font)
    love.graphics.print(button.text, button.x + 20, button.y + 16, 0, button.sx, button.sy)

    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(Sprites.puzzle2[3], button.x + button.w/2 + 3, button.y + 176, 0, 0.62, 0.62,
        Sprites.puzzle2[3]:getWidth()/2, Sprites.puzzle2[3]:getHeight()/2)
  end

  -- self.level3 = self.smui:Button(1736, 150, 200, 300, 'Level 3', Fonts.menu_small, levelButtonColors)
  -- self.level3.released = function(level3Button)
  --   Gamestate.switch(Level3)
  --   if level3Button.isHovered then level3Button.currentColor = level3Button.colors.hovered
  --   else level3Button.currentColor = level3Button.colors.normal
  --   end
  -- end

  self.levelBack = self.smui:Button(1804, 612, 140, 60, 'BACK', Fonts.menu_medium)
  self.levelBack.colors = blueColors
  self.levelBack.currentColor = self.levelBack.colors.normal
  self.levelBack.released = function(levelBack, x, y, button)
    self.currentFrame = 'main'
    if levelBack.isHovered then levelBack.currentColor = {100/255, 145/255, 160/255}
    else levelBack.currentColor = {90/255, 135/255, 150/255}
    end
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
  love.graphics.setBackgroundColor(124/255, 156/255, 131/255)

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