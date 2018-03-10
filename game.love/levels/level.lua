Level = {}

function Level:create(level, imgsoup, imglevel)
  self.__index = self
  
  return setmetatable({
    level    = level,
    imgsoup  = love.graphics.newImage(imgsoup),
    imglevel = imglevel
  }, self)
end

function Level:draw()
  love.graphics.setColor(255, 255, 255)
  bg = love.graphics.newImage('levels/background.png')
  love.graphics.draw(bg, 0, 0)
  
  love.graphics.draw(self.imgsoup, 0, 0)
  
  steam = love.graphics.newImage('levels/steam.png')
  love.graphics.draw(steam, 0, 0)
  
  lvl = love.graphics.newImage(self.imglevel)
  love.graphics.draw(lvl, 1713, 0+winmargin)

  love.graphics.setColor(0, 0, 0)
  love.graphics.setFont(fontcutesml)
  love.graphics.print(level, 1783, 80)
end

return Level
