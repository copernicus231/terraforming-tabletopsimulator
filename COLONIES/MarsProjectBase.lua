require("../COLONIES/BaseColony")
stepBonus = {"1 He","2 He","2 Pl","1 Temperature","1 Oxygen","1 Ocean","1 Greenery"}
isActiveColony = true

function placementBonus(color)
    local gen  = getBoard("BaseGame").call("getTrackLevel",{track="tr",color="Grey"})
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus increase 2 per generation ("..gen.. ") step (MC) production from \""..self.getName().."\" ]",color)
    --log("Current generation: "..getBoard("BaseGame").call("getTrackLevel",{track="tr",color="Grey"}))

    getPlayerBoard(color).call("moveProduction",{resource="MC",step=2*gen})
    --PLAYER_BOARDS[color].call("incrementProd",{steps=1,resource="St"})
end

function tradeBonus(color,position)
    if position == 1 then
        broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
        getPlayerBoard(color).call("addResource",{resource="He",value=1})
    elseif position == 2 then
        broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
        getPlayerBoard(color).call("addResource",{resource="He",value=2})
    elseif position == 3 then
        broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
        getPlayerBoard(color).call("addResource",{resource="Pl",value=2})
    elseif position == 4 then
        if getBoard("BaseGame").call("moveTrack",{name="temperature",step=1,color=color})then
            broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
        end
    elseif position == 5 then
        if getBoard("BaseGame").call("moveTrack",{step=1,color=color,name="oxygen"}) then
            broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
        end
    elseif position == 6 then
        local bag = getBag("Ocean")
        local pos = getCardPlayTable(color).positionToWorld(Vector(0,1,-2.7))
        if bag != nil and bag != Global then
            if bag.getQuantity() > 1 then
                bag.takeObject({position = pos})
                broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
            end
        end
    elseif position == 7 then
        local bag = getBag("Greenery")
        local pos = getCardPlayTable(color).positionToWorld(Vector(0,1,-2.7))
        if bag != nil and bag != Global then
            bag.takeObject({position = pos})
            broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." from \""..self.getName().."\" ]",color)
        end
    end
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 2 (MC) from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="MC",value=2})
end
