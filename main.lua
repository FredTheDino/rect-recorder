local Box = require("box")
local camera = require("camera") 
local Level = require("level")

local large_font = love.graphics.newFont("baskervville.ttf", 100, "normal")

local current_level = nil

local music = nil

local gos = nil
local player = nil
local goal = nil

local load_next = nil
function love.load()
    music = love.audio.newSource("sounds/music.mp3", "stream")
    music:setVolume(0.5)
    music:play()

    current_level = Level.load("levels.w1l1")
    start_level()
end

function reload_level(name)
    current_level = Level.load(current_level.name)
    start_level()
end

function start_level()
    player, goal, gos = current_level:inst()
    player.camera = camera
    camera:setup(player, goal)
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
        goal:update()
        if goal:should_load_next() and current_level.next ~= "end" then
            if current_level.next ~= nil then
                current_level = Level.load(current_level.next)
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

    love.graphics.origin()
    if current_level.next == "end" and player.finished then
        local t = (love.timer.getTime() - goal.finish_start) / goal.fadein_time
        love.graphics.setColor(1.0, 1.0, 1.0, t)
        love.graphics.setFont(large_font)
        love.graphics.printf("The End", 000, 300, 800, "center")
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

    if key == "n" then
        player.x = goal.x
        player.y = goal.y
    end

    if key == "r" then
        reload_level()
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
