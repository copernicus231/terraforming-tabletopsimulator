require("../COLONIES/BaseColony")
stepBonus = {1,2,3,4,5,6,8}
isActiveColony = false

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 3 (Radiation) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="RADIATION",value=3})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (Radiation) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="RADIATION",value=stepBonus[position]})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 2 (Radiation) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="RADIATION",value=2})
end
