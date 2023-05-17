Snake = {}

Snake.press = {
    ["w"] = function () Snake.direction = Vec2( 0, -1 ) end,
    ["s"] = function () Snake.direction = Vec2( 0,  1 ) end,
    ["a"] = function () Snake.direction = Vec2( -1, 0 ) end,
    ["d"] = function () Snake.direction = Vec2(  1, 0 ) end
}

function Snake:init()
    self.body = { Vec3( 0,0 ) }
    self.color = {255,60,0}
    self.direction = Vec2( 0, 1 )

    self.angle = 0;

    self.sprite_body_h = love.graphics.newImage( "/sprites/bodyh.png" )
    self.sprite_body_v = love.graphics.newImage( "/sprites/bodyv.png" )
end

function Snake:update()
    -- Passa a informação de cada parte do corpo para a próxima
    for i=table.getn( self.body ), 2, -1 do
        self.body[i].x = self.body[i - 1].x
        self.body[i].y = self.body[i - 1].y
        self.body[i].z = self.body[i - 1].z
    end

    self.angle = self.direction["x"] == 0

    -- Mudar a direção da cabeça
    self.body[1].x = self.body[1].x + self.direction.x
    self.body[1].y = self.body[1].y + self.direction.y
    self.body[1].z = self.angle

    -- Atravessar as paredes
    if self.body[1].x >= PERLINE then self.body[1].x = 0 end
    if self.body[1].y >= PERLINE then self.body[1].y = 0 end
    if self.body[1].x < 0 then self.body[1].x = PERLINE  end
    if self.body[1].y < 0 then self.body[1].y = PERLINE  end

    -- Perder o jogo
    for i=2, table.getn( self.body ) do
        local pos = self.body[i]
        if pos.x == self.body[1].x and pos.y == self.body[1].y then
            love.event.quit( 0 )
        end
    end
end

function Snake:draw()
    love.graphics.setColor( self.color )

    for index,value in pairs( self.body ) do
        love.graphics.draw(
            Tri( value["z"] == false , self.sprite_body_h, self.sprite_body_v ),
            value["x"]*UNIT,
            value["y"]*UNIT
        )
    end
end
