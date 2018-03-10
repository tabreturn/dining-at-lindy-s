Level = {}

winmargin = 50

function Level:create(level, imglevel, imgsoup)
  self.__index = self
  
  return setmetatable({
    level = level,
    imglevel = love.graphics.newImage(imglevel),
    imgsoup = imgsoup
  }, self)
end

function Level:draw()
  love.graphics.setColor(0, 0, 0)
  --love.graphics.print(level, winwidth-fontcute:getWidth(level)-winmargin, 0+winmargin)
  love.graphics.draw(self.imglevel, 0, 0)
  
  if imgsoup then
    love.graphics.draw(love.graphics.newImage(self.imgsoup), winwidth-imgsoup:getWidth()-winmargin, y+winmargin)
  end
end

return Level
