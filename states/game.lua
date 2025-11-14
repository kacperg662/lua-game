local game = {}
local timer = 0
game.finished = false
game.name = "game"

function game.update(dt)
    timer = timer + dt
    if timer > 4 then
        game.finished = true
    end
end

function game.draw()
    love.graphics.print("To jest gra", 0, 0)
end

return game