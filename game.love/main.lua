function love.load()
  
  --tween      = require 'lib/tween'
  ingredient = require 'ingredients/ingredient'
  level      = require 'levels/level'
    
  -- window setup
  
  love.window.setTitle('Dining at Lindy\'s')
  winwidth   = 1920
  winheight  = 1080
  hdpiscale  = 2
  love.window.setMode(winwidth/hdpiscale, winheight/hdpiscale, {highdpi=true})
  love.graphics.setBackgroundColor(160, 100, 50)
  
  -- assets
  
  fontcute  = love.graphics.newFont('fonts/cute.ttf', 100)
  fontread  = love.graphics.newFont('fonts/quicksand.ttf', 35)
  
  ingredients = {
    ingapple     = ingredient:create(100, 0, 'ingredients/(clubs)apple.png'),
    ingegg       = ingredient:create(100, 0, 'ingredients/(clubs)egg.png'),
    ingpepper    = ingredient:create(100, 0, 'ingredients/(clubs)pepper.png'),
    ingcheese    = ingredient:create(100, 0, 'ingredients/(diamonds)cheese.png'),
    ingsushi     = ingredient:create(100, 0, 'ingredients/(diamonds)sushi.png'),
    ingtofu      = ingredient:create(100, 0, 'ingredients/(diamonds)tofu.png'),
    ingcarrot    = ingredient:create(100, 0, 'ingredients/(hearts)carrot.png'),
    ingcorn      = ingredient:create(100, 0, 'ingredients/(hearts)corn.png'),
    ingsquid     = ingredient:create(100, 0, 'ingredients/(hearts)squid.png'),
    ingchicken   = ingredient:create(100, 0, 'ingredients/(spades)chicken.png'),
    ingicecream  = ingredient:create(100, 0, 'ingredients/(spades)icecream.png'),
    ingmushroom  = ingredient:create(100, 0, 'ingredients/(spades)mushroom.png')
  }
  
  levels = {
    level0 = level:create(0, 'levels/splash.png', false),
    level1 = level:create(1, 'levels/level1.png', 'levels/soup1.png'),
    level2 = level:create(2, 'levels/level2.png', 'levels/soup2.png'),
    level3 = level:create(3, 'levels/level3.png', 'levels/soup3.png')
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
  love.graphics.setColor(255, 255, 255)
  
  -- splash screen
  
  if level == 0 then
    
    --img = love.graphics.newImage('levels/background.png')
    --love.graphics.draw(img)
    levels['level0']:draw()
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

  -- TEXT ???
  
  if 0 == 0 then
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontcute)
    love.graphics.print(level, winwidth-fontcute:getWidth(level), 0)
  end
  
  -- place ingredients
  
  for k,v in pairs(ingredients) do
    ingredients[k]:draw()
  end 
  
  -- quit game
  
  if love.keyboard.isDown('q') then
    love.event.quit(0)
  end
  
  -- debug log
  
  love.graphics.setFont(fontread)
  love.graphics.print(log, 0, winheight-100)
  
end
