local Box = require("box")
local camera = require("camera") 
local Level = require("level")

local current_level = nil

local gos = nil
local player = nil
local goal = nil

local load_next = nil
function love.load()
    current_level = Level.load("levels.w1l5")
    start_level()
end

function start_level()
    player, goal, gos = current_level:inst()
    player.camera = camera
end

function love.update(delta)
    if not player.finished then 
        for _, v in pairs(gos) do
            v:update(delta)
        end

        for i = 0,3,1 do
            for i, a in pairs(gos) do
                for j, b in pairs(gos) do
                    if j > i and not a.non_collidable and not b.non_collidable then 
                        Box.overlap_and_solve(delta, a, b)
                    end
                end
            end
        end

        if player.y > 500 then
            start_level()
        end
    else
        if load_next == nil then
            load_next = love.timer.getTime() + 0.5
        end

        if love.timer.getTime() >= load_next then
            load_next = nil
            if current_level.next ~= nil then
                current_level = Level.load(current_level.next)
            else
                print("No next level")
            end
            start_level()
        end
    end

    camera:update(player, goal, delta)
end

function love.draw()
    love.graphics.clear(0, 0, 0, 1.0)

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
    end

    if key == "space" or key == "w" then
        player.bounce_mode = true
        player:do_jump()
    end

    if key == "r" then
        start_level()
    end
end

function love.keyreleased(key, sc)
    if key == "left" or key == "a" then
        player.left = false
    end
    if key == "space" or key == "w" then
        player.bounce_mode = false
        player.jump = false
    end
end
