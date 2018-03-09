function love.load()
  love.window.setTitle('Dining at Lindy\'s')
  love.window.setMode(960, 540, {highdpi=true})
  love.graphics.setBackgroundColor(255, 255, 255) -- white bg
  placeholder = love.graphics.newImage('ingredients/placeholder.png')
end


function love.update(dt)
  
end

function love.draw()
  -- love.graphics.draw(drawable, x, y, r, sx, sy, ox, oy, kx, ky)
  love.graphics.draw(placeholder, 0, 0, 0, 0.5, 0.5)
  
  if love.keyboard.isDown('q') then
    love.event.quit(0)
  end
end
