local options = {}
local options = {"todo", "Back"}
local selected = 1
options.finished = false
options.choice = "none"
options.name = "options"

function options.enter(previous)
    selected = 1
    options.choice = "none"
    options.finished = false
end

function options.exit()
    -- todo
end

function options.update(dt) end

function options.draw()
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

function options.keypressed(key)
    if key == "up" then
        selected = selected - 1
        if selected < 1 then selected = #options end
    elseif key == "down" then
        selected = selected + 1
        if selected > #options then selected = 1 end
    elseif key == "return" then
        if options[selected] == "todo" then
            -- todo
        elseif options[selected] == "Back" then
            options.choice = "back"
            options.finished = true
        end
    end
end

return options