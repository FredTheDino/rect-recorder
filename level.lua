local Box = require("box")
local Player = require("player")
local Goal = require("goal")
local Text = require("text")
local Level = {}

function Level.load(level_name)
    local raw_data = require(level_name)

    local this = {}
    this.name = level_name
    this.objs = {}
    this.start = nil
    this.goal = nil
    this.next = nil

    for _, layer in pairs(raw_data.layers) do
        if layer.name == "misc" then
            for _, obj in pairs(layer.objects) do
                if obj.name == "start" then
                    this.start = {x=obj.x, y = obj.y}
                elseif obj.name == "goal" then
                    this.goal = {x=obj.x, y = obj.y} 
                elseif obj.name == "next" then
                    this.next = obj.type
                end
            end 
        end
        if layer.name == "platforms" then
            for _, obj in pairs(layer.objects) do
                if obj.shape == "rectangle" then
                    local x = obj.x
                    local y = obj.y
                    local w = obj.width
                    local h = obj.height
                    local m = obj.properties["m"] and tonumber(obj.properties["m"]) or 0
                    local b = obj.properties["b"] and tonumber(obj.properties["b"]) or 1.0
                    local f = obj.properties["f"] and tonumber(obj.properties["f"]) or 0.5
                    local box = Box.new(x + w / 2, y + h / 2, w, h, m, b, f)
                    table.insert(this.objs, box)
                elseif obj.shape == "text" then
                    local x = obj.x
                    local y = obj.y
                    local w = obj.width
                    local size = obj.pixelsize
                    local text = obj.text
                    local t = Text.new(x, y, w, size, text)
                    table.insert(this.objs, t)
                end
            end
        end
    end

    function copy(obj)
        if type(obj) ~= 'table' then return obj end
        local res = {}
        for k, v in pairs(obj) do res[copy(k)] = copy(v) end
        return res
    end

    function this.inst(this)
        local player = Player.new(this.start.x, this.start.y)
        local goal = Goal.new(this.goal.x, this.goal.y)
        goal.player = player
        local gos = copy(this.objs)
        table.insert(gos, player)
        table.insert(gos, goal)
        return player, goal, gos
    end

    return this
end

return Level
