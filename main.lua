local Player = require("player")


local player = nil
function love.load()
    player = Player.new()
end

function love.update(delta)
    player:update(delta)
end

function love.draw()
    player:draw()
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
