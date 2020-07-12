local Text = {}
local small_font = love.graphics.newFont("baskervville.ttf", 45, "normal")
local large_font = love.graphics.newFont("baskervville.ttf", 100, "normal")

function Text.new(x, y, w, size, text)
    local this = {}

    print(x, y, size, text)
    this.non_collidable = true
    this.x = x
    this.y = y
    this.w = w
    this.large = (size or 0) > 30
    this.text = text

    function this.update(this, delta)
    end

    function this.draw(this)
        if this.large then
            love.graphics.setFont(large_font)
        else
            love.graphics.setFont(small_font)
        end
        love.graphics.setColor(1.0, 1.0, 1.0, 0.9 + math.sin(love.timer.getTime()) * 0.1)
        love.graphics.print(this.text, this.x, this.y)
    end
    return this
end

return Text
