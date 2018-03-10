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
  love.graphics.draw(levelbg, 0, 0)
  
  --love.graphics.draw(self.imgsoup, 0, 0)
  
  --
  love.graphics.draw(levelstm, 0, 0)
  
  --lvl = love.graphics.newImage(self.imglevel)
  --love.graphics.draw(lvl, 1713, 0+winmargin)
end

return Level
