require("../COLONIES/BaseColony")
stepBonus = {0,1,2,3,4,5,6}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus increase 1 step (Pl) production from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("moveProduction",{resource="Pl",step=1})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (Pl) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="Pl",value=stepBonus[position]})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 1 (Pl) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="Pl",value=1})
end
