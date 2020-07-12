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
        love.graphics.setColor(0.3, 0.8, 0.7, 1.0)
        local r = this.radius + math.sin(love.timer.getTime()) * 5
        love.graphics.circle("fill", this.x, this.y, r)
    end

    return this
end

return Goal
