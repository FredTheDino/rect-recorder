local Box = {}

function dot(x1, y1, x2, y2)
    return x1 * x2 + y1 * y2
end

function sign(x)
    if x > 0 then return 1 end
    return -1
end

function Box.overlap(a, b)
    local dx = a.x - b.x
    local sw = (a.w + b.w) / 2.0
    local ox = math.abs(dx) - sw

    local dy = a.y - b.y
    local sh = (a.h + b.h) / 2.0
    local oy = math.abs(dy) - sh

    local depth = 0
    local normal = { x = 0, y = 0 }

    if oy >= 0 or ox >= 0 then
        return false, depth, normal, a, b
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
    return dot(normal.x, normal.y, dvx, dvy) < 0.0, depth, normal, a, b
end

function Box.solve(depth, normal, a, b)
    local total_mass = a.mass + b.mass
    if total_mass == 0 then return end

    local a_rel_mass = a.mass / total_mass
    local b_rel_mass = b.mass / total_mass

    -- Energy loss
    local epsilon = 0.1

    local av = dot(a.vx, a.vy, normal.x, normal.y)
    local bv = dot(b.vx, b.vy, normal.x, normal.y)
    local dv = (1 + epsilon) * (av - bv)

    -- Velocity correction
    a.vx = a.vx - a_rel_mass * dv * normal.x
    a.vy = a.vy - a_rel_mass * dv * normal.y

    b.vx = b.vx + b_rel_mass * dv * normal.x
    b.vy = b.vy + b_rel_mass * dv * normal.y

    -- Position correction
    a.x = a.x - a_rel_mass * depth * normal.x
    a.y = a.y - a_rel_mass * depth * normal.y

    b.x = b.x + b_rel_mass * depth * normal.x
    b.y = b.y + b_rel_mass * depth * normal.y
end

function Box.overlap_and_solve(a, b)
    local valid, depth, normal, a, b = Box.overlap(a, b)
    if valid then
        Box.solve(depth, normal, a, b)
    end
end


function Box.new(x, y, w, h, mass)
    local this = {}
    this.x = x or 0
    this.y = y or 0
    this.w = w
    this.h = h

    this.r = math.random()

    this.vx = 0
    this.vy = 0

    this.mass = mass or 0
    this.gravity = 1000
    
    function this.update(this, delta)
        if this.mass ~= 0 then
            this.vy = this.vy + this.gravity * delta
        end

        this.x = this.x + this.vx * delta
        this.y = this.y + this.vy * delta
    end

    function this.draw(this)
        love.graphics.setColor(this.r, 0.2, 0.5, 1.0)
        love.graphics.rectangle("fill", this.x - this.w / 2, this.y - this.h / 2, this.w, this.h)
    end

    return this
end

return Box
