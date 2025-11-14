local loreIntro = {}

loreIntro.name = "loreIntro"
loreIntro.finished = false

local lines = {
    {text = "You wake up in the middle of the forest...", startTime = 0},
    {text = "you remember nothing...", startTime = 5},
    {text = "you have no idea how you got here...", startTime = 10},
    {text = "but you feel a disturbing sensation.", startTime = 15},
    {text = "Something draws you deeper into it...", startTime = 20},
    {text = "some place...", startTime = 25},
    {text = "you don’t know what, but you must find out...", startTime = 30},
    {text = "it won’t let me rest.", startTime = 35},
    {text = "I must find what is calling me.", startTime = 40}
}

local timer = 0
local fadeDuration = 2.5

function loreIntro.enter(previous)
    timer = 0
    loreIntro.finished = false
end

function loreIntro.update(dt)
    local settings = require("settings")
    if settings.skipIntro then
        loreIntro.finished = true
        loreIntro.choice = "game"
    else
        timer = timer + dt
    end

    if timer >= 49 then
        loreIntro.finished = true
    end
end

function loreIntro.draw()
    local screenWidth = love.graphics.getWidth()
    local y = 50

    for i, line in ipairs(lines) do
        local t = timer - line.startTime
        if t > 0 then
            local alpha = math.min(t / fadeDuration, 1)

            local nextLine = lines[i+1]
            if nextLine and timer >= nextLine.startTime then
                local fadeOutT = timer - nextLine.startTime
                alpha = math.max(1 - fadeOutT / fadeDuration, 0)
            elseif not nextLine then
                local endTime = line.startTime + fadeDuration + 3
                if timer >= endTime then
                    local fadeOutT = timer - endTime
                    alpha = math.max(1 - fadeOutT / fadeDuration, 0)
                end
            end

            love.graphics.setColor(1, 1, 1, alpha)
            love.graphics.printf(line.text, 0, y + i * 40, screenWidth, "center")
        end
    end

    love.graphics.setColor(1, 1, 1, 1)
end


return loreIntro
