--tween      = require 'lib/tween'
ingredient = require 'ingredients/ingredient'
level      = require 'levels/level'
anim8      = require 'lib/anim8'
             local splashimg, splashanm

title      = 'Dining at Lindy\'s'

function love.load()
  
  -- window setup
  
  love.window.setTitle(title)
  winwidth   = 1920
  winheight  = 1080
  winmargin  = 50
  hdpiscale  = 2
  love.window.setMode(winwidth/hdpiscale, winheight/hdpiscale, {highdpi=true})
  love.graphics.setBackgroundColor(255, 255, 255)
  
  -- assets
  
  fontcutesml  = love.graphics.newFont('fonts/cute.ttf', 50)
  fontcutemed  = love.graphics.newFont('fonts/cute.ttf', 100)
  fontcutelrg  = love.graphics.newFont('fonts/cute.ttf', 200)
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
    level1 = level:create(1, 'levels/soup1.png', 'levels/background.png', 'levels/level1.png'),
    level2 = level:create(2, 'levels/soup2.png', 'levels/background.png', 'levels/level2.png'),
    level3 = level:create(3, 'levels/soup3.png', 'levels/background.png', 'levels/level3.png')
  }
  
  -- animation
  
  splashimg = love.graphics.newImage('levels/splash.png')
  splashgrd = anim8.newGrid(360, 353, splashimg:getWidth(), splashimg:getHeight())
  splashanm = anim8.newAnimation(splashgrd('1-5',1), 0.25)
  
  -- stage variables
  
  level = 0
  log = ''

end


function love.update(dt)
  
  splashanm:update(dt)
  
  for k,v in pairs(ingredients) do
    ingredients[k]:update(dt)
  end
  
end

function love.draw()
  
  log = ''
  love.graphics.setColor(255, 255, 255)
  
  -- splash screen
  
  if level == 0 then
    love.graphics.setColor(255, 255, 255)
    splashanm:draw(splashimg, winwidth/2.5, winheight/2)
    
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontcutelrg)
    love.graphics.print(title, winwidth/4.7, winheight/4)
    
    if love.keyboard.isDown('z') then
      level = level+1;
    end
  end
  
  -- level 1
  
  if level == 1 then
    levels['level1']:draw()
    
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
    levels['level2']:draw()
    
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
    levels['level2']:draw()
    
    if love.keyboard.isDown('z') then
      log = 'option z'
    elseif love.keyboard.isDown('x') then
      log = 'option x'
    elseif love.keyboard.isDown('c') then
      log = 'option c'
    end
  end
  
  -- place ingredients
  
  for k,v in pairs(ingredients) do
    --ingredients[k]:draw()
  end 
  
  -- quit game
  
  if love.keyboard.isDown('q') then
    love.event.quit(0)
  end
  
  -- debug log
  
  love.graphics.setColor(255, 0, 0)
  love.graphics.setFont(fontread)
  love.graphics.print(log, 0, winheight-100)
  
end
