function love.load()
  
  tween = require 'lib/tween'
  ingredient = require 'ingredient'
    
  -- window setup
  love.window.setTitle('Dining at Lindy\'s')
  winwidth   = 1920
  winheight  = 1080
  winmargin  = 50
  rm         = 2 --highdpi multiplier
  love.window.setMode(winwidth/rm, winheight/rm, {highdpi=true})
  love.graphics.setBackgroundColor(255, 255, 255)
  
  -- assets
  fontcute  = love.graphics.newFont('fonts/cute.ttf', 100)
  fontread  = love.graphics.newFont('fonts/quicksand.ttf', 35)
  
  ingredients = {
    ingapple  = ingredient:create(100, 0, 'ingredients/apple.png'),
    ingcarrot = ingredient:create(500, 0, 'ingredients/carrot.png'),
    ingtofu   = ingredient:create(1200, 0, 'ingredients/tofu.png')
  }
  
  -- stage variables
  level = 0
  log = ''

end


function love.update(dt)
  
  for k,v in pairs(ingredients) do
    ingredients[k]:update(dt)
  end
  
end

function love.draw()

  for k,v in pairs(ingredients) do
    ingredients[k]:draw()
  end
  
  if 0 == 0 then
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontcute)
    love.graphics.print(level, winwidth-fontcute:getWidth(level)-winmargin, 0+winmargin)
  end
  
  -- selections
  if love.keyboard.isDown('z') then
    log = 'z'
  elseif love.keyboard.isDown('x') then
    log = 'x'
  elseif love.keyboard.isDown('c') then
    log = 'c'
  end
  
  -- quit game
  if love.keyboard.isDown('q') then
    love.event.quit(0)
  end
  
  -- debug log
  love.graphics.setFont(fontread)
  love.graphics.print(log, 0, winheight-100)
  
end
