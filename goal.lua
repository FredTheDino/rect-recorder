local Goal = {}

function Goal.new(x, y)
    local this = {}
    this.x = x
    this.y = y

    this.non_collidable = true
    this.radius = 50
    this.player = nil

    this.fadeout_time = 0.8
    this.blackout = 0.2
    this.finish_start = nil
    this.finish_end = nil

    this.fadein_time = 0.4
    this.fade_in_start = love.timer.getTime()

    function this.update(this, delta)
        local dx = this.x - this.player.x
        local dy = this.y - this.player.y
        local length = dx * dx + dy * dy
        if length < (this.radius * this.radius) and this.finish_start == nil then
            this.player.finished = true
            this.finish_start = love.timer.getTime()
            this.finish_end = love.timer.getTime() + this.fadeout_time + this.blackout
        end
    end

    function this.should_load_next(this)
        return love.timer.getTime() > this.finish_end
    end

    function this.draw(this)
        local t = love.timer.getTime()
        if this.finish_end then
            t = this.finish_start
        end

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

        if this.finish_start ~= nil or this.fade_in_start ~= nil then
            local l = 0
            if this.finish_end ~= nil then
                l = (love.timer.getTime() - this.finish_start) / this.fadeout_time 
            else
                l = 1.0 - (love.timer.getTime() - this.fade_in_start) / this.fadein_time 
            end
            love.graphics.setColor(0.3 * (1.0 - l), 0.8 * (1.0 - l), 0.7 * (1.0 - l), l)
            local end_radius = 2000
            love.graphics.circle("fill", this.x, this.y, end_radius * (l * l))
        end

    end

    return this
end

return Goal
