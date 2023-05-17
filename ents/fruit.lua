Fruit = {}

function Random_pos()
    :: repos ::
    local pos =  Vec2( love.math.random( PERLINE-1 ), love.math.random( PERLINE-1 ) )
    for _, value in pairs( Snake.body ) do
        if value["x"] == pos.x and value["y"] == pos.y then goto repos end
    end
    return pos
end

function Fruit:init()
    self.position = Random_pos()
    self.color = { 255, 0, 0, 1 }
end

function Fruit:update()
    if Snake.body[1].x == self.position.x and Snake.body[1].y == self.position.y then
        self.position = Random_pos()
        Score = Score + 1
        table.insert( Snake.body, Vec3( -1, -1 ) )
    end
end

function Fruit:draw()
    love.graphics.setColor( self.color )
    love.graphics.rectangle( 'fill',
        self.position["x"]*UNIT,
        self.position["y"]*UNIT,
        UNIT, UNIT )
end
