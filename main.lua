local Box = require("box")
local camera = require("camera") 
local Level = require("level")

local current_level = nil

local gos = nil
local player = nil
function love.load()
    current_level = Level.load("levels.first")
    start_level()
end

function start_level()
    player, gos = current_level:inst()
    player.camera = camera
end

function love.update(delta)
    for _, v in pairs(gos) do
        v:update(delta)
    end

    for i = 0,3,1 do
        for i, a in pairs(gos) do
            for j, b in pairs(gos) do
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
    for _, v in pairs(gos) do
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
        player.bounce_mode = true
        player:do_jump()
    end

    if key == "e" then
        camera:shake(0.5)
    end

    if key == "r" then
        start_level()
    end
end

function love.keyreleased(key, sc)
    if key == "left" or key == "a" then
        player.left = false
    elseif key == "right" or key == "d" then
        player.right = false
    elseif key == "space" or key == "w" then
        player.bounce_mode = false
        player.jump = false
    end
end
