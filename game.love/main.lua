function love.load()
  
  -- window setup
  love.window.setTitle('Dining at Lindy\'s')
  winwidth   = 1920
  winheight  = 1080
  winmargin  = 50
  rm         = 2 --highdpi multiplier
  love.window.setMode(winwidth/rm, winheight/rm, {highdpi=true})
  love.graphics.setBackgroundColor(255, 255, 255)
  
  -- assets
  fontcute = love.graphics.newFont('fonts/cute.ttf', 100)
  fontread = love.graphics.newFont('fonts/quicksand.ttf', 35)
  ingapple = love.graphics.newImage('ingredients/apple.png')
  ingcarrot = love.graphics.newImage('ingredients/apple.png')
  ingtofu = love.graphics.newImage('ingredients/tofu.png')
  
  -- stage variables
  level = 0
  log = ''
  
end


function love.update(dt)
  
end

function love.draw()
  
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(ingapple, 0, 0, 0.5, 0.5) --love.graphics.draw(drawable, x, y, r, sx, sy, ox, oy, kx, ky)
  
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
