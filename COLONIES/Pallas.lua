require("../COLONIES/BaseColony")
stepBonus = {0,0,1,1,2,2,3}
isActiveColony = true

function placementBonus(color)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get placement bonus 1 (Science) Card from \""..self.getName().."\" ]",color)
end

function tradeBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get trade bonus "..stepBonus[position].." (Science) resources from \""..self.getName().."\" ]",color)
    getPlayerBoard(color).call("addResource",{resource="SCIENCE",value=stepBonus[position]})
end

function colonyBonus(color,position)
    broadcastToAll("<COLONY>[==> "..getPlayerName(color).." get colony bonus ".. stepBonus[position] .." Cards keep 1  from \""..self.getName().."\" ]",color)
end
