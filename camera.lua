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

function camera.update(this, target, delta)
    this.t = math.max(0, this.t - delta * math.max(this.t, 1.0))

    
    local dx = target.x - this.x
    local dy = target.y - this.y

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
    love.graphics.scale(math.min(math.random() * shake * 0.01, 0.5) + 1.0)
    love.graphics.translate(-this.x, -this.y)
end

function camera.shake_factor(this)
    return this.t * this.t * 0.2
end

function camera.shake(this, strength)
    this.t = this.t + strength
end


return camera
