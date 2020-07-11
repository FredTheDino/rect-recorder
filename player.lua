local Player = {}

local floor = 200
function Player.new()
    local this = {}
    this.x = 0
    this.y = 0

    this.vx = 0
    this.vy = 0
    this.acc = 2000.0
    this.damp = 0.005
    this.gravity = 5000.0
    this.jump_force = 1500.0

    this.w = 100
    this.h = 100

    this.jump = false
    this.left = false
    this.right = false

    function this.do_jump(this)
        this.jump = true
        this.vy = -this.jump_force
    end

    function this.update(this, delta)
        if this.left then
            this.vx = this.vx - this.acc * delta
        elseif this.right then
            this.vx = this.vx + this.acc * delta
        end
        this.vx = this.vx * math.pow(this.damp, delta)

        if not this.jump or this.vy > 0 then
            this.vy = this.vy * math.pow(this.damp, delta)
        end

        this.vy = this.vy + this.gravity * delta
        this.y = this.y + this.vy * delta
        if this.y >= floor then
            this.y = floor
            this.vy = 0
        end

        this.x = this.x + this.vx * delta
    end

    function this.draw(this)
        love.graphics.setColor(0.6, 0.6, 1.0, 1.0)
        love.graphics.rectangle("fill", this.x, this.y, this.w, this.h)
    end
    
    return this
end

return Player
