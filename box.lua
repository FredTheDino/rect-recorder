local Box = {}

function dot(x1, y1, x2, y2)
    return x1 * x2 + y1 * y2
end

function sign(x)
    if x > 0 then return 1 end
    return 0
end


function Box.new(x, y, w, h, mass)
    local this = {}
    this.x = x or 0
    this.y = y or 0
    this.w = w
    this.h = h

    this.vx = 0
    this.vy = 0

    this.mass = mass or 0
    this.gravity = 1000

    function this.overlap(a, b)
        local dx = a.x - b.x
        local sw = (a.w + b.w) / 2.0
        local ox = math.abs(dx) - sw

        local dy = a.y - b.y
        local sh = (a.h + b.h) / 2.0
        local oy = math.abs(dy) - sh

        local depth = 0
        local normal = { x = 0, y = 0 }

        print(oy, ox)
        if oy >= 0 or ox >= 0 then
            return false, depth, normal
        end

        local dvx = a.vx - b.vx
        local dvy = a.vy - b.vy

        if oy > ox then
            depth = oy
            normal.y = sign(dy)
        else
            depth = ox
            normal.x = sign(dx)
        end
        return dot(normal.x, normal.y, dvx, dvy) < 0, depth, normal
    end
    
    function this.update(this, delta)
        if this.mass ~= 0 then
            this.vy = this.vy + this.gravity * delta
        end

        this.x = this.x + this.vx * delta
        this.y = this.y + this.vy * delta
    end

    function this.draw(this)
        love.graphics.setColor(0.5, 0.2, 0.5, 1.0)
        love.graphics.rectangle("fill", this.x, this.y, this.w, this.h)
    end

    return this
end

return Box
