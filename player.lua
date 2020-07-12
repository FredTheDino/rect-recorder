local Player = {}

local floor = 200
function Player.new(x, y)
    local this = {}

    -- A player, is infact a box!
    this.x = x
    this.y = y

    this.vx = 0
    this.vy = 0

    this.last_vy = 0
    this.ay = 0
    this.squeeze = 0
    this.color_lerp = 0

    this.w = 50
    this.h = 100
    this.mass = 1.0
    this.bounce = nil
    this.friction = 0.1

    this.player = true
    this.grounded = false
    this.finished = false

    this.acc = 5000.0
    this.air_acc = 800.0
    this.damp = 0.001
    this.air_damp = 0.7
    this.gravity = 5000.0
    this.jump_force = 1000.0
    this.jump_speedup = 200.0
    this.extra_jump = 2000.0
    this.max_speed = 800

    this.jump = false
    this.left = false
    this.right = false
    this.bounce_mode = false

    this.full_energy = 1.0
    this.jump_energy_cost = 0.15
    this.walk_energy_cost = 0.3
    this.energy = this.full_energy

    function this.do_jump(this)
        local cost = this.jump_energy_cost
        if this.grounded  then
            if this.energy > cost then
                this.energy = this.energy - cost

                this.jump = true
                this.grounded = false
                this.vy = -this.jump_force
                if this.left then
                    this.vx = this.vx - this.jump_speedup
                elseif this.right then
                    this.vx = this.vx + this.jump_speedup
                end

                this.energy = this.energy - cost
            end
        end
    end

    function this.collision(this, normal, impact)
        this.grounded = normal.y < 0.6
        if impact > 200 then
            this.camera:shake(impact * 0.0001)
        end
    end

    function this.update(this, delta)

        if this.bounce_mode and math.abs(this.vy) > 20 then
            this.color_lerp = math.min(1.0, this.color_lerp + delta * 4)
            this.bounce = 0.50
        else
            this.color_lerp = math.max(0.0, this.color_lerp - delta * 8)
            this.bounce = -1.0
        end

        if this.energy > 0 then
            local cost = this.walk_energy_cost * delta
            local acc = this.grounded and this.acc or this.air_acc
            if this.left then
                local vel_scale = math.min(math.abs(this.vx + this.max_speed) / this.max_speed, 1.0)
                this.vx = this.vx - acc * vel_scale * delta
                this.energy = math.max(this.energy - cost, 0)
            elseif this.right then
                local vel_scale = math.min(math.abs(this.vx - this.max_speed) / this.max_speed, 1.0)
                this.vx = this.vx + acc * vel_scale * delta
                this.energy = math.max(this.energy - cost, 0)
            end
        end

        if this.bounce_mode and this.vy < 0 then
            this.vy = this.vy - this.extra_jump * delta
        end

        this.vy = this.vy + this.gravity * delta
        this.y = this.y + this.vy * delta

        this.ay = (this.ay + this.vy - this.last_vy) / 2.0
        this.last_vy = this.vy

        local damp = (this.grounded and this.vy > 0) and this.damp or this.air_damp
        this.vx = this.vx * math.pow(damp, delta)
        this.x = this.x + this.vx * delta

        this.grounded = false
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

    function lerp(a, b, t)
        return a  + (b - a) * t
    end

    function this.draw(this)
        love.graphics.setColor(
            lerp(0.9, 0.8, this.color_lerp), 
            lerp(0.3, 0.1, this.color_lerp), 
            lerp(0.3, 0.1, this.color_lerp),
            1.0)

        local s = 0.1
        local force = clamp(this.ay * 0.0004, -s, s)
        this.squeeze = (this.squeeze + 4 * force) / 5
        this.squeeze = this.squeeze * math.pow(0.6, love.timer.getDelta())

        local num_slices = 25
        local area = 5000 / num_slices
        local h = (this.squeeze + 1.0) * (this.h / num_slices)
        local w = area / h

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
