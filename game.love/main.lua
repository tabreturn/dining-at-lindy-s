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
  
  log = ''

  for k,v in pairs(ingredients) do
    ingredients[k]:draw()
  end
  
  -- splash screen
  if level == 0 then
    love.graphics.setColor(255, 255, 255)
    img = love.graphics.newImage('levels/0.png')
    love.graphics.draw(img)
    -- selections
    if love.keyboard.isDown('z') then
      log = 'next'
      level = level+1;
    elseif love.keyboard.isDown('x') then
      log = 'x'
    elseif love.keyboard.isDown('c') then
      log = 'c'
    end
  end
  
  -- level 1
  if level == 1 then
    love.graphics.setColor(255, 255, 255)
    img = love.graphics.newImage('levels/1.png')
    love.graphics.draw(img)
    -- selections
    if love.keyboard.isDown('z') then
      log = 'option z'
    elseif love.keyboard.isDown('x') then
      log = 'option x'
    elseif love.keyboard.isDown('c') then
      log = 'option c'
    end
  end
  
  -- level 2
  if level == 2 then
    love.graphics.setColor(255, 255, 255)
    img = love.graphics.newImage('levels/1.png')
    love.graphics.draw(img)
    -- selections
    if love.keyboard.isDown('z') then
      log = 'option z'
    elseif love.keyboard.isDown('x') then
      log = 'option x'
    elseif love.keyboard.isDown('c') then
      log = 'option c'
    end
  end
  
  -- level 3
  if level == 3 then
    love.graphics.setColor(255, 255, 255)
    img = love.graphics.newImage('levels/1.png')
    love.graphics.draw(img)
    -- selections
    if love.keyboard.isDown('z') then
      log = 'option z'
    elseif love.keyboard.isDown('x') then
      log = 'option x'
    elseif love.keyboard.isDown('c') then
      log = 'option c'
    end
  end

  
  if 0 == 0 then
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontcute)
    love.graphics.print(level, winwidth-fontcute:getWidth(level)-winmargin, 0+winmargin)
  end
  

  
  -- quit game
  if love.keyboard.isDown('q') then
    love.event.quit(0)
  end
  
  -- debug log
  love.graphics.setFont(fontread)
  love.graphics.print(log, 0, winheight-100)
  
end
