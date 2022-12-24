require("../COLONIES/BaseColony")
stepBonus = {"MC","He","En","St","Pl","Ti","Wild"}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus another player discard a card from \""..self.getName().."\" ]",color)
    --getPlayerBoard(color).call("moveProduction",{resource="He",step=1})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus steal 3 ("..stepBonus[position]..") resources from \""..self.getName().."\" ]",color)
    --getPlayerBoard(color).call("addResource",{resource="He",value=stepBonus[position]})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony 4 cards from discard pile and keep 1 resources from \""..self.getName().."\" ]",color)
    --getPlayerBoard(color).call("addResource",{resource="He",value=2})
end
