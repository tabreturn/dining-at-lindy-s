local splashimg, splashanm

function love.load()
  
  tween = require 'lib/tween'
  anim8 = require 'lib/anim8'
  
  -- window setup
  
  title = 'Dining at Lindy\'s'
  love.window.setTitle(title)
  winwidth   = 1920
  winheight  = 1080
  winmargin  = 50
  hdpiscale  = 2
  love.window.setMode(winwidth/hdpiscale, winheight/hdpiscale, {highdpi=true})
  love.graphics.setBackgroundColor(255, 255, 255)
  
  -- assets
  
  levelbg  = love.graphics.newImage('levels/background.png')
  levelstm = love.graphics.newImage('levels/steam.png')
  board1   = love.graphics.newImage('ingredients/board.png')
  board2   = love.graphics.newImage('ingredients/board.png')
  board3   = love.graphics.newImage('ingredients/board.png')
  brdsin   = false
  
  ingredient = require 'ingredients/ingredient'
  boards     = require 'ingredients/boards'
  level      = require 'levels/level'
  recipes    = require 'levels/recipes'
  
  fontcutesml  = love.graphics.newFont('fonts/cute.ttf', 50)
  fontcutemed  = love.graphics.newFont('fonts/cute.ttf', 100)
  fontcutelrg  = love.graphics.newFont('fonts/cute.ttf', 200)
  fontreadsml  = love.graphics.newFont('fonts/quicksand.ttf', 15)
  fontreadmed  = love.graphics.newFont('fonts/quicksand.ttf', 30)
  fontreadlrg  = love.graphics.newFont('fonts/quicksand.ttf', 50)
  
  ingredients = {
    apple     = love.graphics.newImage('ingredients/(clubs)apple.png'),
    egg       = love.graphics.newImage('ingredients/(clubs)egg.png'),
    pepper    = love.graphics.newImage('ingredients/(clubs)pepper.png'),
    cheese    = love.graphics.newImage('ingredients/(diamonds)cheese.png'),
    sushi     = love.graphics.newImage('ingredients/(diamonds)sushi.png'),
    tofu      = love.graphics.newImage('ingredients/(diamonds)tofu.png'),
    carrot    = love.graphics.newImage('ingredients/(hearts)carrot.png'),
    corn      = love.graphics.newImage('ingredients/(hearts)corn.png'),
    squid     = love.graphics.newImage('ingredients/(hearts)squid.png'),
    chicken   = love.graphics.newImage('ingredients/(spades)chicken.png'),
    icecream  = love.graphics.newImage('ingredients/(spades)icecream.png'),
    mushroom  = love.graphics.newImage('ingredients/(spades)mushroom.png')
  }
  
  levels = {
    level1 = level:create(1, 'levels/soup1.png', 'levels/level1.png'),
    level2 = level:create(2, 'levels/soup2.png', 'levels/level2.png'),
    level3 = level:create(3, 'levels/soup3.png', 'levels/level3.png')
  }
  
  recipes:create(ingredients)
  boards:create()
  
  -- animation
  
  splashimg = love.graphics.newImage('levels/splash.png')
  splashgrd = anim8.newGrid(360, 353, splashimg:getWidth(), splashimg:getHeight())
  splashanm = anim8.newAnimation(splashgrd('1-5',1), 0.25)
  
  -- stage variables
  
  level = 0

end


function love.update(dt)

  splashanm:update(dt)
  boards:update(dt)
  recipes:update(dt)
  
end

function love.draw()
  
  log = ''
  love.graphics.setColor(255, 255, 255)
  
  -- splash screen
  
  if level == 0 then
    
    splashanm:draw(splashimg, 768, 432)
    
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontcutelrg)
    love.graphics.print(title, 408, 180)
    
    love.graphics.setFont(fontreadmed)
    love.graphics.print('press enter to begin', 820, winheight-200)
    
    if love.keyboard.isDown('return') then
      level = level+1;
    end
  end
  
  -- level 1
  
  if level == 1 then
    levels['level1']:draw()
    
    boards:draw()
    boards:animateIn()
    
    recipes:draw(3)
    
    if brdsin then
      recipes:animateIn()
    end
    
    --for k,v in pairs(recipes1_1) do
      --recipes1_1[k]:draw()
    --end
    
    if love.keyboard.isDown('z') then
      log = 'option z'
      level = level+1;
    elseif love.keyboard.isDown('x') then
      log = 'option x'
      level = 0;
    elseif love.keyboard.isDown('c') then
      log = 'option c'
      level = 0;
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
  
  --for k,v in pairs(ingredients) do
    --ingredients[k]:draw()
  --end 
  
  -- quit game
  
  if love.keyboard.isDown('q') then
    love.event.quit(0)
  end
  
  -- debug log
  
  love.graphics.setColor(255, 0, 0)
  love.graphics.setFont(fontreadsml)
  love.graphics.print(log, 0, winheight-100)
  
end
