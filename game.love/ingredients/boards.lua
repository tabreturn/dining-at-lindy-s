Boards = {}

local brdpos1 = {x=-800}
local brdpos2 = {x=-800}
local brdpos3 = {x=-800}
local brdanim = false;
local twn1 = tween.new(0.1, brdpos1, {x=brdpos1.x})
local twn2 = tween.new(0.1, brdpos2, {x=brdpos2.x})
local twn3 = tween.new(0.1, brdpos3, {x=brdpos3.x})

function Boards:create()
  self.__index = self
end

function Boards:update(dt)
  twn1:update(dt)
  twn2:update(dt)
  twn3:update(dt)
  
  if brdpos3.x > 0 then
    brdsin = true
  end
end

function Boards:animateIn()
  if brdanim == false then
    twn1 = tween.new(1.4, brdpos1, {x=20}, 'inOutBack')
    twn2 = tween.new(1.8, brdpos2, {x=20}, 'inOutBack')
    twn3 = tween.new(2.0, brdpos3, {x=20}, 'inOutBack')
  end
  
  brdanim = true;
end

function Boards:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(board1, brdpos1.x, 100, -0.02)
  love.graphics.draw(board2, brdpos2.x, 400, -0.01)
  love.graphics.draw(board3, brdpos3.x, 700, 0.01)
end

return Boards
