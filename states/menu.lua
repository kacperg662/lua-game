local menu = {}
local selected
local options = {"Start Run", "Options", "Exit"}

menu.name = "menu"
menu.choice = "none"
menu.finished = false

function menu.enter(previous)
    selected = 1
    menu.choice = "none"
    menu.finished = false
end

function menu.exit()
    -- todo
end

function menu.update(dt) end

function menu.draw()
    for i, option in ipairs(options) do
        if i == selected then
            love.graphics.setColor(0.7, 0.7, 0.7)
        else
            love.graphics.setColor(1, 1, 1)
        end
        love.graphics.printf(option, 0, 200 + i * 40, love.graphics.getWidth(), "center")
    end
    love.graphics.setColor(1, 1, 1)
end

function menu.keypressed(key)
    if key == "up" then
        selected = selected - 1
        if selected < 1 then selected = #options end
    elseif key == "down" then
        selected = selected + 1
        if selected > #options then selected = 1 end
    elseif key == "return" then
        if options[selected] == "Start Run" then
            menu.choice = "game"
        elseif options[selected] == "Options" then
            menu.choice = "options"
        elseif options[selected] == "Exit" then
            love.event.quit()
            return
        end
        menu.finished = true
    end
end

return menu
