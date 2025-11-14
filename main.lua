local currentState

function love.load()
    switchState(require("states.intro"))
end

function love.update(dt)
    if currentState.update then
        currentState.update(dt)
    end

    if currentState.finished then
        determineState(currentState)
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
    -- intro state
    if state.name == "intro" then 
        switchState(require("states.menu"))
    
    -- menu state 
    elseif state.name == "menu" then
        if state.choice == "loreIntro" then
            switchState(require("states.loreIntro"))
        elseif state.choice == "options" then
            switchState(require("states.options"))
        end
    
    -- lore intro state
    elseif state.name == "loreIntro" then
        switchState(require("states.game"))
    
    -- options state
    elseif state.name == "options" then
        if state.choice == "menu" then
            switchState(require("states.menu"))
        end
    end

end
