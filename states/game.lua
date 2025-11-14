local game = {}
game.finished = false
game.name = "game"

function game.update(dt) end

function game.draw()
    love.graphics.print("game state", 0, 0)
end

return game