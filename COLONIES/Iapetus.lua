require("../COLONIES/BaseColony")
stepBonus = {0,1,2,3,4,5,6}
isActiveColony = false

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 4 (Data) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="DATA",value=4})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (Data) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="DATA",value=stepBonus[position]})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 2 (Data) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="DATA",value=2})
end
