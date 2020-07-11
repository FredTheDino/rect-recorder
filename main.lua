local Player = require("player")
local Box = require("box")
local camera = require("camera") 

local boxes = {}
local player = nil
function love.load()
    player = Player.new()
    local box_a = Box.new(300, 400, 600, 100, 0, 1.0)
    local box_b = Box.new(100, 200, 100, 100, 1, 1.0)
    local box_c = Box.new(250, 200, 100, 100, 2, 1.0)
    box_b.vx = 50

    table.insert(boxes, box_a)
    table.insert(boxes, box_b)
    table.insert(boxes, box_c)
    table.insert(boxes, player)
end

function love.update(delta)
    for _, v in pairs(boxes) do
        v:update(delta)
    end

    for i = 0,3,1 do
        for i, a in pairs(boxes) do
            for j, b in pairs(boxes) do
                if j > i then 
                    Box.overlap_and_solve(delta, a, b)
                end
            end
        end
    end

    camera:update(player, delta)
end

function love.draw()
    love.graphics.origin()
    player:ui()
    camera:draw()
    for _, v in pairs(boxes) do
        v:draw()
    end
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

    if key == "e" then
        camera:shake(0.5)
    end

    if key == "r" then
        camera:shake(1.5)
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
