local Box = {}

function dot(x1, y1, x2, y2)
    return x1 * x2 + y1 * y2
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

        print(oy, ox)
        if oy >= 0 or ox >= 0 then
            return 0, {
                x = 0,
                y = 0,
            }
        end

        if oy > ox then
            a.vy = 0
            b.vy = 0
        else
            a.vx = 0
            b.vx = 0
        end
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
