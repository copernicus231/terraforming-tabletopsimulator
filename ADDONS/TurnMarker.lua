require("../UTIL/GetComponents")
currentPlayer=nil
neutralPosition=nil
function onLoad(save_state)
    bottomNext = {
        index = 0, click_function = 'nextPlayer', function_owner = self, label = "",
        position = {0,0,0}, width = 600, height = 600, font_size = 360,font_color={0,0,0,100},color={253/255, 231/255, 46/255,0},scale={x=1, y=1, z=1},tooltip = "Ready"
    }
    self.createButton(bottomNext)
    currentPlayer=Global.call("getCurrentPlayer",{})
    neutralPosition = vector(10.52, 2.87, -11.29)
end
function getCurrentPlayer()
    return currentPlayer
end
function setNeutralPosition()
    self.setPositionSmooth(neutralPosition+Vector(0,3,0),false,false)
end

function setPlayerPosition(color)
    local cpt = getCardPlayTable(color)
    self.setPositionSmooth(cpt.positionToWorld(Vector(0,3,-1.5)),false,false)
    currentPlayer = color
end

function nextPlayer()
    local next = Global.call("getNextPlayer",currentPlayer)
    if next == currentPlayer then
        broadcastToAll("<< Only one player >>")
    elseif next == "Grey" then
        broadcastToAll("<< Round finish >>" )
        currentPlayer = Global.call("getCurrentPlayer",{})
        setNeutralPosition()
    else
        setPlayerPosition(next)
    end

end
