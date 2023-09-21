local sX, sY = guiGetScreenSize()
function drawCircle( x,y, radius, thick, color )
    local numPoints = 45
    local step = math.pi * 2 / numPoints
    local sx,sy
    for p=0,numPoints do
        local ex = math.cos ( p * step ) * radius
        local ey = math.sin ( p * step ) * radius
        if sx then
            dxDrawLine( x+sx, y+sy, x+ex, y+ey, color, thick, true )
        end
        sx,sy = ex,ey
    end
end