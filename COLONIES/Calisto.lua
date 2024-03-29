require("../COLONIES/BaseColony")
stepBonus = {0,2,3,5,7,10,13}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus increase 1 step (En) production from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("moveProduction",{resource="En",step=1})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (En) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="En",value=stepBonus[position]})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 3 (En) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="En",value=3})
end
