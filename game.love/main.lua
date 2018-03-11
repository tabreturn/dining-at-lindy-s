-- love.draw

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
  
  -- animation
  
  splashimg = love.graphics.newImage('levels/splash.png')
  splashgrd = anim8.newGrid(360, 353, splashimg:getWidth(), splashimg:getHeight())
  splashanm = anim8.newAnimation(splashgrd('1-5',1), 0.25)
  
  avatarimg = love.graphics.newImage('tomavatar.png')
  avatargrd = anim8.newGrid(400, 400, avatarimg:getWidth(), avatarimg:getHeight())
  avataranm = anim8.newAnimation(avatargrd('1-2',1), 0.25)
  
  brdpos1 = {x=-800}
  brdpos2 = {x=-800}
  brdpos3 = {x=-800}
  brdanim = false;
  
  recposz = {y=-1100}
  recposx = {y=-800}
  recposc = {y=-500}
  recanim = false;

  fadeprm = {o=255}
  fadeanim = false
  fadetwn = tween.new(0.1, fadeprm, {o=fadeprm.o})
  
  introvid = love.graphics.newVideo('levels/intro.ogv')
  intropld = false
  
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
  fontreadlrg  = love.graphics.newFont('fonts/quicksand.ttf', 40)
  
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
    level1 = level:create(1, 'levels/soup1.png', 'levels/level1.png', 'levels/soupberg1.png'),
    level2 = level:create(2, 'levels/soup2.png', 'levels/level2.png', 'levels/soupberg2.png'),
    level3 = level:create(3, 'levels/soup3.png', 'levels/level3.png', 'levels/soupberg3.png'),
  }
  
  endwin = love.graphics.newImage('levels/endwin.png')
  endlose = love.graphics.newImage('levels/endlose.png')
  
  tombowl = love.graphics.newImage('tombowl.png')
  
  recipes:create(ingredients)
  boards:create()
  
  -- stage variables
  
  keyrelspc = true
  keyrelz   = true
  keyrelx   = true
  keyrelc   = true
  
  level = -1

end

-- additional key listners

function love.keyreleased(key)
   if key == 'space' then
      keyrelspc = true
   end
   if key == 'z' then
      keyrelz = true
   end
   if key == 'x' then
      keyrelx = true
   end
   if key == 'c' then
      keyrelc = true
   end
end

function love.keypressed(key)
  if key == 'q' then
    love.event.quit(0)
  end
end

-- love.update

function love.update(dt)

  splashanm:update(dt)
  avataranm:update(dt)
  boards:update(dt)
  recipes:update(dt)
  fadetwn:update(dt)
  
end

-- love.draw

function love.draw()
  
  -- splash screen
  
  if level == -1 then
    
    love.graphics.setColor(255, 255, 255)
    splashanm:draw(splashimg, 768, 432)
    
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontcutelrg)
    love.graphics.print(title, 408, 180)
    
    love.graphics.setFont(fontreadmed)
    love.graphics.print('< press space to begin >', 790, winheight-200)
    
    if love.keyboard.isDown('space') and keyrelspc then
      nextLevel(level+1)
      keyrelspc = false
    end
    
    fadeIn()
  end
  
  -- intro screen
  
  if level == 0 then
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(introvid, 480, 180, 0, 0.5, 0.5)
    
    if intropld == false then
      intropld = true
      introvid:play()
    end
    
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontreadlrg)
    love.graphics.print('Quickly! Save Mr. Yum (or, Tom, to his friends) from drowning in your soup!', 280, winheight-260)
    love.graphics.setFont(fontreadmed)
    love.graphics.print('< press space to proceed >', 770, winheight-150)
    
    if love.keyboard.isDown('space') and keyrelspc then
      nextLevel(level+1)
      keyrelspc = false
    end
    
    fadeIn()
  end
  
  -- level 1
  
  if level == 1 then
    levels['level1']:draw()
    boards:draw()
    boards:animateIn()
    recipes:draw(1)
    
    if brdsin then
      recipes:animateIn()
    end
    
    if love.keyboard.isDown('z') and keyrelz then
      nextLevel(-2)
      keyrelz = false
    elseif love.keyboard.isDown('x') and keyrelx then
      nextLevel(-2)
      keyrelx = false
    elseif love.keyboard.isDown('c') and keyrelc then
      nextLevel(level+1)
      keyrelc = false
    end
    
    love.graphics.setColor(255, 255, 255)
    avataranm:draw(avatarimg, winwidth-400, winheight-400)
    
    fadeIn()
  end
  
  -- level 2
  
  if level == 2 then
    levels['level2']:draw()
    boards:draw()
    boards:animateIn()
    recipes:draw(2)
    
    if brdsin then
      recipes:animateIn()
    end
    
    if love.keyboard.isDown('z') and keyrelz then
      nextLevel(-2)
      keyrelz = false
    elseif love.keyboard.isDown('x') and keyrelx then
      nextLevel(level+1)
      keyrelx = false
    elseif love.keyboard.isDown('c') and keyrelc then
      nextLevel(-2)
      keyrelc = false
    end
    
    love.graphics.setColor(255, 255, 255)
    avataranm:draw(avatarimg, winwidth-400, winheight-400)
    
    fadeIn()
  end
  
  -- level 3
  
  if level == 3 then
    levels['level3']:draw()
    boards:draw()
    boards:animateIn()
    recipes:draw(3)
    
    if brdsin then
      recipes:animateIn()
    end
    
    if love.keyboard.isDown('z') and keyrelz then
      nextLevel(-2)
      keyrelz = false
    elseif love.keyboard.isDown('x') and keyrelx then
      nextLevel(-2)
      keyrelx = false
    elseif love.keyboard.isDown('c') and keyrelc then
      nextLevel(level+1)
      keyrelc = false
    end
    
    love.graphics.setColor(255, 255, 255)
    avataranm:draw(avatarimg, winwidth-400, winheight-400)
    
    fadeIn()
  end
  
  -- win
  
  if level == 4 then
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(endwin, 0, 0)
    
    if love.keyboard.isDown('space') and keyrelspc then
      nextLevel(-1)
      keyrelspc = false
    end
    
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontreadlrg)
    love.graphics.print('You saved Mr. Yum!', 780, winheight-260)
    love.graphics.setFont(fontreadmed)
    love.graphics.print('< press space to return to the start screen >', 660, winheight-150)
    
    fadeIn()
  end
  
  if level == -2 then
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(endlose, 0, 0)
    
    if love.keyboard.isDown('space') and keyrelspc then
      nextLevel(-1)
      keyrelspc = false
    end
    
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontreadlrg)
    love.graphics.print('Mr. Yum has drowned!', 750, winheight-260)
    love.graphics.setFont(fontreadmed)
    love.graphics.print('< press space to return to the start screen >', 660, winheight-150)
    
    fadeIn()
  end
  
end

-- non-standard functions

function nextLevel(lvl)
  fadeprm.o = 255
  fadeanim = false
  
  brdanim = false
  brdpos1.x = -800
  brdpos2.x = -800
  brdpos3.x = -800
  brdsin = false
  
  recanim = false
  recposz = {y=-1100}
  recposx = {y=-800}
  recposc = {y=-500}
  
  level = lvl
end

function fadeIn()
  love.graphics.setColor(255, 255, 255, fadeprm.o)
  love.graphics.rectangle('fill', 0, 0, winwidth, winheight)
  
  if fadeanim == false then
    fadetwn = tween.new(1.5, fadeprm, {o=0}, 'linear')
  end
  
  fadeanim = true;
end
