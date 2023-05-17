
UNIT = 24
PERLINE = 16
WIDTH = UNIT*PERLINE
HEIGHT = UNIT*PERLINE

DELAY = 0.14

Score = 0

Vec2 = function ( x, y )
    return {
        ["x"]=x or 0,
        ["y"]=y or x or 0
    }
end

Vec3 = function ( x, y, z )
    return {
        ["x"]=x or 0,
        ["y"]=y or x or 0,
        ["z"]=z or 0
    }
end

function ToRad( deg )
    return deg * ( math.pi / 180 )
end

function Tri( cond , T , F )
    if cond then return T else return F end
end

Color = function( rgb ) 

end