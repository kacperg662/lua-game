local menu = {}
local settings = require("settings")
local entries = {"Start run", "Options", "Exit"}
local selected = 1

menu.name = "menu"
menu.choice = "none"
menu.finished = false

function menu.enter(previous)
    selected = 1
    menu.choice = "none"
    menu.finished = false
end

function menu.keypressed(key)
    if key == "up" then
        selected = selected - 1
        if selected < 1 then selected = #entries end
    elseif key == "down" then
        selected = selected + 1
        if selected > #entries then selected = 1 end
    elseif key == "return" then
        if selected == 1 then
            menu.choice = "loreIntro"
            menu.finished = true
        elseif selected == 2 then
            menu.choice = "options"
            menu.finished = true
        elseif selected == 3 then
            love.event.quit()
        end
    end
end

function menu.draw()
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

return menu
