local Player = require("player")
local Box = require("box")

local player = nil
local box_a = nil
local box_b = nil
function love.load()
    player = Player.new()
    box_a = Box.new(100, 400, 100, 100, 0)
    box_b = Box.new(100, 200, 100, 100, 1)
end

function love.update(delta)
    player:update(delta)

    box_a:update(delta)
    box_b:update(delta)

    valid, depth, normal = box_a:overlap(box_b)
    if valid then
        box_a.vx = 0
        box_b.vx = 0

        box_a.vy = 0
        box_b.vy = 0
    end
end

function love.draw()
    player:draw()

    box_a:draw()
    box_b:draw()
end

function love.keypressed(key, scancode, isrepeat)
    if isrepeat then return end

    print("Press", key)

    if key == "left" or key == "a" then
        player.left = true
    elseif key == "right" or key == "d" then
        player.right = true
    elseif key == "space" or key == "w" then
        player:do_jump()
    end
end

function love.keyreleased(key, sc)
    print("Rel", key)

    if key == "left" or key == "a" then
        player.left = false
    elseif key == "right" or key == "d" then
        player.right = false
    elseif key == "space" or key == "w" then
        player.jump = false
    end
end
