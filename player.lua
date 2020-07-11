local Player = {}

local floor = 200
function Player.new()
    local this = {}

    -- A player, is infact a box!
    this.x = 0
    this.y = 0

    this.vx = 0
    this.vy = 0

    this.w = 50
    this.h = 100
    this.mass = 1.0
    this.friction = 0.1

    this.player = true
    this.grounded = false

    this.acc = 2000.0
    this.damp = 0.005
    this.gravity = 5000.0
    this.jump_force = 1500.0


    this.jump = false
    this.left = false
    this.right = false

    function this.do_jump(this)
        if this.grounded then
            this.jump = true
            this.grounded = false
            this.vy = -this.jump_force
        end
    end

    function this.update(this, delta)
        if this.left then
            this.vx = this.vx - this.acc * delta
        elseif this.right then
            this.vx = this.vx + this.acc * delta
        end

        if not this.jump or this.vy > 0 then
            this.vy = this.vy * math.pow(this.damp, delta)
        end

        this.vy = this.vy + this.gravity * delta
        this.y = this.y + this.vy * delta

        this.vx = this.vx * math.pow(this.damp, delta)
        this.x = this.x + this.vx * delta
    end

    function this.draw(this)
        love.graphics.setColor(0.6, 0.6, 1.0, 1.0)
        love.graphics.rectangle("fill", this.x - this.w / 2.0, this.y - this.h / 2.0, this.w, this.h)
    end
    
    return this
end

return Player
