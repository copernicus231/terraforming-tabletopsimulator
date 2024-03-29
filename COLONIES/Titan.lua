require("../COLONIES/BaseColony")
stepBonus = {0,1,1,2,3,3,4}
isActiveColony = false

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 3 (Floater) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="FLOATER",value=3})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (Floater) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="FLOATER",value=stepBonus[position]})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 1 (Floater) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="FLOATER",value=1})
end
