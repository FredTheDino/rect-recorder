local Box = require("box")
local Player = require("player")
local Level = {}

function Level.load(level_name)
    local this = {}
    this.objs = {}
    this.start = nil
    this.finish = nil

    local raw_data = require(level_name)
    for _, layer in pairs(raw_data.layers) do
        if layer.name == "misc" then
            for _, obj in pairs(layer.objects) do
                if obj.name == "start" then
                    this.start = {x=obj.x, y = obj.y}
                elseif obj.name == "finish" then
                    this.finish = {x=obj.x, y = obj.y} 
                end
            end 
        end
        if layer.name == "platforms" then
            for _, obj in pairs(layer.objects) do
                local x = obj.x
                local y = obj.y
                local w = obj.width
                local h = obj.height
                local m = obj.properties["m"] and tonumber(obj.properties["m"]) or 0
                local b = obj.properties["b"] and tonumber(obj.properties["b"]) or 0
                local f = obj.properties["f"] and tonumber(obj.properties["f"]) or 0
                local box = Box.new(x + w / 2, y + h / 2, w, h, m, b, f)
                table.insert(this.objs, box)
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
        local gos = copy(this.objs)
        table.insert(gos, player)
        return player, gos
    end

    return this
end

return Level