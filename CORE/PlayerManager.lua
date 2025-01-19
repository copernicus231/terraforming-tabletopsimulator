PLAYERS = {
    Red = {seated=false,next="Brown",prev="Blue",active=false},
    Brown = {seated=false,next="Yellow",prev="Red",active=false},
    Yellow ={seated=false,next="Green",prev="Brown",active=false},
    Green = {seated=false,next="Blue",prev="Yellow",active=false},
    Blue = {seated=false,next="Red",prev="Green",active=false}
}

PLAYER_COLORS={
    Red = {seated=false,next="Brown",prev="Grey"},
    Brown = {seated=false,next="Yellow",prev="Red"},
    Yellow = {seated=false,next="Green",prev="Brown"},
    Green = {seated=false,next="Blue",prev="Yellow"},
    Blue = {seated=false,next="Grey",prev="Green"},
    Grey = {seated=true,next="Red",prev="Blue"}
}
currentPlayer="Red"
function updatePlayers()
    for i,a in pairs(PLAYERS) do
        if Player[i].seated then
            a.seated = true
            a.active = true
            PLAYER_COLORS[i].seated = true
        else
            a.seated = false
            a.active = false
            PLAYER_COLORS[i].seated=false
        end
    end
end

function onPlayerChangeColor(player_color)
    updatePlayers()
end

function onObjectStateChange(changed_object, old_guid)
    if changed_object.hasTag("PlayerStatus") then
        local playerInfo = PLAYERS[changed_object.getColorTint():toString()]
        if playerInfo != nil and playerInfo.seated then
                if changed_object.hasTag("Enable") then
                    playerInfo.active=true
                else changed_object.hasTag("Disable")
                    playerInfo.active=false
                end
        end
    end
end
function getPlayers()
    local list = {}
    for i,a in pairs(PLAYERS) do
        if a.seated then
            list[#list + 1] = i
         end
    end
    return list
end

function getNextPlayerDir(params)
    local color = params.color
    local dir = params.dir
    return i_getNextPlayerDir(color,dir)
end

function i_getNextPlayerDir(color,dir)
    local nextPlayer = PLAYERS[color][dir]
    if PLAYERS[nextPlayer].seated then
        return nextPlayer
    else
        return i_getNextPlayerDir(nextPlayer,dir)
    end
end

function getNextPlayer(color)
    return i_getNextPlayer(color,1)
end
function i_getNextPlayer(color,counter)
    if counter == 6 then
        return "Grey"
    end
    local nextPlayer = PLAYERS[color].next
    if PLAYERS[nextPlayer].seated and  PLAYERS[nextPlayer].active then
        return nextPlayer
    else
        return i_getNextPlayer(nextPlayer,counter + 1)
    end
end
function getNext(color)
    return getNextColor(color,1)
end

function getNextColor(color,counter)
    if counter == 6 then
        return "Grey"
    end
    local nextColor = PLAYER_COLORS[color].next
    if PLAYER_COLORS[nextColor].seated then
        return nextColor
    else
        return getNextColor(nextColor,counter + 1)
    end
end

function setCurrentPlayer(color)
    currentPlayer=color
end
function getCurrentPlayer()
    return currentPlayer
end

function onLoad(save_state)
    MusicPlayer.play()
    if save_state != nil and save_state != '' then
        local json = JSON.decode(save_state)
        currentPlayer = json.currentPlayer
        isSetup=json.isSetup or false
    end
    updatePlayers()
    if isSetup == false then
        UI.show("Menu")
    end
end

function onSave()
    local data_to_save = {currentPlayer=currentPlayer,isSetup=isSetup}
    save_state = JSON.encode(data_to_save)
    return save_state
end
