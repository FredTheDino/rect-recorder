local camera = {}
camera.t = 0.0
camera.speed = 25
camera.max_speed = 100
camera.x = 0
camera.y = 0
camera.radius = 20

function clamp(v, l, h)
    return math.max(l, math.min(h, v))
end

function camera.setup(this, a, b)
    this.x = (a.x + b.x) / 2
    this.y = (a.y + b.y) / 2
end

function camera.update(this, a, b, delta)
    this.t = math.max(0, this.t - delta * math.max(this.t * 10, 1.0))

    local target_x = (a.x + b.x) / 2
    local target_y = (a.y + b.y) / 2
    
    local dx = target_x - this.x
    local dy = target_y - this.y

    if dy < (camera.radius * 3) and not a.grounded then
        dy = 0
    end

    local length = math.sqrt(dx * dx + dy * dy)
    if length < camera.radius then return end

    local dirx = dx / length
    local diry = dy / length

    local max = math.pow(camera.radius - length, 2) * 0.05
    local speed = clamp(length * this.speed, -max, max) * delta
    this.x = this.x + dirx * speed
    this.y = this.y + diry * speed
end

function camera.draw(this)
    local shake = this:shake_factor()
    love.graphics.origin()
    love.graphics.translate(love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
    love.graphics.rotate(math.sin(math.random() * 2 * math.pi) * math.min(shake * 0.01, 0.1))
    love.graphics.translate(math.sin(math.random() * 2 * math.pi) * shake * 5,
                            math.sin(math.random() * 2 * math.pi) * shake * 5)
    love.graphics.scale(math.min(math.random() * shake * 0.01, 0.5) + 0.5)
    love.graphics.translate(-this.x, -this.y)
end

function camera.shake_factor(this)
    return math.sqrt(this.t * 0.1) * 2.0
end

function camera.shake(this, strength)
    this.t = this.t + strength
end


return camera
