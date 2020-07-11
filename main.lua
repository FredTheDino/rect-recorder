local Player = require("player")
local Box = require("box")

local player = nil
local box_a = nil
local box_b = nil
local box_c = nil
function love.load()
    player = Player.new()
    box_a = Box.new(300, 400, 300, 100, 0)
    box_b = Box.new(100, 200, 100, 100, 1)
    box_c = Box.new(250, 200, 100, 100, 2)
    box_b.vx = 50
end

function love.update(delta)
    player:update(delta)

    box_a:update(delta)
    box_b:update(delta)
    box_c:update(delta)

    Box.overlap_and_solve(box_a, box_b)
    Box.overlap_and_solve(box_a, box_c)
    Box.overlap_and_solve(box_b, box_c)

end

function love.draw()
    player:draw()

    box_a:draw()
    box_b:draw()
    box_c:draw()
end

function love.keypressed(key, scancode, isrepeat)
    if isrepeat then return end

    if key == "left" or key == "a" then
        player.left = true
    elseif key == "right" or key == "d" then
        player.right = true
    elseif key == "space" or key == "w" then
        player:do_jump()
    end
end

function love.keyreleased(key, sc)
    if key == "left" or key == "a" then
        player.left = false
    elseif key == "right" or key == "d" then
        player.right = false
    elseif key == "space" or key == "w" then
        player.jump = false
    end
end
