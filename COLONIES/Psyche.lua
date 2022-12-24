require("../COLONIES/BaseColony")
stepBonus = {1,2,3,4,5,7,9}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus play a infrastructure card from \""..self.getName().."\" ]",color)
    --getPlayerBoard(color).call("moveProduction",{resource="Ore",step=1})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (Ore) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="Ore",value=stepBonus[position]})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 2 (Ore) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="Ore",value=2})
end
