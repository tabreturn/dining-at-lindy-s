Level = {}

function Level:create(level, imgsoup, imglevel)
  self.__index = self
  
  return setmetatable({
    level    = level,
    imgsoup  = love.graphics.newImage(imgsoup),
    imglevel = love.graphics.newImage(imglevel),
    tomposx  = love.math.random(800, 1600),
    tomposy  = love.math.random(400, 800)
  }, self)
end

function Level:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(levelbg, 0, 0)
  
  love.graphics.draw(self.imgsoup, 0, 0)
  love.graphics.draw(levelstm, 0, 0)
  love.graphics.draw(self.imglevel, 1713, 0+winmargin)
  
  love.graphics.draw(tombowl, self.tomposx, self.tomposy)
end

return Level
