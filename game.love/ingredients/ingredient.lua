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
  love.graphics.draw(self.img, self.x, self.y, 0.23, 0.23) 
end

return Ingredient
