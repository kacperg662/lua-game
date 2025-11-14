local currentState

function love.load()
    switchState(require("states.intro"))
end

function love.update(dt)
    if currentState.update then
        currentState.update(dt)
    end

    if currentState.finished then
        local nextState = determineState(currentState)
        if nextState then
            switchState(nextState)
        end
    end
end

function love.draw()
    if currentState.draw then
        currentState.draw()
    end
end

function love.keypressed(key)
    if currentState.keypressed then
        currentState.keypressed(key)
    end
end

function switchState(newState)
    if currentState and currentState.exit then
        currentState.exit()
    end
    local previous = currentState
    currentState = newState
    if currentState.enter then
        currentState.enter(previous)
    end
end

function determineState(state)
    if state.name == "intro" then
        return require("states.menu")
    elseif state.name == "menu" then
        if state.choice == "game" then
            return require("states.game")
        elseif state.choice == "options" then
            return require("states.options")
        end
    elseif state.name == "options" then
        if state.choice == "back" then
            return require("states.menu")
        end
    end
end
