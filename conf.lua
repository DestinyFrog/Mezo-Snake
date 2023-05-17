
function love.conf( t )
    require( 'data' )

    t.window.width = WIDTH
    t.window.height = HEIGHT

    t.version = "11.4"
    t.console = false

    t.window.title = "Snake"

    t.window.borderless = false
    t.window.resizable = false

    t.window.x = 100
    t.window.y = 100

    t.window.vsync = true
end
