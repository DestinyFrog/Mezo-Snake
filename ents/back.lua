
Background = {}

function Background:init()
    self.back_color = { 0.1,0.18,0.5 }
    self.graph_color = { 0, 0, 0, 0.15 }

    love.graphics.setBackgroundColor( self.back_color )
end

function Background:draw()
    love.graphics.setColor( { 0, 0, 0, 0.8 } )
    love.graphics.print( tostring( Score ), 0, 0 )

    love.graphics.setColor( self.graph_color )

    for i=0,PERLINE,1 do
        love.graphics.line( 0, i*UNIT, WIDTH, i*UNIT )
        love.graphics.line( i*UNIT, 0, i*UNIT, HEIGHT )
    end
end
