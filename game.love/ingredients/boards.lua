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
end

function Boards:AnimateIn()
  if brdanim == false then
    twn1 = tween.new(1.5, brdpos1, {x=20}, 'inOutBack')
    twn2 = tween.new(2.0, brdpos2, {x=20}, 'inOutBack')
    twn3 = tween.new(2.5, brdpos3, {x=20}, 'inOutBack')
  end
  
  brdanim = true;
end

function Boards:draw()
  love.graphics.setColor(255, 255, 255)
  board1 = love.graphics.newImage('ingredients/board.png')
  board2 = love.graphics.newImage('ingredients/board.png')
  board3 = love.graphics.newImage('ingredients/board.png')
  love.graphics.draw(board1, brdpos1.x, 100)
  love.graphics.draw(board2, brdpos2.x, 400)
  love.graphics.draw(board3, brdpos3.x, 700) 
end

return Boards
