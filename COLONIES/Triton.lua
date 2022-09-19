require("../COLONIES/BaseColony")
tritonStepBonus = {0,1,1,2,3,4,5}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 3 (Ti) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="Ti",value=3})
end
function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..tritonStepBonus[position].." (Ti) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="Ti",value=tritonStepBonus[position]})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 1 (Ti) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="Ti",value=1})
end
