local intro = {}
local timer = 0
intro.finished = false
intro.name = "intro"

local text = "Intro..."
local screenWidth = love.graphics.getWidth()
local screenHeight = love.graphics.getHeight()
local font = love.graphics.getFont()
local textHeight = font:getHeight()

function intro.update(dt)
    timer = timer + dt
    if timer > 4 then
        intro.finished = true
    end
end

function intro.draw()
    love.graphics.printf(text, 0, screenHeight / 2 - textHeight / 2, screenWidth, "center")
end

return intro
