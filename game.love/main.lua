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
  placeholder = love.graphics.newImage('ingredients/placeholder.png')
  
  -- stage variables
  level = 0
  
end


function love.update(dt)
  
end

function love.draw()
  
  love.graphics.draw(placeholder, 0, 0, 0, 0.5, 0.5) --love.graphics.draw(drawable, x, y, r, sx, sy, ox, oy, kx, ky)
  
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
  log = 'stuff ...'
  love.graphics.setFont(fontread)
  love.graphics.print(log, 0, winheight-100)
  
end
