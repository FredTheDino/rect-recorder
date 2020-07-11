local Player = {}

local floor = 200
function Player.new()
    local this = {}

    -- A player, is infact a box!
    this.x = 0
    this.y = 0

    this.vx = 0
    this.vy = 0

    this.last_vy = 0
    this.ay = 0

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

    this.full_energy = 1.0
    this.jump_energy_cost = 0.0
    this.walk_energy_cost = 0.0
    this.energy = this.full_energy

    function this.do_jump(this)
        local cost = this.jump_energy_cost
        if this.energy > cost then
            this.energy = this.energy - cost
            if this.grounded  then
                this.jump = true
                this.grounded = false
                this.vy = -this.jump_force

                this.energy = this.energy - this.jump_energy_cost
            end
        end
    end

    function this.update(this, delta)
        this.grounded = false

        if this.energy > 0 then
            local cost = this.walk_energy_cost * delta
            if this.left then
                this.vx = this.vx - this.acc * delta

                this.energy = this.energy - cost
            elseif this.right then
                this.vx = this.vx + this.acc * delta

                this.energy = this.energy - cost
            end
        end

        if not this.jump or this.vy > 0 then
            this.vy = this.vy * math.pow(this.damp, delta)
        end

        this.vy = this.vy + this.gravity * delta
        this.y = this.y + this.vy * delta

        this.ay = (this.ay + this.vy - this.last_vy) / 2.0
        this.last_vy = this.vy

        this.vx = this.vx * math.pow(this.damp, delta)
        this.x = this.x + this.vx * delta
    end

    function this.ui(this)
        local p = 10
        local w = 25
        local h = 200
        local c = 0.5 + this.energy * 0.5
        local r = math.random() * (1.0 - this.energy) * 0.2 + 0.8
        love.graphics.setColor(r, c, c, 1.0)
        love.graphics.rectangle("fill", p, (h * (1.0 - this.energy)) + p, w, h * this.energy)
    end

    squeeze = 0.0
    function this.draw(this)
        love.graphics.setColor(0.6, 0.6, 1.0, 1.0)

        local s = 0.1
        local force = clamp(this.ay * 0.0004, -s, s)
        print(this.ay, force)
        squeeze = (squeeze + 2 * force) / 3
        squeeze = squeeze * math.pow(0.3, love.timer.getDelta())

        local num_slices = 10
        local area = 5000 / num_slices
        local h = (squeeze + 1.0) * (this.h / num_slices)
        local w = area / h
        this.w = w

        local bottom = this.y + this.h / 2.0
        local center = this.x - w / 2.0

        local dx = clamp(this.vx * -0.01, -10, 10)
        for i = 1, num_slices, 1 do
            local x = center + (i * i) * dx / (num_slices * num_slices)
            local y = bottom - i * h 
            love.graphics.rectangle("fill", x, y, w, h)
        end
    end
    
    return this
end

return Player
