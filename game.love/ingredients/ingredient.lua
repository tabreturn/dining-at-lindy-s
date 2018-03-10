Ingredient = {}

function Ingredient:create(x, y, img)
  self.__index = self
  return setmetatable({
    x   = x,
    y   = y,
    img = love.graphics.newImage(img)
  }, self)
end

function Ingredient:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(self.img, 0, 0) 
end

return Ingredient
