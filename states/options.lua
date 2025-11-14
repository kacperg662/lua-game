local options = {}
local settings = require("settings")
local entries = {"Skip intro", "Back"}
local selected = 1

options.name = "options"
options.finished = false
options.choice = "none"

function options.enter(previous)
    selected = 1
    options.finished = false
end

function options.keypressed(key)
    if key == "up" then
        selected = selected - 1
        if selected < 1 then selected = #entries end
    elseif key == "down" then
        selected = selected + 1
        if selected > #entries then selected = 1 end
    elseif key == "return" then
        if selected == 1 then
            settings.skipIntro = not settings.skipIntro
        elseif selected == 2 then
            options.choice = "menu"
            options.finished = true
        end
    end
end

function options.draw()
    for i, entry in ipairs(entries) do
        if i == selected then
            love.graphics.setColor(0.7, 0.7, 0.7)
        else
            love.graphics.setColor(1, 1, 1)
        end
        love.graphics.printf(entry, 0, 200 + i * 40, love.graphics.getWidth(), "center")
    end
    love.graphics.setColor(1, 1, 1)
end

return options