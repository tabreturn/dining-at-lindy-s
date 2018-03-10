Button = {}
Button.__index = Button

function Button.new(text)
   local bn = {}
   setmetatable(bn, Button)

   bn.text = text
   return bn
end

function Button:draw()
  love.graphics.setColor(0, 0, 0)
  love.graphics.print('HIIHIHIHIIHIHIHIHIHIHIHIHIHI', 300,300)
end