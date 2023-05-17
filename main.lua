
function love.load()
    Retro_font = love.graphics.newFont( "/assets/retro_computer.ttf", 16 )
    love.graphics.setFont( Retro_font )

    require( 'data' )
    require( 'ents.back' )
    require( 'ents.snake' )
    require( 'ents.fruit' )

    Background:init()
    Snake:init()
    Fruit:init()
end

function love.update()
    Snake:update()
    Fruit:update()
    love.timer.sleep( DELAY )
end

function love.draw()
    Background:draw()
    Snake:draw()
    Fruit:draw()
end

function love.keypressed( key )
    if key == 'escape' then love.event.quit( 0 ) end	
    if Snake.press[key] ~= nil then Snake.press[key]() end
end