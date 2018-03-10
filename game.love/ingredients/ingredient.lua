Ingredient = {}

tween = require 'lib/tween'

pos = {x=0, y=0}

function Ingredient:create(x, y, img)
  self.__index = self
  return setmetatable({
    x = x,
    y = y,
    img = love.graphics.newImage(img),
    twn = tween.new(1.5, pos, {y=200}, 'outBounce')
  }, self)
end

function Ingredient:update(dt)
  self.twn:update(dt)
end

function Ingredient:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(self.img, pos.x+self.x, pos.y+self.y) 
end

return Ingredient
