Recipes = {}

-- level 1 recipes

recipe1z = {
  'sushi','apple','corn'
}
recipe1x = {
  'icecream','egg','tofu'
}
recipe1c = {
  'tofu','egg','carrot'
}

-- level 2 recipes

recipe2z = {
  'icecream','mushroom','corn','apple'
}
recipe2x = {
  'chicken','icecream','corn','egg'
}
recipe2c = {
  'apple','carrot','chicken','icecream',
  'mushroom'
}

-- level 3 recipes

recipe3z = {
  'apple','pepper','carrot','chicken',
  'tofu'
}
recipe3x = {
  'egg','apple','squid','cheese',
  'carrot','mushroom'
}
recipe3c = {
  'cheese','apple','corn','squid',
  'mushroom','pepper'
}

local twnz = tween.new(2, recposz, {y=recposz.y})
local twnx = tween.new(2, recposx, {y=recposx.y})
local twnc = tween.new(2, recposc, {y=recposc.y})

function Recipes:create()
  self.__index = self
end

function layoutBoard(recipe, brdx, brdy, letter)
  row     = 1
  col     = 1
  pad     = 125
  drpshdw = 5
  
  for i=1, #recipe do
      
    if i%5 == 0 then
      row = 2
      col = 1
    end
    
    love.graphics.setColor(0, 0, 0, 100)
    love.graphics.draw(ingredients[ recipe[i] ], pad*(col-1)+brdx+drpshdw, pad*(row-1)+brdy+drpshdw, 0.2, 0.2)
    love.graphics.setColor(255, 255, 255)
    love.graphics.draw(ingredients[ recipe[i] ], pad*(col-1)+brdx, pad*(row-1)+brdy, 0.2, 0.2)
    col = col+1
  end
  
  if recposc.y > 700 then
    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(fontcutemed)
    love.graphics.print(letter, brdx-118, brdy+92)
  end
end

function Recipes:animateIn()
  if recanim == false then
    twnz = tween.new(1.5, recposz, {y=105}, 'outBounce')
    twnx = tween.new(1.5, recposx, {y=405}, 'outBounce')
    twnc = tween.new(1.5, recposc, {y=705}, 'outBounce')
  end
  
  recanim = true;
end

function Recipes:update(dt)
  twnz:update(dt)
  twnx:update(dt)
  twnc:update(dt)
end

function Recipes:draw(lvl)
  if lvl == 1 then
    layoutBoard(recipe1z, 195, recposz.y, 'Z')
    layoutBoard(recipe1x, 195, recposx.y, 'X')
    layoutBoard(recipe1c, 195, recposc.y, 'C')
  end
  if lvl == 2 then
    layoutBoard(recipe2z, 195, recposz.y, 'Z')
    layoutBoard(recipe2x, 195, recposx.y, 'X')
    layoutBoard(recipe2c, 195, recposc.y, 'C')
  end
  if lvl == 3 then
    layoutBoard(recipe3z, 195, recposz.y, 'Z')
    layoutBoard(recipe3x, 195, recposx.y, 'X')
    layoutBoard(recipe3c, 195, recposc.y, 'C')
  end
end

return Recipes
