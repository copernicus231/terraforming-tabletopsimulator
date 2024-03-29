require("../COLONIES/BaseColony")
stepBonus = {0,1,2,3,4,4,5}
isActiveColony = false

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 3 (Microbe) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="MICROBE",value=3})
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (Microbe) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="MICROBE",value=stepBonus[position]})
end

function colonyBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus 1 (Microbe) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="MICROBE",value=1})
end
