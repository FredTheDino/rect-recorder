local Goal = {}

function Goal.new(x, y)
    local this = {}
    this.x = x
    this.y = y

    this.non_collidable = true
    this.radius = 50
    this.player = nil

    function this.update(this, delta)
        local dx = this.x - this.player.x
        local dy = this.y - this.player.y
        local length = dx * dx + dy * dy
        if length < (this.radius * this.radius) then
            this.player.finished = true
        end
    end

    function this.draw(this)
        local t = love.timer.getTime()
        local r = this.radius + math.sin(t) * 5

        love.graphics.setColor(0.3, 0.8, 0.7, 1.0)
        love.graphics.circle("fill", this.x, this.y, r)
        
        local dx = math.sin(t) * r
        local dy = math.cos(t) * r
        love.graphics.setColor(0.3, 0.8, 0.7, 1.0)
        for _ = 0, 1, 1 do
            love.graphics.circle("fill", this.x + dx, this.y + dy, r * 0.3)
            love.graphics.circle("fill", this.x - dy, this.y + dx, r * 0.3)
            love.graphics.circle("fill", this.x - dx, this.y - dy, r * 0.3)
            love.graphics.circle("fill", this.x + dy, this.y - dx, r * 0.3)
            love.graphics.setColor(1.0, 1.0, 1.0, 0.1)
        end

        love.graphics.setColor(1.0, 1.0, 1.0, 0.1)
        for i = 2, 7, 1 do
            local inner_r = r / i * 1.0
            local inner_t = t * i * 1.213122
            local dx = math.cos(inner_t) * inner_r * 0.5
            local dy = math.sin(inner_t) * inner_r * 0.5
            love.graphics.circle("fill", this.x + dx, this.y + dy, inner_r)
        end
    end

    return this
end

return Goal
